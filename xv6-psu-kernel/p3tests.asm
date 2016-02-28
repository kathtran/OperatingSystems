
_p3tests:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:

int testuidgid(void);

int
main(int argc, char *argv[])
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
  testuidgid();
   6:	e8 05 00 00 00       	call   10 <testuidgid>

  exit();
   b:	e8 76 03 00 00       	call   386 <exit>

00000010 <testuidgid>:
}

int
testuidgid(void)
{
  10:	55                   	push   %ebp
  11:	89 e5                	mov    %esp,%ebp
  13:	83 ec 28             	sub    $0x28,%esp
  int uid, gid, ppid;

  uid = getuid();
  16:	e8 13 04 00 00       	call   42e <getuid>
  1b:	89 45 f4             	mov    %eax,-0xc(%ebp)
  printf(2, "Current UID is: %d\n", uid);
  1e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  21:	89 44 24 08          	mov    %eax,0x8(%esp)
  25:	c7 44 24 04 12 09 00 	movl   $0x912,0x4(%esp)
  2c:	00 
  2d:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  34:	e8 0d 05 00 00       	call   546 <printf>
  printf(2, "Setting UID to 100\n");
  39:	c7 44 24 04 26 09 00 	movl   $0x926,0x4(%esp)
  40:	00 
  41:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  48:	e8 f9 04 00 00       	call   546 <printf>
  setuid(100);
  4d:	c7 04 24 64 00 00 00 	movl   $0x64,(%esp)
  54:	e8 ed 03 00 00       	call   446 <setuid>
  uid = getuid();
  59:	e8 d0 03 00 00       	call   42e <getuid>
  5e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  printf(2, "Current UID is: %d\n", uid);
  61:	8b 45 f4             	mov    -0xc(%ebp),%eax
  64:	89 44 24 08          	mov    %eax,0x8(%esp)
  68:	c7 44 24 04 12 09 00 	movl   $0x912,0x4(%esp)
  6f:	00 
  70:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  77:	e8 ca 04 00 00       	call   546 <printf>

  gid = getgid();
  7c:	e8 b5 03 00 00       	call   436 <getgid>
  81:	89 45 f0             	mov    %eax,-0x10(%ebp)
  printf(2, "Current GID is: %d\n", gid);
  84:	8b 45 f0             	mov    -0x10(%ebp),%eax
  87:	89 44 24 08          	mov    %eax,0x8(%esp)
  8b:	c7 44 24 04 3a 09 00 	movl   $0x93a,0x4(%esp)
  92:	00 
  93:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  9a:	e8 a7 04 00 00       	call   546 <printf>
  printf(2, "Setting GID to 100\n");
  9f:	c7 44 24 04 4e 09 00 	movl   $0x94e,0x4(%esp)
  a6:	00 
  a7:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  ae:	e8 93 04 00 00       	call   546 <printf>
  setgid(100);
  b3:	c7 04 24 64 00 00 00 	movl   $0x64,(%esp)
  ba:	e8 8f 03 00 00       	call   44e <setgid>
  gid = getgid();
  bf:	e8 72 03 00 00       	call   436 <getgid>
  c4:	89 45 f0             	mov    %eax,-0x10(%ebp)
  printf(2, "Current GID is: %d\n", gid);
  c7:	8b 45 f0             	mov    -0x10(%ebp),%eax
  ca:	89 44 24 08          	mov    %eax,0x8(%esp)
  ce:	c7 44 24 04 3a 09 00 	movl   $0x93a,0x4(%esp)
  d5:	00 
  d6:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  dd:	e8 64 04 00 00       	call   546 <printf>

  ppid = getppid();
  e2:	e8 57 03 00 00       	call   43e <getppid>
  e7:	89 45 ec             	mov    %eax,-0x14(%ebp)
  printf(2, "My parent process is: %d\n", ppid);
  ea:	8b 45 ec             	mov    -0x14(%ebp),%eax
  ed:	89 44 24 08          	mov    %eax,0x8(%esp)
  f1:	c7 44 24 04 62 09 00 	movl   $0x962,0x4(%esp)
  f8:	00 
  f9:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 100:	e8 41 04 00 00       	call   546 <printf>
  printf(2, "Done!\n");
 105:	c7 44 24 04 7c 09 00 	movl   $0x97c,0x4(%esp)
 10c:	00 
 10d:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 114:	e8 2d 04 00 00       	call   546 <printf>

  exit();
 119:	e8 68 02 00 00       	call   386 <exit>

0000011e <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 11e:	55                   	push   %ebp
 11f:	89 e5                	mov    %esp,%ebp
 121:	57                   	push   %edi
 122:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 123:	8b 4d 08             	mov    0x8(%ebp),%ecx
 126:	8b 55 10             	mov    0x10(%ebp),%edx
 129:	8b 45 0c             	mov    0xc(%ebp),%eax
 12c:	89 cb                	mov    %ecx,%ebx
 12e:	89 df                	mov    %ebx,%edi
 130:	89 d1                	mov    %edx,%ecx
 132:	fc                   	cld    
 133:	f3 aa                	rep stos %al,%es:(%edi)
 135:	89 ca                	mov    %ecx,%edx
 137:	89 fb                	mov    %edi,%ebx
 139:	89 5d 08             	mov    %ebx,0x8(%ebp)
 13c:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 13f:	5b                   	pop    %ebx
 140:	5f                   	pop    %edi
 141:	5d                   	pop    %ebp
 142:	c3                   	ret    

00000143 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 143:	55                   	push   %ebp
 144:	89 e5                	mov    %esp,%ebp
 146:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 149:	8b 45 08             	mov    0x8(%ebp),%eax
 14c:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 14f:	90                   	nop
 150:	8b 45 08             	mov    0x8(%ebp),%eax
 153:	8d 50 01             	lea    0x1(%eax),%edx
 156:	89 55 08             	mov    %edx,0x8(%ebp)
 159:	8b 55 0c             	mov    0xc(%ebp),%edx
 15c:	8d 4a 01             	lea    0x1(%edx),%ecx
 15f:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 162:	0f b6 12             	movzbl (%edx),%edx
 165:	88 10                	mov    %dl,(%eax)
 167:	0f b6 00             	movzbl (%eax),%eax
 16a:	84 c0                	test   %al,%al
 16c:	75 e2                	jne    150 <strcpy+0xd>
    ;
  return os;
 16e:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 171:	c9                   	leave  
 172:	c3                   	ret    

00000173 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 173:	55                   	push   %ebp
 174:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 176:	eb 08                	jmp    180 <strcmp+0xd>
    p++, q++;
 178:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 17c:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 180:	8b 45 08             	mov    0x8(%ebp),%eax
 183:	0f b6 00             	movzbl (%eax),%eax
 186:	84 c0                	test   %al,%al
 188:	74 10                	je     19a <strcmp+0x27>
 18a:	8b 45 08             	mov    0x8(%ebp),%eax
 18d:	0f b6 10             	movzbl (%eax),%edx
 190:	8b 45 0c             	mov    0xc(%ebp),%eax
 193:	0f b6 00             	movzbl (%eax),%eax
 196:	38 c2                	cmp    %al,%dl
 198:	74 de                	je     178 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 19a:	8b 45 08             	mov    0x8(%ebp),%eax
 19d:	0f b6 00             	movzbl (%eax),%eax
 1a0:	0f b6 d0             	movzbl %al,%edx
 1a3:	8b 45 0c             	mov    0xc(%ebp),%eax
 1a6:	0f b6 00             	movzbl (%eax),%eax
 1a9:	0f b6 c0             	movzbl %al,%eax
 1ac:	29 c2                	sub    %eax,%edx
 1ae:	89 d0                	mov    %edx,%eax
}
 1b0:	5d                   	pop    %ebp
 1b1:	c3                   	ret    

