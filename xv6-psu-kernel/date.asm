
_date:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "user.h"
#include "date.h"

int
main(int argc, char *argv[])
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	57                   	push   %edi
   4:	56                   	push   %esi
   5:	53                   	push   %ebx
   6:	83 e4 f0             	and    $0xfffffff0,%esp
   9:	83 ec 70             	sub    $0x70,%esp
  struct rtcdate r;

  if (date(&r)) {
   c:	8d 44 24 58          	lea    0x58(%esp),%eax
  10:	89 04 24             	mov    %eax,(%esp)
  13:	e8 d5 03 00 00       	call   3ed <date>
  18:	85 c0                	test   %eax,%eax
  1a:	74 19                	je     35 <main+0x35>
    printf(2, "date_failed\n");
  1c:	c7 44 24 04 a1 08 00 	movl   $0x8a1,0x4(%esp)
  23:	00 
  24:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  2b:	e8 a5 04 00 00       	call   4d5 <printf>
    exit();
  30:	e8 18 03 00 00       	call   34d <exit>
  }

  char *months[] = {
  35:	c7 44 24 28 ae 08 00 	movl   $0x8ae,0x28(%esp)
  3c:	00 
  3d:	c7 44 24 2c b2 08 00 	movl   $0x8b2,0x2c(%esp)
  44:	00 
  45:	c7 44 24 30 b6 08 00 	movl   $0x8b6,0x30(%esp)
  4c:	00 
  4d:	c7 44 24 34 ba 08 00 	movl   $0x8ba,0x34(%esp)
  54:	00 
  55:	c7 44 24 38 be 08 00 	movl   $0x8be,0x38(%esp)
  5c:	00 
  5d:	c7 44 24 3c c2 08 00 	movl   $0x8c2,0x3c(%esp)
  64:	00 
  65:	c7 44 24 40 c6 08 00 	movl   $0x8c6,0x40(%esp)
  6c:	00 
  6d:	c7 44 24 44 ca 08 00 	movl   $0x8ca,0x44(%esp)
  74:	00 
  75:	c7 44 24 48 ce 08 00 	movl   $0x8ce,0x48(%esp)
  7c:	00 
  7d:	c7 44 24 4c d2 08 00 	movl   $0x8d2,0x4c(%esp)
  84:	00 
  85:	c7 44 24 50 d6 08 00 	movl   $0x8d6,0x50(%esp)
  8c:	00 
  8d:	c7 44 24 54 da 08 00 	movl   $0x8da,0x54(%esp)
  94:	00 
    "Oct",
    "Nov",
    "Dec"
  };

  printf(1, "%s %d %d:%d:%d UTC %d",
  95:	8b 7c 24 6c          	mov    0x6c(%esp),%edi
  99:	8b 74 24 58          	mov    0x58(%esp),%esi
  9d:	8b 5c 24 5c          	mov    0x5c(%esp),%ebx
  a1:	8b 4c 24 60          	mov    0x60(%esp),%ecx
  a5:	8b 54 24 64          	mov    0x64(%esp),%edx
         months[r.month-1], r.day, r.hour, r.minute, r.second, r.year);
  a9:	8b 44 24 68          	mov    0x68(%esp),%eax
  ad:	83 e8 01             	sub    $0x1,%eax
    "Oct",
    "Nov",
    "Dec"
  };

  printf(1, "%s %d %d:%d:%d UTC %d",
  b0:	8b 44 84 28          	mov    0x28(%esp,%eax,4),%eax
  b4:	89 7c 24 1c          	mov    %edi,0x1c(%esp)
  b8:	89 74 24 18          	mov    %esi,0x18(%esp)
  bc:	89 5c 24 14          	mov    %ebx,0x14(%esp)
  c0:	89 4c 24 10          	mov    %ecx,0x10(%esp)
  c4:	89 54 24 0c          	mov    %edx,0xc(%esp)
  c8:	89 44 24 08          	mov    %eax,0x8(%esp)
  cc:	c7 44 24 04 de 08 00 	movl   $0x8de,0x4(%esp)
  d3:	00 
  d4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  db:	e8 f5 03 00 00       	call   4d5 <printf>
         months[r.month-1], r.day, r.hour, r.minute, r.second, r.year);

  exit();
  e0:	e8 68 02 00 00       	call   34d <exit>

000000e5 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  e5:	55                   	push   %ebp
  e6:	89 e5                	mov    %esp,%ebp
  e8:	57                   	push   %edi
  e9:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  ea:	8b 4d 08             	mov    0x8(%ebp),%ecx
  ed:	8b 55 10             	mov    0x10(%ebp),%edx
  f0:	8b 45 0c             	mov    0xc(%ebp),%eax
  f3:	89 cb                	mov    %ecx,%ebx
  f5:	89 df                	mov    %ebx,%edi
  f7:	89 d1                	mov    %edx,%ecx
  f9:	fc                   	cld    
  fa:	f3 aa                	rep stos %al,%es:(%edi)
  fc:	89 ca                	mov    %ecx,%edx
  fe:	89 fb                	mov    %edi,%ebx
 100:	89 5d 08             	mov    %ebx,0x8(%ebp)
 103:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 106:	5b                   	pop    %ebx
 107:	5f                   	pop    %edi
 108:	5d                   	pop    %ebp
 109:	c3                   	ret    

