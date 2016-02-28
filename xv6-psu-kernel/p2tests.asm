
_p2tests:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
void _testdate();
void _testsimpletime(char *input);

// user program that runs tests
int
main(int argc, char *argv[]) {
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
   6:	83 ec 10             	sub    $0x10,%esp

  // testing date system call
  printf(1, "<--- STARTING TESTS FOR _DATE --->\n");
   9:	c7 44 24 04 d4 0a 00 	movl   $0xad4,0x4(%esp)
  10:	00 
  11:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  18:	e8 eb 06 00 00       	call   708 <printf>

  printf(1, "RUNNING DATE_SYSCALL_TEST\n");
  1d:	c7 44 24 04 f8 0a 00 	movl   $0xaf8,0x4(%esp)
  24:	00 
  25:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  2c:	e8 d7 06 00 00       	call   708 <printf>
  _testdate();
  31:	e8 11 01 00 00       	call   147 <_testdate>
  printf(1, "<--- TEST FOR DATE RAN SUCCESSFULLY --->\n\n");
  36:	c7 44 24 04 14 0b 00 	movl   $0xb14,0x4(%esp)
  3d:	00 
  3e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  45:	e8 be 06 00 00       	call   708 <printf>

  // testing simpletime command
  printf(1, "<--- STARTING TESTS FOR _SIMPLETIME --->\n");
  4a:	c7 44 24 04 40 0b 00 	movl   $0xb40,0x4(%esp)
  51:	00 
  52:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  59:	e8 aa 06 00 00       	call   708 <printf>

  printf(1, "RUNNING TIME_CMD_TEST_DATE\n");
  5e:	c7 44 24 04 6a 0b 00 	movl   $0xb6a,0x4(%esp)
  65:	00 
  66:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  6d:	e8 96 06 00 00       	call   708 <printf>
  _testsimpletime("date");
  72:	c7 04 24 86 0b 00 00 	movl   $0xb86,(%esp)
  79:	e8 9b 01 00 00       	call   219 <_testsimpletime>
  printf(1, "TIME_CMD_TEST_DATE OK\n");
  7e:	c7 44 24 04 8b 0b 00 	movl   $0xb8b,0x4(%esp)
  85:	00 
  86:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  8d:	e8 76 06 00 00       	call   708 <printf>

  printf(1, "RUNNING TIME_CMD_TEST_LS\n");
  92:	c7 44 24 04 a2 0b 00 	movl   $0xba2,0x4(%esp)
  99:	00 
  9a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  a1:	e8 62 06 00 00       	call   708 <printf>
  _testsimpletime("ls");
  a6:	c7 04 24 bc 0b 00 00 	movl   $0xbbc,(%esp)
  ad:	e8 67 01 00 00       	call   219 <_testsimpletime>
  printf(1, "TIME_CMD_TEST_LS OK\n");
  b2:	c7 44 24 04 bf 0b 00 	movl   $0xbbf,0x4(%esp)
  b9:	00 
  ba:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  c1:	e8 42 06 00 00       	call   708 <printf>

  printf(1, "RUNNING TIME_CMD_TEST_TOOMANYARGS\n");
  c6:	c7 44 24 04 d4 0b 00 	movl   $0xbd4,0x4(%esp)
  cd:	00 
  ce:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  d5:	e8 2e 06 00 00       	call   708 <printf>
  _testsimpletime("toomanyargs");
  da:	c7 04 24 f7 0b 00 00 	movl   $0xbf7,(%esp)
  e1:	e8 33 01 00 00       	call   219 <_testsimpletime>
  printf(1, "TIME_CMD_TEST_TOOMANYARGS OK\n");
  e6:	c7 44 24 04 03 0c 00 	movl   $0xc03,0x4(%esp)
  ed:	00 
  ee:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  f5:	e8 0e 06 00 00       	call   708 <printf>

  printf(1, "RUNNING TIME_CMD_TEST_INVALIDARGS\n");
  fa:	c7 44 24 04 24 0c 00 	movl   $0xc24,0x4(%esp)
 101:	00 
 102:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 109:	e8 fa 05 00 00       	call   708 <printf>
  _testsimpletime("testinvalidcommand");
 10e:	c7 04 24 47 0c 00 00 	movl   $0xc47,(%esp)
 115:	e8 ff 00 00 00       	call   219 <_testsimpletime>
  printf(1, "TIME_CMD_TEST_INVALIDARGS OK\n");
 11a:	c7 44 24 04 5a 0c 00 	movl   $0xc5a,0x4(%esp)
 121:	00 
 122:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 129:	e8 da 05 00 00       	call   708 <printf>

  printf(1, "<--- TESTS FOR SIMPLETIME RAN SUCCESSFULLY --->\n");
 12e:	c7 44 24 04 78 0c 00 	movl   $0xc78,0x4(%esp)
 135:	00 
 136:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 13d:	e8 c6 05 00 00       	call   708 <printf>

  exit();
 142:	e8 01 04 00 00       	call   548 <exit>

00000147 <_testdate>:
}