000001b2 <strlen>:

uint
strlen(char *s)
{
 1b2:	55                   	push   %ebp
 1b3:	89 e5                	mov    %esp,%ebp
 1b5:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 1b8:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 1bf:	eb 04                	jmp    1c5 <strlen+0x13>
 1c1:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 1c5:	8b 55 fc             	mov    -0x4(%ebp),%edx
 1c8:	8b 45 08             	mov    0x8(%ebp),%eax
 1cb:	01 d0                	add    %edx,%eax
 1cd:	0f b6 00             	movzbl (%eax),%eax
 1d0:	84 c0                	test   %al,%al
 1d2:	75 ed                	jne    1c1 <strlen+0xf>
    ;
  return n;
 1d4:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 1d7:	c9                   	leave  
 1d8:	c3                   	ret    

000001d9 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1d9:	55                   	push   %ebp
 1da:	89 e5                	mov    %esp,%ebp
 1dc:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 1df:	8b 45 10             	mov    0x10(%ebp),%eax
 1e2:	89 44 24 08          	mov    %eax,0x8(%esp)
 1e6:	8b 45 0c             	mov    0xc(%ebp),%eax
 1e9:	89 44 24 04          	mov    %eax,0x4(%esp)
 1ed:	8b 45 08             	mov    0x8(%ebp),%eax
 1f0:	89 04 24             	mov    %eax,(%esp)
 1f3:	e8 26 ff ff ff       	call   11e <stosb>
  return dst;
 1f8:	8b 45 08             	mov    0x8(%ebp),%eax
}
 1fb:	c9                   	leave  
 1fc:	c3                   	ret    

000001fd <strchr>:

char*
strchr(const char *s, char c)
{
 1fd:	55                   	push   %ebp
 1fe:	89 e5                	mov    %esp,%ebp
 200:	83 ec 04             	sub    $0x4,%esp
 203:	8b 45 0c             	mov    0xc(%ebp),%eax
 206:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 209:	eb 14                	jmp    21f <strchr+0x22>
    if(*s == c)
 20b:	8b 45 08             	mov    0x8(%ebp),%eax
 20e:	0f b6 00             	movzbl (%eax),%eax
 211:	3a 45 fc             	cmp    -0x4(%ebp),%al
 214:	75 05                	jne    21b <strchr+0x1e>
      return (char*)s;
 216:	8b 45 08             	mov    0x8(%ebp),%eax
 219:	eb 13                	jmp    22e <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 21b:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 21f:	8b 45 08             	mov    0x8(%ebp),%eax
 222:	0f b6 00             	movzbl (%eax),%eax
 225:	84 c0                	test   %al,%al
 227:	75 e2                	jne    20b <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 229:	b8 00 00 00 00       	mov    $0x0,%eax
}
 22e:	c9                   	leave  
 22f:	c3                   	ret    

00000230 <gets>:

