7900 // Console input and output.
7901 // Input is from the keyboard or serial port.
7902 // Output is written to the screen and serial port.
7903 
7904 #include "types.h"
7905 #include "defs.h"
7906 #include "param.h"
7907 #include "traps.h"
7908 #include "spinlock.h"
7909 #include "fs.h"
7910 #include "file.h"
7911 #include "memlayout.h"
7912 #include "mmu.h"
7913 #include "proc.h"
7914 #include "x86.h"
7915 
7916 static void consputc(int);
7917 
7918 static int panicked = 0;
7919 
7920 static struct {
7921   struct spinlock lock;
7922   int locking;
7923 } cons;
7924 
7925 static void
7926 printint(int xx, int base, int sign)
7927 {
7928   static char digits[] = "0123456789abcdef";
7929   char buf[16];
7930   int i;
7931   uint x;
7932 
7933   if(sign && (sign = xx < 0))
7934     x = -xx;
7935   else
7936     x = xx;
7937 
7938   i = 0;
7939   do{
7940     buf[i++] = digits[x % base];
7941   }while((x /= base) != 0);
7942 
7943   if(sign)
7944     buf[i++] = '-';
7945 
7946   while(--i >= 0)
7947     consputc(buf[i]);
7948 }
7949 
7950 // Print to the console. only understands %d, %x, %p, %s.
7951 void
7952 cprintf(char *fmt, ...)
7953 {
7954   int i, c, locking;
7955   uint *argp;
7956   char *s;
7957 
7958   locking = cons.locking;
7959   if(locking)
7960     acquire(&cons.lock);
7961 
7962   if (fmt == 0)
7963     panic("null fmt");
7964 
7965   argp = (uint*)(void*)(&fmt + 1);
7966   for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
7967     if(c != '%'){
7968       consputc(c);
7969       continue;
7970     }
7971     c = fmt[++i] & 0xff;
7972     if(c == 0)
7973       break;
7974     switch(c){
7975     case 'd':
7976       printint(*argp++, 10, 1);
7977       break;
7978     case 'x':
7979     case 'p':
7980       printint(*argp++, 16, 0);
7981       break;
7982     case 's':
7983       if((s = (char*)*argp++) == 0)
7984         s = "(null)";
7985       for(; *s; s++)
7986         consputc(*s);
7987       break;
7988     case '%':
7989       consputc('%');
7990       break;
7991     default:
7992       // Print unknown % sequence to draw attention.
7993       consputc('%');
7994       consputc(c);
7995       break;
7996     }
7997   }
7998 
7999 
8000   if(locking)
8001     release(&cons.lock);
8002 }
8003 
8004 void
8005 panic(char *s)
8006 {
8007   int i;
8008   uint pcs[10];
8009 
8010   cli();
8011   cons.locking = 0;
8012   cprintf("cpu%d: panic: ", cpu->id);
8013   cprintf(s);
8014   cprintf("\n");
8015   getcallerpcs(&s, pcs);
8016   for(i=0; i<10; i++)
8017     cprintf(" %p", pcs[i]);
8018   panicked = 1; // freeze other CPU
8019   for(;;)
8020     ;
8021 }
8022 
8023 
8024 
8025 
8026 
8027 
8028 
8029 
8030 
8031 
8032 
8033 
8034 
8035 
8036 
8037 
8038 
8039 
8040 
8041 
8042 
8043 
8044 
8045 
8046 
8047 
8048 
8049 
8050 #define BACKSPACE 0x100
8051 #define CRTPORT 0x3d4
8052 static ushort *crt = (ushort*)P2V(0xb8000);  // CGA memory
8053 
8054 static void
8055 cgaputc(int c)
8056 {
8057   int pos;
8058 
8059   // Cursor position: col + 80*row.
8060   outb(CRTPORT, 14);
8061   pos = inb(CRTPORT+1) << 8;
8062   outb(CRTPORT, 15);
8063   pos |= inb(CRTPORT+1);
8064 
8065   if(c == '\n')
8066     pos += 80 - pos%80;
8067   else if(c == BACKSPACE){
8068     if(pos > 0) --pos;
8069   } else
8070     crt[pos++] = (c&0xff) | 0x0700;  // black on white
8071 
8072   if(pos < 0 || pos > 25*80)
8073     panic("pos under/overflow");
8074 
8075   if((pos/80) >= 24){  // Scroll up.
8076     memmove(crt, crt+80, sizeof(crt[0])*23*80);
8077     pos -= 80;
8078     memset(crt+pos, 0, sizeof(crt[0])*(24*80 - pos));
8079   }
8080 
8081   outb(CRTPORT, 14);
8082   outb(CRTPORT+1, pos>>8);
8083   outb(CRTPORT, 15);
8084   outb(CRTPORT+1, pos);
8085   crt[pos] = ' ' | 0x0700;
8086 }
8087 
8088 
8089 
8090 
8091 
8092 
8093 
8094 
8095 
8096 
8097 
8098 
8099 
8100 void
8101 consputc(int c)
8102 {
8103   if(panicked){
8104     cli();
8105     for(;;)
8106       ;
8107   }
8108 
8109   if(c == BACKSPACE){
8110     uartputc('\b'); uartputc(' '); uartputc('\b');
8111   } else
8112     uartputc(c);
8113   cgaputc(c);
8114 }
8115 
8116 #define INPUT_BUF 128
8117 struct {
8118   char buf[INPUT_BUF];
8119   uint r;  // Read index
8120   uint w;  // Write index
8121   uint e;  // Edit index
8122 } input;
8123 
8124 #define C(x)  ((x)-'@')  // Control-x
8125 
8126 void
8127 consoleintr(int (*getc)(void))
8128 {
8129   int c, doprocdump = 0;
8130 
8131   acquire(&cons.lock);
8132   while((c = getc()) >= 0){
8133     switch(c){
8134     case C('P'):  // Process listing.
8135       doprocdump = 1;   // procdump() locks cons.lock indirectly; invoke later
8136       break;
8137     case C('U'):  // Kill line.
8138       while(input.e != input.w &&
8139             input.buf[(input.e-1) % INPUT_BUF] != '\n'){
8140         input.e--;
8141         consputc(BACKSPACE);
8142       }
8143       break;
8144     case C('H'): case '\x7f':  // Backspace
8145       if(input.e != input.w){
8146         input.e--;
8147         consputc(BACKSPACE);
8148       }
8149       break;
8150     default:
8151       if(c != 0 && input.e-input.r < INPUT_BUF){
8152         c = (c == '\r') ? '\n' : c;
8153         input.buf[input.e++ % INPUT_BUF] = c;
8154         consputc(c);
8155         if(c == '\n' || c == C('D') || input.e == input.r+INPUT_BUF){
8156           input.w = input.e;
8157           wakeup(&input.r);
8158         }
8159       }
8160       break;
8161     }
8162   }
8163   release(&cons.lock);
8164   if(doprocdump) {
8165     procdump();  // now call procdump() wo. cons.lock held
8166   }
8167 }
8168 
8169 int
8170 consoleread(struct inode *ip, char *dst, int n)
8171 {
8172   uint target;
8173   int c;
8174 
8175   iunlock(ip);
8176   target = n;
8177   acquire(&cons.lock);
8178   while(n > 0){
8179     while(input.r == input.w){
8180       if(proc->killed){
8181         release(&cons.lock);
8182         ilock(ip);
8183         return -1;
8184       }
8185       sleep(&input.r, &cons.lock);
8186     }
8187     c = input.buf[input.r++ % INPUT_BUF];
8188     if(c == C('D')){  // EOF
8189       if(n < target){
8190         // Save ^D for next time, to make sure
8191         // caller gets a 0-byte result.
8192         input.r--;
8193       }
8194       break;
8195     }
8196     *dst++ = c;
8197     --n;
8198     if(c == '\n')
8199       break;
8200   }
8201   release(&cons.lock);
8202   ilock(ip);
8203 
8204   return target - n;
8205 }
8206 
8207 int
8208 consolewrite(struct inode *ip, char *buf, int n)
8209 {
8210   int i;
8211 
8212   iunlock(ip);
8213   acquire(&cons.lock);
8214   for(i = 0; i < n; i++)
8215     consputc(buf[i] & 0xff);
8216   release(&cons.lock);
8217   ilock(ip);
8218 
8219   return n;
8220 }
8221 
8222 void
8223 consoleinit(void)
8224 {
8225   initlock(&cons.lock, "console");
8226 
8227   devsw[CONSOLE].write = consolewrite;
8228   devsw[CONSOLE].read = consoleread;
8229   cons.locking = 1;
8230 
8231   picenable(IRQ_KBD);
8232   ioapicenable(IRQ_KBD, 0);
8233 }
8234 
8235 
8236 
8237 
8238 
8239 
8240 
8241 
8242 
8243 
8244 
8245 
8246 
8247 
8248 
8249 