// function to run date system call
void
_testdate() {
 147:	55                   	push   %ebp
 148:	89 e5                	mov    %esp,%ebp
 14a:	57                   	push   %edi
 14b:	56                   	push   %esi
 14c:	53                   	push   %ebx
 14d:	83 ec 7c             	sub    $0x7c,%esp
  struct rtcdate r;

  if (date(&r)) {
 150:	8d 45 d0             	lea    -0x30(%ebp),%eax
 153:	89 04 24             	mov    %eax,(%esp)
 156:	e8 8d 04 00 00       	call   5e8 <date>
 15b:	85 c0                	test   %eax,%eax
 15d:	74 19                	je     178 <_testdate+0x31>
    printf(2, "date_failed\n");
 15f:	c7 44 24 04 a9 0c 00 	movl   $0xca9,0x4(%esp)
 166:	00 
 167:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 16e:	e8 95 05 00 00       	call   708 <printf>
    exit();
 173:	e8 d0 03 00 00       	call   548 <exit>
  } 

  char *months[] = {
 178:	c7 45 a0 b6 0c 00 00 	movl   $0xcb6,-0x60(%ebp)
 17f:	c7 45 a4 ba 0c 00 00 	movl   $0xcba,-0x5c(%ebp)
 186:	c7 45 a8 be 0c 00 00 	movl   $0xcbe,-0x58(%ebp)
 18d:	c7 45 ac c2 0c 00 00 	movl   $0xcc2,-0x54(%ebp)
 194:	c7 45 b0 c6 0c 00 00 	movl   $0xcc6,-0x50(%ebp)
 19b:	c7 45 b4 ca 0c 00 00 	movl   $0xcca,-0x4c(%ebp)
 1a2:	c7 45 b8 ce 0c 00 00 	movl   $0xcce,-0x48(%ebp)
 1a9:	c7 45 bc d2 0c 00 00 	movl   $0xcd2,-0x44(%ebp)
 1b0:	c7 45 c0 d6 0c 00 00 	movl   $0xcd6,-0x40(%ebp)
 1b7:	c7 45 c4 da 0c 00 00 	movl   $0xcda,-0x3c(%ebp)
 1be:	c7 45 c8 de 0c 00 00 	movl   $0xcde,-0x38(%ebp)
 1c5:	c7 45 cc e2 0c 00 00 	movl   $0xce2,-0x34(%ebp)
    "Oct",
    "Nov",
    "Dec"
  };

  printf(1, "%s %d %d:%d:%d UTC %d\n",
 1cc:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 1cf:	8b 75 d0             	mov    -0x30(%ebp),%esi
 1d2:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
 1d5:	8b 4d d8             	mov    -0x28(%ebp),%ecx
 1d8:	8b 55 dc             	mov    -0x24(%ebp),%edx
         months[r.month-1], r.day, r.hour, r.minute, r.second, r.year);
 1db:	8b 45 e0             	mov    -0x20(%ebp),%eax
 1de:	83 e8 01             	sub    $0x1,%eax
    "Oct",
    "Nov",
    "Dec"
  };

  printf(1, "%s %d %d:%d:%d UTC %d\n",
 1e1:	8b 44 85 a0          	mov    -0x60(%ebp,%eax,4),%eax
 1e5:	89 7c 24 1c          	mov    %edi,0x1c(%esp)
 1e9:	89 74 24 18          	mov    %esi,0x18(%esp)
 1ed:	89 5c 24 14          	mov    %ebx,0x14(%esp)
 1f1:	89 4c 24 10          	mov    %ecx,0x10(%esp)
 1f5:	89 54 24 0c          	mov    %edx,0xc(%esp)
 1f9:	89 44 24 08          	mov    %eax,0x8(%esp)
 1fd:	c7 44 24 04 e6 0c 00 	movl   $0xce6,0x4(%esp)
 204:	00 
 205:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 20c:	e8 f7 04 00 00       	call   708 <printf>
         months[r.month-1], r.day, r.hour, r.minute, r.second, r.year);
}
 211:	83 c4 7c             	add    $0x7c,%esp
 214:	5b                   	pop    %ebx
 215:	5e                   	pop    %esi
 216:	5f                   	pop    %edi
 217:	5d                   	pop    %ebp
 218:	c3                   	ret    

00000219 <_testsimpletime>:

// function to run simpletime command
void
_testsimpletime(char *input) {
 219:	55                   	push   %ebp
 21a:	89 e5                	mov    %esp,%ebp
 21c:	83 ec 28             	sub    $0x28,%esp
  char *argv[1];
  argv[0] = "placeholder";  
 21f:	c7 45 f4 fd 0c 00 00 	movl   $0xcfd,-0xc(%ebp)

  if (!strcmp(input, "date")) {
 226:	c7 44 24 04 86 0b 00 	movl   $0xb86,0x4(%esp)
 22d:	00 
 22e:	8b 45 08             	mov    0x8(%ebp),%eax
 231:	89 04 24             	mov    %eax,(%esp)
 234:	e8 fc 00 00 00       	call   335 <strcmp>
 239:	85 c0                	test   %eax,%eax
 23b:	75 18                	jne    255 <_testsimpletime+0x3c>
    exec("simpletime date", argv); 
 23d:	8d 45 f4             	lea    -0xc(%ebp),%eax
 240:	89 44 24 04          	mov    %eax,0x4(%esp)
 244:	c7 04 24 09 0d 00 00 	movl   $0xd09,(%esp)
 24b:	e8 30 03 00 00       	call   580 <exec>
 250:	e9 89 00 00 00       	jmp    2de <_testsimpletime+0xc5>
  } else if (!strcmp(input, "ls")) {
 255:	c7 44 24 04 bc 0b 00 	movl   $0xbbc,0x4(%esp)
 25c:	00 
 25d:	8b 45 08             	mov    0x8(%ebp),%eax
 260:	89 04 24             	mov    %eax,(%esp)
 263:	e8 cd 00 00 00       	call   335 <strcmp>
 268:	85 c0                	test   %eax,%eax
 26a:	75 15                	jne    281 <_testsimpletime+0x68>
    exec("simpletime ls", argv); 
 26c:	8d 45 f4             	lea    -0xc(%ebp),%eax
 26f:	89 44 24 04          	mov    %eax,0x4(%esp)
 273:	c7 04 24 19 0d 00 00 	movl   $0xd19,(%esp)
 27a:	e8 01 03 00 00       	call   580 <exec>
 27f:	eb 5d                	jmp    2de <_testsimpletime+0xc5>
  } else if (!strcmp(input, "toomanyargs")) {
 281:	c7 44 24 04 f7 0b 00 	movl   $0xbf7,0x4(%esp)
 288:	00 
 289:	8b 45 08             	mov    0x8(%ebp),%eax
 28c:	89 04 24             	mov    %eax,(%esp)
 28f:	e8 a1 00 00 00       	call   335 <strcmp>
 294:	85 c0                	test   %eax,%eax
 296:	75 15                	jne    2ad <_testsimpletime+0x94>
    exec("simpletime 1 2 3 4 5 6 7 8 9 10 1 2 3 4 5 6 7 8 9 10 1", argv);
 298:	8d 45 f4             	lea    -0xc(%ebp),%eax
 29b:	89 44 24 04          	mov    %eax,0x4(%esp)
 29f:	c7 04 24 28 0d 00 00 	movl   $0xd28,(%esp)
 2a6:	e8 d5 02 00 00       	call   580 <exec>
 2ab:	eb 31                	jmp    2de <_testsimpletime+0xc5>
  } else if (!strcmp(input, "testinvalidcommand")) {
 2ad:	c7 44 24 04 47 0c 00 	movl   $0xc47,0x4(%esp)
 2b4:	00 
 2b5:	8b 45 08             	mov    0x8(%ebp),%eax
 2b8:	89 04 24             	mov    %eax,(%esp)
 2bb:	e8 75 00 00 00       	call   335 <strcmp>
 2c0:	85 c0                	test   %eax,%eax
 2c2:	75 15                	jne    2d9 <_testsimpletime+0xc0>
    exec("simpletime test", argv);
 2c4:	8d 45 f4             	lea    -0xc(%ebp),%eax
 2c7:	89 44 24 04          	mov    %eax,0x4(%esp)
 2cb:	c7 04 24 5f 0d 00 00 	movl   $0xd5f,(%esp)
 2d2:	e8 a9 02 00 00       	call   580 <exec>
 2d7:	eb 05                	jmp    2de <_testsimpletime+0xc5>
  } else
    exit();
 2d9:	e8 6a 02 00 00       	call   548 <exit>
}
 2de:	c9                   	leave  
 2df:	c3                   	ret    

