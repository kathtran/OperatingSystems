3850 struct buf {
3851   int flags;
3852   uint dev;
3853   uint blockno;
3854   struct buf *prev; // LRU cache list
3855   struct buf *next;
3856   struct buf *qnext; // disk queue
3857   uchar data[BSIZE];
3858 };
3859 #define B_BUSY  0x1  // buffer is locked by some process
3860 #define B_VALID 0x2  // buffer has been read from disk
3861 #define B_DIRTY 0x4  // buffer needs to be written to disk
3862 
3863 
3864 
3865 
3866 
3867 
3868 
3869 
3870 
3871 
3872 
3873 
3874 
3875 
3876 
3877 
3878 
3879 
3880 
3881 
3882 
3883 
3884 
3885 
3886 
3887 
3888 
3889 
3890 
3891 
3892 
3893 
3894 
3895 
3896 
3897 
3898 
3899 
