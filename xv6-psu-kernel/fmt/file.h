4100 struct file {
4101   enum { FD_NONE, FD_PIPE, FD_INODE } type;
4102   int ref; // reference count
4103   char readable;
4104   char writable;
4105   struct pipe *pipe;
4106   struct inode *ip;
4107   uint off;
4108 };
4109 
4110 
4111 // in-memory copy of an inode
4112 struct inode {
4113   uint dev;           // Device number
4114   uint inum;          // Inode number
4115   int ref;            // Reference count
4116   int flags;          // I_BUSY, I_VALID
4117 
4118   short type;         // copy of disk inode
4119   short major;
4120   short minor;
4121   short nlink;
4122   uint size;
4123   uint addrs[NDIRECT+1];
4124 };
4125 #define I_BUSY 0x1
4126 #define I_VALID 0x2
4127 
4128 // table mapping major device number to
4129 // device functions
4130 struct devsw {
4131   int (*read)(struct inode*, char*, int);
4132   int (*write)(struct inode*, char*, int);
4133 };
4134 
4135 extern struct devsw devsw[];
4136 
4137 #define CONSOLE 1
4138 
4139 
4140 
4141 
4142 
4143 
4144 
4145 
4146 
4147 
4148 
4149 
4150 // Blank page.
4151 
4152 
4153 
4154 
4155 
4156 
4157 
4158 
4159 
4160 
4161 
4162 
4163 
4164 
4165 
4166 
4167 
4168 
4169 
4170 
4171 
4172 
4173 
4174 
4175 
4176 
4177 
4178 
4179 
4180 
4181 
4182 
4183 
4184 
4185 
4186 
4187 
4188 
4189 
4190 
4191 
4192 
4193 
4194 
4195 
4196 
4197 
4198 
4199 