0000010a <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 10a:	55                   	push   %ebp
 10b:	89 e5                	mov    %esp,%ebp
 10d:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 110:	8b 45 08             	mov    0x8(%ebp),%eax
 113:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 116:	90                   	nop
 117:	8b 45 08             	mov    0x8(%ebp),%eax
 11a:	8d 50 01             	lea    0x1(%eax),%edx
 11d:	89 55 08             	mov    %edx,0x8(%ebp)
 120:	8b 55 0c             	mov    0xc(%ebp),%edx
 123:	8d 4a 01             	lea    0x1(%edx),%ecx
 126:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 129:	0f b6 12             	movzbl (%edx),%edx
 12c:	88 10                	mov    %dl,(%eax)
 12e:	0f b6 00             	movzbl (%eax),%eax
 131:	84 c0                	test   %al,%al
 133:	75 e2                	jne    117 <strcpy+0xd>
    ;
  return os;
 135:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 138:	c9                   	leave  
 139:	c3                   	ret    

0000013a <strcmp>:

int
strcmp(const char *p, const char *q)
{
 13a:	55                   	push   %ebp
 13b:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 13d:	eb 08                	jmp    147 <strcmp+0xd>
    p++, q++;
 13f:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 143:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 147:	8b 45 08             	mov    0x8(%ebp),%eax
 14a:	0f b6 00             	movzbl (%eax),%eax
 14d:	84 c0                	test   %al,%al
 14f:	74 10                	je     161 <strcmp+0x27>
 151:	8b 45 08             	mov    0x8(%ebp),%eax
 154:	0f b6 10             	movzbl (%eax),%edx
 157:	8b 45 0c             	mov    0xc(%ebp),%eax
 15a:	0f b6 00             	movzbl (%eax),%eax
 15d:	38 c2                	cmp    %al,%dl
 15f:	74 de                	je     13f <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 161:	8b 45 08             	mov    0x8(%ebp),%eax
 164:	0f b6 00             	movzbl (%eax),%eax
 167:	0f b6 d0             	movzbl %al,%edx
 16a:	8b 45 0c             	mov    0xc(%ebp),%eax
 16d:	0f b6 00             	movzbl (%eax),%eax
 170:	0f b6 c0             	movzbl %al,%eax
 173:	29 c2                	sub    %eax,%edx
 175:	89 d0                	mov    %edx,%eax
}
 177:	5d                   	pop    %ebp
 178:	c3                   	ret    

00000179 <strlen>:

uint
strlen(char *s)
{
 179:	55                   	push   %ebp
 17a:	89 e5                	mov    %esp,%ebp
 17c:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 17f:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 186:	eb 04                	jmp    18c <strlen+0x13>
 188:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 18c:	8b 55 fc             	mov    -0x4(%ebp),%edx
 18f:	8b 45 08             	mov    0x8(%ebp),%eax
 192:	01 d0                	add    %edx,%eax
 194:	0f b6 00             	movzbl (%eax),%eax
 197:	84 c0                	test   %al,%al
 199:	75 ed                	jne    188 <strlen+0xf>
    ;
  return n;
 19b:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 19e:	c9                   	leave  
 19f:	c3                   	ret    

000001a0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1a0:	55                   	push   %ebp
 1a1:	89 e5                	mov    %esp,%ebp
 1a3:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 1a6:	8b 45 10             	mov    0x10(%ebp),%eax
 1a9:	89 44 24 08          	mov    %eax,0x8(%esp)
 1ad:	8b 45 0c             	mov    0xc(%ebp),%eax
 1b0:	89 44 24 04          	mov    %eax,0x4(%esp)
 1b4:	8b 45 08             	mov    0x8(%ebp),%eax
 1b7:	89 04 24             	mov    %eax,(%esp)
 1ba:	e8 26 ff ff ff       	call   e5 <stosb>
  return dst;
 1bf:	8b 45 08             	mov    0x8(%ebp),%eax
}
 1c2:	c9                   	leave  
 1c3:	c3                   	ret    

000001c4 <strchr>:

char*
strchr(const char *s, char c)
{
 1c4:	55                   	push   %ebp
 1c5:	89 e5                	mov    %esp,%ebp
 1c7:	83 ec 04             	sub    $0x4,%esp
 1ca:	8b 45 0c             	mov    0xc(%ebp),%eax
 1cd:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 1d0:	eb 14                	jmp    1e6 <strchr+0x22>
    if(*s == c)
 1d2:	8b 45 08             	mov    0x8(%ebp),%eax
 1d5:	0f b6 00             	movzbl (%eax),%eax
 1d8:	3a 45 fc             	cmp    -0x4(%ebp),%al
 1db:	75 05                	jne    1e2 <strchr+0x1e>
      return (char*)s;
 1dd:	8b 45 08             	mov    0x8(%ebp),%eax
 1e0:	eb 13                	jmp    1f5 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 1e2:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 1e6:	8b 45 08             	mov    0x8(%ebp),%eax
 1e9:	0f b6 00             	movzbl (%eax),%eax
 1ec:	84 c0                	test   %al,%al
 1ee:	75 e2                	jne    1d2 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 1f0:	b8 00 00 00 00       	mov    $0x0,%eax
}
 1f5:	c9                   	leave  
 1f6:	c3                   	ret    