char*
gets(char *buf, int max)
{
 230:	55                   	push   %ebp
 231:	89 e5                	mov    %esp,%ebp
 233:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 236:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 23d:	eb 4c                	jmp    28b <gets+0x5b>
    cc = read(0, &c, 1);
 23f:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 246:	00 
 247:	8d 45 ef             	lea    -0x11(%ebp),%eax
 24a:	89 44 24 04          	mov    %eax,0x4(%esp)
 24e:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 255:	e8 44 01 00 00       	call   39e <read>
 25a:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 25d:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 261:	7f 02                	jg     265 <gets+0x35>
      break;
 263:	eb 31                	jmp    296 <gets+0x66>
    buf[i++] = c;
 265:	8b 45 f4             	mov    -0xc(%ebp),%eax
 268:	8d 50 01             	lea    0x1(%eax),%edx
 26b:	89 55 f4             	mov    %edx,-0xc(%ebp)
 26e:	89 c2                	mov    %eax,%edx
 270:	8b 45 08             	mov    0x8(%ebp),%eax
 273:	01 c2                	add    %eax,%edx
 275:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 279:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 27b:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 27f:	3c 0a                	cmp    $0xa,%al
 281:	74 13                	je     296 <gets+0x66>
 283:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 287:	3c 0d                	cmp    $0xd,%al
 289:	74 0b                	je     296 <gets+0x66>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 28b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 28e:	83 c0 01             	add    $0x1,%eax
 291:	3b 45 0c             	cmp    0xc(%ebp),%eax
 294:	7c a9                	jl     23f <gets+0xf>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 296:	8b 55 f4             	mov    -0xc(%ebp),%edx
 299:	8b 45 08             	mov    0x8(%ebp),%eax
 29c:	01 d0                	add    %edx,%eax
 29e:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 2a1:	8b 45 08             	mov    0x8(%ebp),%eax
}
 2a4:	c9                   	leave  
 2a5:	c3                   	ret    

000002a6 <stat>:

int
stat(char *n, struct stat *st)
{
 2a6:	55                   	push   %ebp
 2a7:	89 e5                	mov    %esp,%ebp
 2a9:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2ac:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 2b3:	00 
 2b4:	8b 45 08             	mov    0x8(%ebp),%eax
 2b7:	89 04 24             	mov    %eax,(%esp)
 2ba:	e8 07 01 00 00       	call   3c6 <open>
 2bf:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 2c2:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 2c6:	79 07                	jns    2cf <stat+0x29>
    return -1;
 2c8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 2cd:	eb 23                	jmp    2f2 <stat+0x4c>
  r = fstat(fd, st);
 2cf:	8b 45 0c             	mov    0xc(%ebp),%eax
 2d2:	89 44 24 04          	mov    %eax,0x4(%esp)
 2d6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2d9:	89 04 24             	mov    %eax,(%esp)
 2dc:	e8 fd 00 00 00       	call   3de <fstat>
 2e1:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 2e4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2e7:	89 04 24             	mov    %eax,(%esp)
 2ea:	e8 bf 00 00 00       	call   3ae <close>
  return r;
 2ef:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 2f2:	c9                   	leave  
 2f3:	c3                   	ret    

000002f4 <atoi>:

int
atoi(const char *s)
{
 2f4:	55                   	push   %ebp
 2f5:	89 e5                	mov    %esp,%ebp
 2f7:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 2fa:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 301:	eb 25                	jmp    328 <atoi+0x34>
    n = n*10 + *s++ - '0';
 303:	8b 55 fc             	mov    -0x4(%ebp),%edx
 306:	89 d0                	mov    %edx,%eax
 308:	c1 e0 02             	shl    $0x2,%eax
 30b:	01 d0                	add    %edx,%eax
 30d:	01 c0                	add    %eax,%eax
 30f:	89 c1                	mov    %eax,%ecx
 311:	8b 45 08             	mov    0x8(%ebp),%eax
 314:	8d 50 01             	lea    0x1(%eax),%edx
 317:	89 55 08             	mov    %edx,0x8(%ebp)
 31a:	0f b6 00             	movzbl (%eax),%eax
 31d:	0f be c0             	movsbl %al,%eax
 320:	01 c8                	add    %ecx,%eax
 322:	83 e8 30             	sub    $0x30,%eax
 325:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 328:	8b 45 08             	mov    0x8(%ebp),%eax
 32b:	0f b6 00             	movzbl (%eax),%eax
 32e:	3c 2f                	cmp    $0x2f,%al
 330:	7e 0a                	jle    33c <atoi+0x48>
 332:	8b 45 08             	mov    0x8(%ebp),%eax
 335:	0f b6 00             	movzbl (%eax),%eax
 338:	3c 39                	cmp    $0x39,%al
 33a:	7e c7                	jle    303 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 33c:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 33f:	c9                   	leave  
 340:	c3                   	ret    

00000341 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 341:	55                   	push   %ebp
 342:	89 e5                	mov    %esp,%ebp
 344:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 347:	8b 45 08             	mov    0x8(%ebp),%eax
 34a:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 34d:	8b 45 0c             	mov    0xc(%ebp),%eax
 350:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 353:	eb 17                	jmp    36c <memmove+0x2b>
    *dst++ = *src++;
 355:	8b 45 fc             	mov    -0x4(%ebp),%eax
 358:	8d 50 01             	lea    0x1(%eax),%edx
 35b:	89 55 fc             	mov    %edx,-0x4(%ebp)
 35e:	8b 55 f8             	mov    -0x8(%ebp),%edx
 361:	8d 4a 01             	lea    0x1(%edx),%ecx
 364:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 367:	0f b6 12             	movzbl (%edx),%edx
 36a:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 36c:	8b 45 10             	mov    0x10(%ebp),%eax
 36f:	8d 50 ff             	lea    -0x1(%eax),%edx
 372:	89 55 10             	mov    %edx,0x10(%ebp)
 375:	85 c0                	test   %eax,%eax
 377:	7f dc                	jg     355 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 379:	8b 45 08             	mov    0x8(%ebp),%eax
}
 37c:	c9                   	leave  
 37d:	c3                   	ret    

0000037e <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 37e:	b8 01 00 00 00       	mov    $0x1,%eax
 383:	cd 40                	int    $0x40
 385:	c3                   	ret    

00000386 <exit>:
SYSCALL(exit)
 386:	b8 02 00 00 00       	mov    $0x2,%eax
 38b:	cd 40                	int    $0x40
 38d:	c3                   	ret    

0000038e <wait>:
SYSCALL(wait)
 38e:	b8 03 00 00 00       	mov    $0x3,%eax
 393:	cd 40                	int    $0x40
 395:	c3                   	ret    

00000396 <pipe>:
SYSCALL(pipe)
 396:	b8 04 00 00 00       	mov    $0x4,%eax
 39b:	cd 40                	int    $0x40
 39d:	c3                   	ret    

0000039e <read>:
SYSCALL(read)
 39e:	b8 05 00 00 00       	mov    $0x5,%eax
 3a3:	cd 40                	int    $0x40
 3a5:	c3                   	ret    

000003a6 <write>:
SYSCALL(write)
 3a6:	b8 10 00 00 00       	mov    $0x10,%eax
 3ab:	cd 40                	int    $0x40
 3ad:	c3                   	ret    

000003ae <close>:
SYSCALL(close)
 3ae:	b8 15 00 00 00       	mov    $0x15,%eax
 3b3:	cd 40                	int    $0x40
 3b5:	c3                   	ret    

000003b6 <kill>:
SYSCALL(kill)
 3b6:	b8 06 00 00 00       	mov    $0x6,%eax
 3bb:	cd 40                	int    $0x40
 3bd:	c3                   	ret    

000003be <exec>:
SYSCALL(exec)
 3be:	b8 07 00 00 00       	mov    $0x7,%eax
 3c3:	cd 40                	int    $0x40
 3c5:	c3                   	ret    

000003c6 <open>:
SYSCALL(open)
 3c6:	b8 0f 00 00 00       	mov    $0xf,%eax
 3cb:	cd 40                	int    $0x40
 3cd:	c3                   	ret    

000003ce <mknod>:
SYSCALL(mknod)
 3ce:	b8 11 00 00 00       	mov    $0x11,%eax
 3d3:	cd 40                	int    $0x40
 3d5:	c3                   	ret    

000003d6 <unlink>:
SYSCALL(unlink)
 3d6:	b8 12 00 00 00       	mov    $0x12,%eax
 3db:	cd 40                	int    $0x40
 3dd:	c3                   	ret    

000003de <fstat>:
SYSCALL(fstat)
 3de:	b8 08 00 00 00       	mov    $0x8,%eax
 3e3:	cd 40                	int    $0x40
 3e5:	c3                   	ret    

000003e6 <link>:
SYSCALL(link)
 3e6:	b8 13 00 00 00       	mov    $0x13,%eax
 3eb:	cd 40                	int    $0x40
 3ed:	c3                   	ret    

000003ee <mkdir>:
SYSCALL(mkdir)
 3ee:	b8 14 00 00 00       	mov    $0x14,%eax
 3f3:	cd 40                	int    $0x40
 3f5:	c3                   	ret    

000003f6 <chdir>:
SYSCALL(chdir)
 3f6:	b8 09 00 00 00       	mov    $0x9,%eax
 3fb:	cd 40                	int    $0x40
 3fd:	c3                   	ret    

000003fe <dup>:
SYSCALL(dup)
 3fe:	b8 0a 00 00 00       	mov    $0xa,%eax
 403:	cd 40                	int    $0x40
 405:	c3                   	ret    

00000406 <getpid>:
SYSCALL(getpid)
 406:	b8 0b 00 00 00       	mov    $0xb,%eax
 40b:	cd 40                	int    $0x40
 40d:	c3                   	ret    

0000040e <sbrk>:
SYSCALL(sbrk)
 40e:	b8 0c 00 00 00       	mov    $0xc,%eax
 413:	cd 40                	int    $0x40
 415:	c3                   	ret    

00000416 <sleep>:
SYSCALL(sleep)
 416:	b8 0d 00 00 00       	mov    $0xd,%eax
 41b:	cd 40                	int    $0x40
 41d:	c3                   	ret    

0000041e <uptime>:
SYSCALL(uptime)
 41e:	b8 0e 00 00 00       	mov    $0xe,%eax
 423:	cd 40                	int    $0x40
 425:	c3                   	ret    

00000426 <date>:
SYSCALL(date)
 426:	b8 16 00 00 00       	mov    $0x16,%eax
 42b:	cd 40                	int    $0x40
 42d:	c3                   	ret    

0000042e <getuid>:
SYSCALL(getuid)
 42e:	b8 17 00 00 00       	mov    $0x17,%eax
 433:	cd 40                	int    $0x40
 435:	c3                   	ret    

00000436 <getgid>:
SYSCALL(getgid)
 436:	b8 18 00 00 00       	mov    $0x18,%eax
 43b:	cd 40                	int    $0x40
 43d:	c3                   	ret    

0000043e <getppid>:
SYSCALL(getppid)
 43e:	b8 19 00 00 00       	mov    $0x19,%eax
 443:	cd 40                	int    $0x40
 445:	c3                   	ret    

00000446 <setuid>:
SYSCALL(setuid)
 446:	b8 1a 00 00 00       	mov    $0x1a,%eax
 44b:	cd 40                	int    $0x40
 44d:	c3                   	ret    

0000044e <setgid>:
SYSCALL(setgid)
 44e:	b8 1b 00 00 00       	mov    $0x1b,%eax
 453:	cd 40                	int    $0x40
 455:	c3                   	ret    

00000456 <getprocs>:
SYSCALL(getprocs)
 456:	b8 1c 00 00 00       	mov    $0x1c,%eax
 45b:	cd 40                	int    $0x40
 45d:	c3                   	ret    

0000045e <setpriority>:
SYSCALL(setpriority)
 45e:	b8 1d 00 00 00       	mov    $0x1d,%eax
 463:	cd 40                	int    $0x40
 465:	c3                   	ret    

00000466 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 466:	55                   	push   %ebp
 467:	89 e5                	mov    %esp,%ebp
 469:	83 ec 18             	sub    $0x18,%esp
 46c:	8b 45 0c             	mov    0xc(%ebp),%eax
 46f:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 472:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 479:	00 
 47a:	8d 45 f4             	lea    -0xc(%ebp),%eax
 47d:	89 44 24 04          	mov    %eax,0x4(%esp)
 481:	8b 45 08             	mov    0x8(%ebp),%eax
 484:	89 04 24             	mov    %eax,(%esp)
 487:	e8 1a ff ff ff       	call   3a6 <write>
}
 48c:	c9                   	leave  
 48d:	c3                   	ret    

