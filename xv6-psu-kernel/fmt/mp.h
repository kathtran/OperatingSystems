6850 // See MultiProcessor Specification Version 1.[14]
6851 
6852 struct mp {             // floating pointer
6853   uchar signature[4];           // "_MP_"
6854   void *physaddr;               // phys addr of MP config table
6855   uchar length;                 // 1
6856   uchar specrev;                // [14]
6857   uchar checksum;               // all bytes must add up to 0
6858   uchar type;                   // MP system config type
6859   uchar imcrp;
6860   uchar reserved[3];
6861 };
6862 
6863 struct mpconf {         // configuration table header
6864   uchar signature[4];           // "PCMP"
6865   ushort length;                // total table length
6866   uchar version;                // [14]
6867   uchar checksum;               // all bytes must add up to 0
6868   uchar product[20];            // product id
6869   uint *oemtable;               // OEM table pointer
6870   ushort oemlength;             // OEM table length
6871   ushort entry;                 // entry count
6872   uint *lapicaddr;              // address of local APIC
6873   ushort xlength;               // extended table length
6874   uchar xchecksum;              // extended table checksum
6875   uchar reserved;
6876 };
6877 
6878 struct mpproc {         // processor table entry
6879   uchar type;                   // entry type (0)
6880   uchar apicid;                 // local APIC id
6881   uchar version;                // local APIC verison
6882   uchar flags;                  // CPU flags
6883     #define MPBOOT 0x02           // This proc is the bootstrap processor.
6884   uchar signature[4];           // CPU signature
6885   uint feature;                 // feature flags from CPUID instruction
6886   uchar reserved[8];
6887 };
6888 
6889 struct mpioapic {       // I/O APIC table entry
6890   uchar type;                   // entry type (2)
6891   uchar apicno;                 // I/O APIC id
6892   uchar version;                // I/O APIC version
6893   uchar flags;                  // I/O APIC flags
6894   uint *addr;                  // I/O APIC address
6895 };
6896 
6897 
6898 
6899 
6900 // Table entry types
6901 #define MPPROC    0x00  // One per processor
6902 #define MPBUS     0x01  // One per bus
6903 #define MPIOAPIC  0x02  // One per I/O APIC
6904 #define MPIOINTR  0x03  // One per bus interrupt source
6905 #define MPLINTR   0x04  // One per system interrupt source
6906 
6907 
6908 
6909 
6910 
6911 
6912 
6913 
6914 
6915 
6916 
6917 
6918 
6919 
6920 
6921 
6922 
6923 
6924 
6925 
6926 
6927 
6928 
6929 
6930 
6931 
6932 
6933 
6934 
6935 
6936 
6937 
6938 
6939 
6940 
6941 
6942 
6943 
6944 
6945 
6946 
6947 
6948 
6949 
6950 // Blank page.
6951 
6952 
6953 
6954 
6955 
6956 
6957 
6958 
6959 
6960 
6961 
6962 
6963 
6964 
6965 
6966 
6967 
6968 
6969 
6970 
6971 
6972 
6973 
6974 
6975 
6976 
6977 
6978 
6979 
6980 
6981 
6982 
6983 
6984 
6985 
6986 
6987 
6988 
6989 
6990 
6991 
6992 
6993 
6994 
6995 
6996 
6997 
6998 
6999 
