8300 // Intel 8250 serial port (UART).
8301 
8302 #include "types.h"
8303 #include "defs.h"
8304 #include "param.h"
8305 #include "traps.h"
8306 #include "spinlock.h"
8307 #include "fs.h"
8308 #include "file.h"
8309 #include "mmu.h"
8310 #include "proc.h"
8311 #include "x86.h"
8312 
8313 #define COM1    0x3f8
8314 
8315 static int uart;    // is there a uart?
8316 
8317 void
8318 uartinit(void)
8319 {
8320   char *p;
8321 
8322   // Turn off the FIFO
8323   outb(COM1+2, 0);
8324 
8325   // 9600 baud, 8 data bits, 1 stop bit, parity off.
8326   outb(COM1+3, 0x80);    // Unlock divisor
8327   outb(COM1+0, 115200/9600);
8328   outb(COM1+1, 0);
8329   outb(COM1+3, 0x03);    // Lock divisor, 8 data bits.
8330   outb(COM1+4, 0);
8331   outb(COM1+1, 0x01);    // Enable receive interrupts.
8332 
8333   // If status is 0xFF, no serial port.
8334   if(inb(COM1+5) == 0xFF)
8335     return;
8336   uart = 1;
8337 
8338   // Acknowledge pre-existing interrupt conditions;
8339   // enable interrupts.
8340   inb(COM1+2);
8341   inb(COM1+0);
8342   picenable(IRQ_COM1);
8343   ioapicenable(IRQ_COM1, 0);
8344 
8345   // Announce that we're here.
8346   for(p="xv6...\n"; *p; p++)
8347     uartputc(*p);
8348 }
8349 
8350 void
8351 uartputc(int c)
8352 {
8353   int i;
8354 
8355   if(!uart)
8356     return;
8357   for(i = 0; i < 128 && !(inb(COM1+5) & 0x20); i++)
8358     microdelay(10);
8359   outb(COM1+0, c);
8360 }
8361 
8362 static int
8363 uartgetc(void)
8364 {
8365   if(!uart)
8366     return -1;
8367   if(!(inb(COM1+5) & 0x01))
8368     return -1;
8369   return inb(COM1+0);
8370 }
8371 
8372 void
8373 uartintr(void)
8374 {
8375   consoleintr(uartgetc);
8376 }
8377 
8378 
8379 
8380 
8381 
8382 
8383 
8384 
8385 
8386 
8387 
8388 
8389 
8390 
8391 
8392 
8393 
8394 
8395 
8396 
8397 
8398 
8399 