000001f7 <gets>:

char*
gets(char *buf, int max)
{
 1f7:	55                   	push   %ebp
 1f8:	89 e5                	mov    %esp,%ebp
 1fa:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1fd:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 204:	eb 4c                	jmp    252 <gets+0x5b>
    cc = read(0, &c, 1);
 206:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 20d:	00 
 20e:	8d 45 ef             	lea    -0x11(%ebp),%eax
 211:	89 44 24 04          	mov    %eax,0x4(%esp)
 215:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 21c:	e8 44 01 00 00       	call   365 <read>
 221:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 224:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 228:	7f 02                	jg     22c <gets+0x35>
      break;
 22a:	eb 31                	jmp    25d <gets+0x66>
    buf[i++] = c;
 22c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 22f:	8d 50 01             	lea    0x1(%eax),%edx
 232:	89 55 f4             	mov    %edx,-0xc(%ebp)
 235:	89 c2                	mov    %eax,%edx
 237:	8b 45 08             	mov    0x8(%ebp),%eax
 23a:	01 c2                	add    %eax,%edx
 23c:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 240:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 242:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 246:	3c 0a                	cmp    $0xa,%al
 248:	74 13                	je     25d <gets+0x66>
 24a:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 24e:	3c 0d                	cmp    $0xd,%al
 250:	74 0b                	je     25d <gets+0x66>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 252:	8b 45 f4             	mov    -0xc(%ebp),%eax
 255:	83 c0 01             	add    $0x1,%eax
 258:	3b 45 0c             	cmp    0xc(%ebp),%eax
 25b:	7c a9                	jl     206 <gets+0xf>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 25d:	8b 55 f4             	mov    -0xc(%ebp),%edx
 260:	8b 45 08             	mov    0x8(%ebp),%eax
 263:	01 d0                	add    %edx,%eax
 265:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 268:	8b 45 08             	mov    0x8(%ebp),%eax
}
 26b:	c9                   	leave  
 26c:	c3                   	ret    

0000026d <stat>:

int
stat(char *n, struct stat *st)
{
 26d:	55                   	push   %ebp
 26e:	89 e5                	mov    %esp,%ebp
 270:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 273:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 27a:	00 
 27b:	8b 45 08             	mov    0x8(%ebp),%eax
 27e:	89 04 24             	mov    %eax,(%esp)
 281:	e8 07 01 00 00       	call   38d <open>
 286:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 289:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 28d:	79 07                	jns    296 <stat+0x29>
    return -1;
 28f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 294:	eb 23                	jmp    2b9 <stat+0x4c>
  r = fstat(fd, st);
 296:	8b 45 0c             	mov    0xc(%ebp),%eax
 299:	89 44 24 04          	mov    %eax,0x4(%esp)
 29d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2a0:	89 04 24             	mov    %eax,(%esp)
 2a3:	e8 fd 00 00 00       	call   3a5 <fstat>
 2a8:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 2ab:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2ae:	89 04 24             	mov    %eax,(%esp)
 2b1:	e8 bf 00 00 00       	call   375 <close>
  return r;
 2b6:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 2b9:	c9                   	leave  
 2ba:	c3                   	ret    

000002bb <atoi>:

int
atoi(const char *s)
{
 2bb:	55                   	push   %ebp
 2bc:	89 e5                	mov    %esp,%ebp
 2be:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 2c1:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 2c8:	eb 25                	jmp    2ef <atoi+0x34>
    n = n*10 + *s++ - '0';
 2ca:	8b 55 fc             	mov    -0x4(%ebp),%edx
 2cd:	89 d0                	mov    %edx,%eax
 2cf:	c1 e0 02             	shl    $0x2,%eax
 2d2:	01 d0                	add    %edx,%eax
 2d4:	01 c0                	add    %eax,%eax
 2d6:	89 c1                	mov    %eax,%ecx
 2d8:	8b 45 08             	mov    0x8(%ebp),%eax
 2db:	8d 50 01             	lea    0x1(%eax),%edx
 2de:	89 55 08             	mov    %edx,0x8(%ebp)
 2e1:	0f b6 00             	movzbl (%eax),%eax
 2e4:	0f be c0             	movsbl %al,%eax
 2e7:	01 c8                	add    %ecx,%eax
 2e9:	83 e8 30             	sub    $0x30,%eax
 2ec:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 2ef:	8b 45 08             	mov    0x8(%ebp),%eax
 2f2:	0f b6 00             	movzbl (%eax),%eax
 2f5:	3c 2f                	cmp    $0x2f,%al
 2f7:	7e 0a                	jle    303 <atoi+0x48>
 2f9:	8b 45 08             	mov    0x8(%ebp),%eax
 2fc:	0f b6 00             	movzbl (%eax),%eax
 2ff:	3c 39                	cmp    $0x39,%al
 301:	7e c7                	jle    2ca <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 303:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 306:	c9                   	leave  
 307:	c3                   	ret    

00000308 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 308:	55                   	push   %ebp
 309:	89 e5                	mov    %esp,%ebp
 30b:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 30e:	8b 45 08             	mov    0x8(%ebp),%eax
 311:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 314:	8b 45 0c             	mov    0xc(%ebp),%eax
 317:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 31a:	eb 17                	jmp    333 <memmove+0x2b>
    *dst++ = *src++;
 31c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 31f:	8d 50 01             	lea    0x1(%eax),%edx
 322:	89 55 fc             	mov    %edx,-0x4(%ebp)
 325:	8b 55 f8             	mov    -0x8(%ebp),%edx
 328:	8d 4a 01             	lea    0x1(%edx),%ecx
 32b:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 32e:	0f b6 12             	movzbl (%edx),%edx
 331:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 333:	8b 45 10             	mov    0x10(%ebp),%eax
 336:	8d 50 ff             	lea    -0x1(%eax),%edx
 339:	89 55 10             	mov    %edx,0x10(%ebp)
 33c:	85 c0                	test   %eax,%eax
 33e:	7f dc                	jg     31c <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 340:	8b 45 08             	mov    0x8(%ebp),%eax
}
 343:	c9                   	leave  
 344:	c3                   	ret    

00000345 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 345:	b8 01 00 00 00       	mov    $0x1,%eax
 34a:	cd 40                	int    $0x40
 34c:	c3                   	ret    

0000034d <exit>:
SYSCALL(exit)
 34d:	b8 02 00 00 00       	mov    $0x2,%eax
 352:	cd 40                	int    $0x40
 354:	c3                   	ret    

00000355 <wait>:
SYSCALL(wait)
 355:	b8 03 00 00 00       	mov    $0x3,%eax
 35a:	cd 40                	int    $0x40
 35c:	c3                   	ret    

0000035d <pipe>:
SYSCALL(pipe)
 35d:	b8 04 00 00 00       	mov    $0x4,%eax
 362:	cd 40                	int    $0x40
 364:	c3                   	ret    

00000365 <read>:
SYSCALL(read)
 365:	b8 05 00 00 00       	mov    $0x5,%eax
 36a:	cd 40                	int    $0x40
 36c:	c3                   	ret    

0000036d <write>:
SYSCALL(write)
 36d:	b8 10 00 00 00       	mov    $0x10,%eax
 372:	cd 40                	int    $0x40
 374:	c3                   	ret    

00000375 <close>:
SYSCALL(close)
 375:	b8 15 00 00 00       	mov    $0x15,%eax
 37a:	cd 40                	int    $0x40
 37c:	c3                   	ret    

0000037d <kill>:
SYSCALL(kill)
 37d:	b8 06 00 00 00       	mov    $0x6,%eax
 382:	cd 40                	int    $0x40
 384:	c3                   	ret    

00000385 <exec>:
SYSCALL(exec)
 385:	b8 07 00 00 00       	mov    $0x7,%eax
 38a:	cd 40                	int    $0x40
 38c:	c3                   	ret    

0000038d <open>:
SYSCALL(open)
 38d:	b8 0f 00 00 00       	mov    $0xf,%eax
 392:	cd 40                	int    $0x40
 394:	c3                   	ret    

00000395 <mknod>:
SYSCALL(mknod)
 395:	b8 11 00 00 00       	mov    $0x11,%eax
 39a:	cd 40                	int    $0x40
 39c:	c3                   	ret    

0000039d <unlink>:
SYSCALL(unlink)
 39d:	b8 12 00 00 00       	mov    $0x12,%eax
 3a2:	cd 40                	int    $0x40
 3a4:	c3                   	ret    

000003a5 <fstat>:
SYSCALL(fstat)
 3a5:	b8 08 00 00 00       	mov    $0x8,%eax
 3aa:	cd 40                	int    $0x40
 3ac:	c3                   	ret    

000003ad <link>:
SYSCALL(link)
 3ad:	b8 13 00 00 00       	mov    $0x13,%eax
 3b2:	cd 40                	int    $0x40
 3b4:	c3                   	ret    

000003b5 <mkdir>:
SYSCALL(mkdir)
 3b5:	b8 14 00 00 00       	mov    $0x14,%eax
 3ba:	cd 40                	int    $0x40
 3bc:	c3                   	ret    

000003bd <chdir>:
SYSCALL(chdir)
 3bd:	b8 09 00 00 00       	mov    $0x9,%eax
 3c2:	cd 40                	int    $0x40
 3c4:	c3                   	ret    

000003c5 <dup>:
SYSCALL(dup)
 3c5:	b8 0a 00 00 00       	mov    $0xa,%eax
 3ca:	cd 40                	int    $0x40
 3cc:	c3                   	ret    

000003cd <getpid>:
SYSCALL(getpid)
 3cd:	b8 0b 00 00 00       	mov    $0xb,%eax
 3d2:	cd 40                	int    $0x40
 3d4:	c3                   	ret    

000003d5 <sbrk>:
SYSCALL(sbrk)
 3d5:	b8 0c 00 00 00       	mov    $0xc,%eax
 3da:	cd 40                	int    $0x40
 3dc:	c3                   	ret    

000003dd <sleep>:
SYSCALL(sleep)
 3dd:	b8 0d 00 00 00       	mov    $0xd,%eax
 3e2:	cd 40                	int    $0x40
 3e4:	c3                   	ret    

000003e5 <uptime>:
SYSCALL(uptime)
 3e5:	b8 0e 00 00 00       	mov    $0xe,%eax
 3ea:	cd 40                	int    $0x40
 3ec:	c3                   	ret    

000003ed <date>:
SYSCALL(date)
 3ed:	b8 16 00 00 00       	mov    $0x16,%eax
 3f2:	cd 40                	int    $0x40
 3f4:	c3                   	ret    

000003f5 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 3f5:	55                   	push   %ebp
 3f6:	89 e5                	mov    %esp,%ebp
 3f8:	83 ec 18             	sub    $0x18,%esp
 3fb:	8b 45 0c             	mov    0xc(%ebp),%eax
 3fe:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 401:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 408:	00 
 409:	8d 45 f4             	lea    -0xc(%ebp),%eax
 40c:	89 44 24 04          	mov    %eax,0x4(%esp)
 410:	8b 45 08             	mov    0x8(%ebp),%eax
 413:	89 04 24             	mov    %eax,(%esp)
 416:	e8 52 ff ff ff       	call   36d <write>
}
 41b:	c9                   	leave  
 41c:	c3                   	ret    