0000048e <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 48e:	55                   	push   %ebp
 48f:	89 e5                	mov    %esp,%ebp
 491:	56                   	push   %esi
 492:	53                   	push   %ebx
 493:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 496:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 49d:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 4a1:	74 17                	je     4ba <printint+0x2c>
 4a3:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 4a7:	79 11                	jns    4ba <printint+0x2c>
    neg = 1;
 4a9:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 4b0:	8b 45 0c             	mov    0xc(%ebp),%eax
 4b3:	f7 d8                	neg    %eax
 4b5:	89 45 ec             	mov    %eax,-0x14(%ebp)
 4b8:	eb 06                	jmp    4c0 <printint+0x32>
  } else {
    x = xx;
 4ba:	8b 45 0c             	mov    0xc(%ebp),%eax
 4bd:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 4c0:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 4c7:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 4ca:	8d 41 01             	lea    0x1(%ecx),%eax
 4cd:	89 45 f4             	mov    %eax,-0xc(%ebp)
 4d0:	8b 5d 10             	mov    0x10(%ebp),%ebx
 4d3:	8b 45 ec             	mov    -0x14(%ebp),%eax
 4d6:	ba 00 00 00 00       	mov    $0x0,%edx
 4db:	f7 f3                	div    %ebx
 4dd:	89 d0                	mov    %edx,%eax
 4df:	0f b6 80 ec 0b 00 00 	movzbl 0xbec(%eax),%eax
 4e6:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 4ea:	8b 75 10             	mov    0x10(%ebp),%esi
 4ed:	8b 45 ec             	mov    -0x14(%ebp),%eax
 4f0:	ba 00 00 00 00       	mov    $0x0,%edx
 4f5:	f7 f6                	div    %esi
 4f7:	89 45 ec             	mov    %eax,-0x14(%ebp)
 4fa:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 4fe:	75 c7                	jne    4c7 <printint+0x39>
  if(neg)
 500:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 504:	74 10                	je     516 <printint+0x88>
    buf[i++] = '-';
 506:	8b 45 f4             	mov    -0xc(%ebp),%eax
 509:	8d 50 01             	lea    0x1(%eax),%edx
 50c:	89 55 f4             	mov    %edx,-0xc(%ebp)
 50f:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 514:	eb 1f                	jmp    535 <printint+0xa7>
 516:	eb 1d                	jmp    535 <printint+0xa7>
    putc(fd, buf[i]);
 518:	8d 55 dc             	lea    -0x24(%ebp),%edx
 51b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 51e:	01 d0                	add    %edx,%eax
 520:	0f b6 00             	movzbl (%eax),%eax
 523:	0f be c0             	movsbl %al,%eax
 526:	89 44 24 04          	mov    %eax,0x4(%esp)
 52a:	8b 45 08             	mov    0x8(%ebp),%eax
 52d:	89 04 24             	mov    %eax,(%esp)
 530:	e8 31 ff ff ff       	call   466 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 535:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 539:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 53d:	79 d9                	jns    518 <printint+0x8a>
    putc(fd, buf[i]);
}
 53f:	83 c4 30             	add    $0x30,%esp
 542:	5b                   	pop    %ebx
 543:	5e                   	pop    %esi
 544:	5d                   	pop    %ebp
 545:	c3                   	ret    

