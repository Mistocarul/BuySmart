”@
HD:\BuySmart\BuySmart\Infrastructure\Repositories\UserClientRepository.cs
	namespace 	
Infrastructure
 
. 
Repositories %
{ 
public		 

class		  
UserClientRepository		 %
:		& '
IUserRepository		( 7
<		7 8

UserClient		8 B
>		B C
{

 
private 
readonly  
ApplicationDbContext -
context. 5
;5 6
public  
UserClientRepository #
(# $ 
ApplicationDbContext$ 8
context9 @
)@ A
{ 	
this 
. 
context 
= 
context "
;" #
} 	
public 
async 
Task 
< 
IEnumerable %
<% &

UserClient& 0
>0 1
>1 2
GetAllAsync3 >
(> ?
)? @
{ 	
var 
userClients 
= 
await #
context$ +
.+ ,
UserClients, 7
.7 8
ToListAsync8 C
(C D
)D E
;E F
foreach 
( 
var 

userClient #
in$ &
userClients' 2
)2 3
{ 
string 
profileFilePath &
=' (

userClient) 3
.3 4
Image4 9
;9 :
if 
( 
File 
. 
Exists 
(  
profileFilePath  /
)/ 0
)0 1
{ 
byte 
[ 
] 

imageArray %
=& '
await( -
File. 2
.2 3
ReadAllBytesAsync3 D
(D E
profileFilePathE T
)T U
;U V
string %
base64ImageRepresentation 4
=5 6
Convert7 >
.> ?
ToBase64String? M
(M N

imageArrayN X
)X Y
;Y Z

userClient 
. 
Image $
=% &%
base64ImageRepresentation' @
;@ A
} 
else 
{ 
throw   
new   !
FileNotFoundException   3
(  3 4
$str  4 E
)  E F
;  F G
}!! 
}"" 
return## 
userClients## 
;## 
}$$ 	
public&& 
async&& 
Task&& 
<&& 

UserClient&& $
>&&$ %
GetByIdAsync&&& 2
(&&2 3
Guid&&3 7
userId&&8 >
)&&> ?
{'' 	
var(( 

userClient(( 
=(( 
await(( "
context((# *
.((* +
UserClients((+ 6
.((6 7
	FindAsync((7 @
(((@ A
userId((A G
)((G H
;((H I
if)) 
()) 

userClient)) 
==)) 
null)) "
)))" #
{** 
throw++ 
new++  
KeyNotFoundException++ .
(++. /
$str++/ E
)++E F
;++F G
},, 
string-- 
profileFilePath-- "
=--# $

userClient--% /
.--/ 0
Image--0 5
;--5 6
if.. 
(.. 
File.. 
... 
Exists.. 
(.. 
profileFilePath.. +
)..+ ,
).., -
{// 
byte00 
[00 
]00 

imageArray00 !
=00" #
await00$ )
File00* .
.00. /
ReadAllBytesAsync00/ @
(00@ A
profileFilePath00A P
)00P Q
;00Q R
string11 %
base64ImageRepresentation11 0
=111 2
Convert113 :
.11: ;
ToBase64String11; I
(11I J

imageArray11J T
)11T U
;11U V

userClient22 
.22 
Image22  
=22! "%
base64ImageRepresentation22# <
;22< =
}33 
else44 
{55 
throw66 
new66 !
FileNotFoundException66 /
(66/ 0
$str660 A
)66A B
;66B C
}77 
return88 

userClient88 
;88 
}99 	
public;; 
async;; 
Task;; 
<;; 
Result;;  
<;;  !
Guid;;! %
>;;% &
>;;& '
AddAsync;;( 0
(;;0 1

UserClient;;1 ;

userClient;;< F
);;F G
{<< 	
try== 
{>> 
await?? 
context?? 
.?? 
UserClients?? )
.??) *
AddAsync??* 2
(??2 3

userClient??3 =
)??= >
;??> ?
await@@ 
context@@ 
.@@ 
SaveChangesAsync@@ .
(@@. /
)@@/ 0
;@@0 1
returnAA 
ResultAA 
<AA 
GuidAA "
>AA" #
.AA# $
SuccessAA$ +
(AA+ ,

userClientAA, 6
.AA6 7
UserIdAA7 =
)AA= >
;AA> ?
}BB 
catchCC 
(CC 
	ExceptionCC 
exCC 
)CC  
{DD 
returnEE 
ResultEE 
<EE 
GuidEE "
>EE" #
.EE# $
FailureEE$ +
(EE+ ,
exEE, .
.EE. /
MessageEE/ 6
)EE6 7
;EE7 8
}FF 
}GG 	
publicII 
asyncII 
TaskII 
<II 
ResultII  
<II  !
objectII! '
>II' (
>II( )
UpdateAsyncII* 5
(II5 6

UserClientII6 @

userClientIIA K
)IIK L
{JJ 	
tryKK 
{LL 
varMM 
existingUserClientMM &
=MM' (
awaitMM) .
contextMM/ 6
.MM6 7
UserClientsMM7 B
.MMB C
	FindAsyncMMC L
(MML M

userClientMMM W
.MMW X
UserIdMMX ^
)MM^ _
;MM_ `
ifNN 
(NN 
existingUserClientNN &
==NN' )
nullNN* .
)NN. /
{OO 
returnPP 
ResultPP !
<PP! "
objectPP" (
>PP( )
.PP) *
FailurePP* 1
(PP1 2
$strPP2 H
)PPH I
;PPI J
}QQ 
existingUserClientTT "
.TT" #
NameTT# '
=TT( )

userClientTT* 4
.TT4 5
NameTT5 9
;TT9 :
existingUserClientUU "
.UU" #
EmailUU# (
=UU) *

userClientUU+ 5
.UU5 6
EmailUU6 ;
;UU; <
existingUserClientVV "
.VV" #
PasswordVV# +
=VV, -

userClientVV. 8
.VV8 9
PasswordVV9 A
;VVA B
existingUserClientWW "
.WW" #
ImageWW# (
=WW) *

userClientWW+ 5
.WW5 6
ImageWW6 ;
;WW; <
existingUserClientXX "
.XX" #
UserTypeXX# +
=XX, -

userClientXX. 8
.XX8 9
UserTypeXX9 A
;XXA B
contextZZ 
.ZZ 
UserClientsZZ #
.ZZ# $
UpdateZZ$ *
(ZZ* +
existingUserClientZZ+ =
)ZZ= >
;ZZ> ?
await[[ 
context[[ 
.[[ 
SaveChangesAsync[[ .
([[. /
)[[/ 0
;[[0 1
return\\ 
Result\\ 
<\\ 
object\\ $
>\\$ %
.\\% &
Success\\& -
(\\- .
new\\. 1
object\\2 8
(\\8 9
)\\9 :
)\\: ;
;\\; <
}]] 
catch^^ 
(^^ 
	Exception^^ 
ex^^ 
)^^  
{__ 
return`` 
Result`` 
<`` 
object`` $
>``$ %
.``% &
Failure``& -
(``- .
ex``. 0
.``0 1
Message``1 8
)``8 9
;``9 :
}aa 
}bb 	
}cc 
}dd û.
JD:\BuySmart\BuySmart\Infrastructure\Repositories\UserBusinessRepository.cs
	namespace 	
Infrastructure
 
. 
Repositories %
{ 
public		 

class		 "
UserBusinessRepository		 '
:		( )
IUserRepository		* 9
<		9 :
UserBusiness		: F
>		F G
{

 
private 
readonly  
ApplicationDbContext -
context. 5
;5 6
public "
UserBusinessRepository %
(% & 
ApplicationDbContext& :
context; B
)B C
{ 	
this 
. 
context 
= 
context "
;" #
} 	
public 
async 
Task 
< 
Result  
<  !
Guid! %
>% &
>& '
AddAsync( 0
(0 1
UserBusiness1 =
userBusiness> J
)J K
{ 	
try 
{ 
await 
context 
. 
UserBusinesses ,
., -
AddAsync- 5
(5 6
userBusiness6 B
)B C
;C D
await 
context 
. 
SaveChangesAsync .
(. /
)/ 0
;0 1
return 
Result 
< 
Guid "
>" #
.# $
Success$ +
(+ ,
userBusiness, 8
.8 9
UserId9 ?
)? @
;@ A
} 
catch 
( 
	Exception 
ex 
)  
{ 
return 
Result 
< 
Guid "
>" #
.# $
Failure$ +
(+ ,
ex, .
.. /
Message/ 6
)6 7
;7 8
} 
} 	
public 
async 
Task 
< 
IEnumerable %
<% &
UserBusiness& 2
>2 3
>3 4
GetAllAsync5 @
(@ A
)A B
{   	
return!! 
await!! 
context!!  
.!!  !
UserBusinesses!!! /
.!!/ 0
ToListAsync!!0 ;
(!!; <
)!!< =
;!!= >
}"" 	
public$$ 
async$$ 
Task$$ 
<$$ 
UserBusiness$$ &
>$$& '
GetByIdAsync$$( 4
($$4 5
Guid$$5 9
userId$$: @
)$$@ A
{%% 	
var&& 
userBusiness&& 
=&& 
await&& $
context&&% ,
.&&, -
UserBusinesses&&- ;
.&&; <
	FindAsync&&< E
(&&E F
userId&&F L
)&&L M
;&&M N
if'' 
('' 
userBusiness'' 
=='' 
null''  $
)''$ %
{(( 
throw)) 
new))  
KeyNotFoundException)) .
()). /
$str))/ G
)))G H
;))H I
}** 
return++ 
userBusiness++ 
;++  
},, 	
public.. 
async.. 
Task.. 
<.. 
Result..  
<..  !
object..! '
>..' (
>..( )
UpdateAsync..* 5
(..5 6
UserBusiness..6 B
userBusiness..C O
)..O P
{// 	
try00 
{11 
var22  
existingUserBusiness22 (
=22) *
await22+ 0
context221 8
.228 9
UserBusinesses229 G
.22G H
	FindAsync22H Q
(22Q R
userBusiness22R ^
.22^ _
UserId22_ e
)22e f
;22f g
if33 
(33  
existingUserBusiness33 (
==33) +
null33, 0
)330 1
{44 
return55 
Result55 !
<55! "
object55" (
>55( )
.55) *
Failure55* 1
(551 2
$str552 J
)55J K
;55K L
}66  
existingUserBusiness99 $
.99$ %
Name99% )
=99* +
userBusiness99, 8
.998 9
Name999 =
;99= > 
existingUserBusiness:: $
.::$ %
Email::% *
=::+ ,
userBusiness::- 9
.::9 :
Email::: ?
;::? @ 
existingUserBusiness;; $
.;;$ %
Password;;% -
=;;. /
userBusiness;;0 <
.;;< =
Password;;= E
;;;E F 
existingUserBusiness<< $
.<<$ %
UserType<<% -
=<<. /
userBusiness<<0 <
.<<< =
UserType<<= E
;<<E F 
existingUserBusiness== $
.==$ %
Image==% *
===+ ,
userBusiness==- 9
.==9 :
Image==: ?
;==? @
context?? 
.?? 
UserBusinesses?? &
.??& '
Update??' -
(??- . 
existingUserBusiness??. B
)??B C
;??C D
await@@ 
context@@ 
.@@ 
SaveChangesAsync@@ .
(@@. /
)@@/ 0
;@@0 1
returnAA 
ResultAA 
<AA 
objectAA $
>AA$ %
.AA% &
SuccessAA& -
(AA- .
newAA. 1
objectAA2 8
(AA8 9
)AA9 :
)AA: ;
;AA; <
}BB 
catchCC 
(CC 
	ExceptionCC 
exCC 
)CC  
{DD 
returnEE 
ResultEE 
<EE 
objectEE $
>EE$ %
.EE% &
FailureEE& -
(EE- .
exEE. 0
.EE0 1
MessageEE1 8
)EE8 9
;EE9 :
}FF 
}GG 	
}HH 
}II âG
LD:\BuySmart\BuySmart\Infrastructure\Repositories\ReviewBusinessRepository.cs
	namespace 	
Infrastructure
 
. 
Repositories %
{ 
public		 

class		 $
ReviewBusinessRepository		 )
:		* +%
IReviewBusinessRepository		, E
{

 
private 
readonly  
ApplicationDbContext -
context. 5
;5 6
public $
ReviewBusinessRepository '
(' ( 
ApplicationDbContext( <
context= D
)D E
{ 	
this 
. 
context 
= 
context "
;" #
} 	
public 
async 
Task 
< 
Result  
<  !
Guid! %
>% &
>& '
AddAsync( 0
(0 1
Review1 7
review8 >
)> ?
{ 	
try 
{ 
var 

userExists 
=  
await! &
context' .
.. /
Users/ 4
.4 5
AnyAsync5 =
(= >
u> ?
=>@ B
uC D
.D E
UserIdE K
==L N
reviewO U
.U V
UserClientIdV b
)b c
;c d
if 
( 
! 

userExists 
)  
{ 
return 
Result !
<! "
Guid" &
>& '
.' (
Failure( /
(/ 0
$str0 N
)N O
;O P
} 
var 
businessExists "
=# $
await% *
context+ 2
.2 3

Businesses3 =
.= >
AnyAsync> F
(F G
bG H
=>I K
bL M
.M N

BusinessIDN X
==Y [
review\ b
.b c

BusinessIdc m
)m n
;n o
if 
( 
! 
businessExists #
)# $
{ 
return 
Result !
<! "
Guid" &
>& '
.' (
Failure( /
(/ 0
$str0 L
)L M
;M N
} 
await 
context 
. 
Reviews %
.% &
AddAsync& .
(. /
review/ 5
)5 6
;6 7
await   
context   
.   
SaveChangesAsync   .
(  . /
)  / 0
;  0 1
return!! 
Result!! 
<!! 
Guid!! "
>!!" #
.!!# $
Success!!$ +
(!!+ ,
review!!, 2
.!!2 3
ReviewId!!3 ;
)!!; <
;!!< =
}"" 
catch## 
(## 
	Exception## 
ex## 
)##  
{$$ 
return%% 
Result%% 
<%% 
Guid%% "
>%%" #
.%%# $
Failure%%$ +
(%%+ ,
ex%%, .
.%%. /
Message%%/ 6
)%%6 7
;%%7 8
}&& 
}(( 	
public)) 
async)) 
Task)) 
<)) 
Result))  
<))  !
object))! '
>))' (
>))( )
UpdateAsync))* 5
())5 6
Review))6 <
review))= C
)))C D
{** 	
try++ 
{,, 
var-- 
existingReview-- "
=--# $
await--% *
context--+ 2
.--2 3
Reviews--3 :
.--: ;
	FindAsync--; D
(--D E
review--E K
.--K L
ReviewId--L T
)--T U
;--U V
if.. 
(.. 
existingReview.. "
==..# %
null..& *
)..* +
{// 
return00 
Result00 !
<00! "
object00" (
>00( )
.00) *
Failure00* 1
(001 2
$str002 D
)00D E
;00E F
}11 
var33 

userExists33 
=33  
await33! &
context33' .
.33. /
Users33/ 4
.334 5
AnyAsync335 =
(33= >
u33> ?
=>33@ B
u33C D
.33D E
UserId33E K
==33L N
review33O U
.33U V
UserClientId33V b
)33b c
;33c d
if44 
(44 
!44 

userExists44 
)44  
{55 
return66 
Result66 !
<66! "
object66" (
>66( )
.66) *
Failure66* 1
(661 2
$str662 P
)66P Q
;66Q R
}77 
var99 
businessExists99 "
=99# $
await99% *
context99+ 2
.992 3

Businesses993 =
.99= >
AnyAsync99> F
(99F G
b99G H
=>99I K
b99L M
.99M N

BusinessID99N X
==99Y [
review99\ b
.99b c

BusinessId99c m
)99m n
;99n o
if:: 
(:: 
!:: 
businessExists:: #
)::# $
{;; 
return<< 
Result<< !
<<<! "
object<<" (
><<( )
.<<) *
Failure<<* 1
(<<1 2
$str<<2 N
)<<N O
;<<O P
}== 
existingReview@@ 
.@@ 
Rating@@ %
=@@& '
review@@( .
.@@. /
Rating@@/ 5
;@@5 6
existingReviewAA 
.AA 
CommentAA &
=AA' (
reviewAA) /
.AA/ 0
CommentAA0 7
;AA7 8
existingReviewBB 
.BB 

BusinessIdBB )
=BB* +
reviewBB, 2
.BB2 3

BusinessIdBB3 =
;BB= >
existingReviewCC 
.CC 
UserClientIdCC +
=CC, -
reviewCC. 4
.CC4 5
UserClientIdCC5 A
;CCA B
awaitEE 
contextEE 
.EE 
SaveChangesAsyncEE .
(EE. /
)EE/ 0
;EE0 1
returnFF 
ResultFF 
<FF 
objectFF $
>FF$ %
.FF% &
SuccessFF& -
(FF- .
newFF. 1
objectFF2 8
(FF8 9
)FF9 :
)FF: ;
;FF; <
}GG 
catchHH 
(HH 
	ExceptionHH 
exHH 
)HH  
{II 
returnJJ 
ResultJJ 
<JJ 
objectJJ $
>JJ$ %
.JJ% &
FailureJJ& -
(JJ- .
exJJ. 0
.JJ0 1
MessageJJ1 8
)JJ8 9
;JJ9 :
}KK 
}LL 	
publicMM 
asyncMM 
TaskMM 
<MM 
IEnumerableMM %
<MM% &
ReviewMM& ,
>MM, -
>MM- .
GetAllAsyncMM/ :
(MM: ;
)MM; <
{NN 	
returnOO 
awaitOO 
contextOO  
.OO  !
ReviewsOO! (
.OO( )
ToListAsyncOO) 4
(OO4 5
)OO5 6
;OO6 7
}QQ 	
publicRR 
asyncRR 
TaskRR 
<RR 
ReviewRR  
>RR  !
GetByIdAsyncRR" .
(RR. /
GuidRR/ 3
reviewIdRR4 <
)RR< =
{SS 	
varTT 
reviewTT 
=TT 
awaitTT 
contextTT &
.TT& '
ReviewsTT' .
.TT. /
	FindAsyncTT/ 8
(TT8 9
reviewIdTT9 A
)TTA B
;TTB C
ifUU 
(UU 
reviewUU 
==UU 
nullUU 
)UU 
{VV 
throwWW 
newWW  
KeyNotFoundExceptionWW .
(WW. /
$strWW/ A
)WWA B
;WWB C
}XX 
returnYY 
reviewYY 
;YY 
}ZZ 	
public[[ 
async[[ 
Task[[ 
DeleteAsync[[ %
([[% &
Guid[[& *
reviewId[[+ 3
)[[3 4
{\\ 	
var]] 
review]] 
=]] 
await]] 
context]] &
.]]& '
Reviews]]' .
.]]. /
	FindAsync]]/ 8
(]]8 9
reviewId]]9 A
)]]A B
;]]B C
if^^ 
(^^ 
review^^ 
==^^ 
null^^ 
)^^ 
{__ 
throw`` 
new``  
KeyNotFoundException`` .
(``. /
$str``/ A
)``A B
;``B C
}aa 
contextbb 
.bb 
Reviewsbb 
.bb 
Removebb "
(bb" #
reviewbb# )
)bb) *
;bb* +
awaitcc 
contextcc 
.cc 
SaveChangesAsynccc *
(cc* +
)cc+ ,
;cc, -
}dd 	
}ff 
}gg ºu
ED:\BuySmart\BuySmart\Infrastructure\Repositories\ProductRepository.cs
	namespace

 	
Infrastructure


 
.

 
Repositories

 %
{ 
public 

class 
ProductRepository "
:# $
IProductRepository% 7
{ 
private 
readonly  
ApplicationDbContext -
context. 5
;5 6
private 
readonly 
IConfiguration '
configuration( 5
;5 6
public 
ProductRepository  
(  ! 
ApplicationDbContext! 5
context6 =
,= >
IConfiguration? M
configurationN [
)[ \
{ 	
this 
. 
context 
= 
context "
;" #
this 
. 
configuration 
=  
configuration! .
;. /
} 	
public 
async 
Task 
< 
IEnumerable %
<% &
Product& -
>- .
>. /
GetAllAsync0 ;
(; <
)< =
{ 	
var 
products 
= 
await  
context! (
.( )
Products) 1
. 
Include 
( 
p 
=> 
p 
.  

Categories  *
)* +
. 
ToListAsync 
( 
) 
; 
foreach 
( 
var 
product  
in! #
products$ ,
), -
{ 
string 
productPhotoPath '
=( )
product* 1
.1 2
Image2 7
;7 8
if 
( 
! 
File 
. 
Exists  
(  !
productPhotoPath! 1
)1 2
)2 3
{ 
throw 
new !
FileNotFoundException 3
(3 4
$str4 E
)E F
;F G
}   
byte!! 
[!! 
]!! 

imageArray!! !
=!!" #
await!!$ )
File!!* .
.!!. /
ReadAllBytesAsync!!/ @
(!!@ A
productPhotoPath!!A Q
)!!Q R
;!!R S
string"" %
base64ImageRepresentation"" 0
=""1 2
Convert""3 :
."": ;
ToBase64String""; I
(""I J

imageArray""J T
)""T U
;""U V
product## 
.## 
Image## 
=## %
base64ImageRepresentation##  9
;##9 :
}$$ 
return%% 
products%% 
;%% 
}&& 	
public(( 
async(( 
Task(( 
<(( 
Product(( !
>((! "
GetByIdAsync((# /
(((/ 0
Guid((0 4
	productId((5 >
)((> ?
{)) 	
var** 
product** 
=** 
await** 
context**  '
.**' (
Products**( 0
.**0 1
	FindAsync**1 :
(**: ;
	productId**; D
)**D E
;**E F
if++ 
(++ 
product++ 
==++ 
null++ 
)++  
{,, 
throw-- 
new--  
KeyNotFoundException-- .
(--. /
$str--/ B
)--B C
;--C D
}.. 
string// 
productPhotoPath// #
=//$ %
product//& -
.//- .
Image//. 3
;//3 4
if00 
(00 
!00 
File00 
.00 
Exists00 
(00 
productPhotoPath00 -
)00- .
)00. /
{11 
throw22 
new22 !
FileNotFoundException22 /
(22/ 0
$str220 A
)22A B
;22B C
}33 
byte44 
[44 
]44 

imageArray44 
=44 
await44  %
File44& *
.44* +
ReadAllBytesAsync44+ <
(44< =
productPhotoPath44= M
)44M N
;44N O
string55 %
base64ImageRepresentation55 ,
=55- .
Convert55/ 6
.556 7
ToBase64String557 E
(55E F

imageArray55F P
)55P Q
;55Q R
product66 
.66 
Image66 
=66 %
base64ImageRepresentation66 5
;665 6
return77 
product77 
;77 
}88 	
public:: 
async:: 
Task:: 
<:: 
Result::  
<::  !
Guid::! %
>::% &
>::& '
AddAsync::( 0
(::0 1
Product::1 8
product::9 @
)::@ A
{;; 	
try<< 
{== 
string>> 
?>> 
relativePath>> $
=>>% &
configuration>>' 4
[>>4 5
$str>>5 R
]>>R S
;>>S T
if?? 
(?? 
string?? 
.?? 
IsNullOrEmpty?? (
(??( )
relativePath??) 5
)??5 6
)??6 7
{@@ 
returnAA 
ResultAA !
<AA! "
GuidAA" &
>AA& '
.AA' (
FailureAA( /
(AA/ 0
$strAA0 [
)AA[ \
;AA\ ]
}BB 
varDD 
projectRootDirDD "
=DD# $
	DirectoryDD% .
.DD. /
	GetParentDD/ 8
(DD8 9

AppContextDD9 C
.DDC D
BaseDirectoryDDD Q
)DDQ R
?EE$ %
.EE% &
ParentEE& ,
?EE, -
.EE- .
ParentEE. 4
?EE4 5
.EE5 6
ParentEE6 <
;EE< =
ifGG 
(GG 
projectRootDirGG "
==GG# %
nullGG& *
)GG* +
{HH 
returnII 
ResultII !
<II! "
GuidII" &
>II& '
.II' (
FailureII( /
(II/ 0
$strII0 a
)IIa b
;IIb c
}JJ 
stringLL 
fullPathToPhotosLL '
=LL( )
PathLL* .
.LL. /
CombineLL/ 6
(LL6 7
projectRootDirLL7 E
.LLE F
FullNameLLF N
,LLN O
relativePathLLP \
)LL\ ]
;LL] ^
ifNN 
(NN 
!NN 
	DirectoryNN 
.NN 
ExistsNN %
(NN% &
fullPathToPhotosNN& 6
)NN6 7
)NN7 8
{OO 
returnPP 
ResultPP !
<PP! "
GuidPP" &
>PP& '
.PP' (
FailurePP( /
(PP/ 0
$"PP0 2
$strPP2 _
{PP_ `
fullPathToPhotosPP` p
}PPp q
"PPq r
)PPr s
;PPs t
}QQ 
fullPathToPhotosTT  
=TT! "
PathTT# '
.TT' (
GetFullPathTT( 3
(TT3 4
fullPathToPhotosTT4 D
)TTD E
;TTE F
awaitVV 
contextVV 
.VV 
ProductsVV &
.VV& '
AddAsyncVV' /
(VV/ 0
productVV0 7
)VV7 8
;VV8 9
awaitWW 
contextWW 
.WW 
SaveChangesAsyncWW .
(WW. /
)WW/ 0
;WW0 1
stringYY 
productPhotoPathYY '
;YY' (
byte[[ 
[[[ 
][[ 
productImage[[ #
=[[$ %
Convert[[& -
.[[- .
FromBase64String[[. >
([[> ?
product[[? F
.[[F G
Image[[G L
)[[L M
;[[M N
if]] 
(]] 
productImage]]  
!=]]! #
null]]$ (
&&]]) +
productImage]], 8
.]]8 9
Length]]9 ?
>]]@ A
$num]]B C
)]]C D
{^^ 
string__ 
fileName__ #
=__$ %
$"__& (
{__( )
product__) 0
.__0 1
Name__1 5
}__5 6
$str__6 7
{__7 8
product__8 ?
.__? @
	ProductId__@ I
}__I J
$str__J N
"__N O
;__O P
productPhotoPath`` $
=``% &
Path``' +
.``+ ,
Combine``, 3
(``3 4
fullPathToPhotos``4 D
,``D E
fileName``F N
)``N O
;``O P
awaitaa 
Fileaa 
.aa 
WriteAllBytesAsyncaa 1
(aa1 2
productPhotoPathaa2 B
,aaB C
productImageaaD P
)aaP Q
;aaQ R
}bb 
elsecc 
{dd 
stringee 
defaultPhotoPathee +
=ee, -
Pathee. 2
.ee2 3
Combineee3 :
(ee: ;
fullPathToPhotosee; K
,eeK L
$streeM Z
)eeZ [
;ee[ \
stringff 
fileNameff #
=ff$ %
$"ff& (
{ff( )
productff) 0
.ff0 1
Nameff1 5
}ff5 6
$strff6 7
{ff7 8
productff8 ?
.ff? @
	ProductIdff@ I
}ffI J
$strffJ N
"ffN O
;ffO P
productPhotoPathgg $
=gg% &
Pathgg' +
.gg+ ,
Combinegg, 3
(gg3 4
fullPathToPhotosgg4 D
,ggD E
fileNameggF N
)ggN O
;ggO P
Filehh 
.hh 
Copyhh 
(hh 
defaultPhotoPathhh .
,hh. /
productPhotoPathhh0 @
,hh@ A
	overwritehhB K
:hhK L
truehhM Q
)hhQ R
;hhR S
}ii 
productkk 
.kk 
Imagekk 
=kk 
productPhotoPathkk  0
;kk0 1
contextmm 
.mm 
Productsmm  
.mm  !
Updatemm! '
(mm' (
productmm( /
)mm/ 0
;mm0 1
awaitnn 
contextnn 
.nn 
SaveChangesAsyncnn .
(nn. /
)nn/ 0
;nn0 1
returnpp 
Resultpp 
<pp 
Guidpp "
>pp" #
.pp# $
Successpp$ +
(pp+ ,
productpp, 3
.pp3 4
	ProductIdpp4 =
)pp= >
;pp> ?
}qq 
catchrr 
(rr 
	Exceptionrr 
exrr 
)rr  
{ss 
returntt 
Resulttt 
<tt 
Guidtt "
>tt" #
.tt# $
Failurett$ +
(tt+ ,
extt, .
.tt. /
Messagett/ 6
)tt6 7
;tt7 8
}uu 
}vv 	
publicxx 
asyncxx 
Taskxx 
<xx 
Resultxx  
<xx  !
objectxx! '
>xx' (
>xx( )
UpdateAsyncxx* 5
(xx5 6
Productxx6 =
productxx> E
)xxE F
{yy 	
tryzz 
{{{ 
var|| 
existingProduct|| #
=||$ %
await||& +
context||, 3
.||3 4
Products||4 <
.||< =
	FindAsync||= F
(||F G
product||G N
.||N O
	ProductId||O X
)||X Y
;||Y Z
if}} 
(}} 
existingProduct}} #
==}}$ &
null}}' +
)}}+ ,
{~~ 
return 
Result !
<! "
object" (
>( )
.) *
Failure* 1
(1 2
$str2 E
)E F
;F G
}
ÄÄ 
existingProduct
ÅÅ 
.
ÅÅ  
Name
ÅÅ  $
=
ÅÅ% &
product
ÅÅ' .
.
ÅÅ. /
Name
ÅÅ/ 3
;
ÅÅ3 4
existingProduct
ÇÇ 
.
ÇÇ  
Description
ÇÇ  +
=
ÇÇ, -
product
ÇÇ. 5
.
ÇÇ5 6
Description
ÇÇ6 A
;
ÇÇA B
existingProduct
ÉÉ 
.
ÉÉ  
Price
ÉÉ  %
=
ÉÉ& '
product
ÉÉ( /
.
ÉÉ/ 0
Price
ÉÉ0 5
;
ÉÉ5 6
existingProduct
ÑÑ 
.
ÑÑ  
Stock
ÑÑ  %
=
ÑÑ& '
product
ÑÑ( /
.
ÑÑ/ 0
Stock
ÑÑ0 5
;
ÑÑ5 6
existingProduct
ÖÖ 
.
ÖÖ  
Rating
ÖÖ  &
=
ÖÖ' (
product
ÖÖ) 0
.
ÖÖ0 1
Rating
ÖÖ1 7
;
ÖÖ7 8
existingProduct
ÜÜ 
.
ÜÜ  
Image
ÜÜ  %
=
ÜÜ& '
product
ÜÜ( /
.
ÜÜ/ 0
Image
ÜÜ0 5
;
ÜÜ5 6
existingProduct
áá 
.
áá  

BusinessId
áá  *
=
áá+ ,
product
áá- 4
.
áá4 5

BusinessId
áá5 ?
;
áá? @
context
àà 
.
àà 
Products
àà  
.
àà  !
Update
àà! '
(
àà' (
existingProduct
àà( 7
)
àà7 8
;
àà8 9
await
ââ 
context
ââ 
.
ââ 
SaveChangesAsync
ââ .
(
ââ. /
)
ââ/ 0
;
ââ0 1
return
ää 
Result
ää 
<
ää 
object
ää $
>
ää$ %
.
ää% &
Success
ää& -
(
ää- .
new
ää. 1
object
ää2 8
(
ää8 9
)
ää9 :
)
ää: ;
;
ää; <
}
åå 
catch
çç 
(
çç 
	Exception
çç 
ex
çç 
)
çç  
{
éé 
return
èè 
Result
èè 
<
èè 
object
èè $
>
èè$ %
.
èè% &
Failure
èè& -
(
èè- .
ex
èè. 0
.
èè0 1
Message
èè1 8
)
èè8 9
;
èè9 :
}
ëë 
}
íí 	
public
îî 
async
îî 
Task
îî 
DeleteAsync
îî %
(
îî% &
Guid
îî& *
	productId
îî+ 4
)
îî4 5
{
ïï 	
var
ññ 
product
ññ 
=
ññ 
await
ññ 
context
ññ  '
.
ññ' (
Products
ññ( 0
.
ññ0 1
	FindAsync
ññ1 :
(
ññ: ;
	productId
ññ; D
)
ññD E
;
ññE F
if
óó 
(
óó 
product
óó 
==
óó 
null
óó 
)
óó  
{
òò 
throw
ôô 
new
ôô "
KeyNotFoundException
ôô .
(
ôô. /
$str
ôô/ B
)
ôôB C
;
ôôC D
}
öö 
context
õõ 
.
õõ 
Products
õõ 
.
õõ 
Remove
õõ #
(
õõ# $
product
õõ$ +
)
õõ+ ,
;
õõ, -
await
úú 
context
úú 
.
úú 
SaveChangesAsync
úú *
(
úú* +
)
úú+ ,
;
úú, -
}
ùù 	
}
ûû 
}üü ±<
FD:\BuySmart\BuySmart\Infrastructure\Repositories\CategoryRepository.cs
	namespace 	
Infrastructure
 
. 
Repositories %
{ 
public		 

class		 
CategoryRepository		 #
:		$ %
ICategoryRepository		& 9
{

 
private 
readonly  
ApplicationDbContext -
context. 5
;5 6
public 
CategoryRepository !
(! " 
ApplicationDbContext" 6
context7 >
)> ?
{ 	
this 
. 
context 
= 
context "
;" #
} 	
public 
async 
Task 
< 
IEnumerable %
<% &
Category& .
>. /
>/ 0
GetAllAsync1 <
(< =
)= >
{ 	
return 
await 
context  
.  !

Categories! +
.+ ,
ToListAsync, 7
(7 8
)8 9
;9 :
} 	
public 
async 
Task 
< 
Category "
>" #
GetByIdAsync$ 0
(0 1
Guid1 5

categoryId6 @
)@ A
{ 	
Console 
. 
	WriteLine 
( 
$"  
$str  9
{9 :

categoryId: D
}D E
"E F
)F G
;G H
var 
category 
= 
await  
context! (
.( )

Categories) 3
.3 4
	FindAsync4 =
(= >

categoryId> H
)H I
;I J
if 
( 
category 
== 
null  
)  !
{ 
Console 
. 
	WriteLine !
(! "
$str" >
)> ?
;? @
throw 
new  
KeyNotFoundException .
(. /
$str/ C
)C D
;D E
} 
Console 
. 
	WriteLine 
( 
$str 0
)0 1
;1 2
return 
category 
; 
} 	
public"" 
async"" 
Task"" 
<"" 
IEnumerable"" %
<""% &
Category""& .
>"". /
>""/ 0
GetByNamesAsync""1 @
(""@ A
List""A E
<""E F
string""F L
>""L M
names""N S
)""S T
{## 	
return$$ 
await$$ 
context$$  
.$$  !

Categories$$! +
.%% 
Where%% 
(%% 
c%% 
=>%% 
names%% !
.%%! "
Contains%%" *
(%%* +
c%%+ ,
.%%, -
Name%%- 1
)%%1 2
)%%2 3
.&& 
ToListAsync&& 
(&& 
)&& 
;&& 
}'' 	
public** 
async** 
Task** 
<** 
Result**  
<**  !
Guid**! %
>**% &
>**& '
AddAsync**( 0
(**0 1
Category**1 9
category**: B
)**B C
{,, 	
try-- 
{.. 
await// 
context// 
.// 

Categories// (
.//( )
AddAsync//) 1
(//1 2
category//2 :
)//: ;
;//; <
await00 
context00 
.00 
SaveChangesAsync00 .
(00. /
)00/ 0
;000 1
return11 
Result11 
<11 
Guid11 "
>11" #
.11# $
Success11$ +
(11+ ,
category11, 4
.114 5

CategoryId115 ?
)11? @
;11@ A
}22 
catch33 
(33 
	Exception33 
ex33 
)33  
{44 
return55 
Result55 
<55 
Guid55 "
>55" #
.55# $
Failure55$ +
(55+ ,
ex55, .
.55. /
Message55/ 6
)556 7
;557 8
}66 
}77 	
public88 
async88 
Task88 
<88 
Result88  
<88  !
object88! '
>88' (
>88( )
UpdateAsync88* 5
(885 6
Category886 >
category88? G
)88G H
{99 	
try::
 
{;; 
var<< 
existingCategory<< $
=<<% &
await<<' ,
context<<- 4
.<<4 5

Categories<<5 ?
.<<? @
	FindAsync<<@ I
(<<I J
category<<J R
.<<R S

CategoryId<<S ]
)<<] ^
;<<^ _
Console== 
.== 
	WriteLine== !
(==! "
$"==" $
$str==$ =
{=== >
category==> F
.==F G

CategoryId==G Q
}==Q R
"==R S
)==S T
;==T U
if>> 
(>> 
existingCategory>> $
==>>% '
null>>( ,
)>>, -
{?? 
return@@ 
Result@@ !
<@@! "
object@@" (
>@@( )
.@@) *
Failure@@* 1
(@@1 2
$str@@2 F
)@@F G
;@@G H
}AA 
existingCategoryBB  
.BB  !
NameBB! %
=BB& '
categoryBB( 0
.BB0 1
NameBB1 5
;BB5 6
existingCategoryCC  
.CC  !
DescriptionCC! ,
=CC- .
categoryCC/ 7
.CC7 8
DescriptionCC8 C
;CCC D
contextEE 
.EE 

CategoriesEE "
.EE" #
UpdateEE# )
(EE) *
existingCategoryEE* :
)EE: ;
;EE; <
awaitFF 
contextFF 
.FF 
SaveChangesAsyncFF .
(FF. /
)FF/ 0
;FF0 1
returnGG 
ResultGG 
<GG 
objectGG $
>GG$ %
.GG% &
SuccessGG& -
(GG- .
newGG. 1
objectGG2 8
(GG8 9
)GG9 :
)GG: ;
;GG; <
}HH 
catchII 
(II 
	ExceptionII 
exII 
)II  
{JJ 
returnKK 
ResultKK 
<KK 
objectKK $
>KK$ %
.KK% &
FailureKK& -
(KK- .
exKK. 0
.KK0 1
MessageKK1 8
)KK8 9
;KK9 :
}LL 
}MM 	
publicNN 
asyncNN 
TaskNN 
DeleteAsyncNN %
(NN% &
GuidNN& *

categoryIdNN+ 5
)NN5 6
{OO 	
varPP 
categoryPP 
=PP 
awaitPP  
contextPP! (
.PP( )

CategoriesPP) 3
.PP3 4
	FindAsyncPP4 =
(PP= >

categoryIdPP> H
)PPH I
;PPI J
ifQQ 
(QQ 
categoryQQ 
==QQ 
nullQQ  
)QQ  !
{RR 
throwSS 
newSS  
KeyNotFoundExceptionSS .
(SS. /
$strSS/ C
)SSC D
;SSD E
}TT 
contextUU 
.UU 

CategoriesUU 
.UU 
RemoveUU %
(UU% &
categoryUU& .
)UU. /
;UU/ 0
awaitVV 
contextVV 
.VV 
SaveChangesAsyncVV *
(VV* +
)VV+ ,
;VV, -
}WW 	
}YY 
}ZZ ±
BD:\BuySmart\BuySmart\Infrastructure\Repositories\CartRepository.cs
	namespace 	
Infrastructure
 
. 
Repositories %
{ 
public		 

class		 
CartRepository		 
:		  !
ICartRepository		" 1
{

 
private 
readonly  
ApplicationDbContext -
context. 5
;5 6
public 
CartRepository 
(  
ApplicationDbContext 2
context3 :
): ;
{ 	
this 
. 
context 
= 
context "
;" #
} 	
public 
async 
Task 
< 
Result  
<  !
Guid! %
>% &
>& '
AddAsync( 0
(0 1
Cart1 5
cart6 :
): ;
{ 	
try 
{ 
var 

userExists 
=  
await! &
context' .
.. /
Users/ 4
.4 5
AnyAsync5 =
(= >
u> ?
=>@ B
uC D
.D E
UserIdE K
==L N
cartO S
.S T
UserClientIdT `
)` a
;a b
if 
( 
! 

userExists 
)  
{ 
return 
Result !
<! "
Guid" &
>& '
.' (
Failure( /
(/ 0
$str0 N
)N O
;O P
} 
await 
context 
. 
Carts #
.# $
AddAsync$ ,
(, -
cart- 1
)1 2
;2 3
await 
context 
. 
SaveChangesAsync .
(. /
)/ 0
;0 1
return 
Result 
< 
Guid "
>" #
.# $
Success$ +
(+ ,
cart, 0
.0 1
CartId1 7
)7 8
;8 9
} 
catch 
( 
	Exception 
ex 
)  
{   
return!! 
Result!! 
<!! 
Guid!! "
>!!" #
.!!# $
Failure!!$ +
(!!+ ,
ex!!, .
.!!. /
Message!!/ 6
)!!6 7
;!!7 8
}"" 
}## 	
public%% 
Task%% 
DeleteAsync%% 
(%%  
Guid%%  $
cartId%%% +
)%%+ ,
{&& 	
throw'' 
new'' #
NotImplementedException'' -
(''- .
)''. /
;''/ 0
}(( 	
public** 
Task** 
<** 
IEnumerable** 
<**  
Cart**  $
>**$ %
>**% &
GetAllAsync**' 2
(**2 3
)**3 4
{++ 	
throw,, 
new,, #
NotImplementedException,, -
(,,- .
),,. /
;,,/ 0
}-- 	
public// 
Task// 
<// 
Cart// 
>// 
GetByIdAsync// &
(//& '
Guid//' +
cartId//, 2
)//2 3
{00 	
throw11 
new11 #
NotImplementedException11 -
(11- .
)11. /
;11/ 0
}22 	
public44 
Task44 
<44 
Result44 
<44 
object44 !
>44! "
>44" #
UpdateAsync44$ /
(44/ 0
Cart440 4
cart445 9
)449 :
{55 	
throw66 
new66 #
NotImplementedException66 -
(66- .
)66. /
;66/ 0
}77 	
}88 
}99 È8
FD:\BuySmart\BuySmart\Infrastructure\Repositories\BusinessRepository.cs
	namespace 	
Infrastructure
 
. 
Repositories %
{ 
public		 

class		 
BusinessRepository		 #
:		# $
IBusinessRepository		% 8
{

 
private 
readonly  
ApplicationDbContext -
context. 5
;5 6
public 
BusinessRepository !
(! " 
ApplicationDbContext" 6
context7 >
)> ?
{ 	
this 
. 
context 
= 
context "
;" #
} 	
public 
async 
Task 
< 
IEnumerable %
<% &
Business& .
>. /
>/ 0
GetAllAsync1 <
(< =
)= >
{ 	
return 
await 
context  
.  !

Businesses! +
.+ ,
ToListAsync, 7
(7 8
)8 9
;9 :
} 	
public 
async 
Task 
< 
Business "
>" #
GetByIdAsync$ 0
(0 1
Guid1 5

businessId6 @
)@ A
{ 	
var 
business 
= 
await  
context! (
.( )

Businesses) 3
.3 4
	FindAsync4 =
(= >

businessId> H
)H I
;I J
if 
( 
business 
== 
null  
)  !
{ 
throw 
new  
KeyNotFoundException .
(. /
$str/ C
)C D
;D E
} 
return 
business 
; 
}   	
public"" 
async"" 
Task"" 
<"" 
Result""  
<""  !
Guid""! %
>""% &
>""& '
AddAsync""( 0
(""0 1
Business""1 9
business"": B
)""B C
{## 	
try%% 
{&& 
var'' 

userExists'' 
=''  
await''! &
context''' .
.''. /
Users''/ 4
.''4 5
AnyAsync''5 =
(''= >
u''> ?
=>''@ B
u''C D
.''D E
UserId''E K
==''L N
business''O W
.''W X
UserBusinessId''X f
)''f g
;''g h
if(( 
((( 
!(( 

userExists(( 
)((  
{)) 
return** 
Result** !
<**! "
Guid**" &
>**& '
.**' (
Failure**( /
(**/ 0
$str**0 P
)**P Q
;**Q R
}++ 
await-- 
context-- 
.-- 

Businesses-- (
.--( )
AddAsync--) 1
(--1 2
business--2 :
)--: ;
;--; <
await.. 
context.. 
... 
SaveChangesAsync.. .
(... /
)../ 0
;..0 1
return// 
Result// 
<// 
Guid// "
>//" #
.//# $
Success//$ +
(//+ ,
business//, 4
.//4 5

BusinessID//5 ?
)//? @
;//@ A
}00 
catch11 
(11 
	Exception11 
ex11 
)11  
{22 
return33 
Result33 
<33 
Guid33 "
>33" #
.33# $
Failure33$ +
(33+ ,
ex33, .
.33. /
Message33/ 6
)336 7
;337 8
}44 
}55 	
public77 
async77 
Task77 
<77 
Result77  
<77  !
object77! '
>77' (
>77( )
UpdateAsync77* 5
(775 6
Business776 >
business77? G
)77G H
{88 	
try99 
{:: 
var;; 
existingBusiness;; $
=;;% &
await;;' ,
context;;- 4
.;;4 5

Businesses;;5 ?
.;;? @
	FindAsync;;@ I
(;;I J
business;;J R
.;;R S

BusinessID;;S ]
);;] ^
;;;^ _
if<< 
(<< 
existingBusiness<< $
==<<% '
null<<( ,
)<<, -
{== 
return>> 
Result>> !
<>>! "
object>>" (
>>>( )
.>>) *
Failure>>* 1
(>>1 2
$str>>2 F
)>>F G
;>>G H
}?? 
existingBusinessBB  
.BB  !
NameBB! %
=BB& '
businessBB( 0
.BB0 1
NameBB1 5
;BB5 6
existingBusinessCC  
.CC  !
AddressCC! (
=CC) *
businessCC+ 3
.CC3 4
AddressCC4 ;
;CC; <
existingBusinessDD  
.DD  !
PhoneNumberDD! ,
=DD- .
businessDD/ 7
.DD7 8
PhoneNumberDD8 C
;DDC D
existingBusinessEE  
.EE  !
DescriptionEE! ,
=EE- .
businessEE/ 7
.EE7 8
DescriptionEE8 C
;EEC D
contextHH 
.HH 

BusinessesHH "
.HH" #
UpdateHH# )
(HH) *
existingBusinessHH* :
)HH: ;
;HH; <
awaitII 
contextII 
.II 
SaveChangesAsyncII .
(II. /
)II/ 0
;II0 1
returnJJ 
ResultJJ 
<JJ 
objectJJ $
>JJ$ %
.JJ% &
SuccessJJ& -
(JJ- .
newJJ. 1
objectJJ2 8
(JJ8 9
)JJ9 :
)JJ: ;
;JJ; <
}KK 
catchLL 
(LL 
	ExceptionLL 
exLL 
)LL  
{MM 
returnNN 
ResultNN 
<NN 
objectNN $
>NN$ %
.NN% &
FailureNN& -
(NN- .
exNN. 0
.NN0 1
MessageNN1 8
)NN8 9
;NN9 :
}OO 
}PP 	
publicRR 
asyncRR 
TaskRR 
DeleteAsyncRR %
(RR% &
GuidRR& *

businessIdRR+ 5
)RR5 6
{SS 	
varTT 
businessTT 
=TT 
awaitTT  
contextTT! (
.TT( )

BusinessesTT) 3
.TT3 4
	FindAsyncTT4 =
(TT= >

businessIdTT> H
)TTH I
;TTI J
ifUU 
(UU 
businessUU 
==UU 
nullUU  
)UU  !
{VV 
throwWW 
newWW  
KeyNotFoundExceptionWW .
(WW. /
$strWW/ C
)WWC D
;WWD E
}XX 
contextZZ 
.ZZ 

BusinessesZZ 
.ZZ 
RemoveZZ %
(ZZ% &
businessZZ& .
)ZZ. /
;ZZ/ 0
await[[ 
context[[ 
.[[ 
SaveChangesAsync[[ *
([[* +
)[[+ ,
;[[, -
}\\ 	
}__ 
}`` ä+
SD:\BuySmart\BuySmart\Infrastructure\Persistence\Configurations\UserConfiguration.cs
	namespace 	
Infrastructure
 
. 
Persistence $
.$ %
Configurations% 3
{ 
public 

static 
class 
UserConfiguration )
{ 
private

 
static

 
void

 
ConfigureBaseUser

 -
<

- .
TUser

. 3
>

3 4
(

4 5
EntityTypeBuilder

5 F
<

F G
TUser

G L
>

L M
entity

N T
)

T U
where

V [
TUser

\ a
:

b c
User

d h
{ 	
entity 
. 
HasBaseType 
< 
User #
># $
($ %
)% &
;& '
entity 
. 
Property 
( 
e 
=>  
e! "
." #
UserId# )
)) *
. 
HasColumnType 
( 
$str %
)% &
. 
HasDefaultValueSql #
(# $
$str$ 8
)8 9
. 
ValueGeneratedOnAdd $
($ %
)% &
;& '
entity 
. 
Property 
( 
e 
=>  
e! "
." #
Name# '
)' (
. 

IsRequired 
( 
) 
. 
HasMaxLength 
( 
$num !
)! "
;" #
entity 
. 
Property 
( 
e 
=>  
e! "
." #
Email# (
)( )
. 

IsRequired 
( 
) 
. 
HasMaxLength 
( 
$num !
)! "
;" #
entity 
. 
Property 
( 
e 
=>  
e! "
." #
Password# +
)+ ,
. 

IsRequired 
( 
) 
. 
HasMaxLength 
( 
$num !
)! "
;" #
entity 
. 
Property 
( 
e 
=>  
e! "
." #
UserType# +
)+ ,
. 

IsRequired 
( 
) 
; 
entity 
. 
Property 
( 
e 
=>  
e! "
." #
Image# (
)( )
. 
HasMaxLength 
( 
$num !
)! "
;" #
} 	
public!! 
static!! 
void!! 
ConfigureUserClient!! .
(!!. /
this!!/ 3
ModelBuilder!!4 @
modelBuilder!!A M
)!!M N
{"" 	
modelBuilder## 
.## 
Entity## 
<##  

UserClient##  *
>##* +
(##+ ,
entity##, 2
=>##3 5
{$$ 
ConfigureBaseUser%% !
(%%! "
entity%%" (
)%%( )
;%%) *
entity'' 
.'' 
ToTable'' 
('' 
$str'' ,
)'', -
;''- .
entity** 
.** 
HasMany** 
(** 
uc** !
=>**" $
uc**% '
.**' (
Orders**( .
)**. /
.++ 
WithOne++ 
(++ 
o++ 
=>++ !
o++" #
.++# $

UserClient++$ .
)++. /
.,, 
HasForeignKey,, "
(,," #
o,,# $
=>,,% '
o,,( )
.,,) *
UserClientId,,* 6
),,6 7
.-- 
OnDelete-- 
(-- 
DeleteBehavior-- ,
.--, -
Cascade--- 4
)--4 5
;--5 6
}.. 
).. 
;.. 
}// 	
public22 
static22 
void22 !
ConfigureUserBusiness22 0
(220 1
this221 5
ModelBuilder226 B
modelBuilder22C O
)22O P
{33 	
modelBuilder44 
.44 
Entity44 
<44  
UserBusiness44  ,
>44, -
(44- .
entity44. 4
=>445 7
{55 
ConfigureBaseUser66 !
(66! "
entity66" (
)66( )
;66) *
entity88 
.88 
ToTable88 
(88 
$str88 /
)88/ 0
;880 1
entity;; 
.;; 
HasOne;; 
(;; 
ub;;  
=>;;! #
ub;;$ &
.;;& '
Business;;' /
);;/ 0
.<< 
WithOne<< 
(<< 
b<< 
=><< !
b<<" #
.<<# $
UserBusiness<<$ 0
)<<0 1
.== 
HasForeignKey== "
<==" #
Business==# +
>==+ ,
(==, -
b==- .
=>==/ 1
b==2 3
.==3 4
UserBusinessId==4 B
)==B C
.>> 
OnDelete>> 
(>> 
DeleteBehavior>> ,
.>>, -
Cascade>>- 4
)>>4 5
;>>5 6
}?? 
)?? 
;?? 
}@@ 	
}AA 
}BB ˇ
VD:\BuySmart\BuySmart\Infrastructure\Persistence\Configurations\ProductConfiguration.cs
	namespace 	
Infrastructure
 
. 
Persistence $
.$ %
Configurations% 3
{ 
public 

static 
class  
ProductConfiguration ,
{ 
public 
static 
void 
ConfigureProduct +
(+ ,
this, 0
ModelBuilder1 =
modelBuilder> J
)J K
{		 	
modelBuilder

 
.

 
Entity

 
<

  
Product

  '
>

' (
(

( )
entity

) /
=>

0 2
{ 
entity 
. 
ToTable 
( 
$str )
)) *
;* +
entity 
. 
HasKey 
( 
e 
=>  "
e# $
.$ %
	ProductId% .
). /
;/ 0
entity 
. 
Property 
(  
e  !
=>" $
e% &
.& '
	ProductId' 0
)0 1
. 
HasColumnType "
(" #
$str# )
)) *
. 
HasDefaultValueSql '
(' (
$str( <
)< =
. 
ValueGeneratedOnAdd (
(( )
)) *
;* +
entity 
. 
Property 
(  
e  !
=>" $
e% &
.& '
Name' +
)+ ,
. 

IsRequired 
(  
)  !
. 
HasMaxLength !
(! "
$num" %
)% &
;& '
entity 
. 
Property 
(  
e  !
=>" $
e% &
.& '
Description' 2
)2 3
. 

IsRequired 
(  
)  !
. 
HasMaxLength !
(! "
$num" &
)& '
;' (
entity 
. 
Property 
(  
e  !
=>" $
e% &
.& '
Price' ,
), -
. 

IsRequired 
(  
)  !
. 
HasColumnType "
(" #
$str# 2
)2 3
;3 4
entity 
. 
Property 
(  
e  !
=>" $
e% &
.& '
Stock' ,
), -
.- .

IsRequired. 8
(8 9
)9 :
;: ;
entity 
. 
Property 
(  
e  !
=>" $
e% &
.& '
Rating' -
)- .
.. /

IsRequired/ 9
(9 :
): ;
;; <
entity 
. 
Property 
(  
e  !
=>" $
e% &
.& '
Image' ,
), -
. 

IsRequired 
(  
)  !
. 
HasMaxLength !
(! "
$num" %
)% &
;& '
entity!! 
.!! 
HasMany!! 
(!! 
e!!  
=>!!! #
e!!$ %
.!!% &

Categories!!& 0
)!!0 1
."" 
WithMany"" 
("" 
p"" 
=>""  "
p""# $
.""$ %
Products""% -
)""- .
.## 
UsingEntity##  
(##  !
j##! "
=>### %
j##& '
.##' (
ToTable##( /
(##/ 0
$str##0 C
)##C D
)##D E
;##E F
}$$ 
)$$ 
;$$ 
}%% 	
}&& 
}'' Å
GD:\BuySmart\BuySmart\Infrastructure\Persistence\ApplicationDbContext.cs
	namespace 	
Infrastructure
 
. 
Persistence $
{ 
public 

class  
ApplicationDbContext %
:& '
	DbContext( 1
{ 
public		  
ApplicationDbContext		 #
(		# $
DbContextOptions		$ 4
<		4 5 
ApplicationDbContext		5 I
>		I J
options		K R
)		R S
:		T U
base		V Z
(		Z [
options		[ b
)		b c
{		d e
}		f g
public 
DbSet 
< 
Product 
> 
Products &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
public 
DbSet 
< 
Category 
> 

Categories )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
public 
DbSet 
< 
Cart 
> 
Carts  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
DbSet 
< 
User 
> 
Users  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
DbSet 
< 
	OrderItem 
> 

OrderItems  *
{+ ,
get- 0
;0 1
set2 5
;5 6
}7 8
public 
DbSet 
< 
Review 
> 
Reviews $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 
DbSet 
< 
Business 
> 

Businesses )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
public 
DbSet 
< 
Order 
> 
Orders "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
DbSet 
< 
Recommendation #
># $
Recommendations% 4
{5 6
get7 :
;: ;
set< ?
;? @
}A B
public 
DbSet 
< 
History 
> 
	Histories '
{( )
get* -
;- .
set/ 2
;2 3
}4 5
public 
DbSet 
< 
UserBusiness !
>! "
UserBusinesses# 1
{2 3
get4 7
;7 8
set9 <
;< =
}> ?
public 
DbSet 
< 

UserClient 
>  
UserClients! ,
{- .
get/ 2
;2 3
set4 7
;7 8
}9 :
	protected 
override 
void 
OnModelCreating  /
(/ 0
ModelBuilder0 <
modelBuilder= I
)I J
{ 	
modelBuilder 
.  
HasPostgresExtension -
(- .
$str. 9
)9 :
;: ;
modelBuilder 
. 
ConfigureUserClient ,
(, -
)- .
;. /
modelBuilder 
. !
ConfigureUserBusiness .
(. /
)/ 0
;0 1
modelBuilder 
. 
ConfigureProduct )
() *
)* +
;+ ,
base!! 
.!! 
OnModelCreating!!  
(!!  !
modelBuilder!!! -
)!!- .
;!!. /
}"" 	
}## 
}$$ ‘í
ND:\BuySmart\BuySmart\Infrastructure\Migrations\20241201140636_InitialCreate.cs
	namespace 	
Infrastructure
 
. 

Migrations #
{ 
public		 

partial		 
class		 
InitialCreate		 &
:		' (
	Migration		) 2
{

 
	protected 
override 
void 
Up  "
(" #
MigrationBuilder# 3
migrationBuilder4 D
)D E
{ 	
migrationBuilder 
. 
AlterDatabase *
(* +
)+ ,
. 

Annotation 
( 
$str @
,@ A
$strB F
)F G
;G H
migrationBuilder 
. 
CreateTable (
(( )
name 
: 
$str "
," #
columns 
: 
table 
=> !
new" %
{ 

CategoryId 
=  
table! &
.& '
Column' -
<- .
Guid. 2
>2 3
(3 4
type4 8
:8 9
$str: @
,@ A
nullableB J
:J K
falseL Q
,Q R
defaultValueSqlS b
:b c
$strd x
)x y
,y z
Name 
= 
table  
.  !
Column! '
<' (
string( .
>. /
(/ 0
type0 4
:4 5
$str6 N
,N O
	maxLengthP Y
:Y Z
$num[ ^
,^ _
nullable` h
:h i
falsej o
)o p
,p q
Description 
=  !
table" '
.' (
Column( .
<. /
string/ 5
>5 6
(6 7
type7 ;
:; <
$str= V
,V W
	maxLengthX a
:a b
$numc g
,g h
nullablei q
:q r
falses x
)x y
} 
, 
constraints 
: 
table "
=># %
{ 
table 
. 

PrimaryKey $
($ %
$str% 4
,4 5
x6 7
=>8 :
x; <
.< =

CategoryId= G
)G H
;H I
} 
) 
; 
migrationBuilder 
. 
CreateTable (
(( )
name 
: 
$str 
, 
columns   
:   
table   
=>   !
new  " %
{!! 
UserId"" 
="" 
table"" "
.""" #
Column""# )
<"") *
Guid""* .
>"". /
(""/ 0
type""0 4
:""4 5
$str""6 <
,""< =
nullable""> F
:""F G
false""H M
,""M N
defaultValueSql""O ^
:""^ _
$str""` t
)""t u
,""u v
Name## 
=## 
table##  
.##  !
Column##! '
<##' (
string##( .
>##. /
(##/ 0
type##0 4
:##4 5
$str##6 N
,##N O
	maxLength##P Y
:##Y Z
$num##[ ^
,##^ _
nullable##` h
:##h i
false##j o
)##o p
,##p q
Email$$ 
=$$ 
table$$ !
.$$! "
Column$$" (
<$$( )
string$$) /
>$$/ 0
($$0 1
type$$1 5
:$$5 6
$str$$7 O
,$$O P
	maxLength$$Q Z
:$$Z [
$num$$\ _
,$$_ `
nullable$$a i
:$$i j
false$$k p
)$$p q
,$$q r
Password%% 
=%% 
table%% $
.%%$ %
Column%%% +
<%%+ ,
string%%, 2
>%%2 3
(%%3 4
type%%4 8
:%%8 9
$str%%: R
,%%R S
	maxLength%%T ]
:%%] ^
$num%%_ b
,%%b c
nullable%%d l
:%%l m
false%%n s
)%%s t
,%%t u
UserType&& 
=&& 
table&& $
.&&$ %
Column&&% +
<&&+ ,
int&&, /
>&&/ 0
(&&0 1
type&&1 5
:&&5 6
$str&&7 @
,&&@ A
nullable&&B J
:&&J K
false&&L Q
)&&Q R
,&&R S
Image'' 
='' 
table'' !
.''! "
Column''" (
<''( )
string'') /
>''/ 0
(''0 1
type''1 5
:''5 6
$str''7 O
,''O P
	maxLength''Q Z
:''Z [
$num''\ _
,''_ `
nullable''a i
:''i j
false''k p
)''p q
}(( 
,(( 
constraints)) 
:)) 
table)) "
=>))# %
{** 
table++ 
.++ 

PrimaryKey++ $
(++$ %
$str++% /
,++/ 0
x++1 2
=>++3 5
x++6 7
.++7 8
UserId++8 >
)++> ?
;++? @
},, 
),, 
;,, 
migrationBuilder.. 
... 
CreateTable.. (
(..( )
name// 
:// 
$str// &
,//& '
columns00 
:00 
table00 
=>00 !
new00" %
{11 
UserId22 
=22 
table22 "
.22" #
Column22# )
<22) *
Guid22* .
>22. /
(22/ 0
type220 4
:224 5
$str226 <
,22< =
nullable22> F
:22F G
false22H M
,22M N
defaultValueSql22O ^
:22^ _
$str22` t
)22t u
}33 
,33 
constraints44 
:44 
table44 "
=>44# %
{55 
table66 
.66 

PrimaryKey66 $
(66$ %
$str66% 8
,668 9
x66: ;
=>66< >
x66? @
.66@ A
UserId66A G
)66G H
;66H I
table77 
.77 

ForeignKey77 $
(77$ %
name88 
:88 
$str88 >
,88> ?
column99 
:99 
x99  !
=>99" $
x99% &
.99& '
UserId99' -
,99- .
principalTable:: &
:::& '
$str::( /
,::/ 0
principalColumn;; '
:;;' (
$str;;) 1
,;;1 2
onDelete<<  
:<<  !
ReferentialAction<<" 3
.<<3 4
Cascade<<4 ;
)<<; <
;<<< =
}== 
)== 
;== 
migrationBuilder?? 
.?? 
CreateTable?? (
(??( )
name@@ 
:@@ 
$str@@ #
,@@# $
columnsAA 
:AA 
tableAA 
=>AA !
newAA" %
{BB 
UserIdCC 
=CC 
tableCC "
.CC" #
ColumnCC# )
<CC) *
GuidCC* .
>CC. /
(CC/ 0
typeCC0 4
:CC4 5
$strCC6 <
,CC< =
nullableCC> F
:CCF G
falseCCH M
,CCM N
defaultValueSqlCCO ^
:CC^ _
$strCC` t
)CCt u
}DD 
,DD 
constraintsEE 
:EE 
tableEE "
=>EE# %
{FF 
tableGG 
.GG 

PrimaryKeyGG $
(GG$ %
$strGG% 5
,GG5 6
xGG7 8
=>GG9 ;
xGG< =
.GG= >
UserIdGG> D
)GGD E
;GGE F
tableHH 
.HH 

ForeignKeyHH $
(HH$ %
nameII 
:II 
$strII ;
,II; <
columnJJ 
:JJ 
xJJ  !
=>JJ" $
xJJ% &
.JJ& '
UserIdJJ' -
,JJ- .
principalTableKK &
:KK& '
$strKK( /
,KK/ 0
principalColumnLL '
:LL' (
$strLL) 1
,LL1 2
onDeleteMM  
:MM  !
ReferentialActionMM" 3
.MM3 4
CascadeMM4 ;
)MM; <
;MM< =
}NN 
)NN 
;NN 
migrationBuilderPP 
.PP 
CreateTablePP (
(PP( )
nameQQ 
:QQ 
$strQQ "
,QQ" #
columnsRR 
:RR 
tableRR 
=>RR !
newRR" %
{SS 

BusinessIDTT 
=TT  
tableTT! &
.TT& '
ColumnTT' -
<TT- .
GuidTT. 2
>TT2 3
(TT3 4
typeTT4 8
:TT8 9
$strTT: @
,TT@ A
nullableTTB J
:TTJ K
falseTTL Q
)TTQ R
,TTR S
NameUU 
=UU 
tableUU  
.UU  !
ColumnUU! '
<UU' (
stringUU( .
>UU. /
(UU/ 0
typeUU0 4
:UU4 5
$strUU6 N
,UUN O
	maxLengthUUP Y
:UUY Z
$numUU[ ^
,UU^ _
nullableUU` h
:UUh i
falseUUj o
)UUo p
,UUp q
DescriptionVV 
=VV  !
tableVV" '
.VV' (
ColumnVV( .
<VV. /
stringVV/ 5
>VV5 6
(VV6 7
typeVV7 ;
:VV; <
$strVV= U
,VVU V
	maxLengthVVW `
:VV` a
$numVVb e
,VVe f
nullableVVg o
:VVo p
falseVVq v
)VVv w
,VVw x
AddressWW 
=WW 
tableWW #
.WW# $
ColumnWW$ *
<WW* +
stringWW+ 1
>WW1 2
(WW2 3
typeWW3 7
:WW7 8
$strWW9 Q
,WWQ R
	maxLengthWWS \
:WW\ ]
$numWW^ a
,WWa b
nullableWWc k
:WWk l
falseWWm r
)WWr s
,WWs t
PhoneNumberXX 
=XX  !
tableXX" '
.XX' (
ColumnXX( .
<XX. /
stringXX/ 5
>XX5 6
(XX6 7
typeXX7 ;
:XX; <
$strXX= T
,XXT U
	maxLengthXXV _
:XX_ `
$numXXa c
,XXc d
nullableXXe m
:XXm n
falseXXo t
)XXt u
,XXu v
UserBusinessIdYY "
=YY# $
tableYY% *
.YY* +
ColumnYY+ 1
<YY1 2
GuidYY2 6
>YY6 7
(YY7 8
typeYY8 <
:YY< =
$strYY> D
,YYD E
nullableYYF N
:YYN O
falseYYP U
)YYU V
}ZZ 
,ZZ 
constraints[[ 
:[[ 
table[[ "
=>[[# %
{\\ 
table]] 
.]] 

PrimaryKey]] $
(]]$ %
$str]]% 4
,]]4 5
x]]6 7
=>]]8 :
x]]; <
.]]< =

BusinessID]]= G
)]]G H
;]]H I
table^^ 
.^^ 

ForeignKey^^ $
(^^$ %
name__ 
:__ 
$str__ K
,__K L
column`` 
:`` 
x``  !
=>``" $
x``% &
.``& '
UserBusinessId``' 5
,``5 6
principalTableaa &
:aa& '
$straa( 8
,aa8 9
principalColumnbb '
:bb' (
$strbb) 1
,bb1 2
onDeletecc  
:cc  !
ReferentialActioncc" 3
.cc3 4
Cascadecc4 ;
)cc; <
;cc< =
}dd 
)dd 
;dd 
migrationBuilderff 
.ff 
CreateTableff (
(ff( )
namegg 
:gg 
$strgg 
,gg 
columnshh 
:hh 
tablehh 
=>hh !
newhh" %
{ii 
CartIdjj 
=jj 
tablejj "
.jj" #
Columnjj# )
<jj) *
Guidjj* .
>jj. /
(jj/ 0
typejj0 4
:jj4 5
$strjj6 <
,jj< =
nullablejj> F
:jjF G
falsejjH M
,jjM N
defaultValueSqljjO ^
:jj^ _
$strjj` t
)jjt u
,jju v
UserClientIdkk  
=kk! "
tablekk# (
.kk( )
Columnkk) /
<kk/ 0
Guidkk0 4
>kk4 5
(kk5 6
typekk6 :
:kk: ;
$strkk< B
,kkB C
nullablekkD L
:kkL M
falsekkN S
)kkS T
}ll 
,ll 
constraintsmm 
:mm 
tablemm "
=>mm# %
{nn 
tableoo 
.oo 

PrimaryKeyoo $
(oo$ %
$stroo% /
,oo/ 0
xoo1 2
=>oo3 5
xoo6 7
.oo7 8
CartIdoo8 >
)oo> ?
;oo? @
tablepp 
.pp 

ForeignKeypp $
(pp$ %
nameqq 
:qq 
$strqq A
,qqA B
columnrr 
:rr 
xrr  !
=>rr" $
xrr% &
.rr& '
UserClientIdrr' 3
,rr3 4
principalTabless &
:ss& '
$strss( 5
,ss5 6
principalColumntt '
:tt' (
$strtt) 1
,tt1 2
onDeleteuu  
:uu  !
ReferentialActionuu" 3
.uu3 4
Cascadeuu4 ;
)uu; <
;uu< =
}vv 
)vv 
;vv 
migrationBuilderxx 
.xx 
CreateTablexx (
(xx( )
nameyy 
:yy 
$stryy 
,yy 
columnszz 
:zz 
tablezz 
=>zz !
newzz" %
{{{ 
OrderId|| 
=|| 
table|| #
.||# $
Column||$ *
<||* +
Guid||+ /
>||/ 0
(||0 1
type||1 5
:||5 6
$str||7 =
,||= >
nullable||? G
:||G H
false||I N
,||N O
defaultValueSql||P _
:||_ `
$str||a u
)||u v
,||v w
OrderStatus}} 
=}}  !
table}}" '
.}}' (
Column}}( .
<}}. /
int}}/ 2
>}}2 3
(}}3 4
type}}4 8
:}}8 9
$str}}: C
,}}C D
nullable}}E M
:}}M N
false}}O T
)}}T U
,}}U V

TotalPrice~~ 
=~~  
table~~! &
.~~& '
Column~~' -
<~~- .
double~~. 4
>~~4 5
(~~5 6
type~~6 :
:~~: ;
$str~~< K
,~~K L
nullable~~M U
:~~U V
false~~W \
)~~\ ]
,~~] ^
	OrderDate 
= 
table  %
.% &
Column& ,
<, -
DateTime- 5
>5 6
(6 7
type7 ;
:; <
$str= W
,W X
nullableY a
:a b
falsec h
)h i
,i j!
DeliveryPhoneNumber
ÄÄ '
=
ÄÄ( )
table
ÄÄ* /
.
ÄÄ/ 0
Column
ÄÄ0 6
<
ÄÄ6 7
string
ÄÄ7 =
>
ÄÄ= >
(
ÄÄ> ?
type
ÄÄ? C
:
ÄÄC D
$str
ÄÄE \
,
ÄÄ\ ]
	maxLength
ÄÄ^ g
:
ÄÄg h
$num
ÄÄi k
,
ÄÄk l
nullable
ÄÄm u
:
ÄÄu v
false
ÄÄw |
)
ÄÄ| }
,
ÄÄ} ~
PaymentMethod
ÅÅ !
=
ÅÅ" #
table
ÅÅ$ )
.
ÅÅ) *
Column
ÅÅ* 0
<
ÅÅ0 1
int
ÅÅ1 4
>
ÅÅ4 5
(
ÅÅ5 6
type
ÅÅ6 :
:
ÅÅ: ;
$str
ÅÅ< E
,
ÅÅE F
nullable
ÅÅG O
:
ÅÅO P
false
ÅÅQ V
)
ÅÅV W
,
ÅÅW X
DeliveryAddress
ÇÇ #
=
ÇÇ$ %
table
ÇÇ& +
.
ÇÇ+ ,
Column
ÇÇ, 2
<
ÇÇ2 3
string
ÇÇ3 9
>
ÇÇ9 :
(
ÇÇ: ;
type
ÇÇ; ?
:
ÇÇ? @
$str
ÇÇA Y
,
ÇÇY Z
	maxLength
ÇÇ[ d
:
ÇÇd e
$num
ÇÇf i
,
ÇÇi j
nullable
ÇÇk s
:
ÇÇs t
false
ÇÇu z
)
ÇÇz {
,
ÇÇ{ |
UserClientId
ÉÉ  
=
ÉÉ! "
table
ÉÉ# (
.
ÉÉ( )
Column
ÉÉ) /
<
ÉÉ/ 0
Guid
ÉÉ0 4
>
ÉÉ4 5
(
ÉÉ5 6
type
ÉÉ6 :
:
ÉÉ: ;
$str
ÉÉ< B
,
ÉÉB C
nullable
ÉÉD L
:
ÉÉL M
false
ÉÉN S
)
ÉÉS T
,
ÉÉT U

BusinessId
ÑÑ 
=
ÑÑ  
table
ÑÑ! &
.
ÑÑ& '
Column
ÑÑ' -
<
ÑÑ- .
Guid
ÑÑ. 2
>
ÑÑ2 3
(
ÑÑ3 4
type
ÑÑ4 8
:
ÑÑ8 9
$str
ÑÑ: @
,
ÑÑ@ A
nullable
ÑÑB J
:
ÑÑJ K
false
ÑÑL Q
)
ÑÑQ R
}
ÖÖ 
,
ÖÖ 
constraints
ÜÜ 
:
ÜÜ 
table
ÜÜ "
=>
ÜÜ# %
{
áá 
table
àà 
.
àà 

PrimaryKey
àà $
(
àà$ %
$str
àà% 0
,
àà0 1
x
àà2 3
=>
àà4 6
x
àà7 8
.
àà8 9
OrderId
àà9 @
)
àà@ A
;
ààA B
table
ââ 
.
ââ 

ForeignKey
ââ $
(
ââ$ %
name
ää 
:
ää 
$str
ää ?
,
ää? @
column
ãã 
:
ãã 
x
ãã  !
=>
ãã" $
x
ãã% &
.
ãã& '

BusinessId
ãã' 1
,
ãã1 2
principalTable
åå &
:
åå& '
$str
åå( 4
,
åå4 5
principalColumn
çç '
:
çç' (
$str
çç) 5
,
çç5 6
onDelete
éé  
:
éé  !
ReferentialAction
éé" 3
.
éé3 4
Cascade
éé4 ;
)
éé; <
;
éé< =
table
èè 
.
èè 

ForeignKey
èè $
(
èè$ %
name
êê 
:
êê 
$str
êê B
,
êêB C
column
ëë 
:
ëë 
x
ëë  !
=>
ëë" $
x
ëë% &
.
ëë& '
UserClientId
ëë' 3
,
ëë3 4
principalTable
íí &
:
íí& '
$str
íí( 5
,
íí5 6
principalColumn
ìì '
:
ìì' (
$str
ìì) 1
,
ìì1 2
onDelete
îî  
:
îî  !
ReferentialAction
îî" 3
.
îî3 4
Cascade
îî4 ;
)
îî; <
;
îî< =
}
ïï 
)
ïï 
;
ïï 
migrationBuilder
óó 
.
óó 
CreateTable
óó (
(
óó( )
name
òò 
:
òò 
$str
òò  
,
òò  !
columns
ôô 
:
ôô 
table
ôô 
=>
ôô !
new
ôô" %
{
öö 
	ProductId
õõ 
=
õõ 
table
õõ  %
.
õõ% &
Column
õõ& ,
<
õõ, -
Guid
õõ- 1
>
õõ1 2
(
õõ2 3
type
õõ3 7
:
õõ7 8
$str
õõ9 ?
,
õõ? @
nullable
õõA I
:
õõI J
false
õõK P
,
õõP Q
defaultValueSql
õõR a
:
õõa b
$str
õõc w
)
õõw x
,
õõx y
Name
úú 
=
úú 
table
úú  
.
úú  !
Column
úú! '
<
úú' (
string
úú( .
>
úú. /
(
úú/ 0
type
úú0 4
:
úú4 5
$str
úú6 N
,
úúN O
	maxLength
úúP Y
:
úúY Z
$num
úú[ ^
,
úú^ _
nullable
úú` h
:
úúh i
false
úúj o
)
úúo p
,
úúp q
Description
ùù 
=
ùù  !
table
ùù" '
.
ùù' (
Column
ùù( .
<
ùù. /
string
ùù/ 5
>
ùù5 6
(
ùù6 7
type
ùù7 ;
:
ùù; <
$str
ùù= V
,
ùùV W
	maxLength
ùùX a
:
ùùa b
$num
ùùc g
,
ùùg h
nullable
ùùi q
:
ùùq r
false
ùùs x
)
ùùx y
,
ùùy z
Price
ûû 
=
ûû 
table
ûû !
.
ûû! "
Column
ûû" (
<
ûû( )
decimal
ûû) 0
>
ûû0 1
(
ûû1 2
type
ûû2 6
:
ûû6 7
$str
ûû8 G
,
ûûG H
nullable
ûûI Q
:
ûûQ R
false
ûûS X
)
ûûX Y
,
ûûY Z
Stock
üü 
=
üü 
table
üü !
.
üü! "
Column
üü" (
<
üü( )
double
üü) /
>
üü/ 0
(
üü0 1
type
üü1 5
:
üü5 6
$str
üü7 I
,
üüI J
nullable
üüK S
:
üüS T
false
üüU Z
)
üüZ [
,
üü[ \
Rating
†† 
=
†† 
table
†† "
.
††" #
Column
††# )
<
††) *
double
††* 0
>
††0 1
(
††1 2
type
††2 6
:
††6 7
$str
††8 J
,
††J K
nullable
††L T
:
††T U
false
††V [
)
††[ \
,
††\ ]
Image
°° 
=
°° 
table
°° !
.
°°! "
Column
°°" (
<
°°( )
string
°°) /
>
°°/ 0
(
°°0 1
type
°°1 5
:
°°5 6
$str
°°7 O
,
°°O P
	maxLength
°°Q Z
:
°°Z [
$num
°°\ _
,
°°_ `
nullable
°°a i
:
°°i j
false
°°k p
)
°°p q
,
°°q r

BusinessId
¢¢ 
=
¢¢  
table
¢¢! &
.
¢¢& '
Column
¢¢' -
<
¢¢- .
Guid
¢¢. 2
>
¢¢2 3
(
¢¢3 4
type
¢¢4 8
:
¢¢8 9
$str
¢¢: @
,
¢¢@ A
nullable
¢¢B J
:
¢¢J K
false
¢¢L Q
)
¢¢Q R
}
££ 
,
££ 
constraints
§§ 
:
§§ 
table
§§ "
=>
§§# %
{
•• 
table
¶¶ 
.
¶¶ 

PrimaryKey
¶¶ $
(
¶¶$ %
$str
¶¶% 2
,
¶¶2 3
x
¶¶4 5
=>
¶¶6 8
x
¶¶9 :
.
¶¶: ;
	ProductId
¶¶; D
)
¶¶D E
;
¶¶E F
table
ßß 
.
ßß 

ForeignKey
ßß $
(
ßß$ %
name
®® 
:
®® 
$str
®® A
,
®®A B
column
©© 
:
©© 
x
©©  !
=>
©©" $
x
©©% &
.
©©& '

BusinessId
©©' 1
,
©©1 2
principalTable
™™ &
:
™™& '
$str
™™( 4
,
™™4 5
principalColumn
´´ '
:
´´' (
$str
´´) 5
,
´´5 6
onDelete
¨¨  
:
¨¨  !
ReferentialAction
¨¨" 3
.
¨¨3 4
Cascade
¨¨4 ;
)
¨¨; <
;
¨¨< =
}
≠≠ 
)
≠≠ 
;
≠≠ 
migrationBuilder
ØØ 
.
ØØ 
CreateTable
ØØ (
(
ØØ( )
name
∞∞ 
:
∞∞ 
$str
∞∞ !
,
∞∞! "
columns
±± 
:
±± 
table
±± 
=>
±± !
new
±±" %
{
≤≤ 
	HistoryId
≥≥ 
=
≥≥ 
table
≥≥  %
.
≥≥% &
Column
≥≥& ,
<
≥≥, -
Guid
≥≥- 1
>
≥≥1 2
(
≥≥2 3
type
≥≥3 7
:
≥≥7 8
$str
≥≥9 ?
,
≥≥? @
nullable
≥≥A I
:
≥≥I J
false
≥≥K P
,
≥≥P Q
defaultValueSql
≥≥R a
:
≥≥a b
$str
≥≥c w
)
≥≥w x
,
≥≥x y
UserClientId
¥¥  
=
¥¥! "
table
¥¥# (
.
¥¥( )
Column
¥¥) /
<
¥¥/ 0
Guid
¥¥0 4
>
¥¥4 5
(
¥¥5 6
type
¥¥6 :
:
¥¥: ;
$str
¥¥< B
,
¥¥B C
nullable
¥¥D L
:
¥¥L M
false
¥¥N S
)
¥¥S T
,
¥¥T U
	ProductId
µµ 
=
µµ 
table
µµ  %
.
µµ% &
Column
µµ& ,
<
µµ, -
Guid
µµ- 1
>
µµ1 2
(
µµ2 3
type
µµ3 7
:
µµ7 8
$str
µµ9 ?
,
µµ? @
nullable
µµA I
:
µµI J
false
µµK P
)
µµP Q
,
µµQ R
	AccesDate
∂∂ 
=
∂∂ 
table
∂∂  %
.
∂∂% &
Column
∂∂& ,
<
∂∂, -
DateTime
∂∂- 5
>
∂∂5 6
(
∂∂6 7
type
∂∂7 ;
:
∂∂; <
$str
∂∂= W
,
∂∂W X
nullable
∂∂Y a
:
∂∂a b
false
∂∂c h
)
∂∂h i
}
∑∑ 
,
∑∑ 
constraints
∏∏ 
:
∏∏ 
table
∏∏ "
=>
∏∏# %
{
ππ 
table
∫∫ 
.
∫∫ 

PrimaryKey
∫∫ $
(
∫∫$ %
$str
∫∫% 3
,
∫∫3 4
x
∫∫5 6
=>
∫∫7 9
x
∫∫: ;
.
∫∫; <
	HistoryId
∫∫< E
)
∫∫E F
;
∫∫F G
table
ªª 
.
ªª 

ForeignKey
ªª $
(
ªª$ %
name
ºº 
:
ºº 
$str
ºº ?
,
ºº? @
column
ΩΩ 
:
ΩΩ 
x
ΩΩ  !
=>
ΩΩ" $
x
ΩΩ% &
.
ΩΩ& '
	ProductId
ΩΩ' 0
,
ΩΩ0 1
principalTable
ææ &
:
ææ& '
$str
ææ( 2
,
ææ2 3
principalColumn
øø '
:
øø' (
$str
øø) 4
,
øø4 5
onDelete
¿¿  
:
¿¿  !
ReferentialAction
¿¿" 3
.
¿¿3 4
Cascade
¿¿4 ;
)
¿¿; <
;
¿¿< =
table
¡¡ 
.
¡¡ 

ForeignKey
¡¡ $
(
¡¡$ %
name
¬¬ 
:
¬¬ 
$str
¬¬ E
,
¬¬E F
column
√√ 
:
√√ 
x
√√  !
=>
√√" $
x
√√% &
.
√√& '
UserClientId
√√' 3
,
√√3 4
principalTable
ƒƒ &
:
ƒƒ& '
$str
ƒƒ( 5
,
ƒƒ5 6
principalColumn
≈≈ '
:
≈≈' (
$str
≈≈) 1
,
≈≈1 2
onDelete
∆∆  
:
∆∆  !
ReferentialAction
∆∆" 3
.
∆∆3 4
Cascade
∆∆4 ;
)
∆∆; <
;
∆∆< =
}
«« 
)
«« 
;
«« 
migrationBuilder
…… 
.
…… 
CreateTable
…… (
(
……( )
name
   
:
   
$str
   "
,
  " #
columns
ÀÀ 
:
ÀÀ 
table
ÀÀ 
=>
ÀÀ !
new
ÀÀ" %
{
ÃÃ 
OrderItemId
ÕÕ 
=
ÕÕ  !
table
ÕÕ" '
.
ÕÕ' (
Column
ÕÕ( .
<
ÕÕ. /
Guid
ÕÕ/ 3
>
ÕÕ3 4
(
ÕÕ4 5
type
ÕÕ5 9
:
ÕÕ9 :
$str
ÕÕ; A
,
ÕÕA B
nullable
ÕÕC K
:
ÕÕK L
false
ÕÕM R
,
ÕÕR S
defaultValueSql
ÕÕT c
:
ÕÕc d
$str
ÕÕe y
)
ÕÕy z
,
ÕÕz {
OrderId
ŒŒ 
=
ŒŒ 
table
ŒŒ #
.
ŒŒ# $
Column
ŒŒ$ *
<
ŒŒ* +
Guid
ŒŒ+ /
>
ŒŒ/ 0
(
ŒŒ0 1
type
ŒŒ1 5
:
ŒŒ5 6
$str
ŒŒ7 =
,
ŒŒ= >
nullable
ŒŒ? G
:
ŒŒG H
false
ŒŒI N
)
ŒŒN O
,
ŒŒO P
CartId
œœ 
=
œœ 
table
œœ "
.
œœ" #
Column
œœ# )
<
œœ) *
Guid
œœ* .
>
œœ. /
(
œœ/ 0
type
œœ0 4
:
œœ4 5
$str
œœ6 <
,
œœ< =
nullable
œœ> F
:
œœF G
false
œœH M
)
œœM N
,
œœN O
	ProductId
–– 
=
–– 
table
––  %
.
––% &
Column
––& ,
<
––, -
Guid
––- 1
>
––1 2
(
––2 3
type
––3 7
:
––7 8
$str
––9 ?
,
––? @
nullable
––A I
:
––I J
false
––K P
)
––P Q
,
––Q R
Quantity
—— 
=
—— 
table
—— $
.
——$ %
Column
——% +
<
——+ ,
double
——, 2
>
——2 3
(
——3 4
type
——4 8
:
——8 9
$str
——: L
,
——L M
nullable
——N V
:
——V W
false
——X ]
)
——] ^
,
——^ _
Price
““ 
=
““ 
table
““ !
.
““! "
Column
““" (
<
““( )
double
““) /
>
““/ 0
(
““0 1
type
““1 5
:
““5 6
$str
““7 F
,
““F G
nullable
““H P
:
““P Q
false
““R W
)
““W X
}
”” 
,
”” 
constraints
‘‘ 
:
‘‘ 
table
‘‘ "
=>
‘‘# %
{
’’ 
table
÷÷ 
.
÷÷ 

PrimaryKey
÷÷ $
(
÷÷$ %
$str
÷÷% 4
,
÷÷4 5
x
÷÷6 7
=>
÷÷8 :
x
÷÷; <
.
÷÷< =
OrderItemId
÷÷= H
)
÷÷H I
;
÷÷I J
table
◊◊ 
.
◊◊ 

ForeignKey
◊◊ $
(
◊◊$ %
name
ÿÿ 
:
ÿÿ 
$str
ÿÿ :
,
ÿÿ: ;
column
ŸŸ 
:
ŸŸ 
x
ŸŸ  !
=>
ŸŸ" $
x
ŸŸ% &
.
ŸŸ& '
CartId
ŸŸ' -
,
ŸŸ- .
principalTable
⁄⁄ &
:
⁄⁄& '
$str
⁄⁄( /
,
⁄⁄/ 0
principalColumn
€€ '
:
€€' (
$str
€€) 1
,
€€1 2
onDelete
‹‹  
:
‹‹  !
ReferentialAction
‹‹" 3
.
‹‹3 4
Cascade
‹‹4 ;
)
‹‹; <
;
‹‹< =
table
›› 
.
›› 

ForeignKey
›› $
(
››$ %
name
ﬁﬁ 
:
ﬁﬁ 
$str
ﬁﬁ <
,
ﬁﬁ< =
column
ﬂﬂ 
:
ﬂﬂ 
x
ﬂﬂ  !
=>
ﬂﬂ" $
x
ﬂﬂ% &
.
ﬂﬂ& '
OrderId
ﬂﬂ' .
,
ﬂﬂ. /
principalTable
‡‡ &
:
‡‡& '
$str
‡‡( 0
,
‡‡0 1
principalColumn
·· '
:
··' (
$str
··) 2
,
··2 3
onDelete
‚‚  
:
‚‚  !
ReferentialAction
‚‚" 3
.
‚‚3 4
Cascade
‚‚4 ;
)
‚‚; <
;
‚‚< =
table
„„ 
.
„„ 

ForeignKey
„„ $
(
„„$ %
name
‰‰ 
:
‰‰ 
$str
‰‰ @
,
‰‰@ A
column
ÂÂ 
:
ÂÂ 
x
ÂÂ  !
=>
ÂÂ" $
x
ÂÂ% &
.
ÂÂ& '
	ProductId
ÂÂ' 0
,
ÂÂ0 1
principalTable
ÊÊ &
:
ÊÊ& '
$str
ÊÊ( 2
,
ÊÊ2 3
principalColumn
ÁÁ '
:
ÁÁ' (
$str
ÁÁ) 4
,
ÁÁ4 5
onDelete
ËË  
:
ËË  !
ReferentialAction
ËË" 3
.
ËË3 4
Cascade
ËË4 ;
)
ËË; <
;
ËË< =
}
ÈÈ 
)
ÈÈ 
;
ÈÈ 
migrationBuilder
ÎÎ 
.
ÎÎ 
CreateTable
ÎÎ (
(
ÎÎ( )
name
ÏÏ 
:
ÏÏ 
$str
ÏÏ )
,
ÏÏ) *
columns
ÌÌ 
:
ÌÌ 
table
ÌÌ 
=>
ÌÌ !
new
ÌÌ" %
{
ÓÓ "
CategoriesCategoryId
ÔÔ (
=
ÔÔ) *
table
ÔÔ+ 0
.
ÔÔ0 1
Column
ÔÔ1 7
<
ÔÔ7 8
Guid
ÔÔ8 <
>
ÔÔ< =
(
ÔÔ= >
type
ÔÔ> B
:
ÔÔB C
$str
ÔÔD J
,
ÔÔJ K
nullable
ÔÔL T
:
ÔÔT U
false
ÔÔV [
)
ÔÔ[ \
,
ÔÔ\ ]
ProductsProductId
 %
=
& '
table
( -
.
- .
Column
. 4
<
4 5
Guid
5 9
>
9 :
(
: ;
type
; ?
:
? @
$str
A G
,
G H
nullable
I Q
:
Q R
false
S X
)
X Y
}
ÒÒ 
,
ÒÒ 
constraints
ÚÚ 
:
ÚÚ 
table
ÚÚ "
=>
ÚÚ# %
{
ÛÛ 
table
ÙÙ 
.
ÙÙ 

PrimaryKey
ÙÙ $
(
ÙÙ$ %
$str
ÙÙ% ;
,
ÙÙ; <
x
ÙÙ= >
=>
ÙÙ? A
new
ÙÙB E
{
ÙÙF G
x
ÙÙH I
.
ÙÙI J"
CategoriesCategoryId
ÙÙJ ^
,
ÙÙ^ _
x
ÙÙ` a
.
ÙÙa b
ProductsProductId
ÙÙb s
}
ÙÙt u
)
ÙÙu v
;
ÙÙv w
table
ıı 
.
ıı 

ForeignKey
ıı $
(
ıı$ %
name
ˆˆ 
:
ˆˆ 
$str
ˆˆ T
,
ˆˆT U
column
˜˜ 
:
˜˜ 
x
˜˜  !
=>
˜˜" $
x
˜˜% &
.
˜˜& '"
CategoriesCategoryId
˜˜' ;
,
˜˜; <
principalTable
¯¯ &
:
¯¯& '
$str
¯¯( 4
,
¯¯4 5
principalColumn
˘˘ '
:
˘˘' (
$str
˘˘) 5
,
˘˘5 6
onDelete
˙˙  
:
˙˙  !
ReferentialAction
˙˙" 3
.
˙˙3 4
Cascade
˙˙4 ;
)
˙˙; <
;
˙˙< =
table
˚˚ 
.
˚˚ 

ForeignKey
˚˚ $
(
˚˚$ %
name
¸¸ 
:
¸¸ 
$str
¸¸ O
,
¸¸O P
column
˝˝ 
:
˝˝ 
x
˝˝  !
=>
˝˝" $
x
˝˝% &
.
˝˝& '
ProductsProductId
˝˝' 8
,
˝˝8 9
principalTable
˛˛ &
:
˛˛& '
$str
˛˛( 2
,
˛˛2 3
principalColumn
ˇˇ '
:
ˇˇ' (
$str
ˇˇ) 4
,
ˇˇ4 5
onDelete
ÄÄ  
:
ÄÄ  !
ReferentialAction
ÄÄ" 3
.
ÄÄ3 4
Cascade
ÄÄ4 ;
)
ÄÄ; <
;
ÄÄ< =
}
ÅÅ 
)
ÅÅ 
;
ÅÅ 
migrationBuilder
ÉÉ 
.
ÉÉ 
CreateTable
ÉÉ (
(
ÉÉ( )
name
ÑÑ 
:
ÑÑ 
$str
ÑÑ '
,
ÑÑ' (
columns
ÖÖ 
:
ÖÖ 
table
ÖÖ 
=>
ÖÖ !
new
ÖÖ" %
{
ÜÜ 
RecommendationId
áá $
=
áá% &
table
áá' ,
.
áá, -
Column
áá- 3
<
áá3 4
Guid
áá4 8
>
áá8 9
(
áá9 :
type
áá: >
:
áá> ?
$str
áá@ F
,
ááF G
nullable
ááH P
:
ááP Q
false
ááR W
,
ááW X
defaultValueSql
ááY h
:
ááh i
$str
ááj ~
)
áá~ 
,áá Ä
UserClientId
àà  
=
àà! "
table
àà# (
.
àà( )
Column
àà) /
<
àà/ 0
Guid
àà0 4
>
àà4 5
(
àà5 6
type
àà6 :
:
àà: ;
$str
àà< B
,
ààB C
nullable
ààD L
:
ààL M
false
ààN S
)
ààS T
,
ààT U
	ProductId
ââ 
=
ââ 
table
ââ  %
.
ââ% &
Column
ââ& ,
<
ââ, -
Guid
ââ- 1
>
ââ1 2
(
ââ2 3
type
ââ3 7
:
ââ7 8
$str
ââ9 ?
,
ââ? @
nullable
ââA I
:
ââI J
false
ââK P
)
ââP Q
,
ââQ R 
RecommendationDate
ää &
=
ää' (
table
ää) .
.
ää. /
Column
ää/ 5
<
ää5 6
DateTime
ää6 >
>
ää> ?
(
ää? @
type
ää@ D
:
ääD E
$str
ääF `
,
ää` a
nullable
ääb j
:
ääj k
false
ääl q
)
ääq r
,
äär s
RelevanceScore
ãã "
=
ãã# $
table
ãã% *
.
ãã* +
Column
ãã+ 1
<
ãã1 2
double
ãã2 8
>
ãã8 9
(
ãã9 :
type
ãã: >
:
ãã> ?
$str
ãã@ R
,
ããR S
nullable
ããT \
:
ãã\ ]
false
ãã^ c
)
ããc d
}
åå 
,
åå 
constraints
çç 
:
çç 
table
çç "
=>
çç# %
{
éé 
table
èè 
.
èè 

PrimaryKey
èè $
(
èè$ %
$str
èè% 9
,
èè9 :
x
èè; <
=>
èè= ?
x
èè@ A
.
èèA B
RecommendationId
èèB R
)
èèR S
;
èèS T
table
êê 
.
êê 

ForeignKey
êê $
(
êê$ %
name
ëë 
:
ëë 
$str
ëë E
,
ëëE F
column
íí 
:
íí 
x
íí  !
=>
íí" $
x
íí% &
.
íí& '
	ProductId
íí' 0
,
íí0 1
principalTable
ìì &
:
ìì& '
$str
ìì( 2
,
ìì2 3
principalColumn
îî '
:
îî' (
$str
îî) 4
,
îî4 5
onDelete
ïï  
:
ïï  !
ReferentialAction
ïï" 3
.
ïï3 4
Cascade
ïï4 ;
)
ïï; <
;
ïï< =
table
ññ 
.
ññ 

ForeignKey
ññ $
(
ññ$ %
name
óó 
:
óó 
$str
óó K
,
óóK L
column
òò 
:
òò 
x
òò  !
=>
òò" $
x
òò% &
.
òò& '
UserClientId
òò' 3
,
òò3 4
principalTable
ôô &
:
ôô& '
$str
ôô( 5
,
ôô5 6
principalColumn
öö '
:
öö' (
$str
öö) 1
,
öö1 2
onDelete
õõ  
:
õõ  !
ReferentialAction
õõ" 3
.
õõ3 4
Cascade
õõ4 ;
)
õõ; <
;
õõ< =
}
úú 
)
úú 
;
úú 
migrationBuilder
ûû 
.
ûû 
CreateTable
ûû (
(
ûû( )
name
üü 
:
üü 
$str
üü 
,
üü  
columns
†† 
:
†† 
table
†† 
=>
†† !
new
††" %
{
°° 
ReviewId
¢¢ 
=
¢¢ 
table
¢¢ $
.
¢¢$ %
Column
¢¢% +
<
¢¢+ ,
Guid
¢¢, 0
>
¢¢0 1
(
¢¢1 2
type
¢¢2 6
:
¢¢6 7
$str
¢¢8 >
,
¢¢> ?
nullable
¢¢@ H
:
¢¢H I
false
¢¢J O
,
¢¢O P
defaultValueSql
¢¢Q `
:
¢¢` a
$str
¢¢b v
)
¢¢v w
,
¢¢w x
UserClientId
££  
=
££! "
table
££# (
.
££( )
Column
££) /
<
££/ 0
Guid
££0 4
>
££4 5
(
££5 6
type
££6 :
:
££: ;
$str
££< B
,
££B C
nullable
££D L
:
££L M
false
££N S
)
££S T
,
££T U

BusinessId
§§ 
=
§§  
table
§§! &
.
§§& '
Column
§§' -
<
§§- .
Guid
§§. 2
>
§§2 3
(
§§3 4
type
§§4 8
:
§§8 9
$str
§§: @
,
§§@ A
nullable
§§B J
:
§§J K
true
§§L P
)
§§P Q
,
§§Q R
	ProductId
•• 
=
•• 
table
••  %
.
••% &
Column
••& ,
<
••, -
Guid
••- 1
>
••1 2
(
••2 3
type
••3 7
:
••7 8
$str
••9 ?
,
••? @
nullable
••A I
:
••I J
true
••K O
)
••O P
,
••P Q
Rating
¶¶ 
=
¶¶ 
table
¶¶ "
.
¶¶" #
Column
¶¶# )
<
¶¶) *
double
¶¶* 0
>
¶¶0 1
(
¶¶1 2
type
¶¶2 6
:
¶¶6 7
$str
¶¶8 J
,
¶¶J K
nullable
¶¶L T
:
¶¶T U
false
¶¶V [
)
¶¶[ \
,
¶¶\ ]
Comment
ßß 
=
ßß 
table
ßß #
.
ßß# $
Column
ßß$ *
<
ßß* +
string
ßß+ 1
>
ßß1 2
(
ßß2 3
type
ßß3 7
:
ßß7 8
$str
ßß9 R
,
ßßR S
	maxLength
ßßT ]
:
ßß] ^
$num
ßß_ c
,
ßßc d
nullable
ßße m
:
ßßm n
false
ßßo t
)
ßßt u
,
ßßu v

ReviewDate
®® 
=
®®  
table
®®! &
.
®®& '
Column
®®' -
<
®®- .
DateTime
®®. 6
>
®®6 7
(
®®7 8
type
®®8 <
:
®®< =
$str
®®> X
,
®®X Y
nullable
®®Z b
:
®®b c
false
®®d i
)
®®i j
}
©© 
,
©© 
constraints
™™ 
:
™™ 
table
™™ "
=>
™™# %
{
´´ 
table
¨¨ 
.
¨¨ 

PrimaryKey
¨¨ $
(
¨¨$ %
$str
¨¨% 1
,
¨¨1 2
x
¨¨3 4
=>
¨¨5 7
x
¨¨8 9
.
¨¨9 :
ReviewId
¨¨: B
)
¨¨B C
;
¨¨C D
table
≠≠ 
.
≠≠ 

ForeignKey
≠≠ $
(
≠≠$ %
name
ÆÆ 
:
ÆÆ 
$str
ÆÆ @
,
ÆÆ@ A
column
ØØ 
:
ØØ 
x
ØØ  !
=>
ØØ" $
x
ØØ% &
.
ØØ& '

BusinessId
ØØ' 1
,
ØØ1 2
principalTable
∞∞ &
:
∞∞& '
$str
∞∞( 4
,
∞∞4 5
principalColumn
±± '
:
±±' (
$str
±±) 5
,
±±5 6
onDelete
≤≤  
:
≤≤  !
ReferentialAction
≤≤" 3
.
≤≤3 4
Cascade
≤≤4 ;
)
≤≤; <
;
≤≤< =
table
≥≥ 
.
≥≥ 

ForeignKey
≥≥ $
(
≥≥$ %
name
¥¥ 
:
¥¥ 
$str
¥¥ =
,
¥¥= >
column
µµ 
:
µµ 
x
µµ  !
=>
µµ" $
x
µµ% &
.
µµ& '
	ProductId
µµ' 0
,
µµ0 1
principalTable
∂∂ &
:
∂∂& '
$str
∂∂( 2
,
∂∂2 3
principalColumn
∑∑ '
:
∑∑' (
$str
∑∑) 4
,
∑∑4 5
onDelete
∏∏  
:
∏∏  !
ReferentialAction
∏∏" 3
.
∏∏3 4
Cascade
∏∏4 ;
)
∏∏; <
;
∏∏< =
table
ππ 
.
ππ 

ForeignKey
ππ $
(
ππ$ %
name
∫∫ 
:
∫∫ 
$str
∫∫ C
,
∫∫C D
column
ªª 
:
ªª 
x
ªª  !
=>
ªª" $
x
ªª% &
.
ªª& '
UserClientId
ªª' 3
,
ªª3 4
principalTable
ºº &
:
ºº& '
$str
ºº( 5
,
ºº5 6
principalColumn
ΩΩ '
:
ΩΩ' (
$str
ΩΩ) 1
,
ΩΩ1 2
onDelete
ææ  
:
ææ  !
ReferentialAction
ææ" 3
.
ææ3 4
Cascade
ææ4 ;
)
ææ; <
;
ææ< =
}
øø 
)
øø 
;
øø 
migrationBuilder
¡¡ 
.
¡¡ 
CreateIndex
¡¡ (
(
¡¡( )
name
¬¬ 
:
¬¬ 
$str
¬¬ 4
,
¬¬4 5
table
√√ 
:
√√ 
$str
√√ #
,
√√# $
column
ƒƒ 
:
ƒƒ 
$str
ƒƒ (
,
ƒƒ( )
unique
≈≈ 
:
≈≈ 
true
≈≈ 
)
≈≈ 
;
≈≈ 
migrationBuilder
«« 
.
«« 
CreateIndex
«« (
(
««( )
name
»» 
:
»» 
$str
»» -
,
»»- .
table
…… 
:
…… 
$str
…… 
,
…… 
column
   
:
   
$str
   &
,
  & '
unique
ÀÀ 
:
ÀÀ 
true
ÀÀ 
)
ÀÀ 
;
ÀÀ 
migrationBuilder
ÕÕ 
.
ÕÕ 
CreateIndex
ÕÕ (
(
ÕÕ( )
name
ŒŒ 
:
ŒŒ 
$str
ŒŒ .
,
ŒŒ. /
table
œœ 
:
œœ 
$str
œœ "
,
œœ" #
column
–– 
:
–– 
$str
–– #
)
––# $
;
––$ %
migrationBuilder
““ 
.
““ 
CreateIndex
““ (
(
““( )
name
”” 
:
”” 
$str
”” 1
,
””1 2
table
‘‘ 
:
‘‘ 
$str
‘‘ "
,
‘‘" #
column
’’ 
:
’’ 
$str
’’ &
)
’’& '
;
’’' (
migrationBuilder
◊◊ 
.
◊◊ 
CreateIndex
◊◊ (
(
◊◊( )
name
ÿÿ 
:
ÿÿ 
$str
ÿÿ ,
,
ÿÿ, -
table
ŸŸ 
:
ŸŸ 
$str
ŸŸ #
,
ŸŸ# $
column
⁄⁄ 
:
⁄⁄ 
$str
⁄⁄  
)
⁄⁄  !
;
⁄⁄! "
migrationBuilder
‹‹ 
.
‹‹ 
CreateIndex
‹‹ (
(
‹‹( )
name
›› 
:
›› 
$str
›› -
,
››- .
table
ﬁﬁ 
:
ﬁﬁ 
$str
ﬁﬁ #
,
ﬁﬁ# $
column
ﬂﬂ 
:
ﬂﬂ 
$str
ﬂﬂ !
)
ﬂﬂ! "
;
ﬂﬂ" #
migrationBuilder
·· 
.
·· 
CreateIndex
·· (
(
··( )
name
‚‚ 
:
‚‚ 
$str
‚‚ /
,
‚‚/ 0
table
„„ 
:
„„ 
$str
„„ #
,
„„# $
column
‰‰ 
:
‰‰ 
$str
‰‰ #
)
‰‰# $
;
‰‰$ %
migrationBuilder
ÊÊ 
.
ÊÊ 
CreateIndex
ÊÊ (
(
ÊÊ( )
name
ÁÁ 
:
ÁÁ 
$str
ÁÁ ,
,
ÁÁ, -
table
ËË 
:
ËË 
$str
ËË 
,
ËË  
column
ÈÈ 
:
ÈÈ 
$str
ÈÈ $
)
ÈÈ$ %
;
ÈÈ% &
migrationBuilder
ÎÎ 
.
ÎÎ 
CreateIndex
ÎÎ (
(
ÎÎ( )
name
ÏÏ 
:
ÏÏ 
$str
ÏÏ .
,
ÏÏ. /
table
ÌÌ 
:
ÌÌ 
$str
ÌÌ 
,
ÌÌ  
column
ÓÓ 
:
ÓÓ 
$str
ÓÓ &
)
ÓÓ& '
;
ÓÓ' (
migrationBuilder
 
.
 
CreateIndex
 (
(
( )
name
ÒÒ 
:
ÒÒ 
$str
ÒÒ >
,
ÒÒ> ?
table
ÚÚ 
:
ÚÚ 
$str
ÚÚ *
,
ÚÚ* +
column
ÛÛ 
:
ÛÛ 
$str
ÛÛ +
)
ÛÛ+ ,
;
ÛÛ, -
migrationBuilder
ıı 
.
ıı 
CreateIndex
ıı (
(
ıı( )
name
ˆˆ 
:
ˆˆ 
$str
ˆˆ .
,
ˆˆ. /
table
˜˜ 
:
˜˜ 
$str
˜˜ !
,
˜˜! "
column
¯¯ 
:
¯¯ 
$str
¯¯ $
)
¯¯$ %
;
¯¯% &
migrationBuilder
˙˙ 
.
˙˙ 
CreateIndex
˙˙ (
(
˙˙( )
name
˚˚ 
:
˚˚ 
$str
˚˚ 4
,
˚˚4 5
table
¸¸ 
:
¸¸ 
$str
¸¸ (
,
¸¸( )
column
˝˝ 
:
˝˝ 
$str
˝˝ #
)
˝˝# $
;
˝˝$ %
migrationBuilder
ˇˇ 
.
ˇˇ 
CreateIndex
ˇˇ (
(
ˇˇ( )
name
ÄÄ 
:
ÄÄ 
$str
ÄÄ 7
,
ÄÄ7 8
table
ÅÅ 
:
ÅÅ 
$str
ÅÅ (
,
ÅÅ( )
column
ÇÇ 
:
ÇÇ 
$str
ÇÇ &
)
ÇÇ& '
;
ÇÇ' (
migrationBuilder
ÑÑ 
.
ÑÑ 
CreateIndex
ÑÑ (
(
ÑÑ( )
name
ÖÖ 
:
ÖÖ 
$str
ÖÖ -
,
ÖÖ- .
table
ÜÜ 
:
ÜÜ 
$str
ÜÜ  
,
ÜÜ  !
column
áá 
:
áá 
$str
áá $
)
áá$ %
;
áá% &
migrationBuilder
ââ 
.
ââ 
CreateIndex
ââ (
(
ââ( )
name
ää 
:
ää 
$str
ää ,
,
ää, -
table
ãã 
:
ãã 
$str
ãã  
,
ãã  !
column
åå 
:
åå 
$str
åå #
)
åå# $
;
åå$ %
migrationBuilder
éé 
.
éé 
CreateIndex
éé (
(
éé( )
name
èè 
:
èè 
$str
èè /
,
èè/ 0
table
êê 
:
êê 
$str
êê  
,
êê  !
column
ëë 
:
ëë 
$str
ëë &
)
ëë& '
;
ëë' (
migrationBuilder
ìì 
.
ìì 
CreateIndex
ìì (
(
ìì( )
name
îî 
:
îî 
$str
îî &
,
îî& '
table
ïï 
:
ïï 
$str
ïï 
,
ïï 
column
ññ 
:
ññ 
$str
ññ 
,
ññ  
unique
óó 
:
óó 
true
óó 
)
óó 
;
óó 
}
òò 	
	protected
õõ 
override
õõ 
void
õõ 
Down
õõ  $
(
õõ$ %
MigrationBuilder
õõ% 5
migrationBuilder
õõ6 F
)
õõF G
{
úú 	
migrationBuilder
ùù 
.
ùù 
	DropTable
ùù &
(
ùù& '
name
ûû 
:
ûû 
$str
ûû !
)
ûû! "
;
ûû" #
migrationBuilder
†† 
.
†† 
	DropTable
†† &
(
††& '
name
°° 
:
°° 
$str
°° "
)
°°" #
;
°°# $
migrationBuilder
££ 
.
££ 
	DropTable
££ &
(
££& '
name
§§ 
:
§§ 
$str
§§ )
)
§§) *
;
§§* +
migrationBuilder
¶¶ 
.
¶¶ 
	DropTable
¶¶ &
(
¶¶& '
name
ßß 
:
ßß 
$str
ßß '
)
ßß' (
;
ßß( )
migrationBuilder
©© 
.
©© 
	DropTable
©© &
(
©©& '
name
™™ 
:
™™ 
$str
™™ 
)
™™  
;
™™  !
migrationBuilder
¨¨ 
.
¨¨ 
	DropTable
¨¨ &
(
¨¨& '
name
≠≠ 
:
≠≠ 
$str
≠≠ 
)
≠≠ 
;
≠≠ 
migrationBuilder
ØØ 
.
ØØ 
	DropTable
ØØ &
(
ØØ& '
name
∞∞ 
:
∞∞ 
$str
∞∞ 
)
∞∞ 
;
∞∞  
migrationBuilder
≤≤ 
.
≤≤ 
	DropTable
≤≤ &
(
≤≤& '
name
≥≥ 
:
≥≥ 
$str
≥≥ "
)
≥≥" #
;
≥≥# $
migrationBuilder
µµ 
.
µµ 
	DropTable
µµ &
(
µµ& '
name
∂∂ 
:
∂∂ 
$str
∂∂  
)
∂∂  !
;
∂∂! "
migrationBuilder
∏∏ 
.
∏∏ 
	DropTable
∏∏ &
(
∏∏& '
name
ππ 
:
ππ 
$str
ππ #
)
ππ# $
;
ππ$ %
migrationBuilder
ªª 
.
ªª 
	DropTable
ªª &
(
ªª& '
name
ºº 
:
ºº 
$str
ºº "
)
ºº" #
;
ºº# $
migrationBuilder
ææ 
.
ææ 
	DropTable
ææ &
(
ææ& '
name
øø 
:
øø 
$str
øø &
)
øø& '
;
øø' (
migrationBuilder
¡¡ 
.
¡¡ 
	DropTable
¡¡ &
(
¡¡& '
name
¬¬ 
:
¬¬ 
$str
¬¬ 
)
¬¬ 
;
¬¬ 
}
√√ 	
}
ƒƒ 
}≈≈ Ö
9D:\BuySmart\BuySmart\Infrastructure\DependecyInjection.cs
	namespace		 	
Infrastructure		
 
{

 
public 

static 
class 
DependecyInjection *
{ 
public 
static 
IServiceCollection (
AddInfrastructure) :
(: ;
this; ?
IServiceCollection@ R
servicesS [
,[ \
IConfiguration] k
configurationl y
)y z
{ 	
services 
. 
AddDbContext !
<! " 
ApplicationDbContext" 6
>6 7
(7 8
options 
=> 
options &
.& '
	UseNpgsql' 0
(0 1
configuration1 >
.> ?
GetConnectionString? R
(R S
$strS f
)f g
,g h
b 
=> 
b 
. 
MigrationsAssembly -
(- .
typeof. 4
(4 5 
ApplicationDbContext5 I
)I J
.J K
AssemblyK S
.S T
FullNameT \
)\ ]
)] ^
) 
; 
services 
. 
	AddScoped 
< 
IProductRepository 1
,1 2
ProductRepository3 D
>D E
(E F
)F G
;G H
services 
. 
	AddScoped 
< 
ICategoryRepository 2
,2 3
CategoryRepository4 F
>F G
(G H
)H I
;I J
services 
. 
	AddScoped 
< 
IUserRepository .
<. /

UserClient/ 9
>9 :
,: ; 
UserClientRepository< P
>P Q
(Q R
)R S
;S T
services 
. 
	AddScoped 
< 
IUserRepository .
<. /
UserBusiness/ ;
>; <
,< ="
UserBusinessRepository> T
>T U
(U V
)V W
;W X
services 
. 
	AddScoped 
< 
ICartRepository .
,. /
CartRepository0 >
>> ?
(? @
)@ A
;A B
services 
. 
	AddScoped 
< 
IBusinessRepository 2
,2 3
BusinessRepository4 F
>F G
(G H
)H I
;I J
services 
. 
	AddScoped 
< %
IReviewBusinessRepository 8
,8 9$
ReviewBusinessRepository: R
>R S
(S T
)T U
;U V
return 
services 
; 
} 	
} 
} 