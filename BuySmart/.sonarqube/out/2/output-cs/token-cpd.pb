á8
ND:\Repos\BuySmart\BuySmart\Infrastructure\Repositories\UserClientRepository.cs
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
:		& '!
IUserClientRepository		( =
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
(> ?
int? B

pageNumberC M
,M N
intO R
pageSizeS [
)[ \
{ 	
return 
await 
context  
.  !
UserClients! ,
. 
Skip 
( 
( 

pageNumber 
- 
$num  !
)! "
*# $
pageSize% -
)- .
. 
Take 
( 
pageSize 
) 
. 
ToListAsync 
( 
) 
; 
} 	
public 
async 
Task 
< 

UserClient $
>$ %
GetByIdAsync& 2
(2 3
Guid3 7
userClientId8 D
)D E
{ 	
var 

userClient 
= 
await "
context# *
.* +
UserClients+ 6
.6 7
	FindAsync7 @
(@ A
userClientIdA M
)M N
;N O
if 
( 

userClient 
== 
null "
)" #
{ 
throw 
new  
KeyNotFoundException .
(. /
$str/ E
)E F
;F G
}   
return!! 

userClient!! 
;!! 
}"" 	
public$$ 
async$$ 
Task$$ 
<$$ 
Result$$  
<$$  !
Guid$$! %
>$$% &
>$$& '
AddAsync$$( 0
($$0 1

UserClient$$1 ;

userClient$$< F
)$$F G
{%% 	
try&& 
{'' 
await(( 
context(( 
.(( 
UserClients(( )
.(() *
AddAsync((* 2
(((2 3

userClient((3 =
)((= >
;((> ?
await)) 
context)) 
.)) 
SaveChangesAsync)) .
()). /
)))/ 0
;))0 1
return** 
Result** 
<** 
Guid** "
>**" #
.**# $
Success**$ +
(**+ ,

userClient**, 6
.**6 7
UserId**7 =
)**= >
;**> ?
}++ 
catch,, 
(,, 
	Exception,, 
ex,, 
),,  
{-- 
return.. 
Result.. 
<.. 
Guid.. "
>.." #
...# $
Failure..$ +
(..+ ,
ex.., .
.... /
Message../ 6
)..6 7
;..7 8
}// 
}00 	
public22 
async22 
Task22 
<22 
Result22  
<22  !
object22! '
>22' (
>22( )
UpdateAsync22* 5
(225 6

UserClient226 @

userClient22A K
)22K L
{33 	
try44 
{55 
var66 
existingUserClient66 &
=66' (
await66) .
context66/ 6
.666 7
UserClients667 B
.66B C
	FindAsync66C L
(66L M

userClient66M W
.66W X
UserId66X ^
)66^ _
;66_ `
if77 
(77 
existingUserClient77 &
==77' )
null77* .
)77. /
{88 
return99 
Result99 !
<99! "
object99" (
>99( )
.99) *
Failure99* 1
(991 2
$str992 H
)99H I
;99I J
}:: 
existingUserClient== "
.==" #
Name==# '
===( )

userClient==* 4
.==4 5
Name==5 9
;==9 :
existingUserClient>> "
.>>" #
Email>># (
=>>) *

userClient>>+ 5
.>>5 6
Email>>6 ;
;>>; <
existingUserClient?? "
.??" #
Password??# +
=??, -

userClient??. 8
.??8 9
Password??9 A
;??A B
existingUserClient@@ "
.@@" #
Image@@# (
=@@) *

userClient@@+ 5
.@@5 6
Image@@6 ;
;@@; <
existingUserClientAA "
.AA" #
UserTypeAA# +
=AA, -

userClientAA. 8
.AA8 9
UserTypeAA9 A
;AAA B
contextCC 
.CC 
UserClientsCC #
.CC# $
UpdateCC$ *
(CC* +
existingUserClientCC+ =
)CC= >
;CC> ?
awaitDD 
contextDD 
.DD 
SaveChangesAsyncDD .
(DD. /
)DD/ 0
;DD0 1
returnEE 
ResultEE 
<EE 
objectEE $
>EE$ %
.EE% &
SuccessEE& -
(EE- .
newEE. 1
objectEE2 8
(EE8 9
)EE9 :
)EE: ;
;EE; <
}FF 
catchGG 
(GG 
	ExceptionGG 
exGG 
)GG  
{HH 
returnII 
ResultII 
<II 
objectII $
>II$ %
.II% &
FailureII& -
(II- .
exII. 0
.II0 1
MessageII1 8
)II8 9
;II9 :
}JJ 
}KK 	
publicMM 
asyncMM 
TaskMM 
DeleteAsyncMM %
(MM% &
GuidMM& *
userClientIdMM+ 7
)MM7 8
{NN 	
varOO 

userClientOO 
=OO 
awaitOO "
contextOO# *
.OO* +
UserClientsOO+ 6
.OO6 7
	FindAsyncOO7 @
(OO@ A
userClientIdOOA M
)OOM N
;OON O
ifPP 
(PP 

userClientPP 
==PP 
nullPP "
)PP" #
{QQ 
throwRR 
newRR  
KeyNotFoundExceptionRR .
(RR. /
$strRR/ E
)RRE F
;RRF G
}SS 
contextTT 
.TT 
UserClientsTT 
.TT  
RemoveTT  &
(TT& '

userClientTT' 1
)TT1 2
;TT2 3
awaitUU 
contextUU 
.UU 
SaveChangesAsyncUU *
(UU* +
)UU+ ,
;UU, -
}VV 	
}WW 
}XX ‰8
PD:\Repos\BuySmart\BuySmart\Infrastructure\Repositories\UserBusinessRepository.cs
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
:		( )#
IUserBusinessRepository		* A
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
Task 
DeleteAsync %
(% &
Guid& *
userBusinessId+ 9
)9 :
{   	
var!! 
userBusiness!! 
=!! 
await!! $
context!!% ,
.!!, -
UserBusinesses!!- ;
.!!; <
	FindAsync!!< E
(!!E F
userBusinessId!!F T
)!!T U
;!!U V
if"" 
("" 
userBusiness"" 
=="" 
null""  $
)""$ %
{## 
throw$$ 
new$$  
KeyNotFoundException$$ .
($$. /
$str$$/ G
)$$G H
;$$H I
}%% 
context&& 
.&& 
UserBusinesses&& "
.&&" #
Remove&&# )
(&&) *
userBusiness&&* 6
)&&6 7
;&&7 8
await'' 
context'' 
.'' 
SaveChangesAsync'' *
(''* +
)''+ ,
;'', -
}(( 	
public** 
async** 
Task** 
<** 
IEnumerable** %
<**% &
UserBusiness**& 2
>**2 3
>**3 4
GetAllAsync**5 @
(**@ A
int**A D

pageNumber**E O
,**O P
int**Q T
pageSize**U ]
)**] ^
{++ 	
return,, 
await,, 
context,,  
.,,  !
UserBusinesses,,! /
.-- 
Skip-- 
(-- 
(-- 

pageNumber-- 
--- 
$num--  !
)--! "
*--# $
pageSize--% -
)--- .
... 
Take.. 
(.. 
pageSize.. 
).. 
.// 
ToListAsync// 
(// 
)// 
;// 
}00 	
public22 
async22 
Task22 
<22 
UserBusiness22 &
>22& '
GetByIdAsync22( 4
(224 5
Guid225 9
userBusinessId22: H
)22H I
{33 	
var44 
userBusiness44 
=44 
await44 $
context44% ,
.44, -
UserBusinesses44- ;
.44; <
	FindAsync44< E
(44E F
userBusinessId44F T
)44T U
;44U V
if55 
(55 
userBusiness55 
==55 
null55  $
)55$ %
{66 
throw77 
new77  
KeyNotFoundException77 .
(77. /
$str77/ G
)77G H
;77H I
}88 
return99 
userBusiness99 
;99  
}:: 	
public<< 
async<< 
Task<< 
<<< 
Result<<  
<<<  !
object<<! '
><<' (
><<( )
UpdateAsync<<* 5
(<<5 6
UserBusiness<<6 B
userBusiness<<C O
)<<O P
{== 	
try>> 
{?? 
var@@  
existingUserBusiness@@ (
=@@) *
await@@+ 0
context@@1 8
.@@8 9
UserBusinesses@@9 G
.@@G H
	FindAsync@@H Q
(@@Q R
userBusiness@@R ^
.@@^ _
UserId@@_ e
)@@e f
;@@f g
ifAA 
(AA  
existingUserBusinessAA (
==AA) +
nullAA, 0
)AA0 1
{BB 
returnCC 
ResultCC !
<CC! "
objectCC" (
>CC( )
.CC) *
FailureCC* 1
(CC1 2
$strCC2 J
)CCJ K
;CCK L
}DD  
existingUserBusinessGG $
.GG$ %
NameGG% )
=GG* +
userBusinessGG, 8
.GG8 9
NameGG9 =
;GG= > 
existingUserBusinessHH $
.HH$ %
EmailHH% *
=HH+ ,
userBusinessHH- 9
.HH9 :
EmailHH: ?
;HH? @ 
existingUserBusinessII $
.II$ %
PasswordII% -
=II. /
userBusinessII0 <
.II< =
PasswordII= E
;IIE F 
existingUserBusinessJJ $
.JJ$ %
UserTypeJJ% -
=JJ. /
userBusinessJJ0 <
.JJ< =
UserTypeJJ= E
;JJE F 
existingUserBusinessKK $
.KK$ %
ImageKK% *
=KK+ ,
userBusinessKK- 9
.KK9 :
ImageKK: ?
;KK? @
contextMM 
.MM 
UserBusinessesMM &
.MM& '
UpdateMM' -
(MM- . 
existingUserBusinessMM. B
)MMB C
;MMC D
awaitNN 
contextNN 
.NN 
SaveChangesAsyncNN .
(NN. /
)NN/ 0
;NN0 1
returnOO 
ResultOO 
<OO 
objectOO $
>OO$ %
.OO% &
SuccessOO& -
(OO- .
newOO. 1
objectOO2 8
(OO8 9
)OO9 :
)OO: ;
;OO; <
}PP 
catchQQ 
(QQ 
	ExceptionQQ 
exQQ 
)QQ  
{RR 
returnSS 
ResultSS 
<SS 
objectSS $
>SS$ %
.SS% &
FailureSS& -
(SS- .
exSS. 0
.SS0 1
MessageSS1 8
)SS8 9
;SS9 :
}TT 
}UU 	
}VV 
}WW èG
RD:\Repos\BuySmart\BuySmart\Infrastructure\Repositories\ReviewBusinessRepository.cs
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
}PP 	
publicQQ 
asyncQQ 
TaskQQ 
<QQ 
ReviewQQ  
>QQ  !
GetByIdAsyncQQ" .
(QQ. /
GuidQQ/ 3
reviewIdQQ4 <
)QQ< =
{RR 	
varSS 
reviewSS 
=SS 
awaitSS 
contextSS &
.SS& '
ReviewsSS' .
.SS. /
	FindAsyncSS/ 8
(SS8 9
reviewIdSS9 A
)SSA B
;SSB C
ifTT 
(TT 
reviewTT 
==TT 
nullTT 
)TT 
{UU 
throwVV 
newVV  
KeyNotFoundExceptionVV .
(VV. /
$strVV/ A
)VVA B
;VVB C
}WW 
returnXX 
reviewXX 
;XX 
}YY 	
publicZZ 
asyncZZ 
TaskZZ 
DeleteAsyncZZ %
(ZZ% &
GuidZZ& *
reviewIdZZ+ 3
)ZZ3 4
{[[ 	
var\\ 
review\\ 
=\\ 
await\\ 
context\\ &
.\\& '
Reviews\\' .
.\\. /
	FindAsync\\/ 8
(\\8 9
reviewId\\9 A
)\\A B
;\\B C
if]] 
(]] 
review]] 
==]] 
null]] 
)]] 
{^^ 
throw__ 
new__  
KeyNotFoundException__ .
(__. /
$str__/ A
)__A B
;__B C
}`` 
contextaa 
.aa 
Reviewsaa 
.aa 
Removeaa "
(aa" #
reviewaa# )
)aa) *
;aa* +
awaitbb 
contextbb 
.bb 
SaveChangesAsyncbb *
(bb* +
)bb+ ,
;bb, -
}cc 	
}ee 
}ff ¶K
KD:\Repos\BuySmart\BuySmart\Infrastructure\Repositories\ProductRepository.cs
	namespace 	
Infrastructure
 
. 
Repositories %
{		 
public

 

class

 
ProductRepository

 "
:

# $
IProductRepository

% 7
{ 
private 
readonly  
ApplicationDbContext -
context. 5
;5 6
public 
ProductRepository  
(  ! 
ApplicationDbContext! 5
context6 =
)= >
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
< 
IEnumerable %
<% &
Product& -
>- .
>. /
GetAllAsync0 ;
(; <
int< ?

pageNumber@ J
,J K
intL O
pageSizeP X
,X Y
ProductOrderZ f
orderg l
)l m
{ 	
if 
( 
order 
== 
ProductOrder %
.% &
Asc& )
)) *
{ 
return 
await 
context $
.$ %
Products% -
. 
OrderBy 
( 
p 
=> 
p 
.  
Price  %
)% &
. 
Skip 
( 
( 

pageNumber !
-" #
$num$ %
)% &
*' (
pageSize) 1
)1 2
. 
Take 
( 
pageSize 
) 
. 
Include 
( 
p 
=> 
p 
.  

Categories  *
)* +
. 
ToListAsync 
( 
) 
; 
} 
else 
if 
( 
order 
== 
ProductOrder *
.* +
Desc+ /
)/ 0
{ 
return 
await 
context $
.$ %
Products% -
. 
OrderByDescending "
(" #
p# $
=>% '
p( )
.) *
Price* /
)/ 0
.   
Skip   
(   
(   

pageNumber   !
-  " #
$num  $ %
)  % &
*  ' (
pageSize  ) 1
)  1 2
.!! 
Take!! 
(!! 
pageSize!! 
)!! 
."" 
Include"" 
("" 
p"" 
=>"" 
p"" 
.""  

Categories""  *
)""* +
.## 
ToListAsync## 
(## 
)## 
;## 
}$$ 
else%% 
{&& 
return'' 
await'' 
context'' !
.''! "
Products''" *
.(( 
OrderBy(( 
((( 
p(( 
=>(( 
p(( 
.(( 
	ProductId(( %
)((% &
.)) 
Skip)) 
()) 
()) 

pageNumber)) 
-)) 
$num))  !
)))! "
*))# $
pageSize))% -
)))- .
.** 
Take** 
(** 
pageSize** 
)** 
.++ 
Include++ 
(++ 
p++ 
=>++ 
p++ 
.++ 

Categories++ &
)++& '
.,, 
ToListAsync,, 
(,, 
),, 
;,, 
}-- 
}// 	
public11 
async11 
Task11 
<11 
Product11 !
>11! "
GetByIdAsync11# /
(11/ 0
Guid110 4
	productId115 >
)11> ?
{22 	
var33 
product33 
=33 
await33 
context33  '
.33' (
Products33( 0
.330 1
	FindAsync331 :
(33: ;
	productId33; D
)33D E
;33E F
if44 
(44 
product44 
==44 
null44 
)44  
{55 
throw66 
new66  
KeyNotFoundException66 .
(66. /
$str66/ B
)66B C
;66C D
}77 
return88 
product88 
;88 
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
(;;0 1
Product;;1 8
product;;9 @
);;@ A
{<< 	
try== 
{>> 
await?? 
context?? 
.?? 
Products?? &
.??& '
AddAsync??' /
(??/ 0
product??0 7
)??7 8
;??8 9
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
(AA+ ,
productAA, 3
.AA3 4
	ProductIdAA4 =
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
}II 	
publicKK 
asyncKK 
TaskKK 
<KK 
ResultKK  
<KK  !
objectKK! '
>KK' (
>KK( )
UpdateAsyncKK* 5
(KK5 6
ProductKK6 =
productKK> E
)KKE F
{LL 	
tryMM 
{NN 
varOO 
existingProductOO #
=OO$ %
awaitOO& +
contextOO, 3
.OO3 4
ProductsOO4 <
.OO< =
	FindAsyncOO= F
(OOF G
productOOG N
.OON O
	ProductIdOOO X
)OOX Y
;OOY Z
ifPP 
(PP 
existingProductPP #
==PP$ &
nullPP' +
)PP+ ,
{QQ 
returnRR 
ResultRR !
<RR! "
objectRR" (
>RR( )
.RR) *
FailureRR* 1
(RR1 2
$strRR2 E
)RRE F
;RRF G
}SS 
existingProductTT 
.TT  
NameTT  $
=TT% &
productTT' .
.TT. /
NameTT/ 3
;TT3 4
existingProductUU 
.UU  
DescriptionUU  +
=UU, -
productUU. 5
.UU5 6
DescriptionUU6 A
;UUA B
existingProductVV 
.VV  
PriceVV  %
=VV& '
productVV( /
.VV/ 0
PriceVV0 5
;VV5 6
existingProductWW 
.WW  
StockWW  %
=WW& '
productWW( /
.WW/ 0
StockWW0 5
;WW5 6
existingProductXX 
.XX  
RatingXX  &
=XX' (
productXX) 0
.XX0 1
RatingXX1 7
;XX7 8
existingProductYY 
.YY  
ImageYY  %
=YY& '
productYY( /
.YY/ 0
ImageYY0 5
;YY5 6
existingProductZZ 
.ZZ  

BusinessIdZZ  *
=ZZ+ ,
productZZ- 4
.ZZ4 5

BusinessIdZZ5 ?
;ZZ? @
context[[ 
.[[ 
Products[[  
.[[  !
Update[[! '
([[' (
existingProduct[[( 7
)[[7 8
;[[8 9
await\\ 
context\\ 
.\\ 
SaveChangesAsync\\ .
(\\. /
)\\/ 0
;\\0 1
return]] 
Result]] 
<]] 
object]] $
>]]$ %
.]]% &
Success]]& -
(]]- .
new]]. 1
object]]2 8
(]]8 9
)]]9 :
)]]: ;
;]]; <
}__ 
catch`` 
(`` 
	Exception`` 
ex`` 
)``  
{aa 
returnbb 
Resultbb 
<bb 
objectbb $
>bb$ %
.bb% &
Failurebb& -
(bb- .
exbb. 0
.bb0 1
Messagebb1 8
)bb8 9
;bb9 :
}dd 
}ee 	
publicgg 
asyncgg 
Taskgg 
DeleteAsyncgg %
(gg% &
Guidgg& *
	productIdgg+ 4
)gg4 5
{hh 	
varii 
productii 
=ii 
awaitii 
contextii  '
.ii' (
Productsii( 0
.ii0 1
	FindAsyncii1 :
(ii: ;
	productIdii; D
)iiD E
;iiE F
ifjj 
(jj 
productjj 
==jj 
nulljj 
)jj  
{kk 
throwll 
newll  
KeyNotFoundExceptionll .
(ll. /
$strll/ B
)llB C
;llC D
}mm 
contextnn 
.nn 
Productsnn 
.nn 
Removenn #
(nn# $
productnn$ +
)nn+ ,
;nn, -
awaitoo 
contextoo 
.oo 
SaveChangesAsyncoo *
(oo* +
)oo+ ,
;oo, -
}pp 	
}qq 
}rr ﬁ*
LD:\Repos\BuySmart\BuySmart\Infrastructure\Repositories\CategoryRepository.cs
	namespace 	
Infrastructure
 
. 
Repositories %
{ 
public 

class 
CategoryRepository #
:$ %
ICategoryRepository& 9
{		 
private

 
readonly

  
ApplicationDbContext

 -
context

. 5
;

5 6
public 
CategoryRepository !
(! " 
ApplicationDbContext" 6
context7 >
)> ?
{ 	
this 
. 
context 
= 
context "
;" #
} 	
public 
async 
Task 
< 
IEnumerable %
<% &
Category& .
>. /
>/ 0
GetAllAsync1 <
(< =
)= >
{ 	
return 
await 
context  
.  !

Categories! +
.+ ,
ToListAsync, 7
(7 8
)8 9
;9 :
} 	
public 
async 
Task 
< 
Category "
>" #
GetByIdAsync$ 0
(0 1
Guid1 5

categoryId6 @
)@ A
{ 	
var 
category 
= 
await  
context! (
.( )

Categories) 3
.3 4
	FindAsync4 =
(= >

categoryId> H
)H I
;I J
if 
( 
category 
== 
null  
)  !
{ 
throw 
new  
KeyNotFoundException .
(. /
$str/ C
)C D
;D E
} 
return 
category 
; 
} 	
public 
async 
Task 
< 
IEnumerable %
<% &
Category& .
>. /
>/ 0
GetByNamesAsync1 @
(@ A
ListA E
<E F
stringF L
>L M
namesN S
)S T
{ 	
return 
await 
context  
.  !

Categories! +
.   
Where   
(   
c   
=>   
names   !
.  ! "
Contains  " *
(  * +
c  + ,
.  , -
Name  - 1
)  1 2
)  2 3
.!! 
ToListAsync!! 
(!! 
)!! 
;!! 
}"" 	
public## 
async## 
Task## 
<## 
Guid## 
>## 
AddAsync##  (
(##( )
Category##) 1
category##2 :
)##: ;
{$$ 	
await%% 
context%% 
.%% 

Categories%% $
.%%$ %
AddAsync%%% -
(%%- .
category%%. 6
)%%6 7
;%%7 8
await&& 
context&& 
.&& 
SaveChangesAsync&& *
(&&* +
)&&+ ,
;&&, -
return'' 
category'' 
.'' 

CategoryId'' &
;''& '
}(( 	
public)) 
async)) 
Task)) 
UpdateAsync)) %
())% &
Category))& .
category))/ 7
)))7 8
{** 	
var++ 
existingCategory++  
=++! "
await++# (
context++) 0
.++0 1

Categories++1 ;
.++; <
	FindAsync++< E
(++E F
category++F N
.++N O

CategoryId++O Y
)++Y Z
;++Z [
if,, 
(,, 
existingCategory,,  
==,,! #
null,,$ (
),,( )
{-- 
throw.. 
new..  
KeyNotFoundException.. .
(... /
$str../ C
)..C D
;..D E
}// 
context00 
.00 
Entry00 
(00 
existingCategory00 *
)00* +
.00+ ,
CurrentValues00, 9
.009 :
	SetValues00: C
(00C D
category00D L
)00L M
;00M N
await11 
context11 
.11 
SaveChangesAsync11 *
(11* +
)11+ ,
;11, -
}22 	
public33 
async33 
Task33 
DeleteAsync33 %
(33% &
Guid33& *

categoryId33+ 5
)335 6
{44 	
var55 
category55 
=55 
await55  
context55! (
.55( )

Categories55) 3
.553 4
	FindAsync554 =
(55= >

categoryId55> H
)55H I
;55I J
if66 
(66 
category66 
==66 
null66  
)66  !
{77 
throw88 
new88  
KeyNotFoundException88 .
(88. /
$str88/ C
)88C D
;88D E
}99 
context:: 
.:: 

Categories:: 
.:: 
Remove:: %
(::% &
category::& .
)::. /
;::/ 0
await;; 
context;; 
.;; 
SaveChangesAsync;; *
(;;* +
);;+ ,
;;;, -
}<< 	
}>> 
}?? ∑
HD:\Repos\BuySmart\BuySmart\Infrastructure\Repositories\CartRepository.cs
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
}99 Ô8
LD:\Repos\BuySmart\BuySmart\Infrastructure\Repositories\BusinessRepository.cs
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
public 
async 
Task 
< 
Business "
>" #
GetByIdAsync$ 0
(0 1
Guid1 5

businessId6 @
)@ A
{ 	
var 
business 
= 
await  
context! (
.( )

Businesses) 3
.3 4
	FindAsync4 =
(= >

businessId> H
)H I
;I J
if 
( 
business 
== 
null  
)  !
{ 
throw 
new  
KeyNotFoundException .
(. /
$str/ C
)C D
;D E
} 
return 
business 
; 
} 	
public!! 
async!! 
Task!! 
<!! 
Result!!  
<!!  !
Guid!!! %
>!!% &
>!!& '
AddAsync!!( 0
(!!0 1
Business!!1 9
business!!: B
)!!B C
{"" 	
try$$ 
{%% 
var&& 

userExists&& 
=&&  
await&&! &
context&&' .
.&&. /
Users&&/ 4
.&&4 5
AnyAsync&&5 =
(&&= >
u&&> ?
=>&&@ B
u&&C D
.&&D E
UserId&&E K
==&&L N
business&&O W
.&&W X
UserBusinessId&&X f
)&&f g
;&&g h
if'' 
('' 
!'' 

userExists'' 
)''  
{(( 
return)) 
Result)) !
<))! "
Guid))" &
>))& '
.))' (
Failure))( /
())/ 0
$str))0 P
)))P Q
;))Q R
}** 
await,, 
context,, 
.,, 

Businesses,, (
.,,( )
AddAsync,,) 1
(,,1 2
business,,2 :
),,: ;
;,,; <
await-- 
context-- 
.-- 
SaveChangesAsync-- .
(--. /
)--/ 0
;--0 1
return.. 
Result.. 
<.. 
Guid.. "
>.." #
...# $
Success..$ +
(..+ ,
business.., 4
...4 5

BusinessID..5 ?
)..? @
;..@ A
}// 
catch00 
(00 
	Exception00 
ex00 
)00  
{11 
return22 
Result22 
<22 
Guid22 "
>22" #
.22# $
Failure22$ +
(22+ ,
ex22, .
.22. /
Message22/ 6
)226 7
;227 8
}33 
}44 	
public66 
async66 
Task66 
<66 
Result66  
<66  !
object66! '
>66' (
>66( )
UpdateAsync66* 5
(665 6
Business666 >
business66? G
)66G H
{77 	
try88 
{99 
var:: 
existingBusiness:: $
=::% &
await::' ,
context::- 4
.::4 5

Businesses::5 ?
.::? @
	FindAsync::@ I
(::I J
business::J R
.::R S

BusinessID::S ]
)::] ^
;::^ _
if;; 
(;; 
existingBusiness;; $
==;;% '
null;;( ,
);;, -
{<< 
return== 
Result== !
<==! "
object==" (
>==( )
.==) *
Failure==* 1
(==1 2
$str==2 F
)==F G
;==G H
}>> 
existingBusinessAA  
.AA  !
NameAA! %
=AA& '
businessAA( 0
.AA0 1
NameAA1 5
;AA5 6
existingBusinessBB  
.BB  !
AddressBB! (
=BB) *
businessBB+ 3
.BB3 4
AddressBB4 ;
;BB; <
existingBusinessCC  
.CC  !
PhoneNumberCC! ,
=CC- .
businessCC/ 7
.CC7 8
PhoneNumberCC8 C
;CCC D
existingBusinessDD  
.DD  !
DescriptionDD! ,
=DD- .
businessDD/ 7
.DD7 8
DescriptionDD8 C
;DDC D
contextGG 
.GG 

BusinessesGG "
.GG" #
UpdateGG# )
(GG) *
existingBusinessGG* :
)GG: ;
;GG; <
awaitHH 
contextHH 
.HH 
SaveChangesAsyncHH .
(HH. /
)HH/ 0
;HH0 1
returnII 
ResultII 
<II 
objectII $
>II$ %
.II% &
SuccessII& -
(II- .
newII. 1
objectII2 8
(II8 9
)II9 :
)II: ;
;II; <
}JJ 
catchKK 
(KK 
	ExceptionKK 
exKK 
)KK  
{LL 
returnMM 
ResultMM 
<MM 
objectMM $
>MM$ %
.MM% &
FailureMM& -
(MM- .
exMM. 0
.MM0 1
MessageMM1 8
)MM8 9
;MM9 :
}NN 
}OO 	
publicQQ 
asyncQQ 
TaskQQ 
DeleteAsyncQQ %
(QQ% &
GuidQQ& *

businessIdQQ+ 5
)QQ5 6
{RR 	
varSS 
businessSS 
=SS 
awaitSS  
contextSS! (
.SS( )

BusinessesSS) 3
.SS3 4
	FindAsyncSS4 =
(SS= >

businessIdSS> H
)SSH I
;SSI J
ifTT 
(TT 
businessTT 
==TT 
nullTT  
)TT  !
{UU 
throwVV 
newVV  
KeyNotFoundExceptionVV .
(VV. /
$strVV/ C
)VVC D
;VVD E
}WW 
contextYY 
.YY 

BusinessesYY 
.YY 
RemoveYY %
(YY% &
businessYY& .
)YY. /
;YY/ 0
awaitZZ 
contextZZ 
.ZZ 
SaveChangesAsyncZZ *
(ZZ* +
)ZZ+ ,
;ZZ, -
}[[ 	
}^^ 
}__ ú∞
MD:\Repos\BuySmart\BuySmart\Infrastructure\Persistence\ApplicationDbContext.cs
	namespace 	
Infrastructure
 
. 
Persistence $
{ 
public 

class  
ApplicationDbContext %
:& '
	DbContext( 1
{ 
private 
const 
string 
UuidGenerateV4 +
=, -
$str. B
;B C
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
{

 	
} 	
public 
DbSet 
< 
Product 
> 
Products &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
public 
DbSet 
< 
Category 
> 

Categories )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
public 
DbSet 
< 
Cart 
> 
Carts  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
DbSet 
< 
User 
> 
Users  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
DbSet 
< 
	OrderItem 
> 

OrderItems  *
{+ ,
get- 0
;0 1
set2 5
;5 6
}7 8
public 
DbSet 
< 
Review 
> 
Reviews $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 
DbSet 
< 
Business 
> 

Businesses )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
public 
DbSet 
< 
Order 
> 
Orders "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
DbSet 
< 
Recommendation #
># $
Recommendations% 4
{5 6
get7 :
;: ;
set< ?
;? @
}A B
public 
DbSet 
< 
History 
> 
	Histories '
{( )
get* -
;- .
set/ 2
;2 3
}4 5
public 
DbSet 
< 
UserBusiness !
>! "
UserBusinesses# 1
{2 3
get4 7
;7 8
set9 <
;< =
}> ?
public 
DbSet 
< 

UserClient 
>  
UserClients! ,
{- .
get/ 2
;2 3
set4 7
;7 8
}9 :
	protected 
override 
void 
OnModelCreating  /
(/ 0
ModelBuilder0 <
modelBuilder= I
)I J
{ 	
modelBuilder 
.  
HasPostgresExtension -
(- .
$str. 9
)9 :
;: ;
modelBuilder 
. 
Entity 
<  
User  $
>$ %
(% &
)& '
. 
HasKey 
( 
u 
=> 
u 
. 
UserId %
)% &
;& '
modelBuilder!! 
.!! 
Entity!! 
<!!  
User!!  $
>!!$ %
(!!% &
)!!& '
."" 
HasIndex"" 
("" 
u"" 
=>"" 
u""  
.""  !
Email""! &
)""& '
.## 
IsUnique## 
(## 
)## 
;## 
modelBuilder%% 
.%% 
Entity%% 
<%%  
UserBusiness%%  ,
>%%, -
(%%- .
entity%%. 4
=>%%5 7
{&& 
entity'' 
.'' 
ToTable'' 
('' 
$str'' /
)''/ 0
;''0 1
entity(( 
.(( 
HasBaseType(( "
<((" #
User((# '
>((' (
(((( )
)(() *
;((* +
entity)) 
.)) 
Property)) 
())  
e))  !
=>))" $
e))% &
.))& '
UserId))' -
)))- .
.** 
HasColumnType** "
(**" #
$str**# )
)**) *
.++ 
HasDefaultValueSql++ '
(++' (
UuidGenerateV4++( 6
)++6 7
.,, 
ValueGeneratedOnAdd,, (
(,,( )
),,) *
;,,* +
entity-- 
.-- 
Property-- 
(--  
e--  !
=>--" $
e--% &
.--& '
Name--' +
)--+ ,
... 

IsRequired.. 
(..  
)..  !
.// 
HasMaxLength// !
(//! "
$num//" %
)//% &
;//& '
entity00 
.00 
Property00 
(00  
e00  !
=>00" $
e00% &
.00& '
Email00' ,
)00, -
.11 

IsRequired11 
(11  
)11  !
.22 
HasMaxLength22 !
(22! "
$num22" %
)22% &
;22& '
entity33 
.33 
Property33 
(33  
e33  !
=>33" $
e33% &
.33& '
Password33' /
)33/ 0
.44 

IsRequired44 
(44  
)44  !
.55 
HasMaxLength55 !
(55! "
$num55" %
)55% &
;55& '
entity66 
.66 
Property66 
(66  
e66  !
=>66" $
e66% &
.66& '
UserType66' /
)66/ 0
.77 

IsRequired77 
(77  
)77  !
;77! "
entity88 
.88 
Property88 
(88  
e88  !
=>88" $
e88% &
.88& '
Image88' ,
)88, -
.99 
HasMaxLength99 !
(99! "
$num99" %
)99% &
;99& '
entity:: 
.:: 
HasOne:: 
(:: 
ub::  
=>::! #
ub::$ &
.::& '
Business::' /
)::/ 0
.;; 
WithOne;; 
(;; 
b;; 
=>;; !
b;;" #
.;;# $
UserBusiness;;$ 0
);;0 1
.<< 
HasForeignKey<< "
<<<" #
Business<<# +
><<+ ,
(<<, -
b<<- .
=><</ 1
b<<2 3
.<<3 4
UserBusinessId<<4 B
)<<B C
.== 

IsRequired== 
(==  
)==  !
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
;?? 
modelBuilderAA 
.AA 
EntityAA 
<AA  
BusinessAA  (
>AA( )
(AA) *
entityAA* 0
=>AA1 3
{BB 
entityCC 
.CC 
ToTableCC 
(CC 
$strCC +
)CC+ ,
;CC, -
entityEE 
.EE 
HasKeyEE 
(EE 
bEE 
=>EE  "
bEE# $
.EE$ %

BusinessIDEE% /
)EE/ 0
;EE0 1
entityGG 
.GG 
PropertyGG 
(GG  
bGG  !
=>GG" $
bGG% &
.GG& '
NameGG' +
)GG+ ,
.HH 

IsRequiredHH 
(HH  
)HH  !
.II 
HasMaxLengthII !
(II! "
$numII" %
)II% &
;II& '
entityKK 
.KK 
PropertyKK 
(KK  
bKK  !
=>KK" $
bKK% &
.KK& '
DescriptionKK' 2
)KK2 3
.LL 
HasMaxLengthLL !
(LL! "
$numLL" %
)LL% &
;LL& '
entityNN 
.NN 
PropertyNN 
(NN  
bNN  !
=>NN" $
bNN% &
.NN& '
AddressNN' .
)NN. /
.OO 
HasMaxLengthOO !
(OO! "
$numOO" %
)OO% &
;OO& '
entityQQ 
.QQ 
PropertyQQ 
(QQ  
bQQ  !
=>QQ" $
bQQ% &
.QQ& '
PhoneNumberQQ' 2
)QQ2 3
.RR 
HasMaxLengthRR !
(RR! "
$numRR" $
)RR$ %
;RR% &
entityTT 
.TT 
HasManyTT 
(TT 
bTT  
=>TT! #
bTT$ %
.TT% &
ProductsTT& .
)TT. /
.UU 
WithOneUU 
(UU 
pUU 
=>UU !
pUU" #
.UU# $
BusinessUU$ ,
)UU, -
.VV 
HasForeignKeyVV "
(VV" #
pVV# $
=>VV% '
pVV( )
.VV) *

BusinessIdVV* 4
)VV4 5
.WW 

IsRequiredWW 
(WW  
)WW  !
.XX 
OnDeleteXX 
(XX 
DeleteBehaviorXX ,
.XX, -
CascadeXX- 4
)XX4 5
;XX5 6
entity[[ 
.[[ 
HasMany[[ 
([[ 
b[[  
=>[[! #
b[[$ %
.[[% &
Reviews[[& -
)[[- .
.\\ 
WithOne\\ 
(\\ 
r\\ 
=>\\ !
r\\" #
.\\# $
Business\\$ ,
)\\, -
.]] 
HasForeignKey]] "
(]]" #
r]]# $
=>]]% '
r]]( )
.]]) *

BusinessId]]* 4
)]]4 5
.^^ 
OnDelete^^ 
(^^ 
DeleteBehavior^^ ,
.^^, -
Cascade^^- 4
)^^4 5
;^^5 6
entityaa 
.aa 
HasManyaa 
(aa 
baa  
=>aa! #
baa$ %
.aa% &
Ordersaa& ,
)aa, -
.bb 
WithOnebb 
(bb 
obb 
=>bb !
obb" #
.bb# $
Businessbb$ ,
)bb, -
.cc 
HasForeignKeycc "
(cc" #
occ# $
=>cc% '
occ( )
.cc) *

BusinessIdcc* 4
)cc4 5
.dd 

IsRequireddd 
(dd  
)dd  !
.ee 
OnDeleteee 
(ee 
DeleteBehavioree ,
.ee, -
Cascadeee- 4
)ee4 5
;ee5 6
}ff 
)ff 
;ff 
modelBuilderhh 
.hh 
Entityhh 
<hh  

UserClienthh  *
>hh* +
(hh+ ,
entityhh, 2
=>hh3 5
{ii 
entityjj 
.jj 
ToTablejj 
(jj 
$strjj ,
)jj, -
;jj- .
entitykk 
.kk 
HasBaseTypekk "
<kk" #
Userkk# '
>kk' (
(kk( )
)kk) *
;kk* +
entityll 
.ll 
Propertyll 
(ll  
ell  !
=>ll" $
ell% &
.ll& '
UserIdll' -
)ll- .
.mm 
HasColumnTypemm "
(mm" #
$strmm# )
)mm) *
.nn 
HasDefaultValueSqlnn '
(nn' (
UuidGenerateV4nn( 6
)nn6 7
.oo 
ValueGeneratedOnAddoo (
(oo( )
)oo) *
;oo* +
entitypp 
.pp 
Propertypp 
(pp  
epp  !
=>pp" $
epp% &
.pp& '
Namepp' +
)pp+ ,
.qq 

IsRequiredqq 
(qq  
)qq  !
.rr 
HasMaxLengthrr !
(rr! "
$numrr" %
)rr% &
;rr& '
entityss 
.ss 
Propertyss 
(ss  
ess  !
=>ss" $
ess% &
.ss& '
Emailss' ,
)ss, -
.tt 

IsRequiredtt 
(tt  
)tt  !
.uu 
HasMaxLengthuu !
(uu! "
$numuu" %
)uu% &
;uu& '
entityvv 
.vv 
Propertyvv 
(vv  
evv  !
=>vv" $
evv% &
.vv& '
Passwordvv' /
)vv/ 0
.ww 

IsRequiredww 
(ww  
)ww  !
.xx 
HasMaxLengthxx !
(xx! "
$numxx" %
)xx% &
;xx& '
entityyy 
.yy 
Propertyyy 
(yy  
eyy  !
=>yy" $
eyy% &
.yy& '
UserTypeyy' /
)yy/ 0
.zz 

IsRequiredzz 
(zz  
)zz  !
;zz! "
entity{{ 
.{{ 
Property{{ 
({{  
e{{  !
=>{{" $
e{{% &
.{{& '
Image{{' ,
){{, -
.|| 
HasMaxLength|| !
(||! "
$num||" %
)||% &
;||& '
entity~~ 
.~~ 
HasMany~~ 
(~~ 
uc~~ !
=>~~" $
uc~~% '
.~~' (
Orders~~( .
)~~. /
. 
WithOne 
( 
o 
=> !
o" #
.# $

UserClient$ .
). /
.
ÄÄ 
HasForeignKey
ÄÄ "
(
ÄÄ" #
o
ÄÄ# $
=>
ÄÄ% '
o
ÄÄ( )
.
ÄÄ) *
UserClientId
ÄÄ* 6
)
ÄÄ6 7
.
ÅÅ 

IsRequired
ÅÅ 
(
ÅÅ  
)
ÅÅ  !
.
ÇÇ 
OnDelete
ÇÇ 
(
ÇÇ 
DeleteBehavior
ÇÇ ,
.
ÇÇ, -
Cascade
ÇÇ- 4
)
ÇÇ4 5
;
ÇÇ5 6
entity
ÑÑ 
.
ÑÑ 
HasMany
ÑÑ 
(
ÑÑ 
uc
ÑÑ !
=>
ÑÑ" $
uc
ÑÑ% '
.
ÑÑ' (
Reviews
ÑÑ( /
)
ÑÑ/ 0
.
ÖÖ 
WithOne
ÖÖ 
(
ÖÖ 
r
ÖÖ 
=>
ÖÖ !
r
ÖÖ" #
.
ÖÖ# $

UserClient
ÖÖ$ .
)
ÖÖ. /
.
ÜÜ 
HasForeignKey
ÜÜ "
(
ÜÜ" #
r
ÜÜ# $
=>
ÜÜ% '
r
ÜÜ( )
.
ÜÜ) *
UserClientId
ÜÜ* 6
)
ÜÜ6 7
.
áá 

IsRequired
áá 
(
áá  
)
áá  !
.
àà 
OnDelete
àà 
(
àà 
DeleteBehavior
àà ,
.
àà, -
Cascade
àà- 4
)
àà4 5
;
àà5 6
entity
ää 
.
ää 
HasMany
ää 
(
ää 
uc
ää !
=>
ää" $
uc
ää% '
.
ää' (
	Histories
ää( 1
)
ää1 2
.
ãã 
WithOne
ãã 
(
ãã 
h
ãã 
=>
ãã !
h
ãã" #
.
ãã# $

UserClient
ãã$ .
)
ãã. /
.
åå 
HasForeignKey
åå "
(
åå" #
h
åå# $
=>
åå% '
h
åå( )
.
åå) *
UserClientId
åå* 6
)
åå6 7
.
çç 

IsRequired
çç 
(
çç  
)
çç  !
.
éé 
OnDelete
éé 
(
éé 
DeleteBehavior
éé ,
.
éé, -
Cascade
éé- 4
)
éé4 5
;
éé5 6
entity
êê 
.
êê 
HasMany
êê 
(
êê 
uc
êê !
=>
êê" $
uc
êê% '
.
êê' (
Recommendations
êê( 7
)
êê7 8
.
ëë 
WithOne
ëë 
(
ëë 
r
ëë 
=>
ëë !
r
ëë" #
.
ëë# $

UserClient
ëë$ .
)
ëë. /
.
íí 
HasForeignKey
íí "
(
íí" #
r
íí# $
=>
íí% '
r
íí( )
.
íí) *
UserClientId
íí* 6
)
íí6 7
.
ìì 

IsRequired
ìì 
(
ìì  
)
ìì  !
.
îî 
OnDelete
îî 
(
îî 
DeleteBehavior
îî ,
.
îî, -
Cascade
îî- 4
)
îî4 5
;
îî5 6
entity
ññ 
.
ññ 
HasOne
ññ 
(
ññ 
uc
ññ  
=>
ññ! #
uc
ññ$ &
.
ññ& '
Cart
ññ' +
)
ññ+ ,
.
óó 
WithOne
óó 
(
óó 
c
óó 
=>
óó !
c
óó" #
.
óó# $

UserClient
óó$ .
)
óó. /
.
òò 
HasForeignKey
òò "
<
òò" #
Cart
òò# '
>
òò' (
(
òò( )
c
òò) *
=>
òò+ -
c
òò. /
.
òò/ 0
UserClientId
òò0 <
)
òò< =
.
ôô 

IsRequired
ôô 
(
ôô  
)
ôô  !
.
öö 
OnDelete
öö 
(
öö 
DeleteBehavior
öö ,
.
öö, -
Cascade
öö- 4
)
öö4 5
;
öö5 6
}
õõ 
)
õõ 
;
õõ 
modelBuilder
ùù 
.
ùù 
Entity
ùù 
<
ùù  
Product
ùù  '
>
ùù' (
(
ùù( )
entity
ùù) /
=>
ùù0 2
{
ûû 
entity
üü 
.
üü 
ToTable
üü 
(
üü 
$str
üü )
)
üü) *
;
üü* +
entity
†† 
.
†† 
HasKey
†† 
(
†† 
e
†† 
=>
††  "
e
††# $
.
††$ %
	ProductId
††% .
)
††. /
;
††/ 0
entity
°° 
.
°° 
Property
°° 
(
°°  
e
°°  !
=>
°°" $
e
°°% &
.
°°& '
	ProductId
°°' 0
)
°°0 1
.
¢¢ 
HasColumnType
¢¢ "
(
¢¢" #
$str
¢¢# )
)
¢¢) *
.
££  
HasDefaultValueSql
££ '
(
££' (
UuidGenerateV4
££( 6
)
££6 7
.
§§ !
ValueGeneratedOnAdd
§§ (
(
§§( )
)
§§) *
;
§§* +
entity
•• 
.
•• 
Property
•• 
(
••  
e
••  !
=>
••" $
e
••% &
.
••& '
Name
••' +
)
••+ ,
.
¶¶ 

IsRequired
¶¶ 
(
¶¶  
)
¶¶  !
.
ßß 
HasMaxLength
ßß !
(
ßß! "
$num
ßß" %
)
ßß% &
;
ßß& '
entity
®® 
.
®® 
Property
®® 
(
®®  
e
®®  !
=>
®®" $
e
®®% &
.
®®& '
Description
®®' 2
)
®®2 3
.
©© 

IsRequired
©© 
(
©©  
)
©©  !
.
™™ 
HasMaxLength
™™ !
(
™™! "
$num
™™" &
)
™™& '
;
™™' (
entity
´´ 
.
´´ 
Property
´´ 
(
´´  
e
´´  !
=>
´´" $
e
´´% &
.
´´& '
Price
´´' ,
)
´´, -
.
¨¨ 

IsRequired
¨¨ 
(
¨¨  
)
¨¨  !
.
≠≠ 
HasColumnType
≠≠ "
(
≠≠" #
$str
≠≠# 2
)
≠≠2 3
;
≠≠3 4
entity
ÆÆ 
.
ÆÆ 
Property
ÆÆ 
(
ÆÆ  
e
ÆÆ  !
=>
ÆÆ" $
e
ÆÆ% &
.
ÆÆ& '
Stock
ÆÆ' ,
)
ÆÆ, -
.
ØØ 

IsRequired
ØØ 
(
ØØ  
)
ØØ  !
;
ØØ! "
entity
∞∞ 
.
∞∞ 
Property
∞∞ 
(
∞∞  
e
∞∞  !
=>
∞∞" $
e
∞∞% &
.
∞∞& '
Rating
∞∞' -
)
∞∞- .
.
±± 

IsRequired
±± 
(
±±  
)
±±  !
;
±±! "
entity
≤≤ 
.
≤≤ 
Property
≤≤ 
(
≤≤  
e
≤≤  !
=>
≤≤" $
e
≤≤% &
.
≤≤& '
Image
≤≤' ,
)
≤≤, -
.
≥≥ 
HasMaxLength
≥≥ !
(
≥≥! "
$num
≥≥" %
)
≥≥% &
.
¥¥ 

IsRequired
¥¥ 
(
¥¥  
)
¥¥  !
;
¥¥! "
entity
∑∑ 
.
∑∑ 
HasMany
∑∑ 
(
∑∑ 
e
∑∑  
=>
∑∑! #
e
∑∑$ %
.
∑∑% &

Categories
∑∑& 0
)
∑∑0 1
.
∏∏ 
WithMany
∏∏ 
(
∏∏ 
p
∏∏ 
=>
∏∏  "
p
∏∏# $
.
∏∏$ %
Products
∏∏% -
)
∏∏- .
.
ππ 
UsingEntity
ππ  
(
ππ  !
j
ππ! "
=>
ππ# %
j
ππ& '
.
ππ' (
ToTable
ππ( /
(
ππ/ 0
$str
ππ0 C
)
ππC D
)
ππD E
;
ππE F
entity
ªª 
.
ªª 
HasMany
ªª 
(
ªª 
e
ªª  
=>
ªª! #
e
ªª$ %
.
ªª% &

OrderItems
ªª& 0
)
ªª0 1
.
ºº 
WithOne
ºº 
(
ºº 
i
ºº 
=>
ºº !
i
ºº" #
.
ºº# $
Product
ºº$ +
)
ºº+ ,
.
ΩΩ 
HasForeignKey
ΩΩ "
(
ΩΩ" #
i
ΩΩ# $
=>
ΩΩ% '
i
ΩΩ( )
.
ΩΩ) *
	ProductId
ΩΩ* 3
)
ΩΩ3 4
.
ææ 

IsRequired
ææ 
(
ææ  
)
ææ  !
.
øø 
OnDelete
øø 
(
øø 
DeleteBehavior
øø ,
.
øø, -
Cascade
øø- 4
)
øø4 5
;
øø5 6
entity
¡¡ 
.
¡¡ 
HasMany
¡¡ 
(
¡¡ 
e
¡¡  
=>
¡¡! #
e
¡¡$ %
.
¡¡% &
Reviews
¡¡& -
)
¡¡- .
.
¬¬ 
WithOne
¬¬ 
(
¬¬ 
r
¬¬ 
=>
¬¬ !
r
¬¬" #
.
¬¬# $
Product
¬¬$ +
)
¬¬+ ,
.
√√ 
HasForeignKey
√√ "
(
√√" #
r
√√# $
=>
√√% '
r
√√( )
.
√√) *
	ProductId
√√* 3
)
√√3 4
.
ƒƒ 
OnDelete
ƒƒ 
(
ƒƒ 
DeleteBehavior
ƒƒ ,
.
ƒƒ, -
Cascade
ƒƒ- 4
)
ƒƒ4 5
;
ƒƒ5 6
entity
∆∆ 
.
∆∆ 
HasMany
∆∆ 
(
∆∆ 
e
∆∆  
=>
∆∆! #
e
∆∆$ %
.
∆∆% &
	Histories
∆∆& /
)
∆∆/ 0
.
«« 
WithOne
«« 
(
«« 
h
«« 
=>
«« !
h
««" #
.
««# $
Product
««$ +
)
««+ ,
.
»» 
HasForeignKey
»» "
(
»»" #
h
»»# $
=>
»»% '
h
»»( )
.
»») *
	ProductId
»»* 3
)
»»3 4
.
…… 

IsRequired
…… 
(
……  
)
……  !
.
   
OnDelete
   
(
   
DeleteBehavior
   ,
.
  , -
Cascade
  - 4
)
  4 5
;
  5 6
entity
ÃÃ 
.
ÃÃ 
HasMany
ÃÃ 
(
ÃÃ 
e
ÃÃ  
=>
ÃÃ! #
e
ÃÃ$ %
.
ÃÃ% &
Recommendations
ÃÃ& 5
)
ÃÃ5 6
.
ÕÕ 
WithOne
ÕÕ 
(
ÕÕ 
r
ÕÕ 
=>
ÕÕ !
r
ÕÕ" #
.
ÕÕ# $
Product
ÕÕ$ +
)
ÕÕ+ ,
.
ŒŒ 
HasForeignKey
ŒŒ "
(
ŒŒ" #
r
ŒŒ# $
=>
ŒŒ% '
r
ŒŒ( )
.
ŒŒ) *
	ProductId
ŒŒ* 3
)
ŒŒ3 4
.
œœ 

IsRequired
œœ 
(
œœ  
)
œœ  !
.
–– 
OnDelete
–– 
(
–– 
DeleteBehavior
–– ,
.
––, -
Cascade
––- 4
)
––4 5
;
––5 6
}
—— 
)
—— 
;
—— 
modelBuilder
”” 
.
”” 
Entity
”” 
<
””  
Category
””  (
>
””( )
(
””) *
entity
””* 0
=>
””1 3
{
‘‘ 
entity
’’ 
.
’’ 
ToTable
’’ 
(
’’ 
$str
’’ +
)
’’+ ,
;
’’, -
entity
÷÷ 
.
÷÷ 
HasKey
÷÷ 
(
÷÷ 
e
÷÷ 
=>
÷÷  "
e
÷÷# $
.
÷÷$ %

CategoryId
÷÷% /
)
÷÷/ 0
;
÷÷0 1
entity
◊◊ 
.
◊◊ 
Property
◊◊ 
(
◊◊  
e
◊◊  !
=>
◊◊" $
e
◊◊% &
.
◊◊& '

CategoryId
◊◊' 1
)
◊◊1 2
.
ÿÿ 
HasColumnType
ÿÿ "
(
ÿÿ" #
$str
ÿÿ# )
)
ÿÿ) *
.
ŸŸ  
HasDefaultValueSql
ŸŸ '
(
ŸŸ' (
UuidGenerateV4
ŸŸ( 6
)
ŸŸ6 7
.
⁄⁄ !
ValueGeneratedOnAdd
⁄⁄ (
(
⁄⁄( )
)
⁄⁄) *
;
⁄⁄* +
entity
€€ 
.
€€ 
Property
€€ 
(
€€  
e
€€  !
=>
€€" $
e
€€% &
.
€€& '
Name
€€' +
)
€€+ ,
.
‹‹ 

IsRequired
‹‹ 
(
‹‹  
)
‹‹  !
.
›› 
HasMaxLength
›› !
(
››! "
$num
››" %
)
››% &
;
››& '
entity
ﬁﬁ 
.
ﬁﬁ 
Property
ﬁﬁ 
(
ﬁﬁ  
e
ﬁﬁ  !
=>
ﬁﬁ" $
e
ﬁﬁ% &
.
ﬁﬁ& '
Description
ﬁﬁ' 2
)
ﬁﬁ2 3
.
ﬂﬂ 

IsRequired
ﬂﬂ 
(
ﬂﬂ  
)
ﬂﬂ  !
.
‡‡ 
HasMaxLength
‡‡ !
(
‡‡! "
$num
‡‡" &
)
‡‡& '
;
‡‡' (
}
·· 
)
·· 
;
·· 
modelBuilder
„„ 
.
„„ 
Entity
„„ 
<
„„  
Order
„„  %
>
„„% &
(
„„& '
entity
„„' -
=>
„„. 0
{
‰‰ 
entity
ÂÂ 
.
ÂÂ 
ToTable
ÂÂ 
(
ÂÂ 
$str
ÂÂ '
)
ÂÂ' (
;
ÂÂ( )
entity
ÁÁ 
.
ÁÁ 
HasKey
ÁÁ 
(
ÁÁ 
e
ÁÁ 
=>
ÁÁ  "
e
ÁÁ# $
.
ÁÁ$ %
OrderId
ÁÁ% ,
)
ÁÁ, -
;
ÁÁ- .
entity
ÈÈ 
.
ÈÈ 
Property
ÈÈ 
(
ÈÈ  
e
ÈÈ  !
=>
ÈÈ" $
e
ÈÈ% &
.
ÈÈ& '
OrderId
ÈÈ' .
)
ÈÈ. /
.
ÍÍ 
HasColumnType
ÍÍ "
(
ÍÍ" #
$str
ÍÍ# )
)
ÍÍ) *
.
ÎÎ  
HasDefaultValueSql
ÎÎ '
(
ÎÎ' (
UuidGenerateV4
ÎÎ( 6
)
ÎÎ6 7
.
ÏÏ !
ValueGeneratedOnAdd
ÏÏ (
(
ÏÏ( )
)
ÏÏ) *
;
ÏÏ* +
entity
ÓÓ 
.
ÓÓ 
Property
ÓÓ 
(
ÓÓ  
e
ÓÓ  !
=>
ÓÓ" $
e
ÓÓ% &
.
ÓÓ& '
OrderStatus
ÓÓ' 2
)
ÓÓ2 3
.
ÔÔ 

IsRequired
ÔÔ 
(
ÔÔ  
)
ÔÔ  !
;
ÔÔ! "
entity
ÒÒ 
.
ÒÒ 
Property
ÒÒ 
(
ÒÒ  
e
ÒÒ  !
=>
ÒÒ" $
e
ÒÒ% &
.
ÒÒ& '

TotalPrice
ÒÒ' 1
)
ÒÒ1 2
.
ÚÚ 

IsRequired
ÚÚ 
(
ÚÚ  
)
ÚÚ  !
.
ÛÛ 
HasColumnType
ÛÛ "
(
ÛÛ" #
$str
ÛÛ# 2
)
ÛÛ2 3
;
ÛÛ3 4
entity
ıı 
.
ıı 
Property
ıı 
(
ıı  
e
ıı  !
=>
ıı" $
e
ıı% &
.
ıı& '
	OrderDate
ıı' 0
)
ıı0 1
.
ˆˆ 

IsRequired
ˆˆ 
(
ˆˆ  
)
ˆˆ  !
;
ˆˆ! "
entity
¯¯ 
.
¯¯ 
Property
¯¯ 
(
¯¯  
e
¯¯  !
=>
¯¯" $
e
¯¯% &
.
¯¯& '!
DeliveryPhoneNumber
¯¯' :
)
¯¯: ;
.
˘˘ 

IsRequired
˘˘ 
(
˘˘  
)
˘˘  !
.
˙˙ 
HasMaxLength
˙˙ !
(
˙˙! "
$num
˙˙" $
)
˙˙$ %
;
˙˙% &
entity
¸¸ 
.
¸¸ 
Property
¸¸ 
(
¸¸  
e
¸¸  !
=>
¸¸" $
e
¸¸% &
.
¸¸& '
PaymentMethod
¸¸' 4
)
¸¸4 5
.
˝˝ 

IsRequired
˝˝ 
(
˝˝  
)
˝˝  !
;
˝˝! "
entity
ˇˇ 
.
ˇˇ 
Property
ˇˇ 
(
ˇˇ  
e
ˇˇ  !
=>
ˇˇ" $
e
ˇˇ% &
.
ˇˇ& '
DeliveryAddress
ˇˇ' 6
)
ˇˇ6 7
.
ÄÄ 

IsRequired
ÄÄ 
(
ÄÄ  
)
ÄÄ  !
.
ÅÅ 
HasMaxLength
ÅÅ !
(
ÅÅ! "
$num
ÅÅ" %
)
ÅÅ% &
;
ÅÅ& '
entity
ÉÉ 
.
ÉÉ 
HasMany
ÉÉ 
(
ÉÉ 
e
ÉÉ  
=>
ÉÉ! #
e
ÉÉ$ %
.
ÉÉ% &

OrderItems
ÉÉ& 0
)
ÉÉ0 1
.
ÑÑ 
WithOne
ÑÑ 
(
ÑÑ 
oi
ÑÑ 
=>
ÑÑ  "
oi
ÑÑ# %
.
ÑÑ% &
Order
ÑÑ& +
)
ÑÑ+ ,
.
ÖÖ 
HasForeignKey
ÖÖ "
(
ÖÖ" #
oi
ÖÖ# %
=>
ÖÖ& (
oi
ÖÖ) +
.
ÖÖ+ ,
OrderId
ÖÖ, 3
)
ÖÖ3 4
.
ÜÜ 

IsRequired
ÜÜ 
(
ÜÜ  
)
ÜÜ  !
.
áá 
OnDelete
áá 
(
áá 
DeleteBehavior
áá ,
.
áá, -
Cascade
áá- 4
)
áá4 5
;
áá5 6
}
àà 
)
àà 
;
àà 
modelBuilder
ää 
.
ää 
Entity
ää 
<
ää  
Cart
ää  $
>
ää$ %
(
ää% &
entity
ää& ,
=>
ää- /
{
ãã 
entity
åå 
.
åå 
ToTable
åå 
(
åå 
$str
åå &
)
åå& '
;
åå' (
entity
çç 
.
çç 
HasKey
çç 
(
çç 
e
çç 
=>
çç  "
e
çç# $
.
çç$ %
CartId
çç% +
)
çç+ ,
;
çç, -
entity
éé 
.
éé 
Property
éé 
(
éé  
e
éé  !
=>
éé" $
e
éé% &
.
éé& '
CartId
éé' -
)
éé- .
.
èè 
HasColumnType
èè "
(
èè" #
$str
èè# )
)
èè) *
.
êê  
HasDefaultValueSql
êê '
(
êê' (
UuidGenerateV4
êê( 6
)
êê6 7
.
ëë !
ValueGeneratedOnAdd
ëë (
(
ëë( )
)
ëë) *
;
ëë* +
entity
ìì 
.
ìì 
HasMany
ìì 
(
ìì 
e
ìì  
=>
ìì! #
e
ìì$ %
.
ìì% &

OrderItems
ìì& 0
)
ìì0 1
.
îî 
WithOne
îî 
(
îî 
e
îî 
=>
îî !
e
îî" #
.
îî# $
Cart
îî$ (
)
îî( )
.
ïï 
HasForeignKey
ïï "
(
ïï" #
e
ïï# $
=>
ïï% '
e
ïï( )
.
ïï) *
CartId
ïï* 0
)
ïï0 1
.
ññ 

IsRequired
ññ 
(
ññ  
)
ññ  !
.
óó 
OnDelete
óó 
(
óó 
DeleteBehavior
óó ,
.
óó, -
Cascade
óó- 4
)
óó4 5
;
óó5 6
}
òò 
)
òò 
;
òò 
modelBuilder
öö 
.
öö 
Entity
öö 
<
öö  
History
öö  '
>
öö' (
(
öö( )
entity
öö) /
=>
öö0 2
{
õõ 
entity
úú 
.
úú 
ToTable
úú 
(
úú 
$str
úú *
)
úú* +
;
úú+ ,
entity
ùù 
.
ùù 
HasKey
ùù 
(
ùù 
e
ùù 
=>
ùù  "
e
ùù# $
.
ùù$ %
	HistoryId
ùù% .
)
ùù. /
;
ùù/ 0
entity
ûû 
.
ûû 
Property
ûû 
(
ûû  
e
ûû  !
=>
ûû" $
e
ûû% &
.
ûû& '
	HistoryId
ûû' 0
)
ûû0 1
.
üü 
HasColumnType
üü "
(
üü" #
$str
üü# )
)
üü) *
.
††  
HasDefaultValueSql
†† '
(
††' (
UuidGenerateV4
††( 6
)
††6 7
.
°° !
ValueGeneratedOnAdd
°° (
(
°°( )
)
°°) *
;
°°* +
entity
¢¢ 
.
¢¢ 
Property
¢¢ 
(
¢¢  
e
¢¢  !
=>
¢¢" $
e
¢¢% &
.
¢¢& '
	AccesDate
¢¢' 0
)
¢¢0 1
.
££ 

IsRequired
££ 
(
££  
)
££  !
;
££! "
}
§§ 
)
§§ 
;
§§ 
modelBuilder
¶¶ 
.
¶¶ 
Entity
¶¶ 
<
¶¶  
	OrderItem
¶¶  )
>
¶¶) *
(
¶¶* +
entity
¶¶+ 1
=>
¶¶2 4
{
ßß 
entity
®® 
.
®® 
ToTable
®® 
(
®® 
$str
®® +
)
®®+ ,
;
®®, -
entity
©© 
.
©© 
HasKey
©© 
(
©© 
e
©© 
=>
©©  "
e
©©# $
.
©©$ %
OrderItemId
©©% 0
)
©©0 1
;
©©1 2
entity
™™ 
.
™™ 
Property
™™ 
(
™™  
e
™™  !
=>
™™" $
e
™™% &
.
™™& '
OrderItemId
™™' 2
)
™™2 3
.
´´ 
HasColumnType
´´ "
(
´´" #
$str
´´# )
)
´´) *
.
¨¨  
HasDefaultValueSql
¨¨ '
(
¨¨' (
UuidGenerateV4
¨¨( 6
)
¨¨6 7
.
≠≠ !
ValueGeneratedOnAdd
≠≠ (
(
≠≠( )
)
≠≠) *
;
≠≠* +
entity
ÆÆ 
.
ÆÆ 
Property
ÆÆ 
(
ÆÆ  
e
ÆÆ  !
=>
ÆÆ" $
e
ÆÆ% &
.
ÆÆ& '
Quantity
ÆÆ' /
)
ÆÆ/ 0
.
ØØ 

IsRequired
ØØ 
(
ØØ  
)
ØØ  !
;
ØØ! "
entity
∞∞ 
.
∞∞ 
Property
∞∞ 
(
∞∞  
e
∞∞  !
=>
∞∞" $
e
∞∞% &
.
∞∞& '
Price
∞∞' ,
)
∞∞, -
.
±± 

IsRequired
±± 
(
±±  
)
±±  !
.
≤≤ 
HasColumnType
≤≤ "
(
≤≤" #
$str
≤≤# 2
)
≤≤2 3
;
≤≤3 4
}
≥≥ 
)
≥≥ 
;
≥≥ 
modelBuilder
µµ 
.
µµ 
Entity
µµ 
<
µµ  
Recommendation
µµ  .
>
µµ. /
(
µµ/ 0
entity
µµ0 6
=>
µµ7 9
{
∂∂ 
entity
∑∑ 
.
∑∑ 
ToTable
∑∑ 
(
∑∑ 
$str
∑∑ 0
)
∑∑0 1
;
∑∑1 2
entity
∏∏ 
.
∏∏ 
HasKey
∏∏ 
(
∏∏ 
e
∏∏ 
=>
∏∏  "
e
∏∏# $
.
∏∏$ %
RecommendationId
∏∏% 5
)
∏∏5 6
;
∏∏6 7
entity
ππ 
.
ππ 
Property
ππ 
(
ππ  
e
ππ  !
=>
ππ" $
e
ππ% &
.
ππ& '
RecommendationId
ππ' 7
)
ππ7 8
.
∫∫ 
HasColumnType
∫∫ "
(
∫∫" #
$str
∫∫# )
)
∫∫) *
.
ªª  
HasDefaultValueSql
ªª '
(
ªª' (
UuidGenerateV4
ªª( 6
)
ªª6 7
.
ºº !
ValueGeneratedOnAdd
ºº (
(
ºº( )
)
ºº) *
;
ºº* +
entity
ΩΩ 
.
ΩΩ 
Property
ΩΩ 
(
ΩΩ  
e
ΩΩ  !
=>
ΩΩ" $
e
ΩΩ% &
.
ΩΩ& ' 
RecommendationDate
ΩΩ' 9
)
ΩΩ9 :
.
ææ 

IsRequired
ææ 
(
ææ  
)
ææ  !
;
ææ! "
entity
øø 
.
øø 
Property
øø 
(
øø  
e
øø  !
=>
øø" $
e
øø% &
.
øø& '
RelevanceScore
øø' 5
)
øø5 6
.
¿¿ 

IsRequired
¿¿ 
(
¿¿  
)
¿¿  !
;
¿¿! "
}
¡¡ 
)
¡¡ 
;
¡¡ 
modelBuilder
√√ 
.
√√ 
Entity
√√ 
<
√√  
Review
√√  &
>
√√& '
(
√√' (
entity
√√( .
=>
√√/ 1
{
ƒƒ 
entity
≈≈ 
.
≈≈ 
ToTable
≈≈ 
(
≈≈ 
$str
≈≈ (
)
≈≈( )
;
≈≈) *
entity
∆∆ 
.
∆∆ 
HasKey
∆∆ 
(
∆∆ 
e
∆∆ 
=>
∆∆  "
e
∆∆# $
.
∆∆$ %
ReviewId
∆∆% -
)
∆∆- .
;
∆∆. /
entity
«« 
.
«« 
Property
«« 
(
««  
e
««  !
=>
««" $
e
««% &
.
««& '
ReviewId
««' /
)
««/ 0
.
»» 
HasColumnType
»» "
(
»»" #
$str
»»# )
)
»») *
.
……  
HasDefaultValueSql
…… '
(
……' (
UuidGenerateV4
……( 6
)
……6 7
.
   !
ValueGeneratedOnAdd
   (
(
  ( )
)
  ) *
;
  * +
entity
ÀÀ 
.
ÀÀ 
Property
ÀÀ 
(
ÀÀ  
e
ÀÀ  !
=>
ÀÀ" $
e
ÀÀ% &
.
ÀÀ& '

ReviewDate
ÀÀ' 1
)
ÀÀ1 2
.
ÃÃ 

IsRequired
ÃÃ 
(
ÃÃ  
)
ÃÃ  !
;
ÃÃ! "
entity
ÕÕ 
.
ÕÕ 
Property
ÕÕ 
(
ÕÕ  
e
ÕÕ  !
=>
ÕÕ" $
e
ÕÕ% &
.
ÕÕ& '
Comment
ÕÕ' .
)
ÕÕ. /
.
ŒŒ 

IsRequired
ŒŒ 
(
ŒŒ  
)
ŒŒ  !
.
œœ 
HasMaxLength
œœ !
(
œœ! "
$num
œœ" &
)
œœ& '
;
œœ' (
entity
–– 
.
–– 
Property
–– 
(
––  
e
––  !
=>
––" $
e
––% &
.
––& '
Rating
––' -
)
––- .
.
—— 

IsRequired
—— 
(
——  
)
——  !
;
——! "
}
““ 
)
““ 
;
““ 
}
”” 	
}
‘‘ 
}’’ ´
?D:\Repos\BuySmart\BuySmart\Infrastructure\DependecyInjection.cs
	namespace 	
Infrastructure
 
{		 
public

 

static

 
class

 
DependecyInjection

 *
{ 
public 
static 
IServiceCollection (
AddInfrastructure) :
(: ;
this; ?
IServiceCollection@ R
servicesS [
,[ \
IConfiguration] k
configurationl y
)y z
{ 	
services 
. 
AddDbContext !
<! " 
ApplicationDbContext" 6
>6 7
(7 8
options 
=> 
options &
.& '
	UseNpgsql' 0
(0 1
configuration1 >
.> ?
GetConnectionString? R
(R S
$strS f
)f g
,g h
b 
=> 
b 
. 
MigrationsAssembly -
(- .
typeof. 4
(4 5 
ApplicationDbContext5 I
)I J
.J K
AssemblyK S
.S T
FullNameT \
)\ ]
)] ^
) 
; 
services 
. 
	AddScoped 
< 
IProductRepository 1
,1 2
ProductRepository3 D
>D E
(E F
)F G
;G H
services 
. 
	AddScoped 
< 
ICategoryRepository 2
,2 3
CategoryRepository4 F
>F G
(G H
)H I
;I J
services 
. 
	AddScoped 
< !
IUserClientRepository 4
,4 5 
UserClientRepository6 J
>J K
(K L
)L M
;M N
services 
. 
	AddScoped 
< #
IUserBusinessRepository 6
,6 7"
UserBusinessRepository8 N
>N O
(O P
)P Q
;Q R
services 
. 
	AddScoped 
< 
ICartRepository .
,. /
CartRepository0 >
>> ?
(? @
)@ A
;A B
services 
. 
	AddScoped 
< 
IBusinessRepository 2
,2 3
BusinessRepository4 F
>F G
(G H
)H I
;I J
services 
. 
	AddScoped 
< %
IReviewBusinessRepository 8
,8 9$
ReviewBusinessRepository: R
>R S
(S T
)T U
;U V
return 
services 
; 
} 	
} 
} 