000002e0 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 2e0:	55                   	push   %ebp
 2e1:	89 e5                	mov    %esp,%ebp
 2e3:	57                   	push   %edi
 2e4:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 2e5:	8b 4d 08             	mov    0x8(%ebp),%ecx
 2e8:	8b 55 10             	mov    0x10(%ebp),%edx
 2eb:	8b 45 0c             	mov    0xc(%ebp),%eax
 2ee:	89 cb                	mov    %ecx,%ebx
 2f0:	89 df                	mov    %ebx,%edi
 2f2:	89 d1                	mov    %edx,%ecx
 2f4:	fc                   	cld    
 2f5:	f3 aa                	rep stos %al,%es:(%edi)
 2f7:	89 ca                	mov    %ecx,%edx
 2f9:	89 fb                	mov    %edi,%ebx
 2fb:	89 5d 08             	mov    %ebx,0x8(%ebp)
 2fe:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 301:	5b                   	pop    %ebx
 302:	5f                   	pop    %edi
 303:	5d                   	pop    %ebp
 304:	c3                   	ret    

00000305 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 305:	55                   	push   %ebp
 306:	89 e5                	mov    %esp,%ebp
 308:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 30b:	8b 45 08             	mov    0x8(%ebp),%eax
 30e:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 311:	90                   	nop
 312:	8b 45 08             	mov    0x8(%ebp),%eax
 315:	8d 50 01             	lea    0x1(%eax),%edx
 318:	89 55 08             	mov    %edx,0x8(%ebp)
 31b:	8b 55 0c             	mov    0xc(%ebp),%edx
 31e:	8d 4a 01             	lea    0x1(%edx),%ecx
 321:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 324:	0f b6 12             	movzbl (%edx),%edx
 327:	88 10                	mov    %dl,(%eax)
 329:	0f b6 00             	movzbl (%eax),%eax
 32c:	84 c0                	test   %al,%al
 32e:	75 e2                	jne    312 <strcpy+0xd>
    ;
  return os;
 330:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 333:	c9                   	leave  
 334:	c3                   	ret    

00000335 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 335:	55                   	push   %ebp
 336:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 338:	eb 08                	jmp    342 <strcmp+0xd>
    p++, q++;
 33a:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 33e:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 342:	8b 45 08             	mov    0x8(%ebp),%eax
 345:	0f b6 00             	movzbl (%eax),%eax
 348:	84 c0                	test   %al,%al
 34a:	74 10                	je     35c <strcmp+0x27>
 34c:	8b 45 08             	mov    0x8(%ebp),%eax
 34f:	0f b6 10             	movzbl (%eax),%edx
 352:	8b 45 0c             	mov    0xc(%ebp),%eax
 355:	0f b6 00             	movzbl (%eax),%eax
 358:	38 c2                	cmp    %al,%dl
 35a:	74 de                	je     33a <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 35c:	8b 45 08             	mov    0x8(%ebp),%eax
 35f:	0f b6 00             	movzbl (%eax),%eax
 362:	0f b6 d0             	movzbl %al,%edx
 365:	8b 45 0c             	mov    0xc(%ebp),%eax
 368:	0f b6 00             	movzbl (%eax),%eax
 36b:	0f b6 c0             	movzbl %al,%eax
 36e:	29 c2                	sub    %eax,%edx
 370:	89 d0                	mov    %edx,%eax
}
 372:	5d                   	pop    %ebp
 373:	c3                   	ret    

00000374 <strlen>:

uint
strlen(char *s)
{
 374:	55                   	push   %ebp
 375:	89 e5                	mov    %esp,%ebp
 377:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 37a:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 381:	eb 04                	jmp    387 <strlen+0x13>
 383:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 387:	8b 55 fc             	mov    -0x4(%ebp),%edx
 38a:	8b 45 08             	mov    0x8(%ebp),%eax
 38d:	01 d0                	add    %edx,%eax
 38f:	0f b6 00             	movzbl (%eax),%eax
 392:	84 c0                	test   %al,%al
 394:	75 ed                	jne    383 <strlen+0xf>
    ;
  return n;
 396:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 399:	c9                   	leave  
 39a:	c3                   	ret    

0000039b <memset>:

void*
memset(void *dst, int c, uint n)
{
 39b:	55                   	push   %ebp
 39c:	89 e5                	mov    %esp,%ebp
 39e:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 3a1:	8b 45 10             	mov    0x10(%ebp),%eax
 3a4:	89 44 24 08          	mov    %eax,0x8(%esp)
 3a8:	8b 45 0c             	mov    0xc(%ebp),%eax
 3ab:	89 44 24 04          	mov    %eax,0x4(%esp)
 3af:	8b 45 08             	mov    0x8(%ebp),%eax
 3b2:	89 04 24             	mov    %eax,(%esp)
 3b5:	e8 26 ff ff ff       	call   2e0 <stosb>
  return dst;
 3ba:	8b 45 08             	mov    0x8(%ebp),%eax
}
 3bd:	c9                   	leave  
 3be:	c3                   	ret    

000003bf <strchr>:

char*
strchr(const char *s, char c)
{
 3bf:	55                   	push   %ebp
 3c0:	89 e5                	mov    %esp,%ebp
 3c2:	83 ec 04             	sub    $0x4,%esp
 3c5:	8b 45 0c             	mov    0xc(%ebp),%eax
 3c8:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 3cb:	eb 14                	jmp    3e1 <strchr+0x22>
    if(*s == c)
 3cd:	8b 45 08             	mov    0x8(%ebp),%eax
 3d0:	0f b6 00             	movzbl (%eax),%eax
 3d3:	3a 45 fc             	cmp    -0x4(%ebp),%al
 3d6:	75 05                	jne    3dd <strchr+0x1e>
      return (char*)s;
 3d8:	8b 45 08             	mov    0x8(%ebp),%eax
 3db:	eb 13                	jmp    3f0 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 3dd:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 3e1:	8b 45 08             	mov    0x8(%ebp),%eax
 3e4:	0f b6 00             	movzbl (%eax),%eax
 3e7:	84 c0                	test   %al,%al
 3e9:	75 e2                	jne    3cd <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 3eb:	b8 00 00 00 00       	mov    $0x0,%eax
}
 3f0:	c9                   	leave  
 3f1:	c3                   	ret    

000003f2 <gets>:

char*
gets(char *buf, int max)
{
 3f2:	55                   	push   %ebp
 3f3:	89 e5                	mov    %esp,%ebp
 3f5:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 3f8:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 3ff:	eb 4c                	jmp    44d <gets+0x5b>
    cc = read(0, &c, 1);
 401:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 408:	00 
 409:	8d 45 ef             	lea    -0x11(%ebp),%eax
 40c:	89 44 24 04          	mov    %eax,0x4(%esp)
 410:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 417:	e8 44 01 00 00       	call   560 <read>
 41c:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 41f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 423:	7f 02                	jg     427 <gets+0x35>
      break;
 425:	eb 31                	jmp    458 <gets+0x66>
    buf[i++] = c;
 427:	8b 45 f4             	mov    -0xc(%ebp),%eax
 42a:	8d 50 01             	lea    0x1(%eax),%edx
 42d:	89 55 f4             	mov    %edx,-0xc(%ebp)
 430:	89 c2                	mov    %eax,%edx
 432:	8b 45 08             	mov    0x8(%ebp),%eax
 435:	01 c2                	add    %eax,%edx
 437:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 43b:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 43d:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 441:	3c 0a                	cmp    $0xa,%al
 443:	74 13                	je     458 <gets+0x66>
 445:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 449:	3c 0d                	cmp    $0xd,%al
 44b:	74 0b                	je     458 <gets+0x66>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 44d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 450:	83 c0 01             	add    $0x1,%eax
 453:	3b 45 0c             	cmp    0xc(%ebp),%eax
 456:	7c a9                	jl     401 <gets+0xf>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 458:	8b 55 f4             	mov    -0xc(%ebp),%edx
 45b:	8b 45 08             	mov    0x8(%ebp),%eax
 45e:	01 d0                	add    %edx,%eax
 460:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 463:	8b 45 08             	mov    0x8(%ebp),%eax
}
 466:	c9                   	leave  
 467:	c3                   	ret    

00000468 <stat>:

int
stat(char *n, struct stat *st)
{
 468:	55                   	push   %ebp
 469:	89 e5                	mov    %esp,%ebp
 46b:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 46e:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 475:	00 
 476:	8b 45 08             	mov    0x8(%ebp),%eax
 479:	89 04 24             	mov    %eax,(%esp)
 47c:	e8 07 01 00 00       	call   588 <open>
 481:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 484:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 488:	79 07                	jns    491 <stat+0x29>
    return -1;
 48a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 48f:	eb 23                	jmp    4b4 <stat+0x4c>
  r = fstat(fd, st);
 491:	8b 45 0c             	mov    0xc(%ebp),%eax
 494:	89 44 24 04          	mov    %eax,0x4(%esp)
 498:	8b 45 f4             	mov    -0xc(%ebp),%eax
 49b:	89 04 24             	mov    %eax,(%esp)
 49e:	e8 fd 00 00 00       	call   5a0 <fstat>
 4a3:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 4a6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4a9:	89 04 24             	mov    %eax,(%esp)
 4ac:	e8 bf 00 00 00       	call   570 <close>
  return r;
 4b1:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 4b4:	c9                   	leave  
 4b5:	c3                   	ret    

000004b6 <atoi>:

int
atoi(const char *s)
{
 4b6:	55                   	push   %ebp
 4b7:	89 e5                	mov    %esp,%ebp
 4b9:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 4bc:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 4c3:	eb 25                	jmp    4ea <atoi+0x34>
    n = n*10 + *s++ - '0';
 4c5:	8b 55 fc             	mov    -0x4(%ebp),%edx
 4c8:	89 d0                	mov    %edx,%eax
 4ca:	c1 e0 02             	shl    $0x2,%eax
 4cd:	01 d0                	add    %edx,%eax
 4cf:	01 c0                	add    %eax,%eax
 4d1:	89 c1                	mov    %eax,%ecx
 4d3:	8b 45 08             	mov    0x8(%ebp),%eax
 4d6:	8d 50 01             	lea    0x1(%eax),%edx
 4d9:	89 55 08             	mov    %edx,0x8(%ebp)
 4dc:	0f b6 00             	movzbl (%eax),%eax
 4df:	0f be c0             	movsbl %al,%eax
 4e2:	01 c8                	add    %ecx,%eax
 4e4:	83 e8 30             	sub    $0x30,%eax
 4e7:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 4ea:	8b 45 08             	mov    0x8(%ebp),%eax
 4ed:	0f b6 00             	movzbl (%eax),%eax
 4f0:	3c 2f                	cmp    $0x2f,%al
 4f2:	7e 0a                	jle    4fe <atoi+0x48>
 4f4:	8b 45 08             	mov    0x8(%ebp),%eax
 4f7:	0f b6 00             	movzbl (%eax),%eax
 4fa:	3c 39                	cmp    $0x39,%al
 4fc:	7e c7                	jle    4c5 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 4fe:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 501:	c9                   	leave  
 502:	c3                   	ret    

00000503 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 503:	55                   	push   %ebp
 504:	89 e5                	mov    %esp,%ebp
 506:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 509:	8b 45 08             	mov    0x8(%ebp),%eax
 50c:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 50f:	8b 45 0c             	mov    0xc(%ebp),%eax
 512:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 515:	eb 17                	jmp    52e <memmove+0x2b>
    *dst++ = *src++;
 517:	8b 45 fc             	mov    -0x4(%ebp),%eax
 51a:	8d 50 01             	lea    0x1(%eax),%edx
 51d:	89 55 fc             	mov    %edx,-0x4(%ebp)
 520:	8b 55 f8             	mov    -0x8(%ebp),%edx
 523:	8d 4a 01             	lea    0x1(%edx),%ecx
 526:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 529:	0f b6 12             	movzbl (%edx),%edx
 52c:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 52e:	8b 45 10             	mov    0x10(%ebp),%eax
 531:	8d 50 ff             	lea    -0x1(%eax),%edx
 534:	89 55 10             	mov    %edx,0x10(%ebp)
 537:	85 c0                	test   %eax,%eax
 539:	7f dc                	jg     517 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 53b:	8b 45 08             	mov    0x8(%ebp),%eax
}
 53e:	c9                   	leave  
 53f:	c3                   	ret    

00000540 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 540:	b8 01 00 00 00       	mov    $0x1,%eax
 545:	cd 40                	int    $0x40
 547:	c3                   	ret    

00000548 <exit>:
SYSCALL(exit)
 548:	b8 02 00 00 00       	mov    $0x2,%eax
 54d:	cd 40                	int    $0x40
 54f:	c3                   	ret    

00000550 <wait>:
SYSCALL(wait)
 550:	b8 03 00 00 00       	mov    $0x3,%eax
 555:	cd 40                	int    $0x40
 557:	c3                   	ret    

00000558 <pipe>:
SYSCALL(pipe)
 558:	b8 04 00 00 00       	mov    $0x4,%eax
 55d:	cd 40                	int    $0x40
 55f:	c3                   	ret    

00000560 <read>:
SYSCALL(read)
 560:	b8 05 00 00 00       	mov    $0x5,%eax
 565:	cd 40                	int    $0x40
 567:	c3                   	ret    

00000568 <write>:
SYSCALL(write)
 568:	b8 10 00 00 00       	mov    $0x10,%eax
 56d:	cd 40                	int    $0x40
 56f:	c3                   	ret    

00000570 <close>:
SYSCALL(close)
 570:	b8 15 00 00 00       	mov    $0x15,%eax
 575:	cd 40                	int    $0x40
 577:	c3                   	ret    

00000578 <kill>:
SYSCALL(kill)
 578:	b8 06 00 00 00       	mov    $0x6,%eax
 57d:	cd 40                	int    $0x40
 57f:	c3                   	ret    

00000580 <exec>:
SYSCALL(exec)
 580:	b8 07 00 00 00       	mov    $0x7,%eax
 585:	cd 40                	int    $0x40
 587:	c3                   	ret    

00000588 <open>:
SYSCALL(open)
 588:	b8 0f 00 00 00       	mov    $0xf,%eax
 58d:	cd 40                	int    $0x40
 58f:	c3                   	ret    

00000590 <mknod>:
SYSCALL(mknod)
 590:	b8 11 00 00 00       	mov    $0x11,%eax
 595:	cd 40                	int    $0x40
 597:	c3                   	ret    

00000598 <unlink>:
SYSCALL(unlink)
 598:	b8 12 00 00 00       	mov    $0x12,%eax
 59d:	cd 40                	int    $0x40
 59f:	c3                   	ret    

000005a0 <fstat>:
SYSCALL(fstat)
 5a0:	b8 08 00 00 00       	mov    $0x8,%eax
 5a5:	cd 40                	int    $0x40
 5a7:	c3                   	ret    

000005a8 <link>:
SYSCALL(link)
 5a8:	b8 13 00 00 00       	mov    $0x13,%eax
 5ad:	cd 40                	int    $0x40
 5af:	c3                   	ret    

000005b0 <mkdir>:
SYSCALL(mkdir)
 5b0:	b8 14 00 00 00       	mov    $0x14,%eax
 5b5:	cd 40                	int    $0x40
 5b7:	c3                   	ret    

000005b8 <chdir>:
SYSCALL(chdir)
 5b8:	b8 09 00 00 00       	mov    $0x9,%eax
 5bd:	cd 40                	int    $0x40
 5bf:	c3                   	ret    

000005c0 <dup>:
SYSCALL(dup)
 5c0:	b8 0a 00 00 00       	mov    $0xa,%eax
 5c5:	cd 40                	int    $0x40
 5c7:	c3                   	ret    

000005c8 <getpid>:
SYSCALL(getpid)
 5c8:	b8 0b 00 00 00       	mov    $0xb,%eax
 5cd:	cd 40                	int    $0x40
 5cf:	c3                   	ret    

000005d0 <sbrk>:
SYSCALL(sbrk)
 5d0:	b8 0c 00 00 00       	mov    $0xc,%eax
 5d5:	cd 40                	int    $0x40
 5d7:	c3                   	ret    

000005d8 <sleep>:
SYSCALL(sleep)
 5d8:	b8 0d 00 00 00       	mov    $0xd,%eax
 5dd:	cd 40                	int    $0x40
 5df:	c3                   	ret    

000005e0 <uptime>:
SYSCALL(uptime)
 5e0:	b8 0e 00 00 00       	mov    $0xe,%eax
 5e5:	cd 40                	int    $0x40
 5e7:	c3                   	ret    

000005e8 <date>:
SYSCALL(date)
 5e8:	b8 16 00 00 00       	mov    $0x16,%eax
 5ed:	cd 40                	int    $0x40
 5ef:	c3                   	ret    

000005f0 <getuid>:
SYSCALL(getuid)
 5f0:	b8 17 00 00 00       	mov    $0x17,%eax
 5f5:	cd 40                	int    $0x40
 5f7:	c3                   	ret    

000005f8 <getgid>:
SYSCALL(getgid)
 5f8:	b8 18 00 00 00       	mov    $0x18,%eax
 5fd:	cd 40                	int    $0x40
 5ff:	c3                   	ret    

00000600 <getppid>:
SYSCALL(getppid)
 600:	b8 19 00 00 00       	mov    $0x19,%eax
 605:	cd 40                	int    $0x40
 607:	c3                   	ret    

00000608 <setuid>:
SYSCALL(setuid)
 608:	b8 1a 00 00 00       	mov    $0x1a,%eax
 60d:	cd 40                	int    $0x40
 60f:	c3                   	ret    

00000610 <setgid>:
SYSCALL(setgid)
 610:	b8 1b 00 00 00       	mov    $0x1b,%eax
 615:	cd 40                	int    $0x40
 617:	c3                   	ret    

00000618 <getprocs>:
SYSCALL(getprocs)
 618:	b8 1c 00 00 00       	mov    $0x1c,%eax
 61d:	cd 40                	int    $0x40
 61f:	c3                   	ret    

00000620 <setpriority>:
SYSCALL(setpriority)
 620:	b8 1d 00 00 00       	mov    $0x1d,%eax
 625:	cd 40                	int    $0x40
 627:	c3                   	ret    

00000628 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 628:	55                   	push   %ebp
 629:	89 e5                	mov    %esp,%ebp
 62b:	83 ec 18             	sub    $0x18,%esp
 62e:	8b 45 0c             	mov    0xc(%ebp),%eax
 631:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 634:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 63b:	00 
 63c:	8d 45 f4             	lea    -0xc(%ebp),%eax
 63f:	89 44 24 04          	mov    %eax,0x4(%esp)
 643:	8b 45 08             	mov    0x8(%ebp),%eax
 646:	89 04 24             	mov    %eax,(%esp)
 649:	e8 1a ff ff ff       	call   568 <write>
}
 64e:	c9                   	leave  
 64f:	c3                   	ret    

00000650 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 650:	55                   	push   %ebp
 651:	89 e5                	mov    %esp,%ebp
 653:	56                   	push   %esi
 654:	53                   	push   %ebx
 655:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 658:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 65f:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 663:	74 17                	je     67c <printint+0x2c>
 665:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 669:	79 11                	jns    67c <printint+0x2c>
    neg = 1;
 66b:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 672:	8b 45 0c             	mov    0xc(%ebp),%eax
 675:	f7 d8                	neg    %eax
 677:	89 45 ec             	mov    %eax,-0x14(%ebp)
 67a:	eb 06                	jmp    682 <printint+0x32>
  } else {
    x = xx;
 67c:	8b 45 0c             	mov    0xc(%ebp),%eax
 67f:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 682:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 689:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 68c:	8d 41 01             	lea    0x1(%ecx),%eax
 68f:	89 45 f4             	mov    %eax,-0xc(%ebp)
 692:	8b 5d 10             	mov    0x10(%ebp),%ebx
 695:	8b 45 ec             	mov    -0x14(%ebp),%eax
 698:	ba 00 00 00 00       	mov    $0x0,%edx
 69d:	f7 f3                	div    %ebx
 69f:	89 d0                	mov    %edx,%eax
 6a1:	0f b6 80 08 10 00 00 	movzbl 0x1008(%eax),%eax
 6a8:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 6ac:	8b 75 10             	mov    0x10(%ebp),%esi
 6af:	8b 45 ec             	mov    -0x14(%ebp),%eax
 6b2:	ba 00 00 00 00       	mov    $0x0,%edx
 6b7:	f7 f6                	div    %esi
 6b9:	89 45 ec             	mov    %eax,-0x14(%ebp)
 6bc:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 6c0:	75 c7                	jne    689 <printint+0x39>
  if(neg)
 6c2:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 6c6:	74 10                	je     6d8 <printint+0x88>
    buf[i++] = '-';
 6c8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6cb:	8d 50 01             	lea    0x1(%eax),%edx
 6ce:	89 55 f4             	mov    %edx,-0xc(%ebp)
 6d1:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 6d6:	eb 1f                	jmp    6f7 <printint+0xa7>
 6d8:	eb 1d                	jmp    6f7 <printint+0xa7>
    putc(fd, buf[i]);
 6da:	8d 55 dc             	lea    -0x24(%ebp),%edx
 6dd:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6e0:	01 d0                	add    %edx,%eax
 6e2:	0f b6 00             	movzbl (%eax),%eax
 6e5:	0f be c0             	movsbl %al,%eax
 6e8:	89 44 24 04          	mov    %eax,0x4(%esp)
 6ec:	8b 45 08             	mov    0x8(%ebp),%eax
 6ef:	89 04 24             	mov    %eax,(%esp)
 6f2:	e8 31 ff ff ff       	call   628 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 6f7:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 6fb:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 6ff:	79 d9                	jns    6da <printint+0x8a>
    putc(fd, buf[i]);
}
 701:	83 c4 30             	add    $0x30,%esp
 704:	5b                   	pop    %ebx
 705:	5e                   	pop    %esi
 706:	5d                   	pop    %ebp
 707:	c3                   	ret    

