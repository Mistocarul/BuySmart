È
@D:\BuySmart\BuySmart\BuySmart\Swagger\ConfigureSwaggerOptions.cs
	namespace 	
BuySmart
 
. 
Swagger 
{ 
public 

class #
ConfigureSwaggerOptions (
:) *
IConfigureOptions+ <
<< =
SwaggerGenOptions= N
>N O
{ 
public		 
void		 
	Configure		 
(		 
SwaggerGenOptions		 /
options		0 7
)		7 8
{

 	
options 
. !
AddSecurityDefinition )
() *
$str* 2
,2 3
new4 7!
OpenApiSecurityScheme8 M
{ 
In 
= 
ParameterLocation &
.& '
Header' -
,- .
Description 
= 
$str D
,D E
Name 
= 
$str &
,& '
Type 
= 
SecuritySchemeType )
.) *
Http* .
,. /
BearerFormat 
= 
$str $
,$ %
Scheme 
= 
$str !
} 
) 
; 
options 
. "
AddSecurityRequirement *
(* +
new+ .&
OpenApiSecurityRequirement/ I
{ 
{ 
new !
OpenApiSecurityScheme -
{ 
	Reference !
=" #
new$ '
OpenApiReference( 8
{ 
Type  
=! "
ReferenceType# 0
.0 1
SecurityScheme1 ?
,? @
Id 
=  
$str! )
} 
} 
, 
Array   
.   
Empty   
<    
string    &
>  & '
(  ' (
)  ( )
}!! 
}"" 
)"" 
;"" 
}## 	
}$$ 
}%% ˆ 
(D:\BuySmart\BuySmart\BuySmart\Program.cs
var 
builder 
= 
WebApplication 
. 
CreateBuilder *
(* +
args+ /
)/ 0
;0 1
var

 "
MyAllowSpecificOrigins

 
=

 
$str

 5
;

5 6
builder 
. 
Services 
. 
AddCors 
( 
options  
=>! #
{ 
options 
. 
	AddPolicy 
( 
name 
: "
MyAllowSpecificOrigins 2
,2 3
policy 
=> 
{ 	
policy 
. 
WithOrigins 
( 
$str 6
)6 7
. 
AllowAnyHeader 
(  
)  !
. 
AllowAnyMethod 
(  
)  !
;! "
} 	
)	 

;
 
} 
) 
; 
builder 
. 
Services 
. 
AddApplication 
(  
)  !
;! "
builder 
. 
Services 
. 
AddInfrastructure "
(" #
builder# *
.* +
Configuration+ 8
)8 9
;9 :
builder 
. 
Services 
. 
AddIdentity 
( 
builder $
.$ %
Configuration% 2
)2 3
;3 4
builder 
. 
Services 
. 
AddControllers 
(  
)  !
;! "
builder 
. 
Services 
. "
AddHttpContextAccessor '
(' (
)( )
;) *
builder 
. 
Services 
. #
AddEndpointsApiExplorer (
(( )
)) *
;* +
builder   
.   
Services   
.   
AddSwaggerGen   
(   
)    
;    !
builder!! 
.!! 
Services!! 
.!! 
AddTransient!! 
<!! 
IConfigureOptions!! /
<!!/ 0
SwaggerGenOptions!!0 A
>!!A B
,!!B C#
ConfigureSwaggerOptions!!D [
>!![ \
(!!\ ]
)!!] ^
;!!^ _
var## 
app## 
=## 	
builder##
 
.## 
Build## 
(## 
)## 
;## 
app%% 
.%% 
UseMiddleware%% 
<%% '
ExceptionHandlingMiddleware%% -
>%%- .
(%%. /
)%%/ 0
;%%0 1
if)) 
()) 
app)) 
.)) 
Environment)) 
.)) 
IsDevelopment)) !
())! "
)))" #
)))# $
{** 
app++ 
.++ 

UseSwagger++ 
(++ 
)++ 
;++ 
app,, 
.,, 
UseSwaggerUI,, 
(,, 
),, 
;,, 
}-- 
app00 
.00 
UseStaticFiles00 
(00 
)00 
;00 
app22 
.22 

UseRouting22 
(22 
)22 
;22 
app44 
.44 
UseCors44 
(44 "
MyAllowSpecificOrigins44 "
)44" #
;44# $
app66 
.66 
UseHttpsRedirection66 
(66 
)66 
;66 
app88 
.88 
UseAuthentication88 
(88 
)88 
;88 
app99 
.99 
UseAuthorization99 
(99 
)99 
;99 
app;; 
.;; 
MapControllers;; 
(;; 
);; 
;;; 
await== 
app== 	
.==	 

RunAsync==
 
(== 
)== 
;== 
public?? 
partial?? 
class?? 
Program?? 
{@@ 
}AA Õ*
GD:\BuySmart\BuySmart\BuySmart\Middleware\ExceptionHandlingMiddleware.cs
	namespace 	
BuySmart
 
. 