0000041d <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 41d:	55                   	push   %ebp
 41e:	89 e5                	mov    %esp,%ebp
 420:	56                   	push   %esi
 421:	53                   	push   %ebx
 422:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 425:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 42c:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 430:	74 17                	je     449 <printint+0x2c>
 432:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 436:	79 11                	jns    449 <printint+0x2c>
    neg = 1;
 438:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 43f:	8b 45 0c             	mov    0xc(%ebp),%eax
 442:	f7 d8                	neg    %eax
 444:	89 45 ec             	mov    %eax,-0x14(%ebp)
 447:	eb 06                	jmp    44f <printint+0x32>
  } else {
    x = xx;
 449:	8b 45 0c             	mov    0xc(%ebp),%eax
 44c:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 44f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 456:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 459:	8d 41 01             	lea    0x1(%ecx),%eax
 45c:	89 45 f4             	mov    %eax,-0xc(%ebp)
 45f:	8b 5d 10             	mov    0x10(%ebp),%ebx
 462:	8b 45 ec             	mov    -0x14(%ebp),%eax
 465:	ba 00 00 00 00       	mov    $0x0,%edx
 46a:	f7 f3                	div    %ebx
 46c:	89 d0                	mov    %edx,%eax
 46e:	0f b6 80 44 0b 00 00 	movzbl 0xb44(%eax),%eax
 475:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 479:	8b 75 10             	mov    0x10(%ebp),%esi
 47c:	8b 45 ec             	mov    -0x14(%ebp),%eax
 47f:	ba 00 00 00 00       	mov    $0x0,%edx
 484:	f7 f6                	div    %esi
 486:	89 45 ec             	mov    %eax,-0x14(%ebp)
 489:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 48d:	75 c7                	jne    456 <printint+0x39>
  if(neg)
 48f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 493:	74 10                	je     4a5 <printint+0x88>
    buf[i++] = '-';
 495:	8b 45 f4             	mov    -0xc(%ebp),%eax
 498:	8d 50 01             	lea    0x1(%eax),%edx
 49b:	89 55 f4             	mov    %edx,-0xc(%ebp)
 49e:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 4a3:	eb 1f                	jmp    4c4 <printint+0xa7>
 4a5:	eb 1d                	jmp    4c4 <printint+0xa7>
    putc(fd, buf[i]);
 4a7:	8d 55 dc             	lea    -0x24(%ebp),%edx
 4aa:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4ad:	01 d0                	add    %edx,%eax
 4af:	0f b6 00             	movzbl (%eax),%eax
 4b2:	0f be c0             	movsbl %al,%eax
 4b5:	89 44 24 04          	mov    %eax,0x4(%esp)
 4b9:	8b 45 08             	mov    0x8(%ebp),%eax
 4bc:	89 04 24             	mov    %eax,(%esp)
 4bf:	e8 31 ff ff ff       	call   3f5 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 4c4:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 4c8:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 4cc:	79 d9                	jns    4a7 <printint+0x8a>
    putc(fd, buf[i]);
}
 4ce:	83 c4 30             	add    $0x30,%esp
 4d1:	5b                   	pop    %ebx
 4d2:	5e                   	pop    %esi
 4d3:	5d                   	pop    %ebp
 4d4:	c3                   	ret    