00000708 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 708:	55                   	push   %ebp
 709:	89 e5                	mov    %esp,%ebp
 70b:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 70e:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 715:	8d 45 0c             	lea    0xc(%ebp),%eax
 718:	83 c0 04             	add    $0x4,%eax
 71b:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 71e:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 725:	e9 7c 01 00 00       	jmp    8a6 <printf+0x19e>
    c = fmt[i] & 0xff;
 72a:	8b 55 0c             	mov    0xc(%ebp),%edx
 72d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 730:	01 d0                	add    %edx,%eax
 732:	0f b6 00             	movzbl (%eax),%eax
 735:	0f be c0             	movsbl %al,%eax
 738:	25 ff 00 00 00       	and    $0xff,%eax
 73d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 740:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 744:	75 2c                	jne    772 <printf+0x6a>
      if(c == '%'){
 746:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 74a:	75 0c                	jne    758 <printf+0x50>
        state = '%';
 74c:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 753:	e9 4a 01 00 00       	jmp    8a2 <printf+0x19a>
      } else {
        putc(fd, c);
 758:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 75b:	0f be c0             	movsbl %al,%eax
 75e:	89 44 24 04          	mov    %eax,0x4(%esp)
 762:	8b 45 08             	mov    0x8(%ebp),%eax
 765:	89 04 24             	mov    %eax,(%esp)
 768:	e8 bb fe ff ff       	call   628 <putc>
 76d:	e9 30 01 00 00       	jmp    8a2 <printf+0x19a>
      }
    } else if(state == '%'){
 772:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 776:	0f 85 26 01 00 00    	jne    8a2 <printf+0x19a>
      if(c == 'd'){
 77c:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 780:	75 2d                	jne    7af <printf+0xa7>
        printint(fd, *ap, 10, 1);
 782:	8b 45 e8             	mov    -0x18(%ebp),%eax
 785:	8b 00                	mov    (%eax),%eax
 787:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 78e:	00 
 78f:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 796:	00 
 797:	89 44 24 04          	mov    %eax,0x4(%esp)
 79b:	8b 45 08             	mov    0x8(%ebp),%eax
 79e:	89 04 24             	mov    %eax,(%esp)
 7a1:	e8 aa fe ff ff       	call   650 <printint>
        ap++;
 7a6:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 7aa:	e9 ec 00 00 00       	jmp    89b <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 7af:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 7b3:	74 06                	je     7bb <printf+0xb3>
 7b5:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 7b9:	75 2d                	jne    7e8 <printf+0xe0>
        printint(fd, *ap, 16, 0);
 7bb:	8b 45 e8             	mov    -0x18(%ebp),%eax
 7be:	8b 00                	mov    (%eax),%eax
 7c0:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 7c7:	00 
 7c8:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 7cf:	00 
 7d0:	89 44 24 04          	mov    %eax,0x4(%esp)
 7d4:	8b 45 08             	mov    0x8(%ebp),%eax
 7d7:	89 04 24             	mov    %eax,(%esp)
 7da:	e8 71 fe ff ff       	call   650 <printint>
        ap++;
 7df:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 7e3:	e9 b3 00 00 00       	jmp    89b <printf+0x193>
      } else if(c == 's'){
 7e8:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 7ec:	75 45                	jne    833 <printf+0x12b>
        s = (char*)*ap;
 7ee:	8b 45 e8             	mov    -0x18(%ebp),%eax
 7f1:	8b 00                	mov    (%eax),%eax
 7f3:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 7f6:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 7fa:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 7fe:	75 09                	jne    809 <printf+0x101>
          s = "(null)";
 800:	c7 45 f4 6f 0d 00 00 	movl   $0xd6f,-0xc(%ebp)
        while(*s != 0){
 807:	eb 1e                	jmp    827 <printf+0x11f>
 809:	eb 1c                	jmp    827 <printf+0x11f>
          putc(fd, *s);
 80b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80e:	0f b6 00             	movzbl (%eax),%eax
 811:	0f be c0             	movsbl %al,%eax
 814:	89 44 24 04          	mov    %eax,0x4(%esp)
 818:	8b 45 08             	mov    0x8(%ebp),%eax
 81b:	89 04 24             	mov    %eax,(%esp)
 81e:	e8 05 fe ff ff       	call   628 <putc>
          s++;
 823:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 827:	8b 45 f4             	mov    -0xc(%ebp),%eax
 82a:	0f b6 00             	movzbl (%eax),%eax
 82d:	84 c0                	test   %al,%al
 82f:	75 da                	jne    80b <printf+0x103>
 831:	eb 68                	jmp    89b <printf+0x193>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 833:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 837:	75 1d                	jne    856 <printf+0x14e>
        putc(fd, *ap);
 839:	8b 45 e8             	mov    -0x18(%ebp),%eax
 83c:	8b 00                	mov    (%eax),%eax
 83e:	0f be c0             	movsbl %al,%eax
 841:	89 44 24 04          	mov    %eax,0x4(%esp)
 845:	8b 45 08             	mov    0x8(%ebp),%eax
 848:	89 04 24             	mov    %eax,(%esp)
 84b:	e8 d8 fd ff ff       	call   628 <putc>
        ap++;
 850:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 854:	eb 45                	jmp    89b <printf+0x193>
      } else if(c == '%'){
 856:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 85a:	75 17                	jne    873 <printf+0x16b>
        putc(fd, c);
 85c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 85f:	0f be c0             	movsbl %al,%eax
 862:	89 44 24 04          	mov    %eax,0x4(%esp)
 866:	8b 45 08             	mov    0x8(%ebp),%eax
 869:	89 04 24             	mov    %eax,(%esp)
 86c:	e8 b7 fd ff ff       	call   628 <putc>
 871:	eb 28                	jmp    89b <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 873:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 87a:	00 
 87b:	8b 45 08             	mov    0x8(%ebp),%eax
 87e:	89 04 24             	mov    %eax,(%esp)
 881:	e8 a2 fd ff ff       	call   628 <putc>
        putc(fd, c);
 886:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 889:	0f be c0             	movsbl %al,%eax
 88c:	89 44 24 04          	mov    %eax,0x4(%esp)
 890:	8b 45 08             	mov    0x8(%ebp),%eax
 893:	89 04 24             	mov    %eax,(%esp)
 896:	e8 8d fd ff ff       	call   628 <putc>
      }
      state = 0;
 89b:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 8a2:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 8a6:	8b 55 0c             	mov    0xc(%ebp),%edx
 8a9:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8ac:	01 d0                	add    %edx,%eax
 8ae:	0f b6 00             	movzbl (%eax),%eax
 8b1:	84 c0                	test   %al,%al
 8b3:	0f 85 71 fe ff ff    	jne    72a <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 8b9:	c9                   	leave  
 8ba:	c3                   	ret    

000008bb <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 8bb:	55                   	push   %ebp
 8bc:	89 e5                	mov    %esp,%ebp
 8be:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 8c1:	8b 45 08             	mov    0x8(%ebp),%eax
 8c4:	83 e8 08             	sub    $0x8,%eax
 8c7:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8ca:	a1 24 10 00 00       	mov    0x1024,%eax
 8cf:	89 45 fc             	mov    %eax,-0x4(%ebp)
 8d2:	eb 24                	jmp    8f8 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8d4:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8d7:	8b 00                	mov    (%eax),%eax
 8d9:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 8dc:	77 12                	ja     8f0 <free+0x35>
 8de:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8e1:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 8e4:	77 24                	ja     90a <free+0x4f>
 8e6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8e9:	8b 00                	mov    (%eax),%eax
 8eb:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 8ee:	77 1a                	ja     90a <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8f0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8f3:	8b 00                	mov    (%eax),%eax
 8f5:	89 45 fc             	mov    %eax,-0x4(%ebp)
 8f8:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8fb:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 8fe:	76 d4                	jbe    8d4 <free+0x19>
 900:	8b 45 fc             	mov    -0x4(%ebp),%eax
 903:	8b 00                	mov    (%eax),%eax
 905:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 908:	76 ca                	jbe    8d4 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 90a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 90d:	8b 40 04             	mov    0x4(%eax),%eax
 910:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 917:	8b 45 f8             	mov    -0x8(%ebp),%eax
 91a:	01 c2                	add    %eax,%edx
 91c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 91f:	8b 00                	mov    (%eax),%eax
 921:	39 c2                	cmp    %eax,%edx
 923:	75 24                	jne    949 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 925:	8b 45 f8             	mov    -0x8(%ebp),%eax
 928:	8b 50 04             	mov    0x4(%eax),%edx
 92b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 92e:	8b 00                	mov    (%eax),%eax
 930:	8b 40 04             	mov    0x4(%eax),%eax
 933:	01 c2                	add    %eax,%edx
 935:	8b 45 f8             	mov    -0x8(%ebp),%eax
 938:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 93b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 93e:	8b 00                	mov    (%eax),%eax
 940:	8b 10                	mov    (%eax),%edx
 942:	8b 45 f8             	mov    -0x8(%ebp),%eax
 945:	89 10                	mov    %edx,(%eax)
 947:	eb 0a                	jmp    953 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 949:	8b 45 fc             	mov    -0x4(%ebp),%eax
 94c:	8b 10                	mov    (%eax),%edx
 94e:	8b 45 f8             	mov    -0x8(%ebp),%eax
 951:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 953:	8b 45 fc             	mov    -0x4(%ebp),%eax
 956:	8b 40 04             	mov    0x4(%eax),%eax
 959:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 960:	8b 45 fc             	mov    -0x4(%ebp),%eax
 963:	01 d0                	add    %edx,%eax
 965:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 968:	75 20                	jne    98a <free+0xcf>
    p->s.size += bp->s.size;
 96a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 96d:	8b 50 04             	mov    0x4(%eax),%edx
 970:	8b 45 f8             	mov    -0x8(%ebp),%eax
 973:	8b 40 04             	mov    0x4(%eax),%eax
 976:	01 c2                	add    %eax,%edx
 978:	8b 45 fc             	mov    -0x4(%ebp),%eax
 97b:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 97e:	8b 45 f8             	mov    -0x8(%ebp),%eax
 981:	8b 10                	mov    (%eax),%edx
 983:	8b 45 fc             	mov    -0x4(%ebp),%eax
 986:	89 10                	mov    %edx,(%eax)
 988:	eb 08                	jmp    992 <free+0xd7>
  } else
    p->s.ptr = bp;
 98a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 98d:	8b 55 f8             	mov    -0x8(%ebp),%edx
 990:	89 10                	mov    %edx,(%eax)
  freep = p;
 992:	8b 45 fc             	mov    -0x4(%ebp),%eax
 995:	a3 24 10 00 00       	mov    %eax,0x1024
}
 99a:	c9                   	leave  
 99b:	c3                   	ret    