00000546 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 546:	55                   	push   %ebp
 547:	89 e5                	mov    %esp,%ebp
 549:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 54c:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 553:	8d 45 0c             	lea    0xc(%ebp),%eax
 556:	83 c0 04             	add    $0x4,%eax
 559:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 55c:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 563:	e9 7c 01 00 00       	jmp    6e4 <printf+0x19e>
    c = fmt[i] & 0xff;
 568:	8b 55 0c             	mov    0xc(%ebp),%edx
 56b:	8b 45 f0             	mov    -0x10(%ebp),%eax
 56e:	01 d0                	add    %edx,%eax
 570:	0f b6 00             	movzbl (%eax),%eax
 573:	0f be c0             	movsbl %al,%eax
 576:	25 ff 00 00 00       	and    $0xff,%eax
 57b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 57e:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 582:	75 2c                	jne    5b0 <printf+0x6a>
      if(c == '%'){
 584:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 588:	75 0c                	jne    596 <printf+0x50>
        state = '%';
 58a:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 591:	e9 4a 01 00 00       	jmp    6e0 <printf+0x19a>
      } else {
        putc(fd, c);
 596:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 599:	0f be c0             	movsbl %al,%eax
 59c:	89 44 24 04          	mov    %eax,0x4(%esp)
 5a0:	8b 45 08             	mov    0x8(%ebp),%eax
 5a3:	89 04 24             	mov    %eax,(%esp)
 5a6:	e8 bb fe ff ff       	call   466 <putc>
 5ab:	e9 30 01 00 00       	jmp    6e0 <printf+0x19a>
      }
    } else if(state == '%'){
 5b0:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 5b4:	0f 85 26 01 00 00    	jne    6e0 <printf+0x19a>
      if(c == 'd'){
 5ba:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 5be:	75 2d                	jne    5ed <printf+0xa7>
        printint(fd, *ap, 10, 1);
 5c0:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5c3:	8b 00                	mov    (%eax),%eax
 5c5:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 5cc:	00 
 5cd:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 5d4:	00 
 5d5:	89 44 24 04          	mov    %eax,0x4(%esp)
 5d9:	8b 45 08             	mov    0x8(%ebp),%eax
 5dc:	89 04 24             	mov    %eax,(%esp)
 5df:	e8 aa fe ff ff       	call   48e <printint>
        ap++;
 5e4:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 5e8:	e9 ec 00 00 00       	jmp    6d9 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 5ed:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 5f1:	74 06                	je     5f9 <printf+0xb3>
 5f3:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 5f7:	75 2d                	jne    626 <printf+0xe0>
        printint(fd, *ap, 16, 0);
 5f9:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5fc:	8b 00                	mov    (%eax),%eax
 5fe:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 605:	00 
 606:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 60d:	00 
 60e:	89 44 24 04          	mov    %eax,0x4(%esp)
 612:	8b 45 08             	mov    0x8(%ebp),%eax
 615:	89 04 24             	mov    %eax,(%esp)
 618:	e8 71 fe ff ff       	call   48e <printint>
        ap++;
 61d:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 621:	e9 b3 00 00 00       	jmp    6d9 <printf+0x193>
      } else if(c == 's'){
 626:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 62a:	75 45                	jne    671 <printf+0x12b>
        s = (char*)*ap;
 62c:	8b 45 e8             	mov    -0x18(%ebp),%eax
 62f:	8b 00                	mov    (%eax),%eax
 631:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 634:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 638:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 63c:	75 09                	jne    647 <printf+0x101>
          s = "(null)";
 63e:	c7 45 f4 83 09 00 00 	movl   $0x983,-0xc(%ebp)
        while(*s != 0){
 645:	eb 1e                	jmp    665 <printf+0x11f>
 647:	eb 1c                	jmp    665 <printf+0x11f>
          putc(fd, *s);
 649:	8b 45 f4             	mov    -0xc(%ebp),%eax
 64c:	0f b6 00             	movzbl (%eax),%eax
 64f:	0f be c0             	movsbl %al,%eax
 652:	89 44 24 04          	mov    %eax,0x4(%esp)
 656:	8b 45 08             	mov    0x8(%ebp),%eax
 659:	89 04 24             	mov    %eax,(%esp)
 65c:	e8 05 fe ff ff       	call   466 <putc>
          s++;
 661:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 665:	8b 45 f4             	mov    -0xc(%ebp),%eax
 668:	0f b6 00             	movzbl (%eax),%eax
 66b:	84 c0                	test   %al,%al
 66d:	75 da                	jne    649 <printf+0x103>
 66f:	eb 68                	jmp    6d9 <printf+0x193>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 671:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 675:	75 1d                	jne    694 <printf+0x14e>
        putc(fd, *ap);
 677:	8b 45 e8             	mov    -0x18(%ebp),%eax
 67a:	8b 00                	mov    (%eax),%eax
 67c:	0f be c0             	movsbl %al,%eax
 67f:	89 44 24 04          	mov    %eax,0x4(%esp)
 683:	8b 45 08             	mov    0x8(%ebp),%eax
 686:	89 04 24             	mov    %eax,(%esp)
 689:	e8 d8 fd ff ff       	call   466 <putc>
        ap++;
 68e:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 692:	eb 45                	jmp    6d9 <printf+0x193>
      } else if(c == '%'){
 694:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 698:	75 17                	jne    6b1 <printf+0x16b>
        putc(fd, c);
 69a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 69d:	0f be c0             	movsbl %al,%eax
 6a0:	89 44 24 04          	mov    %eax,0x4(%esp)
 6a4:	8b 45 08             	mov    0x8(%ebp),%eax
 6a7:	89 04 24             	mov    %eax,(%esp)
 6aa:	e8 b7 fd ff ff       	call   466 <putc>
 6af:	eb 28                	jmp    6d9 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 6b1:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 6b8:	00 
 6b9:	8b 45 08             	mov    0x8(%ebp),%eax
 6bc:	89 04 24             	mov    %eax,(%esp)
 6bf:	e8 a2 fd ff ff       	call   466 <putc>
        putc(fd, c);
 6c4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6c7:	0f be c0             	movsbl %al,%eax
 6ca:	89 44 24 04          	mov    %eax,0x4(%esp)
 6ce:	8b 45 08             	mov    0x8(%ebp),%eax
 6d1:	89 04 24             	mov    %eax,(%esp)
 6d4:	e8 8d fd ff ff       	call   466 <putc>
      }
      state = 0;
 6d9:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 6e0:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 6e4:	8b 55 0c             	mov    0xc(%ebp),%edx
 6e7:	8b 45 f0             	mov    -0x10(%ebp),%eax
 6ea:	01 d0                	add    %edx,%eax
 6ec:	0f b6 00             	movzbl (%eax),%eax
 6ef:	84 c0                	test   %al,%al
 6f1:	0f 85 71 fe ff ff    	jne    568 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 6f7:	c9                   	leave  
 6f8:	c3                   	ret    

000006f9 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 6f9:	55                   	push   %ebp
 6fa:	89 e5                	mov    %esp,%ebp
 6fc:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 6ff:	8b 45 08             	mov    0x8(%ebp),%eax
 702:	83 e8 08             	sub    $0x8,%eax
 705:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 708:	a1 08 0c 00 00       	mov    0xc08,%eax
 70d:	89 45 fc             	mov    %eax,-0x4(%ebp)
 710:	eb 24                	jmp    736 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 712:	8b 45 fc             	mov    -0x4(%ebp),%eax
 715:	8b 00                	mov    (%eax),%eax
 717:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 71a:	77 12                	ja     72e <free+0x35>
 71c:	8b 45 f8             	mov    -0x8(%ebp),%eax
 71f:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 722:	77 24                	ja     748 <free+0x4f>
 724:	8b 45 fc             	mov    -0x4(%ebp),%eax
 727:	8b 00                	mov    (%eax),%eax
 729:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 72c:	77 1a                	ja     748 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 72e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 731:	8b 00                	mov    (%eax),%eax
 733:	89 45 fc             	mov    %eax,-0x4(%ebp)
 736:	8b 45 f8             	mov    -0x8(%ebp),%eax
 739:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 73c:	76 d4                	jbe    712 <free+0x19>
 73e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 741:	8b 00                	mov    (%eax),%eax
 743:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 746:	76 ca                	jbe    712 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 748:	8b 45 f8             	mov    -0x8(%ebp),%eax
 74b:	8b 40 04             	mov    0x4(%eax),%eax
 74e:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 755:	8b 45 f8             	mov    -0x8(%ebp),%eax
 758:	01 c2                	add    %eax,%edx
 75a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 75d:	8b 00                	mov    (%eax),%eax
 75f:	39 c2                	cmp    %eax,%edx
 761:	75 24                	jne    787 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 763:	8b 45 f8             	mov    -0x8(%ebp),%eax
 766:	8b 50 04             	mov    0x4(%eax),%edx
 769:	8b 45 fc             	mov    -0x4(%ebp),%eax
 76c:	8b 00                	mov    (%eax),%eax
 76e:	8b 40 04             	mov    0x4(%eax),%eax
 771:	01 c2                	add    %eax,%edx
 773:	8b 45 f8             	mov    -0x8(%ebp),%eax
 776:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 779:	8b 45 fc             	mov    -0x4(%ebp),%eax
 77c:	8b 00                	mov    (%eax),%eax
 77e:	8b 10                	mov    (%eax),%edx
 780:	8b 45 f8             	mov    -0x8(%ebp),%eax
 783:	89 10                	mov    %edx,(%eax)
 785:	eb 0a                	jmp    791 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 787:	8b 45 fc             	mov    -0x4(%ebp),%eax
 78a:	8b 10                	mov    (%eax),%edx
 78c:	8b 45 f8             	mov    -0x8(%ebp),%eax
 78f:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 791:	8b 45 fc             	mov    -0x4(%ebp),%eax
 794:	8b 40 04             	mov    0x4(%eax),%eax
 797:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 79e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7a1:	01 d0                	add    %edx,%eax
 7a3:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 7a6:	75 20                	jne    7c8 <free+0xcf>
    p->s.size += bp->s.size;
 7a8:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7ab:	8b 50 04             	mov    0x4(%eax),%edx
 7ae:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7b1:	8b 40 04             	mov    0x4(%eax),%eax
 7b4:	01 c2                	add    %eax,%edx
 7b6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7b9:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 7bc:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7bf:	8b 10                	mov    (%eax),%edx
 7c1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7c4:	89 10                	mov    %edx,(%eax)
 7c6:	eb 08                	jmp    7d0 <free+0xd7>
  } else
    p->s.ptr = bp;
 7c8:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7cb:	8b 55 f8             	mov    -0x8(%ebp),%edx
 7ce:	89 10                	mov    %edx,(%eax)
  freep = p;
 7d0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7d3:	a3 08 0c 00 00       	mov    %eax,0xc08
}
 7d8:	c9                   	leave  
 7d9:	c3                   	ret    

