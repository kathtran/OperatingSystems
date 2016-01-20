7200 // The local APIC manages internal (non-I/O) interrupts.
7201 // See Chapter 8 & Appendix C of Intel processor manual volume 3.
7202 
7203 #include "types.h"
7204 #include "defs.h"
7205 #include "date.h"
7206 #include "memlayout.h"
7207 #include "traps.h"
7208 #include "mmu.h"
7209 #include "x86.h"
7210 
7211 // Local APIC registers, divided by 4 for use as uint[] indices.
7212 #define ID      (0x0020/4)   // ID
7213 #define VER     (0x0030/4)   // Version
7214 #define TPR     (0x0080/4)   // Task Priority
7215 #define EOI     (0x00B0/4)   // EOI
7216 #define SVR     (0x00F0/4)   // Spurious Interrupt Vector
7217   #define ENABLE     0x00000100   // Unit Enable
7218 #define ESR     (0x0280/4)   // Error Status
7219 #define ICRLO   (0x0300/4)   // Interrupt Command
7220   #define INIT       0x00000500   // INIT/RESET
7221   #define STARTUP    0x00000600   // Startup IPI
7222   #define DELIVS     0x00001000   // Delivery status
7223   #define ASSERT     0x00004000   // Assert interrupt (vs deassert)
7224   #define DEASSERT   0x00000000
7225   #define LEVEL      0x00008000   // Level triggered
7226   #define BCAST      0x00080000   // Send to all APICs, including self.
7227   #define BUSY       0x00001000
7228   #define FIXED      0x00000000
7229 #define ICRHI   (0x0310/4)   // Interrupt Command [63:32]
7230 #define TIMER   (0x0320/4)   // Local Vector Table 0 (TIMER)
7231   #define X1         0x0000000B   // divide counts by 1
7232   #define PERIODIC   0x00020000   // Periodic
7233 #define PCINT   (0x0340/4)   // Performance Counter LVT
7234 #define LINT0   (0x0350/4)   // Local Vector Table 1 (LINT0)
7235 #define LINT1   (0x0360/4)   // Local Vector Table 2 (LINT1)
7236 #define ERROR   (0x0370/4)   // Local Vector Table 3 (ERROR)
7237   #define MASKED     0x00010000   // Interrupt masked
7238 #define TICR    (0x0380/4)   // Timer Initial Count
7239 #define TCCR    (0x0390/4)   // Timer Current Count
7240 #define TDCR    (0x03E0/4)   // Timer Divide Configuration
7241 
7242 volatile uint *lapic;  // Initialized in mp.c
7243 
7244 static void
7245 lapicw(int index, int value)
7246 {
7247   lapic[index] = value;
7248   lapic[ID];  // wait for write to finish, by reading
7249 }
7250 
7251 
7252 
7253 
7254 
7255 
7256 
7257 
7258 
7259 
7260 
7261 
7262 
7263 
7264 
7265 
7266 
7267 
7268 
7269 
7270 
7271 
7272 
7273 
7274 
7275 
7276 
7277 
7278 
7279 
7280 
7281 
7282 
7283 
7284 
7285 
7286 
7287 
7288 
7289 
7290 
7291 
7292 
7293 
7294 
7295 
7296 
7297 
7298 
7299 
7300 void
7301 lapicinit(void)
7302 {
7303   if(!lapic)
7304     return;
7305 
7306   // Enable local APIC; set spurious interrupt vector.
7307   lapicw(SVR, ENABLE | (T_IRQ0 + IRQ_SPURIOUS));
7308 
7309   // The timer repeatedly counts down at bus frequency
7310   // from lapic[TICR] and then issues an interrupt.
7311   // If xv6 cared more about precise timekeeping,
7312   // TICR would be calibrated using an external time source.
7313   lapicw(TDCR, X1);
7314   lapicw(TIMER, PERIODIC | (T_IRQ0 + IRQ_TIMER));
7315   lapicw(TICR, 10000000);
7316 
7317   // Disable logical interrupt lines.
7318   lapicw(LINT0, MASKED);
7319   lapicw(LINT1, MASKED);
7320 
7321   // Disable performance counter overflow interrupts
7322   // on machines that provide that interrupt entry.
7323   if(((lapic[VER]>>16) & 0xFF) >= 4)
7324     lapicw(PCINT, MASKED);
7325 
7326   // Map error interrupt to IRQ_ERROR.
7327   lapicw(ERROR, T_IRQ0 + IRQ_ERROR);
7328 
7329   // Clear error status register (requires back-to-back writes).
7330   lapicw(ESR, 0);
7331   lapicw(ESR, 0);
7332 
7333   // Ack any outstanding interrupts.
7334   lapicw(EOI, 0);
7335 
7336   // Send an Init Level De-Assert to synchronise arbitration ID's.
7337   lapicw(ICRHI, 0);
7338   lapicw(ICRLO, BCAST | INIT | LEVEL);
7339   while(lapic[ICRLO] & DELIVS)
7340     ;
7341 
7342   // Enable interrupts on the APIC (but not on the processor).
7343   lapicw(TPR, 0);
7344 }
7345 
7346 
7347 
7348 
7349 
7350 int
7351 cpunum(void)
7352 {
7353   // Cannot call cpu when interrupts are enabled:
7354   // result not guaranteed to last long enough to be used!
7355   // Would prefer to panic but even printing is chancy here:
7356   // almost everything, including cprintf and panic, calls cpu,
7357   // often indirectly through acquire and release.
7358   if(readeflags()&FL_IF){
7359     static int n;
7360     if(n++ == 0)
7361       cprintf("cpu called from %x with interrupts enabled\n",
7362         __builtin_return_address(0));
7363   }
7364 
7365   if(lapic)
7366     return lapic[ID]>>24;
7367   return 0;
7368 }
7369 
7370 // Acknowledge interrupt.
7371 void
7372 lapiceoi(void)
7373 {
7374   if(lapic)
7375     lapicw(EOI, 0);
7376 }
7377 
7378 // Spin for a given number of microseconds.
7379 // On real hardware would want to tune this dynamically.
7380 void
7381 microdelay(int us)
7382 {
7383 }
7384 
7385 #define CMOS_PORT    0x70
7386 #define CMOS_RETURN  0x71
7387 
7388 // Start additional processor running entry code at addr.
7389 // See Appendix B of MultiProcessor Specification.
7390 void
7391 lapicstartap(uchar apicid, uint addr)
7392 {
7393   int i;
7394   ushort *wrv;
7395 
7396   // "The BSP must initialize CMOS shutdown code to 0AH
7397   // and the warm reset vector (DWORD based at 40:67) to point at
7398   // the AP startup code prior to the [universal startup algorithm]."
7399   outb(CMOS_PORT, 0xF);  // offset 0xF is shutdown code
7400   outb(CMOS_PORT+1, 0x0A);
7401   wrv = (ushort*)P2V((0x40<<4 | 0x67));  // Warm reset vector
7402   wrv[0] = 0;
7403   wrv[1] = addr >> 4;
7404 
7405   // "Universal startup algorithm."
7406   // Send INIT (level-triggered) interrupt to reset other CPU.
7407   lapicw(ICRHI, apicid<<24);
7408   lapicw(ICRLO, INIT | LEVEL | ASSERT);
7409   microdelay(200);
7410   lapicw(ICRLO, INIT | LEVEL);
7411   microdelay(100);    // should be 10ms, but too slow in Bochs!
7412 
7413   // Send startup IPI (twice!) to enter code.
7414   // Regular hardware is supposed to only accept a STARTUP
7415   // when it is in the halted state due to an INIT.  So the second
7416   // should be ignored, but it is part of the official Intel algorithm.
7417   // Bochs complains about the second one.  Too bad for Bochs.
7418   for(i = 0; i < 2; i++){
7419     lapicw(ICRHI, apicid<<24);
7420     lapicw(ICRLO, STARTUP | (addr>>12));
7421     microdelay(200);
7422   }
7423 }
7424 
7425 #define CMOS_STATA   0x0a
7426 #define CMOS_STATB   0x0b
7427 #define CMOS_UIP    (1 << 7)        // RTC update in progress
7428 
7429 #define SECS    0x00
7430 #define MINS    0x02
7431 #define HOURS   0x04
7432 #define DAY     0x07
7433 #define MONTH   0x08
7434 #define YEAR    0x09
7435 
7436 static uint cmos_read(uint reg)
7437 {
7438   outb(CMOS_PORT,  reg);
7439   microdelay(200);
7440 
7441   return inb(CMOS_RETURN);
7442 }
7443 
7444 
7445 
7446 
7447 
7448 
7449 
7450 static void fill_rtcdate(struct rtcdate *r)
7451 {
7452   r->second = cmos_read(SECS);
7453   r->minute = cmos_read(MINS);
7454   r->hour   = cmos_read(HOURS);
7455   r->day    = cmos_read(DAY);
7456   r->month  = cmos_read(MONTH);
7457   r->year   = cmos_read(YEAR);
7458 }
7459 
7460 // qemu seems to use 24-hour GWT and the values are BCD encoded
7461 void cmostime(struct rtcdate *r)
7462 {
7463   struct rtcdate t1, t2;
7464   int sb, bcd;
7465 
7466   sb = cmos_read(CMOS_STATB);
7467 
7468   bcd = (sb & (1 << 2)) == 0;
7469 
7470   // make sure CMOS doesn't modify time while we read it
7471   for (;;) {
7472     fill_rtcdate(&t1);
7473     if (cmos_read(CMOS_STATA) & CMOS_UIP)
7474         continue;
7475     fill_rtcdate(&t2);
7476     if (memcmp(&t1, &t2, sizeof(t1)) == 0)
7477       break;
7478   }
7479 
7480   // convert
7481   if (bcd) {
7482 #define    CONV(x)     (t1.x = ((t1.x >> 4) * 10) + (t1.x & 0xf))
7483     CONV(second);
7484     CONV(minute);
7485     CONV(hour  );
7486     CONV(day   );
7487     CONV(month );
7488     CONV(year  );
7489 #undef     CONV
7490   }
7491 
7492   *r = t1;
7493   r->year += 2000;
7494 }
7495 
7496 
7497 
7498 
7499 