000004d5 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 4d5:	55                   	push   %ebp
 4d6:	89 e5                	mov    %esp,%ebp
 4d8:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 4db:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 4e2:	8d 45 0c             	lea    0xc(%ebp),%eax
 4e5:	83 c0 04             	add    $0x4,%eax
 4e8:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 4eb:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 4f2:	e9 7c 01 00 00       	jmp    673 <printf+0x19e>
    c = fmt[i] & 0xff;
 4f7:	8b 55 0c             	mov    0xc(%ebp),%edx
 4fa:	8b 45 f0             	mov    -0x10(%ebp),%eax
 4fd:	01 d0                	add    %edx,%eax
 4ff:	0f b6 00             	movzbl (%eax),%eax
 502:	0f be c0             	movsbl %al,%eax
 505:	25 ff 00 00 00       	and    $0xff,%eax
 50a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 50d:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 511:	75 2c                	jne    53f <printf+0x6a>
      if(c == '%'){
 513:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 517:	75 0c                	jne    525 <printf+0x50>
        state = '%';
 519:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 520:	e9 4a 01 00 00       	jmp    66f <printf+0x19a>
      } else {
        putc(fd, c);
 525:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 528:	0f be c0             	movsbl %al,%eax
 52b:	89 44 24 04          	mov    %eax,0x4(%esp)
 52f:	8b 45 08             	mov    0x8(%ebp),%eax
 532:	89 04 24             	mov    %eax,(%esp)
 535:	e8 bb fe ff ff       	call   3f5 <putc>
 53a:	e9 30 01 00 00       	jmp    66f <printf+0x19a>
      }
    } else if(state == '%'){
 53f:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 543:	0f 85 26 01 00 00    	jne    66f <printf+0x19a>
      if(c == 'd'){
 549:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 54d:	75 2d                	jne    57c <printf+0xa7>
        printint(fd, *ap, 10, 1);
 54f:	8b 45 e8             	mov    -0x18(%ebp),%eax
 552:	8b 00                	mov    (%eax),%eax
 554:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 55b:	00 
 55c:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 563:	00 
 564:	89 44 24 04          	mov    %eax,0x4(%esp)
 568:	8b 45 08             	mov    0x8(%ebp),%eax
 56b:	89 04 24             	mov    %eax,(%esp)
 56e:	e8 aa fe ff ff       	call   41d <printint>
        ap++;
 573:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 577:	e9 ec 00 00 00       	jmp    668 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 57c:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 580:	74 06                	je     588 <printf+0xb3>
 582:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 586:	75 2d                	jne    5b5 <printf+0xe0>
        printint(fd, *ap, 16, 0);
 588:	8b 45 e8             	mov    -0x18(%ebp),%eax
 58b:	8b 00                	mov    (%eax),%eax
 58d:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 594:	00 
 595:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 59c:	00 
 59d:	89 44 24 04          	mov    %eax,0x4(%esp)
 5a1:	8b 45 08             	mov    0x8(%ebp),%eax
 5a4:	89 04 24             	mov    %eax,(%esp)
 5a7:	e8 71 fe ff ff       	call   41d <printint>
        ap++;
 5ac:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 5b0:	e9 b3 00 00 00       	jmp    668 <printf+0x193>
      } else if(c == 's'){
 5b5:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 5b9:	75 45                	jne    600 <printf+0x12b>
        s = (char*)*ap;
 5bb:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5be:	8b 00                	mov    (%eax),%eax
 5c0:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 5c3:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 5c7:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 5cb:	75 09                	jne    5d6 <printf+0x101>
          s = "(null)";
 5cd:	c7 45 f4 f4 08 00 00 	movl   $0x8f4,-0xc(%ebp)
        while(*s != 0){
 5d4:	eb 1e                	jmp    5f4 <printf+0x11f>
 5d6:	eb 1c                	jmp    5f4 <printf+0x11f>
          putc(fd, *s);
 5d8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5db:	0f b6 00             	movzbl (%eax),%eax
 5de:	0f be c0             	movsbl %al,%eax
 5e1:	89 44 24 04          	mov    %eax,0x4(%esp)
 5e5:	8b 45 08             	mov    0x8(%ebp),%eax
 5e8:	89 04 24             	mov    %eax,(%esp)
 5eb:	e8 05 fe ff ff       	call   3f5 <putc>
          s++;
 5f0:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 5f4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5f7:	0f b6 00             	movzbl (%eax),%eax
 5fa:	84 c0                	test   %al,%al
 5fc:	75 da                	jne    5d8 <printf+0x103>
 5fe:	eb 68                	jmp    668 <printf+0x193>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 600:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 604:	75 1d                	jne    623 <printf+0x14e>
        putc(fd, *ap);
 606:	8b 45 e8             	mov    -0x18(%ebp),%eax
 609:	8b 00                	mov    (%eax),%eax
 60b:	0f be c0             	movsbl %al,%eax
 60e:	89 44 24 04          	mov    %eax,0x4(%esp)
 612:	8b 45 08             	mov    0x8(%ebp),%eax
 615:	89 04 24             	mov    %eax,(%esp)
 618:	e8 d8 fd ff ff       	call   3f5 <putc>
        ap++;
 61d:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 621:	eb 45                	jmp    668 <printf+0x193>
      } else if(c == '%'){
 623:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 627:	75 17                	jne    640 <printf+0x16b>
        putc(fd, c);
 629:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 62c:	0f be c0             	movsbl %al,%eax
 62f:	89 44 24 04          	mov    %eax,0x4(%esp)
 633:	8b 45 08             	mov    0x8(%ebp),%eax
 636:	89 04 24             	mov    %eax,(%esp)
 639:	e8 b7 fd ff ff       	call   3f5 <putc>
 63e:	eb 28                	jmp    668 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 640:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 647:	00 
 648:	8b 45 08             	mov    0x8(%ebp),%eax
 64b:	89 04 24             	mov    %eax,(%esp)
 64e:	e8 a2 fd ff ff       	call   3f5 <putc>
        putc(fd, c);
 653:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 656:	0f be c0             	movsbl %al,%eax
 659:	89 44 24 04          	mov    %eax,0x4(%esp)
 65d:	8b 45 08             	mov    0x8(%ebp),%eax
 660:	89 04 24             	mov    %eax,(%esp)
 663:	e8 8d fd ff ff       	call   3f5 <putc>
      }
      state = 0;
 668:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 66f:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 673:	8b 55 0c             	mov    0xc(%ebp),%edx
 676:	8b 45 f0             	mov    -0x10(%ebp),%eax
 679:	01 d0                	add    %edx,%eax
 67b:	0f b6 00             	movzbl (%eax),%eax
 67e:	84 c0                	test   %al,%al
 680:	0f 85 71 fe ff ff    	jne    4f7 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 686:	c9                   	leave  
 687:	c3                   	ret    

00000688 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 688:	55                   	push   %ebp
 689:	89 e5                	mov    %esp,%ebp
 68b:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 68e:	8b 45 08             	mov    0x8(%ebp),%eax
 691:	83 e8 08             	sub    $0x8,%eax
 694:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 697:	a1 60 0b 00 00       	mov    0xb60,%eax
 69c:	89 45 fc             	mov    %eax,-0x4(%ebp)
 69f:	eb 24                	jmp    6c5 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6a1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6a4:	8b 00                	mov    (%eax),%eax
 6a6:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 6a9:	77 12                	ja     6bd <free+0x35>
 6ab:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6ae:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 6b1:	77 24                	ja     6d7 <free+0x4f>
 6b3:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6b6:	8b 00                	mov    (%eax),%eax
 6b8:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 6bb:	77 1a                	ja     6d7 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6bd:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6c0:	8b 00                	mov    (%eax),%eax
 6c2:	89 45 fc             	mov    %eax,-0x4(%ebp)
 6c5:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6c8:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 6cb:	76 d4                	jbe    6a1 <free+0x19>
 6cd:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6d0:	8b 00                	mov    (%eax),%eax
 6d2:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 6d5:	76 ca                	jbe    6a1 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 6d7:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6da:	8b 40 04             	mov    0x4(%eax),%eax
 6dd:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 6e4:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6e7:	01 c2                	add    %eax,%edx
 6e9:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6ec:	8b 00                	mov    (%eax),%eax
 6ee:	39 c2                	cmp    %eax,%edx
 6f0:	75 24                	jne    716 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 6f2:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6f5:	8b 50 04             	mov    0x4(%eax),%edx
 6f8:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6fb:	8b 00                	mov    (%eax),%eax
 6fd:	8b 40 04             	mov    0x4(%eax),%eax
 700:	01 c2                	add    %eax,%edx
 702:	8b 45 f8             	mov    -0x8(%ebp),%eax
 705:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 708:	8b 45 fc             	mov    -0x4(%ebp),%eax
 70b:	8b 00                	mov    (%eax),%eax
 70d:	8b 10                	mov    (%eax),%edx
 70f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 712:	89 10                	mov    %edx,(%eax)
 714:	eb 0a                	jmp    720 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 716:	8b 45 fc             	mov    -0x4(%ebp),%eax
 719:	8b 10                	mov    (%eax),%edx
 71b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 71e:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 720:	8b 45 fc             	mov    -0x4(%ebp),%eax
 723:	8b 40 04             	mov    0x4(%eax),%eax
 726:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 72d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 730:	01 d0                	add    %edx,%eax
 732:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 735:	75 20                	jne    757 <free+0xcf>
    p->s.size += bp->s.size;
 737:	8b 45 fc             	mov    -0x4(%ebp),%eax
 73a:	8b 50 04             	mov    0x4(%eax),%edx
 73d:	8b 45 f8             	mov    -0x8(%ebp),%eax
 740:	8b 40 04             	mov    0x4(%eax),%eax
 743:	01 c2                	add    %eax,%edx
 745:	8b 45 fc             	mov    -0x4(%ebp),%eax
 748:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 74b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 74e:	8b 10                	mov    (%eax),%edx
 750:	8b 45 fc             	mov    -0x4(%ebp),%eax
 753:	89 10                	mov    %edx,(%eax)
 755:	eb 08                	jmp    75f <free+0xd7>
  } else
    p->s.ptr = bp;
 757:	8b 45 fc             	mov    -0x4(%ebp),%eax
 75a:	8b 55 f8             	mov    -0x8(%ebp),%edx
 75d:	89 10                	mov    %edx,(%eax)
  freep = p;
 75f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 762:	a3 60 0b 00 00       	mov    %eax,0xb60
}
 767:	c9                   	leave  
 768:	c3                   	ret    