000007da <morecore>:

static Header*
morecore(uint nu)
{
 7da:	55                   	push   %ebp
 7db:	89 e5                	mov    %esp,%ebp
 7dd:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 7e0:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 7e7:	77 07                	ja     7f0 <morecore+0x16>
    nu = 4096;
 7e9:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 7f0:	8b 45 08             	mov    0x8(%ebp),%eax
 7f3:	c1 e0 03             	shl    $0x3,%eax
 7f6:	89 04 24             	mov    %eax,(%esp)
 7f9:	e8 10 fc ff ff       	call   40e <sbrk>
 7fe:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 801:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 805:	75 07                	jne    80e <morecore+0x34>
    return 0;
 807:	b8 00 00 00 00       	mov    $0x0,%eax
 80c:	eb 22                	jmp    830 <morecore+0x56>
  hp = (Header*)p;
 80e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 811:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 814:	8b 45 f0             	mov    -0x10(%ebp),%eax
 817:	8b 55 08             	mov    0x8(%ebp),%edx
 81a:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 81d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 820:	83 c0 08             	add    $0x8,%eax
 823:	89 04 24             	mov    %eax,(%esp)
 826:	e8 ce fe ff ff       	call   6f9 <free>
  return freep;
 82b:	a1 08 0c 00 00       	mov    0xc08,%eax
}
 830:	c9                   	leave  
 831:	c3                   	ret    

