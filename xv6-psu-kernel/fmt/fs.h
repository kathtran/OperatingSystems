4000 // On-disk file system format.
4001 // Both the kernel and user programs use this header file.
4002 
4003 
4004 #define ROOTINO 1  // root i-number
4005 #define BSIZE 512  // block size
4006 
4007 // Disk layout:
4008 // [ boot block | super block | log | inode blocks | free bit map | data blocks ]
4009 //
4010 // mkfs computes the super block and builds an initial file system. The super describes
4011 // the disk layout:
4012 struct superblock {
4013   uint size;         // Size of file system image (blocks)
4014   uint nblocks;      // Number of data blocks
4015   uint ninodes;      // Number of inodes.
4016   uint nlog;         // Number of log blocks
4017   uint logstart;     // Block number of first log block
4018   uint inodestart;   // Block number of first inode block
4019   uint bmapstart;    // Block number of first free map block
4020 };
4021 
4022 #define NDIRECT 12
4023 #define NINDIRECT (BSIZE / sizeof(uint))
4024 #define MAXFILE (NDIRECT + NINDIRECT)
4025 
4026 // On-disk inode structure
4027 struct dinode {
4028   short type;           // File type
4029   short major;          // Major device number (T_DEV only)
4030   short minor;          // Minor device number (T_DEV only)
4031   short nlink;          // Number of links to inode in file system
4032   uint size;            // Size of file (bytes)
4033   uint addrs[NDIRECT+1];   // Data block addresses
4034 };
4035 
4036 
4037 
4038 
4039 
4040 
4041 
4042 
4043 
4044 
4045 
4046 
4047 
4048 
4049 
4050 // Inodes per block.
4051 #define IPB           (BSIZE / sizeof(struct dinode))
4052 
4053 // Block containing inode i
4054 #define IBLOCK(i, sb)     ((i) / IPB + sb.inodestart)
4055 
4056 // Bitmap bits per block
4057 #define BPB           (BSIZE*8)
4058 
4059 // Block of free map containing bit for block b
4060 #define BBLOCK(b, sb) (b/BPB + sb.bmapstart)
4061 
4062 // Directory is a file containing a sequence of dirent structures.
4063 #define DIRSIZ 14
4064 
4065 struct dirent {
4066   ushort inum;
4067   char name[DIRSIZ];
4068 };
4069 
4070 
4071 
4072 
4073 
4074 
4075 
4076 
4077 
4078 
4079 
4080 
4081 
4082 
4083 
4084 
4085 
4086 
4087 
4088 
4089 
4090 
4091 
4092 
4093 
4094 
4095 
4096 
4097 
4098 
4099 
