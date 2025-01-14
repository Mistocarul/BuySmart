�@
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
}dd �.
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
}II �G
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
}gg �u
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
�� 
existingProduct
�� 
.
��  
Name
��  $
=
��% &
product
��' .
.
��. /
Name
��/ 3
;
��3 4
existingProduct
�� 
.
��  
Description
��  +
=
��, -
product
��. 5
.
��5 6
Description
��6 A
;
��A B
existingProduct
�� 
.
��  
Price
��  %
=
��& '
product
��( /
.
��/ 0
Price
��0 5
;
��5 6
existingProduct
�� 
.
��  
Stock
��  %
=
��& '
product
��( /
.
��/ 0
Stock
��0 5
;
��5 6
existingProduct
�� 
.
��  
Rating
��  &
=
��' (
product
��) 0
.
��0 1
Rating
��1 7
;
��7 8
existingProduct
�� 
.
��  
Image
��  %
=
��& '
product
��( /
.
��/ 0
Image
��0 5
;
��5 6
existingProduct
�� 
.
��  

BusinessId
��  *
=
��+ ,
product
��- 4
.
��4 5

BusinessId
��5 ?
;
��? @
context
�� 
.
�� 
Products
��  
.
��  !
Update
��! '
(
��' (
existingProduct
��( 7
)
��7 8
;
��8 9
await
�� 
context
�� 
.
�� 
SaveChangesAsync
�� .
(
��. /
)
��/ 0
;
��0 1
return
�� 
Result
�� 
<
�� 
object
�� $
>
��$ %
.
��% &
Success
��& -
(
��- .
new
��. 1
object
��2 8
(
��8 9
)
��9 :
)
��: ;
;
��; <
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
return
�� 
Result
�� 
<
�� 
object
�� $
>
��$ %
.
��% &
Failure
��& -
(
��- .
ex
��. 0
.
��0 1
Message
��1 8
)
��8 9
;
��9 :
}
�� 
}
�� 	
public
�� 
async
�� 
Task
�� 
DeleteAsync
�� %
(
��% &
Guid
��& *
	productId
��+ 4
)
��4 5
{
�� 	
var
�� 
product
�� 
=
�� 
await
�� 
context
��  '
.
��' (
Products
��( 0
.
��0 1
	FindAsync
��1 :
(
��: ;
	productId
��; D
)
��D E
;
��E F
if
�� 
(
�� 
product
�� 
==
�� 
null
�� 
)
��  
{
�� 
throw
�� 
new
�� "
KeyNotFoundException
�� .
(
��. /
$str
��/ B
)
��B C
;
��C D
}
�� 
context
�� 
.
�� 
Products
�� 
.
�� 
Remove
�� #
(
��# $
product
��$ +
)
��+ ,
;
��, -
await
�� 
context
�� 
.
�� 
SaveChangesAsync
�� *
(
��* +
)
��+ ,
;
��, -
}
�� 	
}
�� 
}�� �<
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
}ZZ �
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
}99 �8
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
}`` �+
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
}BB �
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
}'' �
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
}$$ Ԓ
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
�� '
=
��( )
table
��* /
.
��/ 0
Column
��0 6
<
��6 7
string
��7 =
>
��= >
(
��> ?
type
��? C
:
��C D
$str
��E \
,
��\ ]
	maxLength