00000832 <malloc>:

void*
malloc(uint nbytes)
{
 832:	55                   	push   %ebp
 833:	89 e5                	mov    %esp,%ebp
 835:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 838:	8b 45 08             	mov    0x8(%ebp),%eax
 83b:	83 c0 07             	add    $0x7,%eax
 83e:	c1 e8 03             	shr    $0x3,%eax
 841:	83 c0 01             	add    $0x1,%eax
 844:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 847:	a1 08 0c 00 00       	mov    0xc08,%eax
 84c:	89 45 f0             	mov    %eax,-0x10(%ebp)
 84f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 853:	75 23                	jne    878 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 855:	c7 45 f0 00 0c 00 00 	movl   $0xc00,-0x10(%ebp)
 85c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 85f:	a3 08 0c 00 00       	mov    %eax,0xc08
 864:	a1 08 0c 00 00       	mov    0xc08,%eax
 869:	a3 00 0c 00 00       	mov    %eax,0xc00
    base.s.size = 0;
 86e:	c7 05 04 0c 00 00 00 	movl   $0x0,0xc04
 875:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 878:	8b 45 f0             	mov    -0x10(%ebp),%eax
 87b:	8b 00                	mov    (%eax),%eax
 87d:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 880:	8b 45 f4             	mov    -0xc(%ebp),%eax
 883:	8b 40 04             	mov    0x4(%eax),%eax
 886:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 889:	72 4d                	jb     8d8 <malloc+0xa6>
      if(p->s.size == nunits)
 88b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 88e:	8b 40 04             	mov    0x4(%eax),%eax
 891:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 894:	75 0c                	jne    8a2 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 896:	8b 45 f4             	mov    -0xc(%ebp),%eax
 899:	8b 10                	mov    (%eax),%edx
 89b:	8b 45 f0             	mov    -0x10(%ebp),%eax
 89e:	89 10                	mov    %edx,(%eax)
 8a0:	eb 26                	jmp    8c8 <malloc+0x96>
      else {
        p->s.size -= nunits;
 8a2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8a5:	8b 40 04             	mov    0x4(%eax),%eax
 8a8:	2b 45 ec             	sub    -0x14(%ebp),%eax
 8ab:	89 c2                	mov    %eax,%edx
 8ad:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8b0:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 8b3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8b6:	8b 40 04             	mov    0x4(%eax),%eax
 8b9:	c1 e0 03             	shl    $0x3,%eax
 8bc:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 8bf:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8c2:	8b 55 ec             	mov    -0x14(%ebp),%edx
 8c5:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 8c8:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8cb:	a3 08 0c 00 00       	mov    %eax,0xc08
      return (void*)(p + 1);
 8d0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8d3:	83 c0 08             	add    $0x8,%eax
 8d6:	eb 38                	jmp    910 <malloc+0xde>
    }
    if(p == freep)
 8d8:	a1 08 0c 00 00       	mov    0xc08,%eax
 8dd:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 8e0:	75 1b                	jne    8fd <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 8e2:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8e5:	89 04 24             	mov    %eax,(%esp)
 8e8:	e8 ed fe ff ff       	call   7da <morecore>
 8ed:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8f0:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 8f4:	75 07                	jne    8fd <malloc+0xcb>
        return 0;
 8f6:	b8 00 00 00 00       	mov    $0x0,%eax
 8fb:	eb 13                	jmp    910 <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8fd:	8b 45 f4             	mov    -0xc(%ebp),%eax
 900:	89 45 f0             	mov    %eax,-0x10(%ebp)
 903:	8b 45 f4             	mov    -0xc(%ebp),%eax
 906:	8b 00                	mov    (%eax),%eax
 908:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 90b:	e9 70 ff ff ff       	jmp    880 <malloc+0x4e>
}
 910:	c9                   	leave  
 911:	c3                   	ret    