Middleware 
{ 
public 

class '
ExceptionHandlingMiddleware ,
{ 
private 
readonly 
RequestDelegate (
_next) .
;. /
public

 '
ExceptionHandlingMiddleware

 *
(

* +
RequestDelegate

+ :
next

; ?
)

? @
{ 	
_next 
= 
next 
; 
} 	
public 
async 
Task 
InvokeAsync %
(% &
HttpContext& 1
httpContext2 =
)= >
{ 	
try 
{ 
await 
_next 
( 
httpContext '
)' (
;( )
} 
catch 
( 
FluentValidation #
.# $
ValidationException$ 7
ex8 :
): ;
{ 
await *
HandleValidationExceptionAsync 4
(4 5
httpContext5 @
,@ A
exB D
)D E
;E F
} 
catch 
(  
KeyNotFoundException '
ex( *
)* +
{ 
await +
HandleKeyNotFoundExceptionAsync 5
(5 6
httpContext6 A
,A B
exC E
)E F
;F G
} 
catch 
( 
	Exception 
ex 
)  
{ 
await  
HandleExceptionAsync *
(* +
httpContext+ 6
,6 7
ex8 :
): ;
;; <
}   
}!! 	
private## 
static## 
async## 
Task## !+
HandleKeyNotFoundExceptionAsync##" A
(##A B
HttpContext##B M
httpContext##N Y
,##Y Z 
KeyNotFoundException##[ o
ex##p r
)##r s
{$$ 	
httpContext%% 
.%% 
Response%%  
.%%  !
ContentType%%! ,
=%%- .
$str%%/ A
;%%A B
httpContext&& 
.&& 
Response&&  
.&&  !

StatusCode&&! +
=&&, -
(&&. /
int&&/ 2
)&&2 3
HttpStatusCode&&3 A
.&&A B
NotFound&&B J
;&&J K
await(( 
httpContext(( 
.(( 
Response(( &
.((& '

WriteAsync((' 1
(((1 2
JsonSerializer((2 @
.((@ A
	Serialize((A J
(((J K
new((K N
{((O P
error((Q V
=((W X
ex((Y [
.(([ \
Message((\ c
}((d e
)((e f
)((f g
;((g h
})) 	
private++ 
static++ 
Task++ *
HandleValidationExceptionAsync++ :
(++: ;
HttpContext++; F
context++G N
,++N O
FluentValidation++P `
.++` a
ValidationException++a t
	exception++u ~
)++~ 
{,, 	
context-- 
.-- 
Response-- 
.-- 
ContentType-- (
=--) *
$str--+ =
;--= >
context.. 
... 
Response.. 
... 

StatusCode.. '
=..( )
(..* +
int..+ .
)... /
HttpStatusCode../ =
...= >

BadRequest..> H
;..H I
var00 
errors00 
=00 
	exception00 "
.00" #
Errors00# )
.00) *
Select00* 0
(000 1
e001 2
=>003 5
new006 9
{00: ;
e00< =
.00= >
PropertyName00> J
,00J K
e00L M
.00M N
ErrorMessage00N Z
}00[ \
)00\ ]
;00] ^
return33 
context33 
.33 
Response33 #
.33# $

WriteAsync33$ .
(33. /
JsonSerializer33/ =
.33= >
	Serialize33> G
(33G H
new33H K
{33L M
errors33N T
}33U V
)33V W
)33W X
;33X Y
}44 	
private66 
static66 
Task66  
HandleExceptionAsync66 0
(660 1
HttpContext661 <
context66= D
,66D E
	Exception66F O
	exception66P Y
)66Y Z
{77 	
context88 
.88 
Response88 
.88 
ContentType88 (
=88) *
$str88+ =
;88= >
context99 
.99 
Response99 
.99 

StatusCode99 '
=99( )
(99* +
int99+ .
)99. /
HttpStatusCode99/ =
.99= >
InternalServerError99> Q
;99Q R
return;; 
context;; 
.;; 
Response;; #
.;;# $

WriteAsync;;$ .
(;;. /
JsonSerializer;;/ =
.;;= >
	Serialize;;> G
(;;G H
new;;H K
{;;L M
error;;N S
=;;T U
	exception;;V _
.;;_ `
Message;;` g
};;h i
);;i j
);;j k
;;;k l
}<< 	
}== 
}>> á
.D:\BuySmart\BuySmart\BuySmart\JWT\JwtHelper.cs
	namespace 	
BuySmart
 
. 
JWT 
{ 
public 

static 
class 
	JwtHelper !
{ 
public 
static 
string 
? 
GetUserIdFromJwt .
(. /
HttpContext/ :
httpContext; F
)F G
{ 	
var		 
authorizationHeader		 #
=		$ %
httpContext		& 1
.		1 2
Request		2 9
.		9 :
Headers		: A
.		A B
Authorization		B O
.		O P
FirstOrDefault		P ^
(		^ _
)		_ `
;		` a
if 
( 
string 
. 
IsNullOrEmpty $
($ %
authorizationHeader% 8
)8 9
||: <
!= >
authorizationHeader> Q
.Q R

StartsWithR \
(\ ]
$str] f
,f g
StringComparisonh x
.x y
OrdinalIgnoreCase	y ä
)
ä ã
)
ã å
{ 
return 
null 
; 
} 
var 
token 
= 
authorizationHeader +
.+ ,
	Substring, 5
(5 6
$str6 ?
.? @
Length@ F
)F G
.G H
TrimH L
(L M
)M N
;N O
var 
jwtTokenHandler 
=  !
new" %#
JwtSecurityTokenHandler& =
(= >
)> ?
;? @
if 
( 
! 
jwtTokenHandler  
.  !
CanReadToken! -
(- .
token. 3
)3 4
)4 5
{ 
return 
null 
; 
} 
var 
jwtToken 
= 
jwtTokenHandler *
.* +
	ReadToken+ 4
(4 5
token5 :
): ;
as< >
JwtSecurityToken? O
;O P
if 
( 
jwtToken 
== 
null  
)  !
{ 
return 
null 
; 
} 
var 
userIdClaim 
= 
jwtToken &
.& '
Claims' -
.- .
FirstOrDefault. <
(< =
claim= B
=>C E
claimF K
.K L
TypeL P
==Q S
$strT a
)a b
;b c
return   
userIdClaim   
?   
.    
Value    %
;  % &
}!! 	
}"" 
}## ïU
AD:\BuySmart\BuySmart\BuySmart\Controllers\UserClientController.cs
	namespace 	
BuySmart
 
. 
Controllers 
{ 
[ 
Route 

(
 
$str  
)  !
]! "
[ 
ApiController 
] 
public 

class  
UserClientController %
:& '
ControllerBase( 6
{ 
private 
readonly 
	IMediator "
mediator# +
;+ ,
private 
readonly  
IHttpContextAccessor -
httpContextAccessor. A
;A B
public  
UserClientController #
(# $
	IMediator$ -
mediator. 6
,6 7 
IHttpContextAccessor8 L
httpContextAccessorM `
)` a
{ 	
this 
. 
mediator 
= 
mediator $
;$ %
this 
. 
httpContextAccessor $
=% &
httpContextAccessor' :
;: ;
} 	
[ 	
	Authorize	 
] 
[ 	
HttpGet	 
( 
$str $
)$ %
]% &
public 
async 
Task 
< 
IActionResult '
>' (
GetAllUsers) 4
(4 5
)5 6
{ 	
var   
users   
=   
await   
mediator   &
.  & '
Send  ' +
(  + ,
new  , /"
GetAllUserClientsQuery  0 F
(  F G
)  G H
)  H I
;  I J
return!! 
Ok!! 
(!! 
users!! 
)!! 
;!! 
}"" 	
[$$ 	
	Authorize$$	 
]$$ 
[%% 	
HttpGet%%	 
(%% 
$str%% *
)%%* +
]%%+ ,
public&& 
async&& 
Task&& 
<&& 
ActionResult&& &
<&&& '
PagedResult&&' 2
<&&2 3
UserClientDto&&3 @
>&&@ A
>&&A B
>&&B C"
GetFilteredUserClients&&D Z
(&&Z [
[&&[ \
	FromQuery&&\ e
]&&e f
int&&g j
page&&k o
,&&o p
[&&q r
	FromQuery&&r {
]&&{ |
int	&&} Ä
pageSize
&&Å â
)
&&â ä
{'' 	
var(( 
query(( 
=(( 
new(( '
GetFilteredUserClientsQuery(( 7
{)) 
Page** 
=** 
page** 
,** 
PageSize++ 
=++ 
pageSize++ #
,++# $
Filter,, 
=,, 
null,, 
}-- 
;-- 
var// 
result// 
=// 
await// 
mediator// '
.//' (
Send//( ,
(//, -
query//- 2
)//2 3
;//3 4
if00 
(00 
result00 
.00 
	IsSuccess00  
)00  !
{11 
return22 
Ok22 
(22 
result22  
.22  !
Data22! %
)22% &
;22& '
}33 
return44 
NotFound44 
(44 
result44 "
.44" #
ErrorMessage44# /
)44/ 0
;440 1
}66 	
[88 	
	Authorize88	 
]88 
[99 	
HttpGet99	 
(99 
$str99 $
)99$ %
]99% &
public:: 
async:: 
Task:: 
<:: 
ActionResult:: &
<::& '
UserClientDto::' 4
>::4 5
>::5 6
GetUserById::7 B
(::B C
)::C D
{;; 	
var<< 
userId<< 
=<< 
	JwtHelper<< "
.<<" #
GetUserIdFromJwt<<# 3
(<<3 4
httpContextAccessor<<4 G
.<<G H
HttpContext<<H S
)<<S T
;<<T U
if== 
(== 
userId== 
==== 
null== 
)== 
{>> 
return?? 
Unauthorized?? #
(??# $
)??$ %
;??% &
}@@ "
GetUserClientByIdQueryAA "
commandQueryAA# /
=AA0 1
newAA2 5"
GetUserClientByIdQueryAA6 L
{AAM N
IdAAO Q
=AAR S
newAAT W
GuidAAX \
(AA\ ]
userIdAA] c
)AAc d
}AAe f
;AAf g
returnBB 
awaitBB 
mediatorBB !
.BB! "
SendBB" &
(BB& '
commandQueryBB' 3
)BB3 4
;BB4 5
}CC 	
[EE 	
HttpPostEE	 
(EE 
$strEE -
)EE- .
]EE. /
publicFF 
asyncFF 
TaskFF 
<FF 
ActionResultFF &
<FF& '
ResultFF' -
<FF- .
GuidFF. 2
>FF2 3
>FF3 4
>FF4 5
CreateUserClientFF6 F
(FFF G
[FFG H
FromBodyFFH P
]FFP Q#
CreateUserClientCommandFFR i
commandFFj q
)FFq r
{GG 	
commandHH 
.HH 
PasswordHH 
=HH 
BCryptHH %
.HH% &
NetHH& )
.HH) *
BCryptHH* 0
.HH0 1
HashPasswordHH1 =
(HH= >
commandHH> E
.HHE F
PasswordHHF N
)HHN O
;HHO P
varJJ 
resultJJ 
=JJ 
awaitJJ 
mediatorJJ '
.JJ' (
SendJJ( ,
(JJ, -
commandJJ- 4
)JJ4 5
;JJ5 6
ifKK 
(KK 
!KK 
resultKK 
.KK 
	IsSuccessKK !
)KK! "
{LL 
returnMM 

BadRequestMM !
(MM! "
resultMM" (
.MM( )
ErrorMessageMM) 5
)MM5 6
;MM6 7
}NN 
CreateCartCommandOO 
createCartCommandOO /
=OO0 1
newOO2 5
CreateCartCommandOO6 G
{OOH I
UserClientIdOOJ V
=OOW X
resultOOY _
.OO_ `
DataOO` d
}OOe f
;OOf g
varPP 

cartResultPP 
=PP 
awaitPP "
mediatorPP# +
.PP+ ,
SendPP, 0
(PP0 1
createCartCommandPP1 B
)PPB C
;PPC D
ifQQ 
(QQ 
!QQ 

cartResultQQ 
.QQ 
	IsSuccessQQ %
)QQ% &
{RR 
awaitSS 
mediatorSS 
.SS 
SendSS #
(SS# $
newSS$ '
DeleteUserCommandSS( 9
{SS: ;
UserIdSS< B
=SSC D
resultSSE K
.SSK L
DataSSL P
}SSQ R
)SSR S
;SSS T
returnTT 

BadRequestTT !
(TT! "

cartResultTT" ,
.TT, -
ErrorMessageTT- 9
)TT9 :
;TT: ;
}UU 
returnVV 
CreatedAtActionVV "
(VV" #
nameofVV# )
(VV) *
CreateUserClientVV* :
)VV: ;
,VV; <
newVV= @
{VVA B
idVVC E
=VVF G
resultVVH N
.VVN O
DataVVO S
}VVT U
,VVU V
resultVVW ]
.VV] ^
DataVV^ b
)VVb c
;VVc d
}WW 	
[YY 	

HttpDeleteYY	 
(YY 
$strYY &
)YY& '
]YY' (
publicZZ 
asyncZZ 
TaskZZ 
<ZZ 
ActionResultZZ &
>ZZ& '
DeleteUserByIdZZ( 6
(ZZ6 7
)ZZ7 8
{[[ 	
var\\ 
userId\\ 
=\\ 
	JwtHelper\\ "
.\\" #
GetUserIdFromJwt\\# 3
(\\3 4
httpContextAccessor\\4 G
.\\G H
HttpContext\\H S
)\\S T
;\\T U
if]] 
(]] 
userId]] 
==]] 
null]] 
)]] 
{^^ 
return__ 
Unauthorized__ #
(__# $
)__$ %
;__% &
}`` 
varaa 
idaa 
=aa 
newaa 
Guidaa 
(aa 
userIdaa $
)aa$ %
;aa% &
awaitbb 
mediatorbb 
.bb 
Sendbb 
(bb  
newbb  #
DeleteUserCommandbb$ 5
{bb6 7
UserIdbb8 >
=bb? @
idbbA C
}bbD E
)bbE F
;bbF G
returncc 
	NoContentcc 
(cc 
)cc 
;cc 
}dd 	
[ff 	
	Authorizeff	 
]ff 
[gg 	
HttpPutgg	 
(gg 
$strgg #
)gg# $
]gg$ %
publichh 
asynchh 
Taskhh 
<hh 
ActionResulthh &
<hh& '
Resulthh' -
<hh- .
objecthh. 4
>hh4 5
>hh5 6
>hh6 7

UpdateUserhh8 B
(hhB C
[hhC D
FromBodyhhD L
]hhL M
UpdateUserCommandhhN _
commandhh` g
)hhg h
{ii 	
varjj 
userIdjj 
=jj 
	JwtHelperjj "
.jj" #
GetUserIdFromJwtjj# 3
(jj3 4
httpContextAccessorjj4 G
.jjG H
HttpContextjjH S
)jjS T
;jjT U
ifkk 
(kk 
userIdkk 
==kk 
nullkk 
)kk 
{ll 
returnmm 
Unauthorizedmm #
(mm# $
)mm$ %
;mm% &
}nn 
commandoo 
.oo 
UserIdoo 
=oo 
newoo  
Guidoo! %
(oo% &
userIdoo& ,
)oo, -
;oo- .
commandpp 
.pp 
Passwordpp 
=pp 
BCryptpp %
.pp% &
Netpp& )
.pp) *
BCryptpp* 0
.pp0 1
HashPasswordpp1 =
(pp= >
commandpp> E
.ppE F
PasswordppF N
)ppN O
;ppO P
varqq 
resultqq 
=qq 
awaitqq 
mediatorqq '
.qq' (
Sendqq( ,
(qq, -
commandqq- 4
)qq4 5
;qq5 6
ifrr 
(rr 
!rr 
resultrr 
.rr 
	IsSuccessrr !
)rr! "
{ss 
returntt 

BadRequesttt !
(tt! "
resulttt" (
.tt( )
ErrorMessagett) 5
)tt5 6
;tt6 7
}uu 
returnvv 
	NoContentvv 
(vv 
)vv 
;vv 
}ww 	
}xx 
}yy °M
CD:\BuySmart\BuySmart\BuySmart\Controllers\UserBusinessController.cs
	namespace 	
BuySmart
 
. 
Controllers 
{ 
[ 
Route 

(
 
$str  
)  !
]! "
[ 
ApiController 
] 
public 

class "
UserBusinessController '
:( )
ControllerBase* 8
{ 
private 
readonly 
	IMediator "
mediator# +
;+ ,
public 
readonly  
IHttpContextAccessor ,
httpContextAccessor- @
;@ A
public "
UserBusinessController %
(% &
	IMediator& /
mediator0 8
,8 9 
IHttpContextAccessor: N
httpContextAccessorO b
)b c
{ 	
this 
. 
mediator 
= 
mediator $
;$ %
this 
. 
httpContextAccessor $
=% &
httpContextAccessor' :
;: ;
} 	
[ 	
HttpPost	 
( 
$str &
)& '
]' (
public 
async 
Task 
< 
ActionResult &
<& '
Result' -
<- .
Guid. 2
>2 3
>3 4
>4 5
CreateUserBusiness6 H
(H I
[I J
FromBodyJ R
]R S%
CreateUserBusinessCommandT m
commandn u
)u v
{ 	
command 
. 
Password 
= 
BCrypt %
.% &
Net& )
.) *
BCrypt* 0
.0 1
HashPassword1 =
(= >
command> E
.E F
PasswordF N
)N O
;O P
var 
result 
= 
await 
mediator '
.' (
Send( ,
(, -
command- 4
)4 5
;5 6
if   
(   
!   
result   
.   
	IsSuccess   !
)  ! "
{!! 
return"" 

BadRequest"" !
(""! "
result""" (
.""( )
ErrorMessage"") 5
)""5 6
;""6 7
}## 
return$$ 
CreatedAtAction$$ "
($$" #
nameof$$# )
($$) *
CreateUserBusiness$$* <
)$$< =
,$$= >
new$$? B
{$$C D
id$$E G
=$$H I
result$$J P
.$$P Q
Data$$Q U
}$$V W
,$$W X
result$$Y _
.$$_ `
Data$$` d
)$$d e
;$$e f
}%% 	
['' 	
	Authorize''	 
]'' 
[(( 	

HttpDelete((	 
((( 
$str(( (
)((( )
](() *
public)) 
async)) 
Task)) 
<)) 
ActionResult)) &
>))& '
DeleteUserBusiness))( :
()): ;
))); <
{** 	
var,, 
userId,, 
=,, 
	JwtHelper,, "
.,," #
GetUserIdFromJwt,,# 3
(,,3 4
httpContextAccessor,,4 G
.,,G H
HttpContext,,H S
),,S T
;,,T U
if-- 
(-- 
userId-- 
==-- 
null-- 
)-- 
{.. 
return// 
Unauthorized// #
(//# $
)//$ %
;//% &
}00 
var11 
id11 
=11 
new11 
Guid11 
(11 
userId11 $
)11$ %
;11% &
await22 
mediator22 
.22 
Send22 
(22  
new22  #
DeleteUserCommand22$ 5
{226 7
UserId228 >
=22? @
id22A C
}22D E
)22E F
;22F G
return33 
	NoContent33 
(33 
)33 
;33 
}44 	
[66 	
	Authorize66	 
]66 
[77 	
HttpPut77	 
(77 
$str77 /
)77/ 0
]770 1
public88 
async88 
Task88 
<88 
ActionResult88 &
<88& '
Result88' -
<88- .
object88. 4
>884 5
>885 6
>886 7
UpdateUserBusiness888 J
(88J K
Guid88K O
id88P R
,88R S
[88T U
FromBody88U ]
]88] ^
UpdateUserCommand88_ p
command88q x
)88x y
{99 	
var:: 
userId:: 
=:: 
	JwtHelper:: "
.::" #
GetUserIdFromJwt::# 3
(::3 4
httpContextAccessor::4 G
.::G H
HttpContext::H S
)::S T
;::T U
if;; 
(;; 
userId;; 
==;; 
null;; 
);; 
{<< 
return== 
Unauthorized== #
(==# $
)==$ %
;==% &
}>> 
command?? 
.?? 
UserId?? 
=?? 
new??  
Guid??! %
(??% &
userId??& ,
)??, -
;??- .
command@@ 
.@@ 
Password@@ 
=@@ 
BCrypt@@ %
.@@% &
Net@@& )
.@@) *
BCrypt@@* 0
.@@0 1
HashPassword@@1 =
(@@= >
command@@> E
.@@E F
Password@@F N
)@@N O
;@@O P
ifAA 
(AA 
idAA 
!=AA 
commandAA 
.AA 
UserIdAA $
)AA$ %
{BB 
returnCC 

BadRequestCC !
(CC! "
)CC" #
;CC# $
}DD 
awaitEE 
mediatorEE 
.EE 
SendEE 
(EE  
commandEE  '
)EE' (
;EE( )
returnFF 
	NoContentFF 
(FF 
)FF 
;FF 
}HH 	
[II 	
	AuthorizeII	 
]II 
[JJ 	
HttpGetJJ	 
(JJ 
$strJJ &
)JJ& '
]JJ' (
publicLL 
asyncLL 
TaskLL 
<LL 
ActionResultLL &
<LL& '
UserBusinessDtoLL' 6
>LL6 7
>LL7 8
GetUserBusinessByIdLL9 L
(LLL M
)LLM N
{MM 	
varNN 
userIdNN 
=NN 
	JwtHelperNN "
.NN" #
GetUserIdFromJwtNN# 3
(NN3 4
httpContextAccessorNN4 G
.NNG H
HttpContextNNH S
)NNS T
;NNT U
ifOO 
(OO 
userIdOO 
==OO 
nullOO 
)OO 
{PP 
returnQQ 
UnauthorizedQQ #
(QQ# $
)QQ$ %
;QQ% &
}RR $
GetUserBusinessByIdQuerySS $
querySS% *
=SS+ ,
newSS- 0$
GetUserBusinessByIdQuerySS1 I
{SSJ K
IdSSL N
=SSO P
newSSQ T
GuidSSU Y
(SSY Z
userIdSSZ `
)SS` a
}SSb c
;SSc d
returnTT 
awaitTT 
mediatorTT !
.TT! "
SendTT" &
(TT& '
queryTT' ,
)TT, -
;TT- .
}UU 	
[WW 	
	AuthorizeWW	 
]WW 
[XX 	
HttpGetXX	 
(XX 
$strXX '
)XX' (
]XX( )
publicYY 
asyncYY 
TaskYY 
<YY 
ActionResultYY &
>YY& ' 
GetAllUserBusinessesYY( <
(YY< =
)YY= >
{ZZ 	
var[[ 
users[[ 
=[[ 
await[[ 
mediator[[ &
.[[& '
Send[[' +
([[+ ,
new[[, /%
GetAllUserBusinessesQuery[[0 I
([[I J
)[[J K
)[[K L
;[[L M
return\\ 
Ok\\ 
(\\ 
users\\ 
)\\ 
;\\ 
}]] 	
[__ 	
	Authorize__	 
]__ 
[`` 	
HttpGet``	 
(`` 
$str`` -
)``- .
]``. /
publicaa 
asyncaa 
Taskaa 
<aa 
ActionResultaa &
<aa& '
PagedResultaa' 2
<aa2 3
UserBusinessDtoaa3 B
>aaB C
>aaC D
>aaD E%
GetFilteredUserBusinessesaaF _
(aa_ `
[aa` a
	FromQueryaaa j
]aaj k
intaal o
pageaap t
,aat u
[aav w
	FromQuery	aaw Ä
]
aaÄ Å
int
aaÇ Ö
pageSize
aaÜ é
)
aaé è
{bb 	
varcc 
querycc 
=cc 
newcc *
GetFilteredUserBusinessesQuerycc :
{dd 
Pageee 
=ee 
pageee 
,ee 
PageSizeff 
=ff 
pageSizeff #
,ff# $
Filtergg 
=gg 
nullgg 
}hh 
;hh 
varii 
resultii 
=ii 
awaitii 
mediatorii '
.ii' (
Sendii( ,
(ii, -
queryii- 2
)ii2 3
;ii3 4
ifjj 
(jj 
resultjj 
.jj 
	IsSuccessjj  
)jj  !
{kk 
returnll 
Okll 
(ll 
resultll  
.ll  !
Datall! %
)ll% &
;ll& '
}mm 
returnnn 
NotFoundnn 
(nn 
resultnn "
.nn" #
ErrorMessagenn# /
)nn/ 0
;nn0 1
}oo 	
}pp 
}qq ¯?
ED:\BuySmart\BuySmart\BuySmart\Controllers\ReviewBusinessController.cs
	namespace 	
BuySmart
 
. 
Controllers 
{ 
[ 
Route 

(
 
$str  
)  !
]! "
[ 
ApiController 
] 
public 

class $
ReviewBusinessController )
:* +
ControllerBase, :
{ 
private 
readonly 
	IMediator "
mediator# +
;+ ,
public $
ReviewBusinessController '
(' (
	IMediator( 1
mediator2 :
): ;
{ 	
this 
. 
mediator 
= 
mediator $
;$ %
} 	
[ 	
HttpGet	 
( 
$str )
)) *
]* +
public 
async 
Task 
< 
IActionResult '
>' ("
GetAllReviewBusinesses) ?
(? @
)@ A
{ 	
var 
reviews 
= 
await 
mediator  (
.( )
Send) -
(- .
new. 1'
GetAllReviewBusinessesQuery2 M
(M N
)N O
)O P
;P Q
return 
Ok 
( 
reviews 
) 
; 
} 	
[ 	
HttpGet	 
( 
$str /
)/ 0
]0 1
public 
async 
Task 
< 
ActionResult &
<& '
PagedResult' 2
<2 3
	ReviewDto3 <
>< =
>= >
>> ?'
GetFilteredReviewBusinesses@ [
([ \
[\ ]
	FromQuery] f
]f g
inth k
pagel p
,p q
[r s
	FromQuerys |
]| }
int	~ Å
pageSize
Ç ä
,
ä ã
[
å ç
	FromQuery
ç ñ
]
ñ ó
string
ò û
?
û ü
keyword
† ß
)
ß ®
{   	

Expression!! 
<!! 
Func!! 
<!! 
Review!! "
,!!" #
bool!!$ (
>!!( )
>!!) *
filter!!+ 1
=!!2 3
m!!4 5
=>!!6 8
string"" 
."" 
IsNullOrEmpty""  
(""  !
keyword""! (
)""( )
||""* ,
m""- .
."". /
Comment""/ 6
.""6 7
Contains""7 ?
(""? @
keyword""@ G
)""G H
;""H I
var$$ 
query$$ 
=$$ 
new$$ ,
 GetFilteredReviewBusinessesQuery$$ <
{%% 
Page&& 
=&& 
page&& 
,&& 
PageSize'' 
='' 
pageSize'' #
,''# $
Filter(( 
=(( 
null(( 
})) 
;)) 
if++ 
(++ 
!++ 
string++ 
.++ 
IsNullOrEmpty++ %
(++% &
keyword++& -
)++- .
)++. /
{,, 
query-- 
.-- 
Filter-- 
=-- 
filter-- %
;--% &
}.. 
var// 
result// 
=// 
await// 
mediator// '
.//' (
Send//( ,
(//, -
query//- 2
)//2 3
;//3 4
if00 
(00 
result00 
.00 
	IsSuccess00  
)00  !
{11 
return22 
Ok22 
(22 
result22  
.22  !
Data22! %
)22% &
;22& '
}33 
return44 
NotFound44 
(44 
result44 "
.44" #
ErrorMessage44# /
)44/ 0
;440 1
}55 	
[77 	
HttpGet77	 
(77 
$str77 -
)77- .
]77. /
public88 
async88 
Task88 
<88 
ActionResult88 &
<88& '
	ReviewDto88' 0
>880 1
>881 2
GetReviewById883 @
(88@ A
Guid88A E
id88F H
)88H I
{99 	
return:: 
await:: 
mediator:: !
.::! "
Send::" &
(::& '
new::' *&
GetReviewBusinessByIdQuery::+ E
{::F G
Id::H J
=::K L
id::M O
}::P Q
)::Q R
;::R S
};; 	
[== 	
HttpPost==	 
(== 
$str== (
)==( )
]==) *
public>> 
async>> 
Task>> 
<>> 
ActionResult>> &
<>>& '
Result>>' -
<>>- .
Guid>>. 2
>>>2 3
>>>3 4
>>>4 5
CreateReview>>6 B
(>>B C
[>>C D
FromBody>>D L
]>>L M'
CreateReviewBusinessCommand>>N i
command>>j q
)>>q r
{?? 	
var@@ 
result@@ 
=@@ 
await@@ 
mediator@@ '
.@@' (
Send@@( ,
(@@, -
command@@- 4
)@@4 5
;@@5 6
ifAA 
(AA 
!AA 
resultAA 
.AA 
	IsSuccessAA !
)AA! "
{BB 
returnCC 

BadRequestCC !
(CC! "
resultCC" (
.CC( )
ErrorMessageCC) 5
)CC5 6
;CC6 7
}DD 
returnEE 
CreatedAtActionEE "
(EE" #
nameofEE# )
(EE) *
CreateReviewEE* 6
)EE6 7
,EE7 8
newEE9 <
{EE= >
idEE? A
=EEB C
resultEED J
.EEJ K
DataEEK O
}EEP Q
,EEQ R
resultEES Y
.EEY Z
DataEEZ ^
)EE^ _
;EE_ `
}FF 	
[HH 	
HttpPutHH	 
(HH 
$strHH 1
)HH1 2
]HH2 3
publicII 
asyncII 
TaskII 
<II 
ActionResultII &
<II& '
ResultII' -
<II- .
objectII. 4
>II4 5
>II5 6
>II6 7
UpdateReviewII7 C
(IIC D
GuidIID H
idIII K
,IIK L
[IIM N
FromBodyIIN V
]IIV W'
UpdateReviewBusinessCommandIIX s
commandIIt {
)II{ |
{JJ 	
ifKK 
(KK 
idKK 
!=KK 
commandKK 
.KK 
ReviewIdKK &
)KK& '
{LL 
returnMM 

BadRequestMM !
(MM! "
)MM" #
;MM# $
}NN 
varOO 
resultOO 
=OO 
awaitOO 
mediatorOO '
.OO' (
SendOO( ,
(OO, -
commandOO- 4
)OO4 5
;OO5 6
ifPP 
(PP 
!PP 
resultPP 
.PP 
	IsSuccessPP !
)PP! "
{QQ 
returnRR 

BadRequestRR !
(RR! "
resultRR" (
.RR( )
ErrorMessageRR) 5
)RR5 6
;RR6 7
}SS 
returnTT 
	NoContentTT 
(TT 
)TT 
;TT 
}UU 	
[WW 	

HttpDeleteWW	 
(WW 
$strWW 
)WW  
]WW  !
publicXX 
asyncXX 
TaskXX 
<XX 
ActionResultXX &
>XX& '
DeleteReviewByIdXX( 8
(XX8 9
GuidXX9 =
idXX> @
)XX@ A
{YY 	
awaitZZ 
mediatorZZ 
.ZZ 
SendZZ 
(ZZ  
newZZ  #'
DeleteReviewBusinessCommandZZ$ ?
{ZZ@ A
ReviewIdZZB J
=ZZK L
idZZM O
}ZZP Q
)ZZQ R
;ZZR S
return[[ 
	NoContent[[ 
([[ 
)[[ 
;[[ 
}\\ 	
}]] 
}^^ ∂)
MD:\BuySmart\BuySmart\BuySmart\Controllers\ProductPricePredictionController.cs
	namespace 	
BuySmart
 
. 
Controllers 
{ 
[ 
Route 

(
 
$str  
)  !
]! "
[		 
ApiController		 
]		 
public

 

class

 ,
 ProductPricePredictionController

 1
:

2 3
ControllerBase

4 B
{ 
private 
readonly '
ProductPricePredictionModel 4'
productPricePredictionModel5 P
;P Q
public ,
 ProductPricePredictionController /
(/ 0
IConfiguration0 >
configuration? L
)L M
{ 	'
productPricePredictionModel '
=( )
new* -'
ProductPricePredictionModel. I
(I J
)J K
;K L
var 
result 
= 
InitializeModel (
(( )
configuration) 6
)6 7
;7 8
if 
( 
! 
result 
. 
	IsSuccess !
)! "
{ 
Console 
. 
	WriteLine !
(! "
result" (
.( )
ErrorMessage) 5
)5 6
;6 7
} 
} 	
public 
Result 
< 
string 
> 
InitializeModel -
(- .
IConfiguration. <
configuration= J
)J K
{ 	
string 
? 
relativePath  
=! "
configuration# 0
[0 1
$str1 M
]M N
;N O
if 
( 
string 
. 
IsNullOrEmpty $
($ %
relativePath% 1
)1 2
)2 3
{ 
return 
Result 
< 
string $
>$ %
.% &
Failure& -
(- .
$str. c
)c d
;d e
} 
var!! 
projectRootDir!! 
=!!  
	Directory!!! *
.!!* +
	GetParent!!+ 4
(!!4 5

AppContext!!5 ?
.!!? @
BaseDirectory!!@ M
)!!M N
?!!N O
.!!O P
Parent!!P V
?!!V W
.!!W X
Parent!!X ^
?!!^ _
.!!_ `
Parent!!` f
;!!f g
if"" 
("" 
projectRootDir"" 
=="" !
null""" &
)""& '
{## 
return$$ 
Result$$ 
<$$ 
string$$ $
>$$$ %
.$$% &
Failure$$& -
($$- .
$str$$. _
)$$_ `
;$$` a
}%% 
string'' 
fullPathToDataset'' $
=''% &
Path''' +
.''+ ,
Combine'', 3
(''3 4
projectRootDir''4 B
.''B C
FullName''C K
,''K L
relativePath''M Y
)''Y Z
;''Z [
var** 

sampleData** 
=**  
ProductDataGenerator** 1
.**1 2
GetProducts**2 =
(**= >
fullPathToDataset**> O
)**O P
;**P Q
if++ 
(++ 

sampleData++ 
==++ 
null++ "
||++# %

sampleData++& 0
.++0 1
Count++1 6
==++7 9
$num++: ;
)++; <
{,, 
return-- 
Result-- 
<-- 
string-- $
>--$ %
.--% &
Failure--& -
(--- .
$str--. T
)--T U
;--U V
}.. '
productPricePredictionModel00 '
.00' (
Train00( -
(00- .

sampleData00. 8
)008 9
;009 :
return22 
Result22 
<22 
string22  
>22  !
.22! "
Success22" )
(22) *
$str22* d
)22d e
;22e f
}33 	
[55 	
	Authorize55	 
]55 
[66 	
HttpPost66	 
(66 
$str66 
)66 
]66 
public77 
ActionResult77 
<77 
float77 !
>77! "
PredictPrice77# /
(77/ 0
[770 1
FromBody771 9
]779 :
ProductData77; F
product77G N
)77N O
{88 	
if99 
(99 '
productPricePredictionModel99 +
==99, .
null99/ 3
)993 4
{:: 
return;; 

StatusCode;; !
(;;! "
$num;;" %
,;;% &
$str;;' M
);;M N
;;;N O
}<< 
float>> 
predictedPrice>>  
=>>! "'
productPricePredictionModel>># >
.>>> ?
Predict>>? F
(>>F G
product>>G N
)>>N O
;>>O P
return?? 
Ok?? 
(?? 
predictedPrice?? $
.??$ %
ToString??% -
(??- .
$str??. 2
)??2 3
)??3 4
;??4 5
}@@ 	
}AA 
}BB ◊N
>D:\BuySmart\BuySmart\BuySmart\Controllers\ProductController.cs
	namespace 	
BuySmart
 
. 
Controllers 
{ 
[ 
Route 

(
 
$str  
)  !
]! "
[ 
ApiController 
] 
public 

class 
ProductController "
:# $
ControllerBase% 3
{ 
private 
readonly 
	IMediator "
mediator# +
;+ ,
public 
ProductController  
(  !
	IMediator! *
mediator+ 3
)3 4
{ 	
this 
. 
mediator 
= 
mediator $
;$ %
} 	
[ 	
HttpGet	 
( 
$str !
)! "
]" #
public 
async 
Task 
< 
IActionResult '
>' (
GetAllProducts) 7
(7 8
)8 9
{ 	
var 
products 
= 
await  
mediator! )
.) *
Send* .
(. /
new/ 2
GetAllProductsQuery3 F
(F G
)G H
)H I
;I J
return 
Ok 
( 
products 
) 
;  
} 	
[!! 	
	Authorize!!	 
]!! 
["" 	
HttpGet""	 
("" 
$str"" '
)""' (
]""( )
public## 
async## 
Task## 
<## 
ActionResult## &
<##& '
PagedResult##' 2
<##2 3

ProductDto##3 =
>##= >
>##> ?
>##? @
GetFilteredProducts##A T
(##T U
[##U V
	FromQuery##V _
]##_ `
int##a d
page##e i
,##i j
[##k l
	FromQuery##l u
]##u v
int##w z
pageSize	##{ É
,
##É Ñ
[
##Ö Ü
	FromQuery
##Ü è
]
##è ê
string
##ë ó
?
##ó ò
name
##ô ù
,
##ù û
[
##ü †
	FromQuery
##† ©
]
##© ™
Guid
##´ Ø
?
##Ø ∞

categoryId
##± ª
,
##ª º
[
##Ω æ
	FromQuery
##æ «
]
##« »
decimal
##… –
?
##– —
minPrice
##“ ⁄
,
##⁄ €
[
##‹ ›
	FromQuery
##› Ê
]
##Ê Á
decimal
##Ë Ô
?
##Ô 
maxPrice
##Ò ˘
,
##˘ ˙
[
##˚ ¸
	FromQuery
##¸ Ö
]
##Ö Ü
string
##á ç
?
##ç é"
sortbyPriceDirection
##è £
)
##£ §
{$$ 	
var%% 
filter%% 
=%% 
PredicateBuilder%% )
.%%) *
New%%* -
<%%- .
Product%%. 5
>%%5 6
(%%6 7
true%%7 ;
)%%; <
;%%< =
if'' 
('' 
!'' 
string'' 
.'' 
IsNullOrEmpty'' %
(''% &
name''& *
)''* +
)''+ ,
{(( 
filter)) 
=)) 
filter)) 
.))  
And))  #
())# $
p))$ %
=>))& (
p))) *
.))* +
Name))+ /
.))/ 0
Contains))0 8
())8 9
name))9 =
)))= >
)))> ?
;))? @
}** 
if,, 
(,, 

categoryId,, 
.,, 
HasValue,, #
),,# $
{-- 
filter.. 
=.. 
filter.. 
...  
And..  #
(..# $
p..$ %
=>..& (
p..) *
...* +

Categories..+ 5
...5 6
Any..6 9
(..9 :
c..: ;
=>..< >
c..? @
...@ A

CategoryId..A K
==..L N

categoryId..O Y
)..Y Z
)..Z [
;..[ \
}// 
if11 
(11 
minPrice11 
.11 
HasValue11 !
)11! "
{22 
filter33 
=33 
filter33 
.33  
And33  #
(33# $
p33$ %
=>33& (
p33) *
.33* +
Price33+ 0
>=331 3
minPrice334 <
)33< =
;33= >
}44 
if66 
(66 
maxPrice66 
.66 
HasValue66 !
)66! "
{77 
filter88 
=88 
filter88 
.88  
And88  #
(88# $
p88$ %
=>88& (
p88) *
.88* +
Price88+ 0
<=881 3
maxPrice884 <
)88< =
;88= >
}99 
var;; 
query;; 
=;; 
new;; $
GetFilteredProductsQuery;; 4
{<< 
Page== 
=== 
page== 
,== 
PageSize>> 
=>> 
pageSize>> #
,>># $
Filter?? 
=?? 
filter?? 
,??  
SortDirection@@ 
=@@  
sortbyPriceDirection@@  4
,@@4 5
}AA 
;AA 
varCC 
resultCC 
=CC 
awaitCC 
mediatorCC '
.CC' (
SendCC( ,
(CC, -
queryCC- 2
)CC2 3
;CC3 4
ifDD 
(DD 
resultDD 
.DD 
	IsSuccessDD  
)DD  !
{EE 
returnFF 
OkFF 
(FF 
resultFF  
.FF  !
DataFF! %
)FF% &
;FF& '
}GG 
returnHH 
NotFoundHH 
(HH 
resultHH "
.HH" #
ErrorMessageHH# /
)HH/ 0
;HH0 1
}II 	
[KK 	
HttpGetKK	 
(KK 
$strKK &
)KK& '
]KK' (
publicLL 
asyncLL 
TaskLL 
<LL 
ActionResultLL &
<LL& '

ProductDtoLL' 1
>LL1 2
>LL2 3
GetProductByIdLL4 B
(LLB C
GuidLLC G
idLLH J
)LLJ K
{MM 	
returnNN 
awaitNN 
mediatorNN !
.NN! "
SendNN" &
(NN& '
newNN' *
GetProductByIdQueryNN+ >
{NN? @
	ProductIdNNA J
=NNK L
idNNM O
}NNP Q
)NNQ R
;NNR S
}OO 	
[RR 	
HttpPostRR	 
(RR 
$strRR !
)RR! "
]RR" #
publicSS 
asyncSS 
TaskSS 
<SS 
ActionResultSS &
<SS& '
ResultSS' -
<SS- .
GuidSS. 2
>SS2 3
>SS3 4
>SS4 5
CreateProductSS6 C
(SSC D
[SSD E
FromBodySSE M
]SSM N 
CreateProductCommandSSO c
commandSSd k
)SSk l
{TT 	
varUU 
resultUU 
=UU 
awaitUU 
mediatorUU '
.UU' (
SendUU( ,
(UU, -
commandUU- 4
)UU4 5
;UU5 6
ifVV 
(VV 
!VV 
resultVV 
.VV 
	IsSuccessVV !
)VV! "
{WW 
returnXX 

BadRequestXX !
(XX! "
resultXX" (
.XX( )
ErrorMessageXX) 5
)XX5 6
;XX6 7
}YY 
returnZZ 
CreatedAtActionZZ "
(ZZ" #
nameofZZ# )
(ZZ) *
CreateProductZZ* 7
)ZZ7 8
,ZZ8 9
newZZ: =
{ZZ> ?
idZZ@ B
=ZZC D
resultZZE K
.ZZK L
DataZZL P
}ZZQ R
,ZZR S
resultZZT Z
.ZZZ [
DataZZ[ _
)ZZ_ `
;ZZ` a
}[[ 	
[]] 	
HttpPut]]	 
(]] 
$str]] *
)]]* +
]]]+ ,
public^^ 
async^^ 
Task^^ 
<^^ 
ActionResult^^ &
<^^& '
Result^^' -
<^^- .
object^^. 4
>^^4 5
>^^5 6
>^^6 7
UpdateProduct^^8 E
(^^E F
Guid^^F J
id^^K M
,^^M N
[^^O P
FromBody^^P X
]^^X Y 
UpdateProductCommand^^Z n
command^^o v
)^^v w
{__ 	
if`` 
(`` 
id`` 
!=`` 
command`` 
.`` 
	ProductId`` '
)``' (
{aa 
returnbb 

BadRequestbb !
(bb! "
)bb" #
;bb# $
}cc 
vardd 
resultdd 
=dd 
awaitdd 
mediatordd '
.dd' (
Senddd( ,
(dd, -
commanddd- 4
)dd4 5
;dd5 6
ifff 
(ff 
!ff 
resultff 
.ff 
	IsSuccessff !
)ff! "
{gg 
returnhh 

BadRequesthh !
(hh! "
resulthh" (
.hh( )
ErrorMessagehh) 5
)hh5 6
;hh6 7
}ii 
returnkk 
	NoContentkk 
(kk 
)kk 
;kk 
}ll 	
[nn 	

HttpDeletenn	 
(nn 
$strnn -
)nn- .
]nn. /
publicoo 
asyncoo 
Taskoo 
<oo 
ActionResultoo &
>oo& '
DeleteProductByIdoo( 9
(oo9 :
Guidoo: >
idoo? A
)ooA B
{pp 	
awaitqq 
mediatorqq 
.qq 
Sendqq 
(qq  
newqq  # 
DeleteProductCommandqq$ 8
{qq9 :
	ProductIdqq; D
=qqE F
idqqG I
}qqJ K
)qqK L
;qqL M
returnrr 
	NoContentrr 
(rr 
)rr 
;rr 
}ss 	
}tt 
}uu ®=
?D:\BuySmart\BuySmart\BuySmart\Controllers\CategoryController.cs
	namespace 	
BuySmart
 
. 
Controllers 
{ 
[ 
Route 

(
 
$str  
)  !
]! "
[ 
ApiController 
] 
public 

class 
CategoryController #
:$ %
ControllerBase& 4
{ 
private 
readonly 
	IMediator "
mediator# +
;+ ,
public 
CategoryController !
(! "
	IMediator" +
mediator, 4
)4 5
{ 	
this 
. 
mediator 
= 
mediator $
;$ %
} 	
[ 	
HttpGet	 
( 
$str #
)# $
]$ %
public 
async 
Task 
< 
IActionResult '
>' (
GetAllCategories) 9
(9 :
): ;
{ 	
var 

categories 
= 
await "
mediator# +
.+ ,
Send, 0
(0 1
new1 4!
GetAllCategoriesQuery5 J
(J K
)K L
)L M
;M N
return 
Ok 
( 

categories  
)  !
;! "
} 	
[ 	
HttpGet	 
( 
$str )
)) *
]* +
public 
async 
Task 
< 
ActionResult &
<& '
PagedResult' 2
<2 3
CategoryDto3 >
>> ?
>? @
>@ A!
GetFilteredCategoriesB W
(W X
[X Y
	FromQueryY b
]b c
intd g
pageh l
,l m
[n o
	FromQueryo x
]x y
intz }
pageSize	~ Ü
,
Ü á
[
à â
	FromQuery
â í
]
í ì
string
î ö
?
ö õ
keyword
ú £
)
£ §
{   	

Expression!! 
<!! 
Func!! 
<!! 
Category!! $
,!!$ %
bool!!& *
>!!* +
>!!+ ,
filter!!- 3
=!!4 5
m!!6 7
=>!!8 :
string"" 
."" 
IsNullOrEmpty""  
(""  !
keyword""! (
)""( )
||""* ,
m""- .
."". /
Description""/ :
."": ;
Contains""; C
(""C D
keyword""D K
)""K L
;""L M
var$$ 
query$$ 
=$$ 
new$$ &
GetFilteredCategoriesQuery$$ 6
{%% 
Page&& 
=&& 
page&& 
,&& 
PageSize'' 
='' 
pageSize'' #
,''# $
Filter(( 
=(( 
filter(( 
})) 
;)) 
var** 
result** 
=** 
await** 
mediator** '
.**' (
Send**( ,
(**, -
query**- 2
)**2 3
;**3 4
if++ 
(++ 
result++ 
.++ 
	IsSuccess++  
)++  !
{,, 
return-- 
Ok-- 
(-- 
result--  
.--  !
Data--! %
)--% &
;--& '
}.. 
return// 
NotFound// 
(// 
result// "
.//" #
ErrorMessage//# /
)/// 0
;//0 1
}00 	
[33 	
HttpGet33	 
(33 
$str33 '
)33' (
]33( )
public44 
async44 
Task44 
<44 
ActionResult44 &
<44& '
CategoryDto44' 2
>442 3
>443 4
GetCategoryById445 D
(44D E
Guid44E I
id44J L
)44L M
{55 	
return66 
await66 
mediator66 !
.66! "
Send66" &
(66& '
new66' * 
GetCategoryByIdQuery66+ ?
{66@ A

CategoryId66B L
=66M N
id66O Q
}66R S
)66S T
;66T U
}77 	
[99 	
HttpPost99	 
(99 
$str99 "
)99" #
]99# $
public:: 
async:: 
Task:: 
<:: 
ActionResult:: &
<::& '
Result::' -
<::- .
Guid::. 2
>::2 3
>::3 4
>::4 5
CreateCategory::6 D
(::D E
[::E F
FromBody::F N
]::N O!
CreateCategoryCommand::P e
command::f m
)::m n
{;; 	
var<< 
result<< 
=<< 
await<< 
mediator<< '
.<<' (
Send<<( ,
(<<, -
command<<- 4
)<<4 5
;<<5 6
if== 
(== 
!== 
result== 
.== 
	IsSuccess== !
)==! "
{>> 
return?? 

BadRequest?? !
(??! "
result??" (
.??( )
ErrorMessage??) 5
)??5 6
;??6 7
}@@ 
returnAA 
CreatedAtActionAA "
(AA" #
nameofAA# )
(AA) *
CreateCategoryAA* 8
)AA8 9
,AA9 :
newAA; >
{AA? @
idAAA C
=AAD E
resultAAF L
.AAL M
DataAAM Q
}AAR S
,AAS T
resultAAU [
.AA[ \
DataAA\ `
)AA` a
;AAa b
}BB 	
[DD 	

HttpDeleteDD	 
(DD 
$strDD .
)DD. /
]DD/ 0
publicEE 
asyncEE 
TaskEE 
<EE 
ActionResultEE &
>EE& '
DeleteCategoryByIdEE( :
(EE: ;
GuidEE; ?
idEE@ B
)EEB C
{FF 	
awaitGG 
mediatorGG 
.GG 
SendGG 
(GG  
newGG  #!
DeleteCategoryCommandGG$ 9
{GG: ;

CategoryIdGG< F
=GGG H
idGGI K
}GGL M
)GGM N
;GGN O
returnHH 
	NoContentHH 
(HH 
)HH 
;HH 
}II 	
[KK 	
HttpPutKK	 
(KK 
$strKK +
)KK+ ,
]KK, -
publicLL 
asyncLL 
TaskLL 
<LL 
ActionResultLL &
<LL& '
ResultLL' -
<LL- .
objectLL. 4
>LL4 5
>LL5 6
>LL6 7
UpdateCategoryLL8 F
(LLF G
GuidLLG K
idLLL N
,LLN O
[LLP Q
FromBodyLLQ Y
]LLY Z!
UpdateCategoryCommandLL[ p
commandLLq x
)LLx y
{MM 	
ifNN 
(NN 
idNN 
!=NN 
commandNN 
.NN 

CategoryIdNN (
)NN( )
{OO 
returnPP 

BadRequestPP !
(PP! "
)PP" #
;PP# $
}QQ 
varRR 
resultRR 
=RR 
awaitRR 
mediatorRR '
.RR' (
SendRR( ,
(RR, -
commandRR- 4
)RR4 5
;RR5 6
ifSS 
(SS 
!SS 
resultSS 
.SS 
	IsSuccessSS !
)SS! "
{TT 
returnUU 

BadRequestUU !
(UU! "
resultUU" (
.UU( )
ErrorMessageUU) 5
)UU5 6
;UU6 7
}VV 
returnWW 
	NoContentWW 
(WW 
)WW 
;WW 
}XX 	
}ZZ 
}[[ “?
?D:\BuySmart\BuySmart\BuySmart\Controllers\BusinessController.cs
	namespace 	
BuySmart
 
. 
Controllers 
{ 
[ 
Route 

(
 
$str  
)  !
]! "
[ 
ApiController 
] 
public 

class 
BusinessController #
:$ %
ControllerBase& 4
{ 
private 
readonly 
	IMediator "
mediator# +
;+ ,
public 
BusinessController !
(! "
	IMediator" +
mediator, 4
)4 5
{ 	
this 
. 
mediator 
= 
mediator $
;$ %
} 	
[ 	
HttpGet	 
( 
$str #
)# $
]$ %
public 
async 
Task 
< 
IActionResult '
>' (
GetAllBusinesses) 9
(9 :
): ;
{ 	
var 

businesses 
= 
await "
mediator# +
.+ ,
Send, 0
(0 1
new1 4!
GetAllBusinessesQuery5 J
(J K
)K L
)L M
;M N
return 
Ok 
( 

businesses  
)  !
;! "
} 	
[ 	
HttpGet	 
( 
$str )
)) *
]* +
public 
async 
Task 
< 
ActionResult &
<& '
PagedResult' 2
<2 3
BusinessDto3 >
>> ?
>? @
>@ A!
GetFilteredBusinessesB W
(W X
[X Y
	FromQueryY b
]b c
intd g
pageh l
,l m
[n o
	FromQueryo x
]x y
intz }
pageSize	~ Ü
,
Ü á
[
à â
	FromQuery
â í
]
í ì
string
î ö
?
ö õ
keyword
ú £
)
£ §
{ 	

Expression   
<   
Func   
<   
Business   $
,  $ %
bool  & *
>  * +
>  + ,
filter  - 3
=  4 5
m  6 7
=>  8 :
string!! 
.!! 
IsNullOrEmpty!!  
(!!  !
keyword!!! (
)!!( )
||!!* ,
m!!- .
.!!. /
Description!!/ :
.!!: ;
Contains!!; C
(!!C D
keyword!!D K
)!!K L
;!!L M
var"" 
query"" 
="" 
new"" &
GetFilteredBusinessesQuery"" 6
{## 
Page$$ 
=$$ 
page$$ 
,$$ 
PageSize%% 
=%% 
pageSize%% #
,%%# $
Filter&& 
=&& 
null&& 
}'' 
;'' 
if(( 
((( 
!(( 
string(( 
.(( 
IsNullOrEmpty(( %
(((% &
keyword((& -
)((- .
)((. /
{)) 
query** 
.** 
Filter** 
=** 
filter** %
;**% &
}++ 
var,, 
result,, 
=,, 
await,, 
mediator,, '
.,,' (
Send,,( ,
(,,, -
query,,- 2
),,2 3
;,,3 4
if-- 
(-- 
result-- 
.-- 
	IsSuccess--  
)--  !
{.. 
return// 
Ok// 
(// 
result//  
.//  !
Data//! %
)//% &
;//& '
}00 
return11 
NotFound11 
(11 
result11 "
.11" #
ErrorMessage11# /
)11/ 0
;110 1
}22 	
[44 	
HttpGet44	 
(44 
$str44 '
)44' (
]44( )
public55 
async55 
Task55 
<55 
ActionResult55 &
<55& '
BusinessDto55' 2
>552 3
>553 4
GetBusinessById555 D
(55D E
Guid55E I
id55J L
)55L M
{66 	
return77 
await77 
mediator77 !
.77! "
Send77" &
(77& '
new77' * 
GetBusinessByIdQuery77+ ?
{77@ A
Id77B D
=77E F
id77G I
}77J K
)77K L
;77L M
}88 	
[:: 	
HttpPost::	 
(:: 
$str:: "
)::" #
]::# $
public;; 
async;; 
Task;; 
<;; 
ActionResult;; &
<;;& '
Result;;' -
<;;- .
Guid;;. 2
>;;2 3
>;;3 4
>;;4 5
CreateBusiness;;6 D
(;;D E
[;;E F
FromBody;;F N
];;N O!
CreateBusinessCommand;;P e
command;;f m
);;m n
{<< 	
var== 
result== 
=== 
await== 
mediator== '
.==' (
Send==( ,
(==, -
command==- 4
)==4 5
;==5 6
if>> 
(>> 
!>> 
result>> 
.>> 
	IsSuccess>> !
)>>! "
{?? 
return@@ 

BadRequest@@ !
(@@! "
result@@" (
.@@( )
ErrorMessage@@) 5
)@@5 6
;@@6 7
}AA 
returnBB 
CreatedAtActionBB "
(BB" #
nameofBB# )
(BB) *
CreateBusinessBB* 8
)BB8 9
,BB9 :
newBB; >
{BB? @
idBBA C
=BBD E
resultBBF L
.BBL M
DataBBM Q
}BBR S
,BBS T
resultBBU [
.BB[ \
DataBB\ `
)BB` a
;BBa b
}CC 	
[EE 	

HttpDeleteEE	 
(EE 
$strEE .
)EE. /
]EE/ 0
publicFF 
asyncFF 
TaskFF 
<FF 
ActionResultFF &
>FF& '
DeleteBusinessByIdFF( :
(FF: ;
GuidFF; ?
idFF@ B
)FFB C
{GG 	
awaitHH 
mediatorHH 
.HH 
SendHH 
(HH  
newHH  #!
DeleteBusinessCommandHH$ 9
{HH: ;

BusinessIDHH< F
=HHG H
idHHI K
}HHL M
)HHM N
;HHN O
returnII 
	NoContentII 
(II 
)II 
;II 
}JJ 	
[LL 	
HttpPutLL	 
(LL 
$strLL +
)LL+ ,
]LL, -
publicMM 
asyncMM 
TaskMM 
<MM 
ActionResultMM &
<MM& '
ResultMM' -
<MM- .
objectMM. 4
>MM4 5
>MM5 6
>MM6 7
UpdateBusinessMM8 F
(MMF G
GuidMMG K
idMML N
,MMN O
[MMP Q
FromBodyMMQ Y
]MMY Z!
UpdateBusinessCommandMM[ p
commandMMq x
)MMx y
{NN 	
ifOO 
(OO 
idOO 
!=OO 
commandOO 
.OO 

BusinessIDOO (
)OO( )
{PP 
returnQQ 

BadRequestQQ !
(QQ! "
)QQ" #
;QQ# $
}RR 
varSS 
resultSS 
=SS 
awaitSS 
mediatorSS '
.SS' (
SendSS( ,
(SS, -
commandSS- 4
)SS4 5
;SS5 6
ifUU 
(UU 
!UU 
resultUU 
.UU 
	IsSuccessUU !
)UU! "
{VV 
returnWW 

BadRequestWW !
(WW! "
resultWW" (
.WW( )
ErrorMessageWW) 5
)WW5 6
;WW6 7
}XX 
returnZZ 
	NoContentZZ 
(ZZ 
)ZZ 
;ZZ 
}[[ 	
}\\ 
}]] ‰5
;D:\BuySmart\BuySmart\BuySmart\Controllers\AuthController.cs
	namespace 	
BuySmart
 
. 
Controllers 
{		 
[

 
ApiController

 
]

 
[ 
Route 

(
 
$str 
) 
] 
public 

class 
AuthController 
:  !
ControllerBase" 0
{ 
private 
readonly 
	IMediator "
	_mediator# ,
;, -
private 
readonly  
IHttpContextAccessor -
httpContextAccessor. A
;A B
public 
AuthController 
( 
	IMediator '
mediator( 0
,0 1 
IHttpContextAccessor2 F
httpContextAccessorG Z
)Z [
{ 	
	_mediator 
= 
mediator  
;  !
this 
. 
httpContextAccessor $
=% &
httpContextAccessor' :
;: ;
} 	
[ 	
HttpPost	 
( 
$str (
)( )
]) *
public 
async 
Task 
< 
ActionResult &
<& '
Result' -
<- .
Guid. 2
>2 3
>3 4
>4 5
Register6 >
(> ?
[? @
FromBody@ H
]H I
RegisterUserCommandJ ]
command^ e
)e f
{ 	
var 
result 
= 
await 
	_mediator (
.( )
Send) -
(- .
command. 5
)5 6
;6 7
if 
( 
! 
result 
. 
	IsSuccess !
)! "
{ 
return 

BadRequest !
(! "
result" (
.( )
ErrorMessage) 5
)5 6
;6 7
} 
return 
CreatedAtAction "
(" #
nameof# )
() *
Register* 2
)2 3
,3 4
new5 8
{9 :
id; =
=> ?
result@ F
.F G
DataG K
}L M
,M N
resultO U
.U V
DataV Z
)Z [
;[ \
}   	
["" 	
HttpPost""	 
("" 
$str"" 
)"" 
]"" 
public## 
async## 
Task## 
<## 
ActionResult## &
<##& '
Result##' -
<##- .
string##. 4
>##4 5
>##5 6
>##6 7
Login##8 =
(##= >
LoginUserCommand##> N
command##O V
)##V W
{$$ 	
var%% 
token%% 
=%% 
await%% 
	_mediator%% '
.%%' (
Send%%( ,
(%%, -
command%%- 4
)%%4 5
;%%5 6
if&& 
(&& 
!&& 
token&& 
.&& 
	IsSuccess&&  
)&&  !
{'' 
return(( 
Unauthorized(( #
(((# $
token(($ )
.(() *
ErrorMessage((* 6
)((6 7
;((7 8
})) 
return** 
Ok** 
(** 
new** 
{** 
Token** !
=**" #
token**$ )
}*** +
)**+ ,
;**, -
}++ 	
[-- 	
HttpPost--	 
(-- 
$str-- 
)-- 
]-- 
public.. 
async.. 
Task.. 
<.. 
ActionResult.. &
<..& '
Result..' -
<..- .
string... 4
>..4 5
>..5 6
>..6 7 
SendConfirmationCode..8 L
(..L M'
SendVerificationCodeCommand..M h
command..i p
)..p q
{// 	
var00 
result00 
=00 
await00 
	_mediator00 (
.00( )
Send00) -
(00- .
command00. 5
)005 6
;006 7
if11 
(11 
!11 
result11 
.11 
	IsSuccess11 !
)11! "
{22 
return33 

BadRequest33 !
(33! "
result33" (
.33( )
ErrorMessage33) 5
)335 6
;336 7
}44 
return55 
Ok55 
(55 
result55 
.55 
Data55 !
)55! "
;55" #
}66 	
[88 	
	Authorize88	 
]88 
[99 	
HttpPost99	 
(99 
$str99 "
)99" #
]99# $
public:: 
async:: 
Task:: 
<:: 
ActionResult:: &
<::& '
Result::' -
<::- .
string::. 4
>::4 5
>::5 6
>::6 7
VerifyPassword::8 F
(::F G!
VerifyPasswordCommand::G \
command::] d
)::d e
{;; 	
var<< 
httpContext<< 
=<< 
httpContextAccessor<< 1
.<<1 2
HttpContext<<2 =
;<<= >
if== 
(== 
httpContext== 
==== 
null== #
)==# $
{>> 
return?? 
Unauthorized?? #
(??# $
)??$ %
;??% &
}@@ 
varBB 
userIdBB 
=BB 
	JwtHelperBB "
.BB" #
GetUserIdFromJwtBB# 3
(BB3 4
httpContextBB4 ?
)BB? @
;BB@ A
ifDD 
(DD 
userIdDD 
==DD 
nullDD 
)DD 
{EE 
returnFF 
UnauthorizedFF #
(FF# $
)FF$ %
;FF% &
}GG 
commandHH 
.HH 
UserIdHH 
=HH 
newHH  
GuidHH! %
(HH% &
userIdHH& ,
)HH, -
;HH- .
varII 
resultII 
=II 
awaitII 
	_mediatorII (
.II( )
SendII) -
(II- .
commandII. 5
)II5 6
;II6 7
ifJJ 
(JJ 
!JJ 
resultJJ 
.JJ 
	IsSuccessJJ !
)JJ! "
{KK 
returnLL 
UnauthorizedLL #
(LL# $
resultLL$ *
.LL* +
ErrorMessageLL+ 7
)LL7 8
;LL8 9
}MM 
returnNN 
OkNN 
(NN 
newNN 
{NN 
DataNN  
=NN! "
resultNN# )
.NN) *
DataNN* .
}NN/ 0
)NN0 1
;NN1 2
}OO 	
}PP 
}QQ 