��^ g
:
��g h
$num
��i k
,
��k l
nullable
��m u
:
��u v
false
��w |
)
��| }
,
��} ~
PaymentMethod
�� !
=
��" #
table
��$ )
.
��) *
Column
��* 0
<
��0 1
int
��1 4
>
��4 5
(
��5 6
type
��6 :
:
��: ;
$str
��< E
,
��E F
nullable
��G O
:
��O P
false
��Q V
)
��V W
,
��W X
DeliveryAddress
�� #
=
��$ %
table
��& +
.
��+ ,
Column
��, 2
<
��2 3
string
��3 9
>
��9 :
(
��: ;
type
��; ?
:
��? @
$str
��A Y
,
��Y Z
	maxLength
��[ d
:
��d e
$num
��f i
,
��i j
nullable
��k s
:
��s t
false
��u z
)
��z {
,
��{ |
UserClientId
��  
=
��! "
table
��# (
.
��( )
Column
��) /
<
��/ 0
Guid
��0 4
>
��4 5
(
��5 6
type
��6 :
:
��: ;
$str
��< B
,
��B C
nullable
��D L
:
��L M
false
��N S
)
��S T
,
��T U

BusinessId
�� 
=
��  
table
��! &
.
��& '
Column
��' -
<
��- .
Guid
��. 2
>
��2 3
(
��3 4
type
��4 8
:
��8 9
$str
��: @
,
��@ A
nullable
��B J
:
��J K
false
��L Q
)
��Q R
}
�� 
,
�� 
constraints
�� 
:
�� 
table
�� "
=>
��# %
{
�� 
table
�� 
.
�� 

PrimaryKey
�� $
(
��$ %
$str
��% 0
,
��0 1
x
��2 3
=>
��4 6
x
��7 8
.
��8 9
OrderId
��9 @
)
��@ A
;
��A B
table
�� 
.
�� 

ForeignKey
�� $
(
��$ %
name
�� 
:
�� 
$str
�� ?
,
��? @
column
�� 
:
�� 
x
��  !
=>
��" $
x
��% &
.
��& '

BusinessId
��' 1
,
��1 2
principalTable
�� &
:
��& '
$str
��( 4
,
��4 5
principalColumn
�� '
:
��' (
$str
��) 5
,
��5 6
onDelete
��  
:
��  !
ReferentialAction
��" 3
.
��3 4
Cascade
��4 ;
)
��; <
;
��< =
table
�� 
.
�� 

ForeignKey
�� $
(
��$ %
name
�� 
:
�� 
$str
�� B
,
��B C
column
�� 
:
�� 
x
��  !
=>
��" $
x
��% &
.
��& '
UserClientId
��' 3
,
��3 4
principalTable
�� &
:
��& '
$str
��( 5
,
��5 6
principalColumn
�� '
:
��' (
$str
��) 1
,
��1 2
onDelete
��  
:
��  !
ReferentialAction
��" 3
.
��3 4
Cascade
��4 ;
)
��; <
;
��< =
}
�� 
)
�� 
;
�� 
migrationBuilder
�� 
.
�� 
CreateTable
�� (
(
��( )
name
�� 
:
�� 
$str
��  
,
��  !
columns
�� 
:
�� 
table
�� 
=>
�� !
new
��" %
{
�� 
	ProductId
�� 
=
�� 
table
��  %
.
��% &
Column
��& ,
<
��, -
Guid
��- 1
>
��1 2
(
��2 3
type
��3 7
:
��7 8
$str
��9 ?
,
��? @
nullable
��A I
:
��I J
false
��K P
,
��P Q
defaultValueSql
��R a
:
��a b
$str
��c w
)
��w x
,
��x y
Name
�� 
=
�� 
table
��  
.
��  !
Column
��! '
<
��' (
string
��( .
>
��. /
(
��/ 0
type
��0 4
:
��4 5
$str
��6 N
,
��N O
	maxLength
��P Y
:
��Y Z
$num
��[ ^
,
��^ _
nullable
��` h
:
��h i
false
��j o
)
��o p
,
��p q
Description
�� 
=
��  !
table
��" '
.
��' (
Column
��( .
<
��. /
string
��/ 5
>
��5 6
(
��6 7
type
��7 ;
:
��; <
$str
��= V
,
��V W
	maxLength
��X a
:
��a b
$num
��c g
,
��g h
nullable
��i q
:
��q r
false
��s x
)
��x y
,
��y z
Price
�� 
=
�� 
table
�� !
.
��! "
Column
��" (
<
��( )
decimal
��) 0
>
��0 1
(
��1 2
type
��2 6
:
��6 7
$str
��8 G
,
��G H
nullable
��I Q
:
��Q R
false
��S X
)
��X Y
,
��Y Z
Stock
�� 
=
�� 
table
�� !
.
��! "
Column
��" (
<
��( )
double
��) /
>
��/ 0
(
��0 1
type
��1 5
:
��5 6
$str
��7 I
,
��I J
nullable
��K S
:
��S T
false
��U Z
)
��Z [
,
��[ \
Rating
�� 
=
�� 
table
�� "
.
��" #
Column
��# )
<
��) *
double
��* 0
>
��0 1
(
��1 2
type
��2 6
:
��6 7
$str
��8 J
,
��J K
nullable
��L T
:
��T U
false
��V [
)
��[ \
,
��\ ]
Image
�� 
=
�� 
table
�� !
.
��! "
Column
��" (
<
��( )
string
��) /
>
��/ 0
(
��0 1
type
��1 5
:
��5 6
$str
��7 O
,
��O P
	maxLength
��Q Z
:
��Z [
$num
��\ _
,
��_ `
nullable
��a i
:
��i j
false
��k p
)
��p q
,
��q r

BusinessId
�� 
=
��  
table
��! &
.
��& '
Column
��' -
<
��- .
Guid
��. 2
>
��2 3
(
��3 4
type
��4 8
:
��8 9
$str
��: @
,
��@ A
nullable
��B J
:
��J K
false
��L Q
)
��Q R
}
�� 
,
�� 
constraints
�� 
:
�� 
table
�� "
=>
��# %
{
�� 
table
�� 
.
�� 

PrimaryKey
�� $
(
��$ %
$str
��% 2
,
��2 3
x
��4 5
=>
��6 8
x
��9 :
.
��: ;
	ProductId
��; D
)
��D E
;
��E F
table
�� 
.
�� 

ForeignKey
�� $
(
��$ %
name
�� 
:
�� 
$str
�� A
,
��A B
column
�� 
:
�� 
x
��  !
=>
��" $
x
��% &
.
��& '

BusinessId
��' 1
,
��1 2
principalTable
�� &
:
��& '
$str
��( 4
,
��4 5
principalColumn
�� '
:
��' (
$str
��) 5
,
��5 6
onDelete
��  
:
��  !
ReferentialAction
��" 3
.
��3 4
Cascade
��4 ;
)
��; <
;
��< =
}
�� 
)
�� 
;
�� 
migrationBuilder
�� 
.
�� 
CreateTable
�� (
(
��( )
name
�� 
:
�� 
$str
�� !
,
��! "
columns
�� 
:
�� 
table
�� 
=>
�� !
new
��" %
{
�� 
	HistoryId
�� 
=
�� 
table
��  %
.
��% &
Column
��& ,
<
��, -
Guid
��- 1
>
��1 2
(
��2 3
type
��3 7
:
��7 8
$str
��9 ?
,
��? @
nullable
��A I
:
��I J
false
��K P
,
��P Q
defaultValueSql
��R a
:
��a b
$str
��c w
)
��w x
,
��x y
UserClientId
��  
=
��! "
table
��# (
.
��( )
Column
��) /
<
��/ 0
Guid
��0 4
>
��4 5
(
��5 6
type
��6 :
:
��: ;
$str
��< B
,
��B C
nullable
��D L
:
��L M
false
��N S
)
��S T
,
��T U
	ProductId
�� 
=
�� 
table
��  %
.
��% &
Column
��& ,
<
��, -
Guid
��- 1
>
��1 2
(
��2 3
type
��3 7
:
��7 8
$str
��9 ?
,
��? @
nullable
��A I
:
��I J
false
��K P
)
��P Q
,
��Q R
	AccesDate
�� 
=
�� 
table
��  %
.
��% &
Column
��& ,
<
��, -
DateTime
��- 5
>
��5 6
(
��6 7
type
��7 ;
:
��; <
$str
��= W
,
��W X
nullable
��Y a
:
��a b
false
��c h
)
��h i
}
�� 
,
�� 
constraints
�� 
:
�� 
table
�� "
=>
��# %
{
�� 
table
�� 
.
�� 

PrimaryKey
�� $
(
��$ %
$str
��% 3
,
��3 4
x
��5 6
=>
��7 9
x
��: ;
.
��; <
	HistoryId
��< E
)
��E F
;
��F G
table
�� 
.
�� 

ForeignKey
�� $
(
��$ %
name
�� 
:
�� 
$str
�� ?
,
��? @
column
�� 
:
�� 
x
��  !
=>
��" $
x
��% &
.
��& '
	ProductId
��' 0
,
��0 1
principalTable
�� &
:
��& '
$str
��( 2
,
��2 3
principalColumn
�� '
:
��' (
$str
��) 4
,
��4 5
onDelete
��  
:
��  !
ReferentialAction
��" 3
.
��3 4
Cascade
��4 ;
)
��; <
;
��< =
table
�� 
.
�� 

ForeignKey
�� $
(
��$ %
name
�� 
:
�� 
$str
�� E
,
��E F
column
�� 
:
�� 
x
��  !
=>
��" $
x
��% &
.
��& '
UserClientId
��' 3
,
��3 4
principalTable
�� &
:
��& '
$str
��( 5
,
��5 6
principalColumn
�� '
:
��' (
$str
��) 1
,
��1 2
onDelete
��  
:
��  !
ReferentialAction
��" 3
.
��3 4
Cascade
��4 ;
)
��; <
;
��< =
}
�� 
)
�� 
;
�� 
migrationBuilder
�� 
.
�� 
CreateTable
�� (
(
��( )
name
�� 
:
�� 
$str
�� "
,
��" #
columns
�� 
:
�� 
table
�� 
=>
�� !
new
��" %
{
�� 
OrderItemId
�� 
=
��  !
table
��" '
.
��' (
Column
��( .
<
��. /
Guid
��/ 3
>
��3 4
(
��4 5
type
��5 9
:
��9 :
$str
��; A
,
��A B
nullable
��C K
:
��K L
false
��M R
,
��R S
defaultValueSql
��T c
:
��c d
$str
��e y
)
��y z
,
��z {
OrderId
�� 
=
�� 
table
�� #
.
��# $
Column
��$ *
<
��* +
Guid
��+ /
>
��/ 0
(
��0 1
type
��1 5
:
��5 6
$str
��7 =
,
��= >
nullable
��? G
:
��G H
false
��I N
)
��N O
,
��O P
CartId
�� 
=
�� 
table
�� "
.
��" #
Column
��# )
<
��) *
Guid
��* .
>
��. /
(
��/ 0
type
��0 4
:
��4 5
$str
��6 <
,
��< =
nullable
��> F
:
��F G
false
��H M
)
��M N
,
��N O
	ProductId
�� 
=
�� 
table
��  %
.
��% &
Column
��& ,
<
��, -
Guid
��- 1
>
��1 2
(
��2 3
type
��3 7
:
��7 8
$str
��9 ?
,
��? @
nullable
��A I
:
��I J
false
��K P
)
��P Q
,
��Q R
Quantity
�� 
=
�� 
table
�� $
.
��$ %
Column
��% +
<
��+ ,
double
��, 2
>
��2 3
(
��3 4
type
��4 8
:
��8 9
$str
��: L
,
��L M
nullable
��N V
:
��V W
false
��X ]
)
��] ^
,
��^ _
Price
�� 
=
�� 
table
�� !
.
��! "
Column
��" (
<
��( )
double
��) /
>
��/ 0
(
��0 1
type
��1 5
:
��5 6
$str
��7 F
,
��F G
nullable
��H P
:
��P Q
false
��R W
)
��W X
}
�� 
,
�� 
constraints
�� 
:
�� 
table
�� "
=>
��# %
{
�� 
table
�� 
.
�� 

PrimaryKey
�� $
(
��$ %
$str
��% 4
,
��4 5
x
��6 7
=>
��8 :
x
��; <
.
��< =
OrderItemId
��= H
)
��H I
;
��I J
table
�� 
.
�� 

ForeignKey
�� $
(
��$ %
name
�� 
:
�� 
$str
�� :
,
��: ;
column
�� 
:
�� 
x
��  !
=>
��" $
x
��% &
.
��& '
CartId
��' -
,
��- .
principalTable
�� &
:
��& '
$str
��( /
,
��/ 0
principalColumn
�� '
:
��' (
$str
��) 1
,
��1 2
onDelete
��  
:
��  !
ReferentialAction
��" 3
.
��3 4
Cascade
��4 ;
)
��; <
;
��< =
table
�� 
.
�� 

ForeignKey
�� $
(
��$ %
name
�� 
:
�� 
$str
�� <
,
��< =
column
�� 
:
�� 
x
��  !
=>
��" $
x
��% &
.
��& '
OrderId
��' .
,
��. /
principalTable
�� &
:
��& '
$str
��( 0
,
��0 1
principalColumn
�� '
:
��' (
$str
��) 2
,
��2 3
onDelete
��  
:
��  !
ReferentialAction
��" 3
.
��3 4
Cascade
��4 ;
)
��; <
;
��< =
table
�� 
.
�� 

ForeignKey
�� $
(
��$ %
name
�� 
:
�� 
$str
�� @
,
��@ A
column
�� 
:
�� 
x
��  !
=>
��" $
x
��% &
.
��& '
	ProductId
��' 0
,
��0 1
principalTable
�� &
:
��& '
$str
��( 2
,
��2 3
principalColumn
�� '
:
��' (
$str
��) 4
,
��4 5
onDelete
��  
:
��  !
ReferentialAction
��" 3
.
��3 4
Cascade
��4 ;
)
��; <
;
��< =
}
�� 
)
�� 
;
�� 
migrationBuilder
�� 
.
�� 
CreateTable
�� (
(
��( )
name
�� 
:
�� 
$str
�� )
,
��) *
columns
�� 
:
�� 
table
�� 
=>
�� !
new
��" %
{
�� "
CategoriesCategoryId
�� (
=
��) *
table
��+ 0
.
��0 1
Column
��1 7
<
��7 8
Guid
��8 <
>
��< =
(
��= >
type
��> B
:
��B C
$str
��D J
,
��J K
nullable
��L T
:
��T U
false
��V [
)
��[ \
,
��\ ]
ProductsProductId
�� %
=
��& '
table
��( -
.
��- .
Column
��. 4
<
��4 5
Guid
��5 9
>
��9 :
(
��: ;
type
��; ?
:
��? @
$str
��A G
,
��G H
nullable
��I Q
:
��Q R
false
��S X
)
��X Y
}
�� 
,
�� 
constraints
�� 
:
�� 
table
�� "
=>
��# %
{
�� 
table
�� 
.
�� 

PrimaryKey
�� $
(
��$ %
$str
��% ;
,
��; <
x
��= >
=>
��? A
new
��B E
{
��F G
x
��H I
.
��I J"
CategoriesCategoryId
��J ^
,
��^ _
x
��` a
.
��a b
ProductsProductId
��b s
}
��t u
)
��u v
;
��v w
table
�� 
.
�� 

ForeignKey
�� $
(
��$ %
name
�� 
:
�� 
$str
�� T
,
��T U
column
�� 
:
�� 
x
��  !
=>
��" $
x
��% &
.
��& '"
CategoriesCategoryId
��' ;
,
��; <
principalTable
�� &
:
��& '
$str
��( 4
,
��4 5
principalColumn
�� '
:
��' (
$str
��) 5
,
��5 6
onDelete
��  
:
��  !
ReferentialAction
��" 3
.
��3 4
Cascade
��4 ;
)
��; <
;
��< =
table
�� 
.
�� 

ForeignKey
�� $
(
��$ %
name
�� 
:
�� 
$str
�� O
,
��O P
column
�� 
:
�� 
x
��  !
=>
��" $
x
��% &
.
��& '
ProductsProductId
��' 8
,
��8 9
principalTable
�� &
:
��& '
$str
��( 2
,
��2 3
principalColumn
�� '
:
��' (
$str
��) 4
,
��4 5
onDelete
��  
:
��  !
ReferentialAction
��" 3
.
��3 4
Cascade
��4 ;
)
��; <
;
��< =
}
�� 
)
�� 
;
�� 
migrationBuilder
�� 
.
�� 
CreateTable
�� (
(
��( )
name
�� 
:
�� 
$str
�� '
,
��' (
columns
�� 
:
�� 
table
�� 
=>
�� !
new
��" %
{
�� 
RecommendationId
�� $
=
��% &
table
��' ,
.
��, -
Column
��- 3
<
��3 4
Guid
��4 8
>
��8 9
(
��9 :
type
��: >
:
��> ?
$str
��@ F
,
��F G
nullable
��H P
:
��P Q
false
��R W
,
��W X
defaultValueSql
��Y h
:
��h i
$str
��j ~
)
��~ 
,�� �
UserClientId
��  
=
��! "
table
��# (
.
��( )
Column
��) /
<
��/ 0
Guid
��0 4
>
��4 5
(
��5 6
type
��6 :
:
��: ;
$str
��< B
,
��B C
nullable
��D L
:
��L M
false
��N S
)
��S T
,
��T U
	ProductId
�� 
=
�� 
table
��  %
.
��% &
Column
��& ,
<
��, -
Guid
��- 1
>
��1 2
(
��2 3
type
��3 7
:
��7 8
$str
��9 ?
,
��? @
nullable
��A I
:
��I J
false
��K P
)
��P Q
,
��Q R 
RecommendationDate
�� &
=
��' (
table
��) .
.
��. /
Column
��/ 5
<
��5 6
DateTime
��6 >
>
��> ?
(
��? @
type
��@ D
:
��D E
$str
��F `
,
��` a
nullable
��b j
:
��j k
false
��l q
)
��q r
,
��r s
RelevanceScore
�� "
=
��# $
table
��% *
.
��* +
Column
��+ 1
<
��1 2
double
��2 8
>
��8 9
(
��9 :
type
��: >
:
��> ?
$str
��@ R
,
��R S
nullable
��T \
:
��\ ]
false
��^ c
)
��c d
}
�� 
,
�� 
constraints
�� 
:
�� 
table
�� "
=>
��# %
{
�� 
table
�� 
.
�� 

PrimaryKey
�� $
(
��$ %
$str
��% 9
,
��9 :
x
��; <
=>
��= ?
x
��@ A
.
��A B
RecommendationId
��B R
)
��R S
;
��S T
table
�� 
.
�� 

ForeignKey
�� $
(
��$ %
name
�� 
:
�� 
$str
�� E
,
��E F
column
�� 
:
�� 
x
��  !
=>
��" $
x
��% &
.
��& '
	ProductId
��' 0
,
��0 1
principalTable
�� &
:
��& '
$str
��( 2
,
��2 3
principalColumn
�� '
:
��' (
$str
��) 4
,
��4 5
onDelete
��  
:
��  !
ReferentialAction
��" 3
.
��3 4
Cascade
��4 ;
)
��; <
;
��< =
table
�� 
.
�� 

ForeignKey
�� $
(
��$ %
name
�� 
:
�� 
$str
�� K
,
��K L
column
�� 
:
�� 
x
��  !
=>
��" $
x
��% &
.
��& '
UserClientId
��' 3
,
��3 4
principalTable
�� &
:
��& '
$str
��( 5
,
��5 6
principalColumn
�� '
:
��' (
$str
��) 1
,
��1 2
onDelete
��  
:
��  !
ReferentialAction
��" 3
.
��3 4
Cascade
��4 ;
)
��; <
;
��< =
}
�� 
)
�� 
;
�� 
migrationBuilder
�� 
.
�� 
CreateTable
�� (
(
��( )
name
�� 
:
�� 
$str
�� 
,
��  
columns
�� 
:
�� 
table
�� 
=>
�� !
new
��" %
{
�� 
ReviewId
�� 
=
�� 
table
�� $
.
��$ %
Column
��% +
<
��+ ,
Guid
��, 0
>
��0 1
(
��1 2
type
��2 6
:
��6 7
$str
��8 >
,
��> ?
nullable
��@ H
:
��H I
false
��J O
,
��O P
defaultValueSql
��Q `
:
��` a
$str
��b v
)
��v w
,
��w x
UserClientId
��  
=
��! "
table
��# (
.
��( )
Column
��) /
<
��/ 0
Guid
��0 4
>
��4 5
(
��5 6
type
��6 :
:
��: ;
$str
��< B
,
��B C
nullable
��D L
:
��L M
false
��N S
)
��S T
,
��T U

BusinessId
�� 
=
��  
table
��! &
.
��& '
Column
��' -
<
��- .
Guid
��. 2
>
��2 3
(
��3 4
type
��4 8
:
��8 9
$str
��: @
,
��@ A
nullable
��B J
:
��J K
true
��L P
)
��P Q
,
��Q R
	ProductId
�� 
=
�� 
table
��  %
.
��% &
Column
��& ,
<
��, -
Guid
��- 1
>
��1 2
(
��2 3
type
��3 7
:
��7 8
$str
��9 ?
,
��? @
nullable
��A I
:
��I J
true
��K O
)
��O P
,
��P Q
Rating
�� 
=
�� 
table
�� "
.
��" #
Column
��# )
<
��) *
double
��* 0
>
��0 1
(
��1 2
type
��2 6
:
��6 7
$str
��8 J
,
��J K
nullable
��L T
:
��T U
false
��V [
)
��[ \
,
��\ ]
Comment
�� 
=
�� 
table
�� #
.
��# $
Column
��$ *
<
��* +
string
��+ 1
>
��1 2
(
��2 3
type
��3 7
:
��7 8
$str
��9 R
,
��R S
	maxLength
��T ]
:
��] ^
$num
��_ c
,
��c d
nullable
��e m
:
��m n
false
��o t
)
��t u
,
��u v

ReviewDate
�� 
=
��  
table
��! &
.
��& '
Column
��' -
<
��- .
DateTime
��. 6
>
��6 7
(
��7 8
type
��8 <
:
��< =
$str
��> X
,
��X Y
nullable
��Z b
:
��b c
false
��d i
)
��i j
}
�� 
,
�� 
constraints
�� 
:
�� 
table
�� "
=>
��# %
{
�� 
table
�� 
.
�� 

PrimaryKey
�� $
(
��$ %
$str
��% 1
,
��1 2
x
��3 4
=>
��5 7
x
��8 9
.
��9 :
ReviewId
��: B
)
��B C
;
��C D
table
�� 
.
�� 

ForeignKey
�� $
(
��$ %
name
�� 
:
�� 
$str
�� @
,
��@ A
column
�� 
:
�� 
x
��  !
=>
��" $
x
��% &
.
��& '

BusinessId
��' 1
,
��1 2
principalTable
�� &
:
��& '
$str
��( 4
,
��4 5
principalColumn
�� '
:
��' (
$str
��) 5
,
��5 6
onDelete
��  
:
��  !
ReferentialAction
��" 3
.
��3 4
Cascade
��4 ;
)
��; <
;
��< =
table
�� 
.
�� 

ForeignKey
�� $
(
��$ %
name
�� 
:
�� 
$str
�� =
,
��= >
column
�� 
:
�� 
x
��  !
=>
��" $
x
��% &
.
��& '
	ProductId
��' 0
,
��0 1
principalTable
�� &
:
��& '
$str
��( 2
,
��2 3
principalColumn
�� '
:
��' (
$str
��) 4
,
��4 5
onDelete
��  
:
��  !
ReferentialAction
��" 3
.
��3 4
Cascade
��4 ;
)
��; <
;
��< =
table
�� 
.
�� 

ForeignKey
�� $
(
��$ %
name
�� 
:
�� 
$str
�� C
,
��C D
column
�� 
:
�� 
x
��  !
=>
��" $
x
��% &
.
��& '
UserClientId
��' 3
,
��3 4
principalTable
�� &
:
��& '
$str
��( 5
,
��5 6
principalColumn
�� '
:
��' (
$str
��) 1
,
��1 2
onDelete
��  
:
��  !
ReferentialAction
��" 3
.
��3 4
Cascade
��4 ;
)
��; <
;
��< =
}
�� 
)
�� 
;
�� 
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� 4
,
��4 5
table
�� 
:
�� 
$str
�� #
,
��# $
column
�� 
:
�� 
$str
�� (
,
��( )
unique
�� 
:
�� 
true
�� 
)
�� 
;
�� 
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� -
,
��- .
table
�� 
:
�� 
$str
�� 
,
�� 
column
�� 
:
�� 
$str
�� &
,
��& '
unique
�� 
:
�� 
true
�� 
)
�� 
;
�� 
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� .
,
��. /
table
�� 
:
�� 
$str
�� "
,
��" #
column
�� 
:
�� 
$str
�� #
)
��# $
;
��$ %
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� 1
,
��1 2
table
�� 
:
�� 
$str
�� "
,
��" #
column
�� 
:
�� 
$str
�� &
)
��& '
;
��' (
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� ,
,
��, -
table
�� 
:
�� 
$str
�� #
,
��# $
column
�� 
:
�� 
$str
��  
)
��  !
;
��! "
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� -
,
��- .
table
�� 
:
�� 
$str
�� #
,
��# $
column
�� 
:
�� 
$str
�� !
)
��! "
;
��" #
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� /
,
��/ 0
table
�� 
:
�� 
$str
�� #
,
��# $
column
�� 
:
�� 
$str
�� #
)
��# $
;
��$ %
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� ,
,
��, -
table
�� 
:
�� 
$str
�� 
,
��  
column
�� 
:
�� 
$str
�� $
)
��$ %
;
��% &
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� .
,
��. /
table
�� 
:
�� 
$str
�� 
,
��  
column
�� 
:
�� 
$str
�� &
)
��& '
;
��' (
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� >
,
��> ?
table
�� 
:
�� 
$str
�� *
,
��* +
column
�� 
:
�� 
$str
�� +
)
��+ ,
;
��, -
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� .
,
��. /
table
�� 
:
�� 
$str
�� !
,
��! "
column
�� 
:
�� 
$str
�� $
)
��$ %
;
��% &
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� 4
,
��4 5
table
�� 
:
�� 
$str
�� (
,
��( )
column
�� 
:
�� 
$str
�� #
)
��# $
;
��$ %
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� 7
,
��7 8
table
�� 
:
�� 
$str
�� (
,
��( )
column
�� 
:
�� 
$str
�� &
)
��& '
;
��' (
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� -
,
��- .
table
�� 
:
�� 
$str
��  
,
��  !
column
�� 
:
�� 
$str
�� $
)
��$ %
;
��% &
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� ,
,
��, -
table
�� 
:
�� 
$str
��  
,
��  !
column
�� 
:
�� 
$str
�� #
)
��# $
;
��$ %
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� /
,
��/ 0
table
�� 
:
�� 
$str
��  
,
��  !
column
�� 
:
�� 
$str
�� &
)
��& '
;
��' (
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� &
,
��& '
table
�� 
:
�� 
$str
�� 
,
�� 
column
�� 
:
�� 
$str
�� 
,
��  
unique
�� 
:
�� 
true
�� 
)
�� 
;
�� 
}
�� 	
	protected
�� 
override
�� 
void
�� 
Down
��  $
(
��$ %
MigrationBuilder
��% 5
migrationBuilder
��6 F
)
��F G
{
�� 	
migrationBuilder
�� 
.
�� 
	DropTable
�� &
(
��& '
name
�� 
:
�� 
$str
�� !
)
��! "
;
��" #
migrationBuilder
�� 
.
�� 
	DropTable
�� &
(
��& '
name
�� 
:
�� 
$str
�� "
)
��" #
;
��# $
migrationBuilder
�� 
.
�� 
	DropTable
�� &
(
��& '
name
�� 
:
�� 
$str
�� )
)
��) *
;
��* +
migrationBuilder
�� 
.
�� 
	DropTable
�� &
(
��& '
name
�� 
:
�� 
$str
�� '
)
��' (
;
��( )
migrationBuilder
�� 
.
�� 
	DropTable
�� &
(
��& '
name
�� 
:
�� 
$str
�� 
)
��  
;
��  !
migrationBuilder
�� 
.
�� 
	DropTable
�� &
(
��& '
name
�� 
:
�� 
$str
�� 
)
�� 
;
�� 
migrationBuilder
�� 
.
�� 
	DropTable
�� &
(
��& '
name
�� 
:
�� 
$str
�� 
)
�� 
;
��  
migrationBuilder
�� 
.
�� 
	DropTable
�� &
(
��& '
name
�� 
:
�� 
$str
�� "
)
��" #
;
��# $
migrationBuilder
�� 
.
�� 
	DropTable
�� &
(
��& '
name
�� 
:
�� 
$str
��  
)
��  !
;
��! "
migrationBuilder
�� 
.
�� 
	DropTable
�� &
(
��& '
name
�� 
:
�� 
$str
�� #
)
��# $
;
��$ %
migrationBuilder
�� 
.
�� 
	DropTable
�� &
(
��& '
name
�� 
:
�� 
$str
�� "
)
��" #
;
��# $
migrationBuilder
�� 
.
�� 
	DropTable
�� &
(
��& '
name
�� 
:
�� 
$str
�� &
)
��& '
;
��' (
migrationBuilder
�� 
.
�� 
	DropTable
�� &
(
��& '
name
�� 
:
�� 
$str
�� 
)
�� 
;
�� 
}
�� 	
}
�� 
}�� �
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