0000099c <morecore>:

static Header*
morecore(uint nu)
{
 99c:	55                   	push   %ebp
 99d:	89 e5                	mov    %esp,%ebp
 99f:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 9a2:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 9a9:	77 07                	ja     9b2 <morecore+0x16>
    nu = 4096;
 9ab:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 9b2:	8b 45 08             	mov    0x8(%ebp),%eax
 9b5:	c1 e0 03             	shl    $0x3,%eax
 9b8:	89 04 24             	mov    %eax,(%esp)
 9bb:	e8 10 fc ff ff       	call   5d0 <sbrk>
 9c0:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 9c3:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 9c7:	75 07                	jne    9d0 <morecore+0x34>
    return 0;
 9c9:	b8 00 00 00 00       	mov    $0x0,%eax
 9ce:	eb 22                	jmp    9f2 <morecore+0x56>
  hp = (Header*)p;
 9d0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9d3:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 9d6:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9d9:	8b 55 08             	mov    0x8(%ebp),%edx
 9dc:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 9df:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9e2:	83 c0 08             	add    $0x8,%eax
 9e5:	89 04 24             	mov    %eax,(%esp)
 9e8:	e8 ce fe ff ff       	call   8bb <free>
  return freep;
 9ed:	a1 24 10 00 00       	mov    0x1024,%eax
}
 9f2:	c9                   	leave  
 9f3:	c3                   	ret    