00000769 <morecore>:

static Header*
morecore(uint nu)
{
 769:	55                   	push   %ebp
 76a:	89 e5                	mov    %esp,%ebp
 76c:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 76f:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 776:	77 07                	ja     77f <morecore+0x16>
    nu = 4096;
 778:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 77f:	8b 45 08             	mov    0x8(%ebp),%eax
 782:	c1 e0 03             	shl    $0x3,%eax
 785:	89 04 24             	mov    %eax,(%esp)
 788:	e8 48 fc ff ff       	call   3d5 <sbrk>
 78d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 790:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 794:	75 07                	jne    79d <morecore+0x34>
    return 0;
 796:	b8 00 00 00 00       	mov    $0x0,%eax
 79b:	eb 22                	jmp    7bf <morecore+0x56>
  hp = (Header*)p;
 79d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7a0:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 7a3:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7a6:	8b 55 08             	mov    0x8(%ebp),%edx
 7a9:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 7ac:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7af:	83 c0 08             	add    $0x8,%eax
 7b2:	89 04 24             	mov    %eax,(%esp)
 7b5:	e8 ce fe ff ff       	call   688 <free>
  return freep;
 7ba:	a1 60 0b 00 00       	mov    0xb60,%eax
}
 7bf:	c9                   	leave  
 7c0:	c3                   	ret    

