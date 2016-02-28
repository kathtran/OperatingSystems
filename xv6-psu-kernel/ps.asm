
_ps:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:

#define MAX 10

int
main(int argc, char *argv[])
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	57                   	push   %edi
   4:	56                   	push   %esi
   5:	53                   	push   %ebx
   6:	83 e4 f0             	and    $0xfffffff0,%esp
   9:	81 ec 90 02 00 00    	sub    $0x290,%esp
  struct uproc table[MAX];
  int rc = getprocs(MAX, table);
   f:	8d 44 24 30          	lea    0x30(%esp),%eax
  13:	89 44 24 04          	mov    %eax,0x4(%esp)
  17:	c7 04 24 0a 00 00 00 	movl   $0xa,(%esp)
  1e:	e8 bc 04 00 00       	call   4df <getprocs>
  23:	89 84 24 88 02 00 00 	mov    %eax,0x288(%esp)
  int i;

  if (rc < 0) {
  2a:	83 bc 24 88 02 00 00 	cmpl   $0x0,0x288(%esp)
  31:	00 
  32:	79 19                	jns    4d <main+0x4d>
    printf(2, "getprocs_failed\n");
  34:	c7 44 24 04 9b 09 00 	movl   $0x99b,0x4(%esp)
  3b:	00 
  3c:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  43:	e8 87 05 00 00       	call   5cf <printf>
    exit();
  48:	e8 c2 03 00 00       	call   40f <exit>
  }

  for (i = 0; i < rc; i++) {
  4d:	c7 84 24 8c 02 00 00 	movl   $0x0,0x28c(%esp)
  54:	00 00 00 00 
  58:	e9 31 01 00 00       	jmp    18e <main+0x18e>
    printf(1, "%d  %d  %d  %d  %s  %d  %s\n",
           table[i].pid, table[i].uid, table[i].gid, table[i].ppid,
           table[i].state, table[i].sz, table[i].name);
  5d:	8d 4c 24 30          	lea    0x30(%esp),%ecx
  61:	8b 84 24 8c 02 00 00 	mov    0x28c(%esp),%eax
  68:	c1 e0 02             	shl    $0x2,%eax
  6b:	89 c2                	mov    %eax,%edx
  6d:	c1 e2 04             	shl    $0x4,%edx
  70:	29 c2                	sub    %eax,%edx
  72:	8d 42 20             	lea    0x20(%edx),%eax
  75:	01 c8                	add    %ecx,%eax
  77:	83 c0 08             	add    $0x8,%eax
  7a:	89 44 24 2c          	mov    %eax,0x2c(%esp)
    printf(2, "getprocs_failed\n");
    exit();
  }

  for (i = 0; i < rc; i++) {
    printf(1, "%d  %d  %d  %d  %s  %d  %s\n",
  7e:	8b 84 24 8c 02 00 00 	mov    0x28c(%esp),%eax
  85:	c1 e0 02             	shl    $0x2,%eax
  88:	89 c2                	mov    %eax,%edx
  8a:	c1 e2 04             	shl    $0x4,%edx
  8d:	29 c2                	sub    %eax,%edx
  8f:	8d 9c 24 90 02 00 00 	lea    0x290(%esp),%ebx
  96:	8d 04 13             	lea    (%ebx,%edx,1),%eax
  99:	2d 3c 02 00 00       	sub    $0x23c,%eax
  9e:	8b 38                	mov    (%eax),%edi
           table[i].pid, table[i].uid, table[i].gid, table[i].ppid,
           table[i].state, table[i].sz, table[i].name);
  a0:	8d 4c 24 30          	lea    0x30(%esp),%ecx
  a4:	8b 84 24 8c 02 00 00 	mov    0x28c(%esp),%eax
  ab:	c1 e0 02             	shl    $0x2,%eax
  ae:	89 c2                	mov    %eax,%edx
  b0:	c1 e2 04             	shl    $0x4,%edx
  b3:	29 c2                	sub    %eax,%edx
  b5:	8d 42 10             	lea    0x10(%edx),%eax
  b8:	8d 34 01             	lea    (%ecx,%eax,1),%esi
  bb:	89 74 24 28          	mov    %esi,0x28(%esp)
    printf(2, "getprocs_failed\n");
    exit();
  }

  for (i = 0; i < rc; i++) {
    printf(1, "%d  %d  %d  %d  %s  %d  %s\n",
  bf:	8b 84 24 8c 02 00 00 	mov    0x28c(%esp),%eax
  c6:	c1 e0 02             	shl    $0x2,%eax
  c9:	89 c2                	mov    %eax,%edx
  cb:	c1 e2 04             	shl    $0x4,%edx
  ce:	29 c2                	sub    %eax,%edx
  d0:	8d 9c 24 90 02 00 00 	lea    0x290(%esp),%ebx
  d7:	8d 04 13             	lea    (%ebx,%edx,1),%eax
  da:	2d 54 02 00 00       	sub    $0x254,%eax
  df:	8b 30                	mov    (%eax),%esi
  e1:	8b 84 24 8c 02 00 00 	mov    0x28c(%esp),%eax
  e8:	c1 e0 02             	shl    $0x2,%eax
  eb:	89 c2                	mov    %eax,%edx
  ed:	c1 e2 04             	shl    $0x4,%edx
  f0:	29 c2                	sub    %eax,%edx
  f2:	8d 8c 24 90 02 00 00 	lea    0x290(%esp),%ecx
  f9:	8d 04 11             	lea    (%ecx,%edx,1),%eax
  fc:	2d 58 02 00 00       	sub    $0x258,%eax
 101:	8b 18                	mov    (%eax),%ebx
 103:	8b 84 24 8c 02 00 00 	mov    0x28c(%esp),%eax
 10a:	c1 e0 02             	shl    $0x2,%eax
 10d:	89 c2                	mov    %eax,%edx
 10f:	c1 e2 04             	shl    $0x4,%edx
 112:	29 c2                	sub    %eax,%edx
 114:	8d 8c 24 90 02 00 00 	lea    0x290(%esp),%ecx
 11b:	8d 04 11             	lea    (%ecx,%edx,1),%eax
 11e:	2d 5c 02 00 00       	sub    $0x25c,%eax
 123:	8b 08                	mov    (%eax),%ecx
 125:	8b 84 24 8c 02 00 00 	mov    0x28c(%esp),%eax
 12c:	89 c2                	mov    %eax,%edx
 12e:	8d 04 95 00 00 00 00 	lea    0x0(,%edx,4),%eax
 135:	89 c2                	mov    %eax,%edx
 137:	89 d0                	mov    %edx,%eax
 139:	c1 e0 04             	shl    $0x4,%eax
 13c:	29 d0                	sub    %edx,%eax
 13e:	8d 94 24 90 02 00 00 	lea    0x290(%esp),%edx
 145:	01 d0                	add    %edx,%eax
 147:	2d 60 02 00 00       	sub    $0x260,%eax
 14c:	8b 00                	mov    (%eax),%eax
 14e:	8b 54 24 2c          	mov    0x2c(%esp),%edx
 152:	89 54 24 20          	mov    %edx,0x20(%esp)
 156:	89 7c 24 1c          	mov    %edi,0x1c(%esp)
 15a:	8b 7c 24 28          	mov    0x28(%esp),%edi
 15e:	89 7c 24 18          	mov    %edi,0x18(%esp)
 162:	89 74 24 14          	mov    %esi,0x14(%esp)
 166:	89 5c 24 10          	mov    %ebx,0x10(%esp)
 16a:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
 16e:	89 44 24 08          	mov    %eax,0x8(%esp)
 172:	c7 44 24 04 ac 09 00 	movl   $0x9ac,0x4(%esp)
 179:	00 
 17a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 181:	e8 49 04 00 00       	call   5cf <printf>
  if (rc < 0) {
    printf(2, "getprocs_failed\n");
    exit();
  }

  for (i = 0; i < rc; i++) {
 186:	83 84 24 8c 02 00 00 	addl   $0x1,0x28c(%esp)
 18d:	01 
 18e:	8b 84 24 8c 02 00 00 	mov    0x28c(%esp),%eax
 195:	3b 84 24 88 02 00 00 	cmp    0x288(%esp),%eax
 19c:	0f 8c bb fe ff ff    	jl     5d <main+0x5d>
    printf(1, "%d  %d  %d  %d  %s  %d  %s\n",
           table[i].pid, table[i].uid, table[i].gid, table[i].ppid,
           table[i].state, table[i].sz, table[i].name);
  }

  exit();
 1a2:	e8 68 02 00 00       	call   40f <exit>

000001a7 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 1a7:	55                   	push   %ebp
 1a8:	89 e5                	mov    %esp,%ebp
 1aa:	57                   	push   %edi
 1ab:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 1ac:	8b 4d 08             	mov    0x8(%ebp),%ecx
 1af:	8b 55 10             	mov    0x10(%ebp),%edx
 1b2:	8b 45 0c             	mov    0xc(%ebp),%eax
 1b5:	89 cb                	mov    %ecx,%ebx
 1b7:	89 df                	mov    %ebx,%edi
 1b9:	89 d1                	mov    %edx,%ecx
 1bb:	fc                   	cld    
 1bc:	f3 aa                	rep stos %al,%es:(%edi)
 1be:	89 ca                	mov    %ecx,%edx
 1c0:	89 fb                	mov    %edi,%ebx
 1c2:	89 5d 08             	mov    %ebx,0x8(%ebp)
 1c5:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 1c8:	5b                   	pop    %ebx
 1c9:	5f                   	pop    %edi
 1ca:	5d                   	pop    %ebp
 1cb:	c3                   	ret    

000001cc <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 1cc:	55                   	push   %ebp
 1cd:	89 e5                	mov    %esp,%ebp
 1cf:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 1d2:	8b 45 08             	mov    0x8(%ebp),%eax
 1d5:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 1d8:	90                   	nop
 1d9:	8b 45 08             	mov    0x8(%ebp),%eax
 1dc:	8d 50 01             	lea    0x1(%eax),%edx
 1df:	89 55 08             	mov    %edx,0x8(%ebp)
 1e2:	8b 55 0c             	mov    0xc(%ebp),%edx
 1e5:	8d 4a 01             	lea    0x1(%edx),%ecx
 1e8:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 1eb:	0f b6 12             	movzbl (%edx),%edx
 1ee:	88 10                	mov    %dl,(%eax)
 1f0:	0f b6 00             	movzbl (%eax),%eax
 1f3:	84 c0                	test   %al,%al
 1f5:	75 e2                	jne    1d9 <strcpy+0xd>
    ;
  return os;
 1f7:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 1fa:	c9                   	leave  
 1fb:	c3                   	ret    

000001fc <strcmp>:

int
strcmp(const char *p, const char *q)
{
 1fc:	55                   	push   %ebp
 1fd:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 1ff:	eb 08                	jmp    209 <strcmp+0xd>
    p++, q++;
 201:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 205:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 209:	8b 45 08             	mov    0x8(%ebp),%eax
 20c:	0f b6 00             	movzbl (%eax),%eax
 20f:	84 c0                	test   %al,%al
 211:	74 10                	je     223 <strcmp+0x27>
 213:	8b 45 08             	mov    0x8(%ebp),%eax
 216:	0f b6 10             	movzbl (%eax),%edx
 219:	8b 45 0c             	mov    0xc(%ebp),%eax
 21c:	0f b6 00             	movzbl (%eax),%eax
 21f:	38 c2                	cmp    %al,%dl
 221:	74 de                	je     201 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 223:	8b 45 08             	mov    0x8(%ebp),%eax
 226:	0f b6 00             	movzbl (%eax),%eax
 229:	0f b6 d0             	movzbl %al,%edx
 22c:	8b 45 0c             	mov    0xc(%ebp),%eax
 22f:	0f b6 00             	movzbl (%eax),%eax
 232:	0f b6 c0             	movzbl %al,%eax
 235:	29 c2                	sub    %eax,%edx
 237:	89 d0                	mov    %edx,%eax
}
 239:	5d                   	pop    %ebp
 23a:	c3                   	ret    

0000023b <strlen>:

uint
strlen(char *s)
{
 23b:	55                   	push   %ebp
 23c:	89 e5                	mov    %esp,%ebp
 23e:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 241:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 248:	eb 04                	jmp    24e <strlen+0x13>
 24a:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 24e:	8b 55 fc             	mov    -0x4(%ebp),%edx
 251:	8b 45 08             	mov    0x8(%ebp),%eax
 254:	01 d0                	add    %edx,%eax
 256:	0f b6 00             	movzbl (%eax),%eax
 259:	84 c0                	test   %al,%al
 25b:	75 ed                	jne    24a <strlen+0xf>
    ;
  return n;
 25d:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 260:	c9                   	leave  
 261:	c3                   	ret    

00000262 <memset>:

void*
memset(void *dst, int c, uint n)
{
 262:	55                   	push   %ebp
 263:	89 e5                	mov    %esp,%ebp
 265:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 268:	8b 45 10             	mov    0x10(%ebp),%eax
 26b:	89 44 24 08          	mov    %eax,0x8(%esp)
 26f:	8b 45 0c             	mov    0xc(%ebp),%eax
 272:	89 44 24 04          	mov    %eax,0x4(%esp)
 276:	8b 45 08             	mov    0x8(%ebp),%eax
 279:	89 04 24             	mov    %eax,(%esp)
 27c:	e8 26 ff ff ff       	call   1a7 <stosb>
  return dst;
 281:	8b 45 08             	mov    0x8(%ebp),%eax
}
 284:	c9                   	leave  
 285:	c3                   	ret    

00000286 <strchr>:

char*
strchr(const char *s, char c)
{
 286:	55                   	push   %ebp
 287:	89 e5                	mov    %esp,%ebp
 289:	83 ec 04             	sub    $0x4,%esp
 28c:	8b 45 0c             	mov    0xc(%ebp),%eax
 28f:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 292:	eb 14                	jmp    2a8 <strchr+0x22>
    if(*s == c)
 294:	8b 45 08             	mov    0x8(%ebp),%eax
 297:	0f b6 00             	movzbl (%eax),%eax
 29a:	3a 45 fc             	cmp    -0x4(%ebp),%al
 29d:	75 05                	jne    2a4 <strchr+0x1e>
      return (char*)s;
 29f:	8b 45 08             	mov    0x8(%ebp),%eax
 2a2:	eb 13                	jmp    2b7 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 2a4:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 2a8:	8b 45 08             	mov    0x8(%ebp),%eax
 2ab:	0f b6 00             	movzbl (%eax),%eax
 2ae:	84 c0                	test   %al,%al
 2b0:	75 e2                	jne    294 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 2b2:	b8 00 00 00 00       	mov    $0x0,%eax
}
 2b7:	c9                   	leave  
 2b8:	c3                   	ret    

000002b9 <gets>:

char*
gets(char *buf, int max)
{
 2b9:	55                   	push   %ebp
 2ba:	89 e5                	mov    %esp,%ebp
 2bc:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2bf:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 2c6:	eb 4c                	jmp    314 <gets+0x5b>
    cc = read(0, &c, 1);
 2c8:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 2cf:	00 
 2d0:	8d 45 ef             	lea    -0x11(%ebp),%eax
 2d3:	89 44 24 04          	mov    %eax,0x4(%esp)
 2d7:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 2de:	e8 44 01 00 00       	call   427 <read>
 2e3:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 2e6:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 2ea:	7f 02                	jg     2ee <gets+0x35>
      break;
 2ec:	eb 31                	jmp    31f <gets+0x66>
    buf[i++] = c;
 2ee:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2f1:	8d 50 01             	lea    0x1(%eax),%edx
 2f4:	89 55 f4             	mov    %edx,-0xc(%ebp)
 2f7:	89 c2                	mov    %eax,%edx
 2f9:	8b 45 08             	mov    0x8(%ebp),%eax
 2fc:	01 c2                	add    %eax,%edx
 2fe:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 302:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 304:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 308:	3c 0a                	cmp    $0xa,%al
 30a:	74 13                	je     31f <gets+0x66>
 30c:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 310:	3c 0d                	cmp    $0xd,%al
 312:	74 0b                	je     31f <gets+0x66>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 314:	8b 45 f4             	mov    -0xc(%ebp),%eax
 317:	83 c0 01             	add    $0x1,%eax
 31a:	3b 45 0c             	cmp    0xc(%ebp),%eax
 31d:	7c a9                	jl     2c8 <gets+0xf>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 31f:	8b 55 f4             	mov    -0xc(%ebp),%edx
 322:	8b 45 08             	mov    0x8(%ebp),%eax
 325:	01 d0                	add    %edx,%eax
 327:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 32a:	8b 45 08             	mov    0x8(%ebp),%eax
}
 32d:	c9                   	leave  
 32e:	c3                   	ret    

0000032f <stat>:

int
stat(char *n, struct stat *st)
{
 32f:	55                   	push   %ebp
 330:	89 e5                	mov    %esp,%ebp
 332:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 335:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 33c:	00 
 33d:	8b 45 08             	mov    0x8(%ebp),%eax
 340:	89 04 24             	mov    %eax,(%esp)
 343:	e8 07 01 00 00       	call   44f <open>
 348:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 34b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 34f:	79 07                	jns    358 <stat+0x29>
    return -1;
 351:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 356:	eb 23                	jmp    37b <stat+0x4c>
  r = fstat(fd, st);
 358:	8b 45 0c             	mov    0xc(%ebp),%eax
 35b:	89 44 24 04          	mov    %eax,0x4(%esp)
 35f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 362:	89 04 24             	mov    %eax,(%esp)
 365:	e8 fd 00 00 00       	call   467 <fstat>
 36a:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 36d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 370:	89 04 24             	mov    %eax,(%esp)
 373:	e8 bf 00 00 00       	call   437 <close>
  return r;
 378:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 37b:	c9                   	leave  
 37c:	c3                   	ret    

0000037d <atoi>:

int
atoi(const char *s)
{
 37d:	55                   	push   %ebp
 37e:	89 e5                	mov    %esp,%ebp
 380:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 383:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 38a:	eb 25                	jmp    3b1 <atoi+0x34>
    n = n*10 + *s++ - '0';
 38c:	8b 55 fc             	mov    -0x4(%ebp),%edx
 38f:	89 d0                	mov    %edx,%eax
 391:	c1 e0 02             	shl    $0x2,%eax
 394:	01 d0                	add    %edx,%eax
 396:	01 c0                	add    %eax,%eax
 398:	89 c1                	mov    %eax,%ecx
 39a:	8b 45 08             	mov    0x8(%ebp),%eax
 39d:	8d 50 01             	lea    0x1(%eax),%edx
 3a0:	89 55 08             	mov    %edx,0x8(%ebp)
 3a3:	0f b6 00             	movzbl (%eax),%eax
 3a6:	0f be c0             	movsbl %al,%eax
 3a9:	01 c8                	add    %ecx,%eax
 3ab:	83 e8 30             	sub    $0x30,%eax
 3ae:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 3b1:	8b 45 08             	mov    0x8(%ebp),%eax
 3b4:	0f b6 00             	movzbl (%eax),%eax
 3b7:	3c 2f                	cmp    $0x2f,%al
 3b9:	7e 0a                	jle    3c5 <atoi+0x48>
 3bb:	8b 45 08             	mov    0x8(%ebp),%eax
 3be:	0f b6 00             	movzbl (%eax),%eax
 3c1:	3c 39                	cmp    $0x39,%al
 3c3:	7e c7                	jle    38c <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 3c5:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 3c8:	c9                   	leave  
 3c9:	c3                   	ret    

000003ca <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 3ca:	55                   	push   %ebp
 3cb:	89 e5                	mov    %esp,%ebp
 3cd:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 3d0:	8b 45 08             	mov    0x8(%ebp),%eax
 3d3:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 3d6:	8b 45 0c             	mov    0xc(%ebp),%eax
 3d9:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 3dc:	eb 17                	jmp    3f5 <memmove+0x2b>
    *dst++ = *src++;
 3de:	8b 45 fc             	mov    -0x4(%ebp),%eax
 3e1:	8d 50 01             	lea    0x1(%eax),%edx
 3e4:	89 55 fc             	mov    %edx,-0x4(%ebp)
 3e7:	8b 55 f8             	mov    -0x8(%ebp),%edx
 3ea:	8d 4a 01             	lea    0x1(%edx),%ecx
 3ed:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 3f0:	0f b6 12             	movzbl (%edx),%edx
 3f3:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 3f5:	8b 45 10             	mov    0x10(%ebp),%eax
 3f8:	8d 50 ff             	lea    -0x1(%eax),%edx
 3fb:	89 55 10             	mov    %edx,0x10(%ebp)
 3fe:	85 c0                	test   %eax,%eax
 400:	7f dc                	jg     3de <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 402:	8b 45 08             	mov    0x8(%ebp),%eax
}
 405:	c9                   	leave  
 406:	c3                   	ret    

00000407 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 407:	b8 01 00 00 00       	mov    $0x1,%eax
 40c:	cd 40                	int    $0x40
 40e:	c3                   	ret    

0000040f <exit>:
SYSCALL(exit)
 40f:	b8 02 00 00 00       	mov    $0x2,%eax
 414:	cd 40                	int    $0x40
 416:	c3                   	ret    

00000417 <wait>:
SYSCALL(wait)
 417:	b8 03 00 00 00       	mov    $0x3,%eax
 41c:	cd 40                	int    $0x40
 41e:	c3                   	ret    

0000041f <pipe>:
SYSCALL(pipe)
 41f:	b8 04 00 00 00       	mov    $0x4,%eax
 424:	cd 40                	int    $0x40
 426:	c3                   	ret    

00000427 <read>:
SYSCALL(read)
 427:	b8 05 00 00 00       	mov    $0x5,%eax
 42c:	cd 40                	int    $0x40
 42e:	c3                   	ret    

0000042f <write>:
SYSCALL(write)
 42f:	b8 10 00 00 00       	mov    $0x10,%eax
 434:	cd 40                	int    $0x40
 436:	c3                   	ret    

00000437 <close>:
SYSCALL(close)
 437:	b8 15 00 00 00       	mov    $0x15,%eax
 43c:	cd 40                	int    $0x40
 43e:	c3                   	ret    

0000043f <kill>:
SYSCALL(kill)
 43f:	b8 06 00 00 00       	mov    $0x6,%eax
 444:	cd 40                	int    $0x40
 446:	c3                   	ret    

00000447 <exec>:
SYSCALL(exec)
 447:	b8 07 00 00 00       	mov    $0x7,%eax
 44c:	cd 40                	int    $0x40
 44e:	c3                   	ret    

0000044f <open>:
SYSCALL(open)
 44f:	b8 0f 00 00 00       	mov    $0xf,%eax
 454:	cd 40                	int    $0x40
 456:	c3                   	ret    

00000457 <mknod>:
SYSCALL(mknod)
 457:	b8 11 00 00 00       	mov    $0x11,%eax
 45c:	cd 40                	int    $0x40
 45e:	c3                   	ret    

0000045f <unlink>:
SYSCALL(unlink)
 45f:	b8 12 00 00 00       	mov    $0x12,%eax
 464:	cd 40                	int    $0x40
 466:	c3                   	ret    

00000467 <fstat>:
SYSCALL(fstat)
 467:	b8 08 00 00 00       	mov    $0x8,%eax
 46c:	cd 40                	int    $0x40
 46e:	c3                   	ret    

0000046f <link>:
SYSCALL(link)
 46f:	b8 13 00 00 00       	mov    $0x13,%eax
 474:	cd 40                	int    $0x40
 476:	c3                   	ret    

00000477 <mkdir>:
SYSCALL(mkdir)
 477:	b8 14 00 00 00       	mov    $0x14,%eax
 47c:	cd 40                	int    $0x40
 47e:	c3                   	ret    

0000047f <chdir>:
SYSCALL(chdir)
 47f:	b8 09 00 00 00       	mov    $0x9,%eax
 484:	cd 40                	int    $0x40
 486:	c3                   	ret    

00000487 <dup>:
SYSCALL(dup)
 487:	b8 0a 00 00 00       	mov    $0xa,%eax
 48c:	cd 40                	int    $0x40
 48e:	c3                   	ret    

0000048f <getpid>:
SYSCALL(getpid)
 48f:	b8 0b 00 00 00       	mov    $0xb,%eax
 494:	cd 40                	int    $0x40
 496:	c3                   	ret    

00000497 <sbrk>:
SYSCALL(sbrk)
 497:	b8 0c 00 00 00       	mov    $0xc,%eax
 49c:	cd 40                	int    $0x40
 49e:	c3                   	ret    

0000049f <sleep>:
SYSCALL(sleep)
 49f:	b8 0d 00 00 00       	mov    $0xd,%eax
 4a4:	cd 40                	int    $0x40
 4a6:	c3                   	ret    

000004a7 <uptime>:
SYSCALL(uptime)
 4a7:	b8 0e 00 00 00       	mov    $0xe,%eax
 4ac:	cd 40                	int    $0x40
 4ae:	c3                   	ret    

000004af <date>:
SYSCALL(date)
 4af:	b8 16 00 00 00       	mov    $0x16,%eax
 4b4:	cd 40                	int    $0x40
 4b6:	c3                   	ret    

000004b7 <getuid>:
SYSCALL(getuid)
 4b7:	b8 17 00 00 00       	mov    $0x17,%eax
 4bc:	cd 40                	int    $0x40
 4be:	c3                   	ret    

000004bf <getgid>:
SYSCALL(getgid)
 4bf:	b8 18 00 00 00       	mov    $0x18,%eax
 4c4:	cd 40                	int    $0x40
 4c6:	c3                   	ret    

000004c7 <getppid>:
SYSCALL(getppid)
 4c7:	b8 19 00 00 00       	mov    $0x19,%eax
 4cc:	cd 40                	int    $0x40
 4ce:	c3                   	ret    

000004cf <setuid>:
SYSCALL(setuid)
 4cf:	b8 1a 00 00 00       	mov    $0x1a,%eax
 4d4:	cd 40                	int    $0x40
 4d6:	c3                   	ret    

000004d7 <setgid>:
SYSCALL(setgid)
 4d7:	b8 1b 00 00 00       	mov    $0x1b,%eax
 4dc:	cd 40                	int    $0x40
 4de:	c3                   	ret    

000004df <getprocs>:
SYSCALL(getprocs)
 4df:	b8 1c 00 00 00       	mov    $0x1c,%eax
 4e4:	cd 40                	int    $0x40
 4e6:	c3                   	ret    

000004e7 <setpriority>:
SYSCALL(setpriority)
 4e7:	b8 1d 00 00 00       	mov    $0x1d,%eax
 4ec:	cd 40                	int    $0x40
 4ee:	c3                   	ret    

000004ef <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 4ef:	55                   	push   %ebp
 4f0:	89 e5                	mov    %esp,%ebp
 4f2:	83 ec 18             	sub    $0x18,%esp
 4f5:	8b 45 0c             	mov    0xc(%ebp),%eax
 4f8:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 4fb:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 502:	00 
 503:	8d 45 f4             	lea    -0xc(%ebp),%eax
 506:	89 44 24 04          	mov    %eax,0x4(%esp)
 50a:	8b 45 08             	mov    0x8(%ebp),%eax
 50d:	89 04 24             	mov    %eax,(%esp)
 510:	e8 1a ff ff ff       	call   42f <write>
}
 515:	c9                   	leave  
 516:	c3                   	ret    

00000517 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 517:	55                   	push   %ebp
 518:	89 e5                	mov    %esp,%ebp
 51a:	56                   	push   %esi
 51b:	53                   	push   %ebx
 51c:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 51f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 526:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 52a:	74 17                	je     543 <printint+0x2c>
 52c:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 530:	79 11                	jns    543 <printint+0x2c>
    neg = 1;
 532:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 539:	8b 45 0c             	mov    0xc(%ebp),%eax
 53c:	f7 d8                	neg    %eax
 53e:	89 45 ec             	mov    %eax,-0x14(%ebp)
 541:	eb 06                	jmp    549 <printint+0x32>
  } else {
    x = xx;
 543:	8b 45 0c             	mov    0xc(%ebp),%eax
 546:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 549:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 550:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 553:	8d 41 01             	lea    0x1(%ecx),%eax
 556:	89 45 f4             	mov    %eax,-0xc(%ebp)
 559:	8b 5d 10             	mov    0x10(%ebp),%ebx
 55c:	8b 45 ec             	mov    -0x14(%ebp),%eax
 55f:	ba 00 00 00 00       	mov    $0x0,%edx
 564:	f7 f3                	div    %ebx
 566:	89 d0                	mov    %edx,%eax
 568:	0f b6 80 18 0c 00 00 	movzbl 0xc18(%eax),%eax
 56f:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 573:	8b 75 10             	mov    0x10(%ebp),%esi
 576:	8b 45 ec             	mov    -0x14(%ebp),%eax
 579:	ba 00 00 00 00       	mov    $0x0,%edx
 57e:	f7 f6                	div    %esi
 580:	89 45 ec             	mov    %eax,-0x14(%ebp)
 583:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 587:	75 c7                	jne    550 <printint+0x39>
  if(neg)
 589:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 58d:	74 10                	je     59f <printint+0x88>
    buf[i++] = '-';
 58f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 592:	8d 50 01             	lea    0x1(%eax),%edx
 595:	89 55 f4             	mov    %edx,-0xc(%ebp)
 598:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 59d:	eb 1f                	jmp    5be <printint+0xa7>
 59f:	eb 1d                	jmp    5be <printint+0xa7>
    putc(fd, buf[i]);
 5a1:	8d 55 dc             	lea    -0x24(%ebp),%edx
 5a4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5a7:	01 d0                	add    %edx,%eax
 5a9:	0f b6 00             	movzbl (%eax),%eax
 5ac:	0f be c0             	movsbl %al,%eax
 5af:	89 44 24 04          	mov    %eax,0x4(%esp)
 5b3:	8b 45 08             	mov    0x8(%ebp),%eax
 5b6:	89 04 24             	mov    %eax,(%esp)
 5b9:	e8 31 ff ff ff       	call   4ef <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 5be:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 5c2:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 5c6:	79 d9                	jns    5a1 <printint+0x8a>
    putc(fd, buf[i]);
}
 5c8:	83 c4 30             	add    $0x30,%esp
 5cb:	5b                   	pop    %ebx
 5cc:	5e                   	pop    %esi
 5cd:	5d                   	pop    %ebp
 5ce:	c3                   	ret    

000005cf <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 5cf:	55                   	push   %ebp
 5d0:	89 e5                	mov    %esp,%ebp
 5d2:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 5d5:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 5dc:	8d 45 0c             	lea    0xc(%ebp),%eax
 5df:	83 c0 04             	add    $0x4,%eax
 5e2:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 5e5:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 5ec:	e9 7c 01 00 00       	jmp    76d <printf+0x19e>
    c = fmt[i] & 0xff;
 5f1:	8b 55 0c             	mov    0xc(%ebp),%edx
 5f4:	8b 45 f0             	mov    -0x10(%ebp),%eax
 5f7:	01 d0                	add    %edx,%eax
 5f9:	0f b6 00             	movzbl (%eax),%eax
 5fc:	0f be c0             	movsbl %al,%eax
 5ff:	25 ff 00 00 00       	and    $0xff,%eax
 604:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 607:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 60b:	75 2c                	jne    639 <printf+0x6a>
      if(c == '%'){
 60d:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 611:	75 0c                	jne    61f <printf+0x50>
        state = '%';
 613:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 61a:	e9 4a 01 00 00       	jmp    769 <printf+0x19a>
      } else {
        putc(fd, c);
 61f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 622:	0f be c0             	movsbl %al,%eax
 625:	89 44 24 04          	mov    %eax,0x4(%esp)
 629:	8b 45 08             	mov    0x8(%ebp),%eax
 62c:	89 04 24             	mov    %eax,(%esp)
 62f:	e8 bb fe ff ff       	call   4ef <putc>
 634:	e9 30 01 00 00       	jmp    769 <printf+0x19a>
      }
    } else if(state == '%'){
 639:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 63d:	0f 85 26 01 00 00    	jne    769 <printf+0x19a>
      if(c == 'd'){
 643:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 647:	75 2d                	jne    676 <printf+0xa7>
        printint(fd, *ap, 10, 1);
 649:	8b 45 e8             	mov    -0x18(%ebp),%eax
 64c:	8b 00                	mov    (%eax),%eax
 64e:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 655:	00 
 656:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 65d:	00 
 65e:	89 44 24 04          	mov    %eax,0x4(%esp)
 662:	8b 45 08             	mov    0x8(%ebp),%eax
 665:	89 04 24             	mov    %eax,(%esp)
 668:	e8 aa fe ff ff       	call   517 <printint>
        ap++;
 66d:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 671:	e9 ec 00 00 00       	jmp    762 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 676:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 67a:	74 06                	je     682 <printf+0xb3>
 67c:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 680:	75 2d                	jne    6af <printf+0xe0>
        printint(fd, *ap, 16, 0);
 682:	8b 45 e8             	mov    -0x18(%ebp),%eax
 685:	8b 00                	mov    (%eax),%eax
 687:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 68e:	00 
 68f:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 696:	00 
 697:	89 44 24 04          	mov    %eax,0x4(%esp)
 69b:	8b 45 08             	mov    0x8(%ebp),%eax
 69e:	89 04 24             	mov    %eax,(%esp)
 6a1:	e8 71 fe ff ff       	call   517 <printint>
        ap++;
 6a6:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 6aa:	e9 b3 00 00 00       	jmp    762 <printf+0x193>
      } else if(c == 's'){
 6af:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 6b3:	75 45                	jne    6fa <printf+0x12b>
        s = (char*)*ap;
 6b5:	8b 45 e8             	mov    -0x18(%ebp),%eax
 6b8:	8b 00                	mov    (%eax),%eax
 6ba:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 6bd:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 6c1:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 6c5:	75 09                	jne    6d0 <printf+0x101>
          s = "(null)";
 6c7:	c7 45 f4 c8 09 00 00 	movl   $0x9c8,-0xc(%ebp)
        while(*s != 0){
 6ce:	eb 1e                	jmp    6ee <printf+0x11f>
 6d0:	eb 1c                	jmp    6ee <printf+0x11f>
          putc(fd, *s);
 6d2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6d5:	0f b6 00             	movzbl (%eax),%eax
 6d8:	0f be c0             	movsbl %al,%eax
 6db:	89 44 24 04          	mov    %eax,0x4(%esp)
 6df:	8b 45 08             	mov    0x8(%ebp),%eax
 6e2:	89 04 24             	mov    %eax,(%esp)
 6e5:	e8 05 fe ff ff       	call   4ef <putc>
          s++;
 6ea:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 6ee:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6f1:	0f b6 00             	movzbl (%eax),%eax
 6f4:	84 c0                	test   %al,%al
 6f6:	75 da                	jne    6d2 <printf+0x103>
 6f8:	eb 68                	jmp    762 <printf+0x193>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 6fa:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 6fe:	75 1d                	jne    71d <printf+0x14e>
        putc(fd, *ap);
 700:	8b 45 e8             	mov    -0x18(%ebp),%eax
 703:	8b 00                	mov    (%eax),%eax
 705:	0f be c0             	movsbl %al,%eax
 708:	89 44 24 04          	mov    %eax,0x4(%esp)
 70c:	8b 45 08             	mov    0x8(%ebp),%eax
 70f:	89 04 24             	mov    %eax,(%esp)
 712:	e8 d8 fd ff ff       	call   4ef <putc>
        ap++;
 717:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 71b:	eb 45                	jmp    762 <printf+0x193>
      } else if(c == '%'){
 71d:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 721:	75 17                	jne    73a <printf+0x16b>
        putc(fd, c);
 723:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 726:	0f be c0             	movsbl %al,%eax
 729:	89 44 24 04          	mov    %eax,0x4(%esp)
 72d:	8b 45 08             	mov    0x8(%ebp),%eax
 730:	89 04 24             	mov    %eax,(%esp)
 733:	e8 b7 fd ff ff       	call   4ef <putc>
 738:	eb 28                	jmp    762 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 73a:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 741:	00 
 742:	8b 45 08             	mov    0x8(%ebp),%eax
 745:	89 04 24             	mov    %eax,(%esp)
 748:	e8 a2 fd ff ff       	call   4ef <putc>
        putc(fd, c);
 74d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 750:	0f be c0             	movsbl %al,%eax
 753:	89 44 24 04          	mov    %eax,0x4(%esp)
 757:	8b 45 08             	mov    0x8(%ebp),%eax
 75a:	89 04 24             	mov    %eax,(%esp)
 75d:	e8 8d fd ff ff       	call   4ef <putc>
      }
      state = 0;
 762:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 769:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 76d:	8b 55 0c             	mov    0xc(%ebp),%edx
 770:	8b 45 f0             	mov    -0x10(%ebp),%eax
 773:	01 d0                	add    %edx,%eax
 775:	0f b6 00             	movzbl (%eax),%eax
 778:	84 c0                	test   %al,%al
 77a:	0f 85 71 fe ff ff    	jne    5f1 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 780:	c9                   	leave  
 781:	c3                   	ret    

00000782 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 782:	55                   	push   %ebp
 783:	89 e5                	mov    %esp,%ebp
 785:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 788:	8b 45 08             	mov    0x8(%ebp),%eax
 78b:	83 e8 08             	sub    $0x8,%eax
 78e:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 791:	a1 34 0c 00 00       	mov    0xc34,%eax
 796:	89 45 fc             	mov    %eax,-0x4(%ebp)
 799:	eb 24                	jmp    7bf <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 79b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 79e:	8b 00                	mov    (%eax),%eax
 7a0:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 7a3:	77 12                	ja     7b7 <free+0x35>
 7a5:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7a8:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 7ab:	77 24                	ja     7d1 <free+0x4f>
 7ad:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7b0:	8b 00                	mov    (%eax),%eax
 7b2:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 7b5:	77 1a                	ja     7d1 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7b7:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7ba:	8b 00                	mov    (%eax),%eax
 7bc:	89 45 fc             	mov    %eax,-0x4(%ebp)
 7bf:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7c2:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 7c5:	76 d4                	jbe    79b <free+0x19>
 7c7:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7ca:	8b 00                	mov    (%eax),%eax
 7cc:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 7cf:	76 ca                	jbe    79b <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 7d1:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7d4:	8b 40 04             	mov    0x4(%eax),%eax
 7d7:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 7de:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7e1:	01 c2                	add    %eax,%edx
 7e3:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7e6:	8b 00                	mov    (%eax),%eax
 7e8:	39 c2                	cmp    %eax,%edx
 7ea:	75 24                	jne    810 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 7ec:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7ef:	8b 50 04             	mov    0x4(%eax),%edx
 7f2:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7f5:	8b 00                	mov    (%eax),%eax
 7f7:	8b 40 04             	mov    0x4(%eax),%eax
 7fa:	01 c2                	add    %eax,%edx
 7fc:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7ff:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 802:	8b 45 fc             	mov    -0x4(%ebp),%eax
 805:	8b 00                	mov    (%eax),%eax
 807:	8b 10                	mov    (%eax),%edx
 809:	8b 45 f8             	mov    -0x8(%ebp),%eax
 80c:	89 10                	mov    %edx,(%eax)
 80e:	eb 0a                	jmp    81a <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 810:	8b 45 fc             	mov    -0x4(%ebp),%eax
 813:	8b 10                	mov    (%eax),%edx
 815:	8b 45 f8             	mov    -0x8(%ebp),%eax
 818:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 81a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 81d:	8b 40 04             	mov    0x4(%eax),%eax
 820:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 827:	8b 45 fc             	mov    -0x4(%ebp),%eax
 82a:	01 d0                	add    %edx,%eax
 82c:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 82f:	75 20                	jne    851 <free+0xcf>
    p->s.size += bp->s.size;
 831:	8b 45 fc             	mov    -0x4(%ebp),%eax
 834:	8b 50 04             	mov    0x4(%eax),%edx
 837:	8b 45 f8             	mov    -0x8(%ebp),%eax
 83a:	8b 40 04             	mov    0x4(%eax),%eax
 83d:	01 c2                	add    %eax,%edx
 83f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 842:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 845:	8b 45 f8             	mov    -0x8(%ebp),%eax
 848:	8b 10                	mov    (%eax),%edx
 84a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 84d:	89 10                	mov    %edx,(%eax)
 84f:	eb 08                	jmp    859 <free+0xd7>
  } else
    p->s.ptr = bp;
 851:	8b 45 fc             	mov    -0x4(%ebp),%eax
 854:	8b 55 f8             	mov    -0x8(%ebp),%edx
 857:	89 10                	mov    %edx,(%eax)
  freep = p;
 859:	8b 45 fc             	mov    -0x4(%ebp),%eax
 85c:	a3 34 0c 00 00       	mov    %eax,0xc34
}
 861:	c9                   	leave  
 862:	c3                   	ret    

00000863 <morecore>:

static Header*
morecore(uint nu)
{
 863:	55                   	push   %ebp
 864:	89 e5                	mov    %esp,%ebp
 866:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 869:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 870:	77 07                	ja     879 <morecore+0x16>
    nu = 4096;
 872:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 879:	8b 45 08             	mov    0x8(%ebp),%eax
 87c:	c1 e0 03             	shl    $0x3,%eax
 87f:	89 04 24             	mov    %eax,(%esp)
 882:	e8 10 fc ff ff       	call   497 <sbrk>
 887:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 88a:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 88e:	75 07                	jne    897 <morecore+0x34>
    return 0;
 890:	b8 00 00 00 00       	mov    $0x0,%eax
 895:	eb 22                	jmp    8b9 <morecore+0x56>
  hp = (Header*)p;
 897:	8b 45 f4             	mov    -0xc(%ebp),%eax
 89a:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 89d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8a0:	8b 55 08             	mov    0x8(%ebp),%edx
 8a3:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 8a6:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8a9:	83 c0 08             	add    $0x8,%eax
 8ac:	89 04 24             	mov    %eax,(%esp)
 8af:	e8 ce fe ff ff       	call   782 <free>
  return freep;
 8b4:	a1 34 0c 00 00       	mov    0xc34,%eax
}
 8b9:	c9                   	leave  
 8ba:	c3                   	ret    

000008bb <malloc>:

void*
malloc(uint nbytes)
{
 8bb:	55                   	push   %ebp
 8bc:	89 e5                	mov    %esp,%ebp
 8be:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8c1:	8b 45 08             	mov    0x8(%ebp),%eax
 8c4:	83 c0 07             	add    $0x7,%eax
 8c7:	c1 e8 03             	shr    $0x3,%eax
 8ca:	83 c0 01             	add    $0x1,%eax
 8cd:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 8d0:	a1 34 0c 00 00       	mov    0xc34,%eax
 8d5:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8d8:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 8dc:	75 23                	jne    901 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 8de:	c7 45 f0 2c 0c 00 00 	movl   $0xc2c,-0x10(%ebp)
 8e5:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8e8:	a3 34 0c 00 00       	mov    %eax,0xc34
 8ed:	a1 34 0c 00 00       	mov    0xc34,%eax
 8f2:	a3 2c 0c 00 00       	mov    %eax,0xc2c
    base.s.size = 0;
 8f7:	c7 05 30 0c 00 00 00 	movl   $0x0,0xc30
 8fe:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 901:	8b 45 f0             	mov    -0x10(%ebp),%eax
 904:	8b 00                	mov    (%eax),%eax
 906:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 909:	8b 45 f4             	mov    -0xc(%ebp),%eax
 90c:	8b 40 04             	mov    0x4(%eax),%eax
 90f:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 912:	72 4d                	jb     961 <malloc+0xa6>
      if(p->s.size == nunits)
 914:	8b 45 f4             	mov    -0xc(%ebp),%eax
 917:	8b 40 04             	mov    0x4(%eax),%eax
 91a:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 91d:	75 0c                	jne    92b <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 91f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 922:	8b 10                	mov    (%eax),%edx
 924:	8b 45 f0             	mov    -0x10(%ebp),%eax
 927:	89 10                	mov    %edx,(%eax)
 929:	eb 26                	jmp    951 <malloc+0x96>
      else {
        p->s.size -= nunits;
 92b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 92e:	8b 40 04             	mov    0x4(%eax),%eax
 931:	2b 45 ec             	sub    -0x14(%ebp),%eax
 934:	89 c2                	mov    %eax,%edx
 936:	8b 45 f4             	mov    -0xc(%ebp),%eax
 939:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 93c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 93f:	8b 40 04             	mov    0x4(%eax),%eax
 942:	c1 e0 03             	shl    $0x3,%eax
 945:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 948:	8b 45 f4             	mov    -0xc(%ebp),%eax
 94b:	8b 55 ec             	mov    -0x14(%ebp),%edx
 94e:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 951:	8b 45 f0             	mov    -0x10(%ebp),%eax
 954:	a3 34 0c 00 00       	mov    %eax,0xc34
      return (void*)(p + 1);
 959:	8b 45 f4             	mov    -0xc(%ebp),%eax
 95c:	83 c0 08             	add    $0x8,%eax
 95f:	eb 38                	jmp    999 <malloc+0xde>
    }
    if(p == freep)
 961:	a1 34 0c 00 00       	mov    0xc34,%eax
 966:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 969:	75 1b                	jne    986 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 96b:	8b 45 ec             	mov    -0x14(%ebp),%eax
 96e:	89 04 24             	mov    %eax,(%esp)
 971:	e8 ed fe ff ff       	call   863 <morecore>
 976:	89 45 f4             	mov    %eax,-0xc(%ebp)
 979:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 97d:	75 07                	jne    986 <malloc+0xcb>
        return 0;
 97f:	b8 00 00 00 00       	mov    $0x0,%eax
 984:	eb 13                	jmp    999 <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 986:	8b 45 f4             	mov    -0xc(%ebp),%eax
 989:	89 45 f0             	mov    %eax,-0x10(%ebp)
 98c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 98f:	8b 00                	mov    (%eax),%eax
 991:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 994:	e9 70 ff ff ff       	jmp    909 <malloc+0x4e>
}
 999:	c9                   	leave  
 99a:	c3                   	ret    
