8250 // Intel 8253/8254/82C54 Programmable Interval Timer (PIT).
8251 // Only used on uniprocessors;
8252 // SMP machines use the local APIC timer.
8253 
8254 #include "types.h"
8255 #include "defs.h"
8256 #include "traps.h"
8257 #include "x86.h"
8258 
8259 #define IO_TIMER1       0x040           // 8253 Timer #1
8260 
8261 // Frequency of all three count-down timers;
8262 // (TIMER_FREQ/freq) is the appropriate count
8263 // to generate a frequency of freq Hz.
8264 
8265 #define TIMER_FREQ      1193182
8266 #define TIMER_DIV(x)    ((TIMER_FREQ+(x)/2)/(x))
8267 
8268 #define TIMER_MODE      (IO_TIMER1 + 3) // timer mode port
8269 #define TIMER_SEL0      0x00    // select counter 0
8270 #define TIMER_RATEGEN   0x04    // mode 2, rate generator
8271 #define TIMER_16BIT     0x30    // r/w counter 16 bits, LSB first
8272 
8273 void
8274 timerinit(void)
8275 {
8276   // Interrupt 100 times/sec.
8277   outb(TIMER_MODE, TIMER_SEL0 | TIMER_RATEGEN | TIMER_16BIT);
8278   outb(IO_TIMER1, TIMER_DIV(100) % 256);
8279   outb(IO_TIMER1, TIMER_DIV(100) / 256);
8280   picenable(IRQ_TIMER);
8281 }
8282 
8283 
8284 
8285 
8286 
8287 
8288 
8289 
8290 
8291 
8292 
8293 
8294 
8295 
8296 
8297 
8298 
8299 