000007c1 <malloc>:

void*
malloc(uint nbytes)
{
 7c1:	55                   	push   %ebp
 7c2:	89 e5                	mov    %esp,%ebp
 7c4:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7c7:	8b 45 08             	mov    0x8(%ebp),%eax
 7ca:	83 c0 07             	add    $0x7,%eax
 7cd:	c1 e8 03             	shr    $0x3,%eax
 7d0:	83 c0 01             	add    $0x1,%eax
 7d3:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 7d6:	a1 60 0b 00 00       	mov    0xb60,%eax
 7db:	89 45 f0             	mov    %eax,-0x10(%ebp)
 7de:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 7e2:	75 23                	jne    807 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 7e4:	c7 45 f0 58 0b 00 00 	movl   $0xb58,-0x10(%ebp)
 7eb:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7ee:	a3 60 0b 00 00       	mov    %eax,0xb60
 7f3:	a1 60 0b 00 00       	mov    0xb60,%eax
 7f8:	a3 58 0b 00 00       	mov    %eax,0xb58
    base.s.size = 0;
 7fd:	c7 05 5c 0b 00 00 00 	movl   $0x0,0xb5c
 804:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 807:	8b 45 f0             	mov    -0x10(%ebp),%eax
 80a:	8b 00                	mov    (%eax),%eax
 80c:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 80f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 812:	8b 40 04             	mov    0x4(%eax),%eax
 815:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 818:	72 4d                	jb     867 <malloc+0xa6>
      if(p->s.size == nunits)
 81a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 81d:	8b 40 04             	mov    0x4(%eax),%eax
 820:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 823:	75 0c                	jne    831 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 825:	8b 45 f4             	mov    -0xc(%ebp),%eax
 828:	8b 10                	mov    (%eax),%edx
 82a:	8b 45 f0             	mov    -0x10(%ebp),%eax
 82d:	89 10                	mov    %edx,(%eax)
 82f:	eb 26                	jmp    857 <malloc+0x96>
      else {
        p->s.size -= nunits;
 831:	8b 45 f4             	mov    -0xc(%ebp),%eax
 834:	8b 40 04             	mov    0x4(%eax),%eax
 837:	2b 45 ec             	sub    -0x14(%ebp),%eax
 83a:	89 c2                	mov    %eax,%edx
 83c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 83f:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 842:	8b 45 f4             	mov    -0xc(%ebp),%eax
 845:	8b 40 04             	mov    0x4(%eax),%eax
 848:	c1 e0 03             	shl    $0x3,%eax
 84b:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 84e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 851:	8b 55 ec             	mov    -0x14(%ebp),%edx
 854:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 857:	8b 45 f0             	mov    -0x10(%ebp),%eax
 85a:	a3 60 0b 00 00       	mov    %eax,0xb60
      return (void*)(p + 1);
 85f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 862:	83 c0 08             	add    $0x8,%eax
 865:	eb 38                	jmp    89f <malloc+0xde>
    }
    if(p == freep)
 867:	a1 60 0b 00 00       	mov    0xb60,%eax
 86c:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 86f:	75 1b                	jne    88c <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 871:	8b 45 ec             	mov    -0x14(%ebp),%eax
 874:	89 04 24             	mov    %eax,(%esp)
 877:	e8 ed fe ff ff       	call   769 <morecore>
 87c:	89 45 f4             	mov    %eax,-0xc(%ebp)
 87f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 883:	75 07                	jne    88c <malloc+0xcb>
        return 0;
 885:	b8 00 00 00 00       	mov    $0x0,%eax
 88a:	eb 13                	jmp    89f <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 88c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 88f:	89 45 f0             	mov    %eax,-0x10(%ebp)
 892:	8b 45 f4             	mov    -0xc(%ebp),%eax
 895:	8b 00                	mov    (%eax),%eax
 897:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 89a:	e9 70 ff ff ff       	jmp    80f <malloc+0x4e>
}
 89f:	c9                   	leave  
 8a0:	c3                   	ret    
