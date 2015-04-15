
[General]
Version=1

[Preferences]
Username=
Password=2020
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYSTEM
Name=VOLUNTEERGROUP
Count=10..20

[Record]
Name=VGID
Type=NUMBER
Size=38
Data=Random(10000, 99999)
Master=

[Record]
Name=ADDRESS
Type=VARCHAR2
Size=38
Data=Address1
Master=

[Record]
Name=DAYOFWEEK
Type=NUMBER
Size=38
Data=Random(1, 6)
Master=

[Record]
Name=TIMEOFDAY
Type=TIMESTAMP(6)
Size=11
Data=Random(6, 22) + ':' + Random(0,5) + '0'
Master=

[Record]
Name=ORGANIZATION
Type=VARCHAR2
Size=38
Data=Company
Master=

[Record]
Name=DETAILS
Type=VARCHAR2
Size=256
Data=Text(256, 10, 4)
Master=

[Record]
Name=PHONE
Type=VARCHAR2
Size=12
Data='05' + Random(10000000, 99999999)
Master=

