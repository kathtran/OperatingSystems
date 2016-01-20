6700 #include "types.h"
6701 #include "x86.h"
6702 
6703 void*
6704 memset(void *dst, int c, uint n)
6705 {
6706   if ((int)dst%4 == 0 && n%4 == 0){
6707     c &= 0xFF;
6708     stosl(dst, (c<<24)|(c<<16)|(c<<8)|c, n/4);
6709   } else
6710     stosb(dst, c, n);
6711   return dst;
6712 }
6713 
6714 int
6715 memcmp(const void *v1, const void *v2, uint n)
6716 {
6717   const uchar *s1, *s2;
6718 
6719   s1 = v1;
6720   s2 = v2;
6721   while(n-- > 0){
6722     if(*s1 != *s2)
6723       return *s1 - *s2;
6724     s1++, s2++;
6725   }
6726 
6727   return 0;
6728 }
6729 
6730 void*
6731 memmove(void *dst, const void *src, uint n)
6732 {
6733   const char *s;
6734   char *d;
6735 
6736   s = src;
6737   d = dst;
6738   if(s < d && s + n > d){
6739     s += n;
6740     d += n;
6741     while(n-- > 0)
6742       *--d = *--s;
6743   } else
6744     while(n-- > 0)
6745       *d++ = *s++;
6746 
6747   return dst;
6748 }
6749 
6750 // memcpy exists to placate GCC.  Use memmove.
6751 void*
6752 memcpy(void *dst, const void *src, uint n)
6753 {
6754   return memmove(dst, src, n);
6755 }
6756 
6757 int
6758 strncmp(const char *p, const char *q, uint n)
6759 {
6760   while(n > 0 && *p && *p == *q)
6761     n--, p++, q++;
6762   if(n == 0)
6763     return 0;
6764   return (uchar)*p - (uchar)*q;
6765 }
6766 
6767 char*
6768 strncpy(char *s, const char *t, int n)
6769 {
6770   char *os;
6771 
6772   os = s;
6773   while(n-- > 0 && (*s++ = *t++) != 0)
6774     ;
6775   while(n-- > 0)
6776     *s++ = 0;
6777   return os;
6778 }
6779 
6780 // Like strncpy but guaranteed to NUL-terminate.
6781 char*
6782 safestrcpy(char *s, const char *t, int n)
6783 {
6784   char *os;
6785 
6786   os = s;
6787   if(n <= 0)
6788     return os;
6789   while(--n > 0 && (*s++ = *t++) != 0)
6790     ;
6791   *s = 0;
6792   return os;
6793 }
6794 
6795 
6796 
6797 
6798 
6799 
6800 int
6801 strlen(const char *s)
6802 {
6803   int n;
6804 
6805   for(n = 0; s[n]; n++)
6806     ;
6807   return n;
6808 }
6809 
6810 
6811 
6812 
6813 
6814 
6815 
6816 
6817 
6818 
6819 
6820 
6821 
6822 
6823 
6824 
6825 
6826 
6827 
6828 
6829 
6830 
6831 
6832 
6833 
6834 
6835 
6836 
6837 
6838 
6839 
6840 
6841 
6842 
6843 
6844 
6845 
6846 
6847 
6848 
6849 
