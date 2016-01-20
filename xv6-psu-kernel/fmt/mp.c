7000 // Multiprocessor support
7001 // Search memory for MP description structures.
7002 // http://developer.intel.com/design/pentium/datashts/24201606.pdf
7003 
7004 #include "types.h"
7005 #include "defs.h"
7006 #include "param.h"
7007 #include "memlayout.h"
7008 #include "mp.h"
7009 #include "x86.h"
7010 #include "mmu.h"
7011 #include "proc.h"
7012 
7013 struct cpu cpus[NCPU];
7014 static struct cpu *bcpu;
7015 int ismp;
7016 int ncpu;
7017 uchar ioapicid;
7018 
7019 int
7020 mpbcpu(void)
7021 {
7022   return bcpu-cpus;
7023 }
7024 
7025 static uchar
7026 sum(uchar *addr, int len)
7027 {
7028   int i, sum;
7029 
7030   sum = 0;
7031   for(i=0; i<len; i++)
7032     sum += addr[i];
7033   return sum;
7034 }
7035 
7036 // Look for an MP structure in the len bytes at addr.
7037 static struct mp*
7038 mpsearch1(uint a, int len)
7039 {
7040   uchar *e, *p, *addr;
7041 
7042   addr = p2v(a);
7043   e = addr+len;
7044   for(p = addr; p < e; p += sizeof(struct mp))
7045     if(memcmp(p, "_MP_", 4) == 0 && sum(p, sizeof(struct mp)) == 0)
7046       return (struct mp*)p;
7047   return 0;
7048 }
7049 
7050 // Search for the MP Floating Pointer Structure, which according to the
7051 // spec is in one of the following three locations:
7052 // 1) in the first KB of the EBDA;
7053 // 2) in the last KB of system base memory;
7054 // 3) in the BIOS ROM between 0xE0000 and 0xFFFFF.
7055 static struct mp*
7056 mpsearch(void)
7057 {
7058   uchar *bda;
7059   uint p;
7060   struct mp *mp;
7061 
7062   bda = (uchar *) P2V(0x400);
7063   if((p = ((bda[0x0F]<<8)| bda[0x0E]) << 4)){
7064     if((mp = mpsearch1(p, 1024)))
7065       return mp;
7066   } else {
7067     p = ((bda[0x14]<<8)|bda[0x13])*1024;
7068     if((mp = mpsearch1(p-1024, 1024)))
7069       return mp;
7070   }
7071   return mpsearch1(0xF0000, 0x10000);
7072 }
7073 
7074 // Search for an MP configuration table.  For now,
7075 // don't accept the default configurations (physaddr == 0).
7076 // Check for correct signature, calculate the checksum and,
7077 // if correct, check the version.
7078 // To do: check extended table checksum.
7079 static struct mpconf*
7080 mpconfig(struct mp **pmp)
7081 {
7082   struct mpconf *conf;
7083   struct mp *mp;
7084 
7085   if((mp = mpsearch()) == 0 || mp->physaddr == 0)
7086     return 0;
7087   conf = (struct mpconf*) p2v((uint) mp->physaddr);
7088   if(memcmp(conf, "PCMP", 4) != 0)
7089     return 0;
7090   if(conf->version != 1 && conf->version != 4)
7091     return 0;
7092   if(sum((uchar*)conf, conf->length) != 0)
7093     return 0;
7094   *pmp = mp;
7095   return conf;
7096 }
7097 
7098 
7099 
7100 void
7101 mpinit(void)
7102 {
7103   uchar *p, *e;
7104   struct mp *mp;
7105   struct mpconf *conf;
7106   struct mpproc *proc;
7107   struct mpioapic *ioapic;
7108 
7109   bcpu = &cpus[0];
7110   if((conf = mpconfig(&mp)) == 0)
7111     return;
7112   ismp = 1;
7113   lapic = (uint*)conf->lapicaddr;
7114   for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
7115     switch(*p){
7116     case MPPROC:
7117       proc = (struct mpproc*)p;
7118       if(ncpu != proc->apicid){
7119         cprintf("mpinit: ncpu=%d apicid=%d\n", ncpu, proc->apicid);
7120         ismp = 0;
7121       }
7122       if(proc->flags & MPBOOT)
7123         bcpu = &cpus[ncpu];
7124       cpus[ncpu].id = ncpu;
7125       ncpu++;
7126       p += sizeof(struct mpproc);
7127       continue;
7128     case MPIOAPIC:
7129       ioapic = (struct mpioapic*)p;
7130       ioapicid = ioapic->apicno;
7131       p += sizeof(struct mpioapic);
7132       continue;
7133     case MPBUS:
7134     case MPIOINTR:
7135     case MPLINTR:
7136       p += 8;
7137       continue;
7138     default:
7139       cprintf("mpinit: unknown config type %x\n", *p);
7140       ismp = 0;
7141     }
7142   }
7143   if(!ismp){
7144     // Didn't like what we found; fall back to no MP.
7145     ncpu = 1;
7146     lapic = 0;
7147     ioapicid = 0;
7148     return;
7149   }
7150   if(mp->imcrp){
7151     // Bochs doesn't support IMCR, so this doesn't run on Bochs.
7152     // But it would on real hardware.
7153     outb(0x22, 0x70);   // Select IMCR
7154     outb(0x23, inb(0x23) | 1);  // Mask external interrupts.
7155   }
7156 }
7157 
7158 
7159 
7160 
7161 
7162 
7163 
7164 
7165 
7166 
7167 
7168 
7169 
7170 
7171 
7172 
7173 
7174 
7175 
7176 
7177 
7178 
7179 
7180 
7181 
7182 
7183 
7184 
7185 
7186 
7187 
7188 
7189 
7190 
7191 
7192 
7193 
7194 
7195 
7196 
7197 
7198 
7199 
