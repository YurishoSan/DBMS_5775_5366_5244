
[General]
Version=1

[Preferences]
Username=
Password=2662
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYSTEM
Name=BOOK
Count=10..20

[Record]
Name=BOOKID
Type=NUMBER
Size=38
Data=Random(10000000, 99999999)
Master=

[Record]
Name=NAME
Type=VARCHAR2
Size=38
Data=Elements.Name
Master=

[Record]
Name=AUTHOR
Type=VARCHAR2
Size=38
Data=FirstName + ' ' + LastName
Master=

[Record]
Name=CATEGORY
Type=VARCHAR2
Size=38
Data=Elements.Name
Master=

[Record]
Name=ABSTRACT
Type=VARCHAR2
Size=256
Data=Text(1000, 10, 5)
Master=

[Record]
Name=PUBLISHER
Type=VARCHAR2
Size=38
Data=Company
Master=

[Record]
Name=SHELFNUM
Type=NUMBER
Size=38
Data=Random(0, 34) + '.' + Random(0,256)
Master=

[Record]
Name=PUBYEAR
Type=NUMBER
Size=4
Data=Random(1900, 2015)
Master=