000009f4 <malloc>:

void*
malloc(uint nbytes)
{
 9f4:	55                   	push   %ebp
 9f5:	89 e5                	mov    %esp,%ebp
 9f7:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 9fa:	8b 45 08             	mov    0x8(%ebp),%eax
 9fd:	83 c0 07             	add    $0x7,%eax
 a00:	c1 e8 03             	shr    $0x3,%eax
 a03:	83 c0 01             	add    $0x1,%eax
 a06:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 a09:	a1 24 10 00 00       	mov    0x1024,%eax
 a0e:	89 45 f0             	mov    %eax,-0x10(%ebp)
 a11:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 a15:	75 23                	jne    a3a <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 a17:	c7 45 f0 1c 10 00 00 	movl   $0x101c,-0x10(%ebp)
 a1e:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a21:	a3 24 10 00 00       	mov    %eax,0x1024
 a26:	a1 24 10 00 00       	mov    0x1024,%eax
 a2b:	a3 1c 10 00 00       	mov    %eax,0x101c
    base.s.size = 0;
 a30:	c7 05 20 10 00 00 00 	movl   $0x0,0x1020
 a37:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a3a:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a3d:	8b 00                	mov    (%eax),%eax
 a3f:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 a42:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a45:	8b 40 04             	mov    0x4(%eax),%eax
 a48:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 a4b:	72 4d                	jb     a9a <malloc+0xa6>
      if(p->s.size == nunits)
 a4d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a50:	8b 40 04             	mov    0x4(%eax),%eax
 a53:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 a56:	75 0c                	jne    a64 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 a58:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a5b:	8b 10                	mov    (%eax),%edx
 a5d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a60:	89 10                	mov    %edx,(%eax)
 a62:	eb 26                	jmp    a8a <malloc+0x96>
      else {
        p->s.size -= nunits;
 a64:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a67:	8b 40 04             	mov    0x4(%eax),%eax
 a6a:	2b 45 ec             	sub    -0x14(%ebp),%eax
 a6d:	89 c2                	mov    %eax,%edx
 a6f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a72:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 a75:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a78:	8b 40 04             	mov    0x4(%eax),%eax
 a7b:	c1 e0 03             	shl    $0x3,%eax
 a7e:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 a81:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a84:	8b 55 ec             	mov    -0x14(%ebp),%edx
 a87:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 a8a:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a8d:	a3 24 10 00 00       	mov    %eax,0x1024
      return (void*)(p + 1);
 a92:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a95:	83 c0 08             	add    $0x8,%eax
 a98:	eb 38                	jmp    ad2 <malloc+0xde>
    }
    if(p == freep)
 a9a:	a1 24 10 00 00       	mov    0x1024,%eax
 a9f:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 aa2:	75 1b                	jne    abf <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 aa4:	8b 45 ec             	mov    -0x14(%ebp),%eax
 aa7:	89 04 24             	mov    %eax,(%esp)
 aaa:	e8 ed fe ff ff       	call   99c <morecore>
 aaf:	89 45 f4             	mov    %eax,-0xc(%ebp)
 ab2:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 ab6:	75 07                	jne    abf <malloc+0xcb>
        return 0;
 ab8:	b8 00 00 00 00       	mov    $0x0,%eax
 abd:	eb 13                	jmp    ad2 <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 abf:	8b 45 f4             	mov    -0xc(%ebp),%eax
 ac2:	89 45 f0             	mov    %eax,-0x10(%ebp)
 ac5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 ac8:	8b 00                	mov    (%eax),%eax
 aca:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 acd:	e9 70 ff ff ff       	jmp    a42 <malloc+0x4e>
}
 ad2:	c9                   	leave  
 ad3:	c3                   	ret    
