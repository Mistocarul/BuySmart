˚
<D:\BuySmart\BuySmart\Application\Utils\ValidationBehavior.cs
	namespace 	
Application
 
. 
Utils 
{ 
public 

class 
ValidationBehavior #
<# $
TRequest$ ,
,, -
	TResponse. 7
>7 8
:9 :
IPipelineBehavior; L
<L M
TRequestM U
,U V
	TResponseW `
>` a
whereb g
TRequesth p
:q r
IRequests {
<{ |
	TResponse	| Ö
>
Ö Ü
{ 
private 
readonly 
IEnumerable $
<$ %

IValidator% /
</ 0
TRequest0 8
>8 9
>9 :

validators; E
;E F
public

 
ValidationBehavior

 !
(

! "
IEnumerable

" -
<

- .

IValidator

. 8
<

8 9
TRequest

9 A
>

A B
>

B C

validators

D N
)

N O
{ 	
this 
. 

validators 
= 

validators (
;( )
} 	
public 
async 
Task 
< 
	TResponse #
># $
Handle% +
(+ ,
TRequest, 4
request5 <
,< ="
RequestHandlerDelegate> T
<T U
	TResponseU ^
>^ _
next` d
,d e
CancellationTokenf w
cancellationToken	x â
)
â ä
{ 	
var 
context 
= 
new 
ValidationContext /
</ 0
TRequest0 8
>8 9
(9 :
request: A
)A B
;B C
var 
failures 
= 

validators %
. 
Select 
( 
v 
=> 
v 
. 
Validate '
(' (
context( /
)/ 0
)0 1
. 

SelectMany 
( 
result "
=># %
result& ,
., -
Errors- 3
)3 4
. 
Where 
( 
f 
=> 
f 
!=  
null! %
)% &
. 
ToList 
( 
) 
; 
if 
( 
failures 
. 
Count 
!= !
$num" #
)# $
{ 
throw 
new 
ValidationException -
(- .
failures. 6
)6 7
;7 8
} 
return 
await 
next 
( 
) 
;  
} 	
} 
} Ã
5D:\BuySmart\BuySmart\Application\Utils\PagedResult.cs
	namespace 	
Application
 
. 
Utils 
{ 
public 

class 
PagedResult 
< 
T 
> 
{ 
public 
PagedResult 
( 
List 
<  
T  !
>! "
data# '
,' (
int) ,

totalCount- 7
)7 8
{ 	
Data 
= 
data 
; 

TotalCount 
= 

totalCount #
;# $
}		 	
public 
List 
< 
T 
> 
Data 
{ 
get !
;! "
}# $
public 
int 

TotalCount 
{ 
get  #
;# $
}% &
} 
} ”4
8D:\BuySmart\BuySmart\Application\Utils\MappingProfile.cs
	namespace 	
Application
 
. 
Utils 
{ 
public 

class 
MappingProfile 
:  !
Profile" )
{ 
public 
MappingProfile 
( 
) 
{ 	
	CreateMap 
< 
Product 
, 

ProductDto )
>) *
(* +
)+ ,
., -

ReverseMap- 7
(7 8
)8 9
;9 :
	CreateMap 
<  
CreateProductCommand *
,* +
Product, 3
>3 4
(4 5
)5 6
.6 7

ReverseMap7 A
(A B
)B C
;C D
	CreateMap 
<  
UpdateProductCommand *
,* +
Product, 3
>3 4
(4 5
)5 6
.6 7

ReverseMap7 A
(A B
)B C
;C D
	CreateMap 
< 
User 
, 
UserDto #
># $
($ %
)% &
.& '

ReverseMap' 1
(1 2
)2 3
;3 4
	CreateMap 
< 
RegisterUserCommand )
,) *
User+ /
>/ 0
(0 1
)1 2
.2 3

ReverseMap3 =
(= >
)> ?
;? @
	CreateMap 
< '
SendVerificationCodeCommand 1
,1 2
User3 7
>7 8
(8 9
)9 :
.: ;

ReverseMap; E
(E F
)F G
;G H
	CreateMap 
< 
LoginUserCommand &
,& '
User( ,
>, -
(- .
). /
./ 0

ReverseMap0 :
(: ;
); <
;< =
	CreateMap 
< 
UpdateUserCommand '
,' (
User) -
>- .
(. /
)/ 0
.0 1

ReverseMap1 ;
(; <
)< =
;= >
	CreateMap 
< 
User 
, 

UserClient &
>& '
(' (
)( )
.) *

ReverseMap* 4
(4 5
)5 6
;6 7
	CreateMap 
< 
User 
, 
UserBusiness (
>( )
() *
)* +
.+ ,

ReverseMap, 6
(6 7
)7 8
;8 9
	CreateMap!! 
<!! 

UserClient!!  
,!!  !
UserClientDto!!" /
>!!/ 0
(!!0 1
)!!1 2
.!!2 3

ReverseMap!!3 =
(!!= >
)!!> ?
;!!? @
	CreateMap"" 
<"" #
CreateUserClientCommand"" -
,""- .

UserClient""/ 9
>""9 :
("": ;
)""; <
.""< =

ReverseMap""= G
(""G H
)""H I
;""I J
	CreateMap## 
<## #
UpdateUserClientCommand## -
,##- .

UserClient##/ 9
>##9 :
(##: ;
)##; <
.##< =

ReverseMap##= G
(##G H
)##H I
;##I J
	CreateMap$$ 
<$$ %
CreateUserBusinessCommand$$ /
,$$/ 0
UserBusiness$$1 =
>$$= >
($$> ?
)$$? @
.$$@ A

ReverseMap$$A K
($$K L
)$$L M
;$$M N
	CreateMap%% 
<%% %
UpdateUserBusinessCommand%% /
,%%/ 0
UserBusiness%%1 =
>%%= >
(%%> ?
)%%? @
.%%@ A

ReverseMap%%A K
(%%K L
)%%L M
;%%M N
	CreateMap&& 
<&& 
UserBusiness&& "
,&&" #
UserBusinessDto&&$ 3
>&&3 4
(&&4 5
)&&5 6
.&&6 7

ReverseMap&&7 A
(&&A B
)&&B C
;&&C D
	CreateMap(( 
<(( !
CreateBusinessCommand(( +
,((+ ,
Business((- 5
>((5 6
(((6 7
)((7 8
.((8 9

ReverseMap((9 C
(((C D
)((D E
;((E F
	CreateMap)) 
<)) !
UpdateBusinessCommand)) +
,))+ ,
Business))- 5
>))5 6
())6 7
)))7 8
.))8 9

ReverseMap))9 C
())C D
)))D E
;))E F
	CreateMap** 
<** 
Business** 
,** 
BusinessDto**  +
>**+ ,
(**, -
)**- .
.**. /

ReverseMap**/ 9
(**9 :
)**: ;
;**; <
	CreateMap,, 
<,, '
CreateReviewBusinessCommand,, 1
,,,1 2
Review,,3 9
>,,9 :
(,,: ;
),,; <
.,,< =

ReverseMap,,= G
(,,G H
),,H I
;,,I J
	CreateMap-- 
<-- '
UpdateReviewBusinessCommand-- 1
,--1 2
Review--3 9
>--9 :
(--: ;
)--; <
.--< =

ReverseMap--= G
(--G H
)--H I
;--I J
	CreateMap.. 
<.. 
Review.. 
,.. 
	ReviewDto.. '
>..' (
(..( )
)..) *
...* +

ReverseMap..+ 5
(..5 6
)..6 7
;..7 8
	CreateMap// 
<// 
CreateCartCommand// '
,//' (
Cart//) -
>//- .
(//. /
)/// 0
.//0 1

ReverseMap//1 ;
(//; <
)//< =
;//= >
	CreateMap00 
<00 
Cart00 
,00 
CartDto00 #
>00# $
(00$ %
)00% &
.00& '

ReverseMap00' 1
(001 2
)002 3
;003 4
	CreateMap33 
<33 !
CreateCategoryCommand33 +
,33+ ,
Category33- 5
>335 6
(336 7
)337 8
.338 9

ReverseMap339 C
(33C D
)33D E
;33E F
	CreateMap44 
<44 !
UpdateCategoryCommand44 +
,44+ ,
Category44- 5
>445 6
(446 7
)447 8
.448 9

ReverseMap449 C
(44C D
)44D E
;44E F
	CreateMap55 
<55 
Category55 
,55 
CategoryDto55  +
>55+ ,
(55, -
)55- .
.55. /

ReverseMap55/ 9
(559 :
)55: ;
;55; <
}77 	
}88 
}99 é
gD:\BuySmart\BuySmart\Application\QueryHandlers\UserClientQueryHandlers\GetUserClientByIdQueryHandler.cs
	namespace 	
Application
 
. 
QueryHandlers #
.# $#
UserClientQueryHandlers$ ;
{		 
public

 

class

 )
GetUserClientByIdQueryHandler

 .
:

/ 0
IRequestHandler

1 @
<

@ A"
GetUserClientByIdQuery

A W
,

W X
UserClientDto

Y f
>

f g
{ 
private 
readonly 
IUserRepository (
<( )

UserClient) 3
>3 4

repository5 ?
;? @
private 
readonly 
IMapper  
mapper! '
;' (
public )
GetUserClientByIdQueryHandler ,
(, -
IUserRepository- <
<< =

UserClient= G
>G H

repositoryI S
,S T
IMapperU \
mapper] c
)c d
{ 	
this 
. 

repository 
= 

repository (
;( )
this 
. 
mapper 
= 
mapper  
;  !
} 	
public 
async 
Task 
< 
UserClientDto '
>' (
Handle) /
(/ 0"
GetUserClientByIdQuery0 F
requestG N
,N O
CancellationTokenP a
cancellationTokenb s
)s t
{ 	
var 

userClient 
= 
await "

repository# -
.- .
GetByIdAsync. :
(: ;
request; B
.B C
IdC E
)E F
;F G
return 
mapper 
. 
Map 
< 
UserClientDto +
>+ ,
(, -

userClient- 7
)7 8
;8 9
} 	
} 
} Ä
lD:\BuySmart\BuySmart\Application\QueryHandlers\UserClientQueryHandlers\GetFilteredUserClientsQueryHandler.cs
	namespace 	
Application
 
. 
QueryHandlers #
.# $#
UserClientQueryHandlers$ ;
{ 
public 

class .
"GetFilteredUserClientsQueryHandler 3
:4 5
IRequestHandler6 E
<E F'
GetFilteredUserClientsQueryF a
,a b
Resultc i
<i j
PagedResultj u
<u v
UserClientDto	v É
>
É Ñ
>
Ñ Ö
>
Ö Ü
{ 
private 
readonly 
IUserRepository (
<( )

UserClient) 3
>3 4

repository5 ?
;? @
private 
readonly 
IMapper  
mapper! '
;' (
public .
"GetFilteredUserClientsQueryHandler 1
(1 2
IUserRepository2 A
<A B

UserClientB L
>L M

repositoryN X
,X Y
IMapperZ a
mapperb h
)h i
{ 	
this 
. 

repository 
= 

repository (
;( )
this 
. 
mapper 
= 
mapper  
;  !
} 	
public 
async 
Task 
< 
Result  
<  !
PagedResult! ,
<, -
UserClientDto- :
>: ;
>; <
>< =
Handle> D
(D E'
GetFilteredUserClientsQueryE `
requesta h
,h i
CancellationTokenj {
cancellationToken	| ç
)
ç é
{ 	
var 
userClients 
= 
await #

repository$ .
.. /
GetAllAsync/ :
(: ;
); <
;< =
if 
( 
request 
. 
Filter 
!= !
null" &
)& '
{ 
userClients 
= 
userClients )
.) *
AsQueryable* 5
(5 6
)6 7
.7 8
Where8 =
(= >
request> E
.E F
FilterF L
)L M
;M N
} 
var 

totalCount 
= 
userClients (
.( )
Count) .
(. /
)/ 0
;0 1
var   
pagedUserClients    
=  ! "
userClients  # .
.  . /
AsQueryable  / :
(  : ;
)  ; <
.  < =
ApplyPaging  = H
(  H I
request  I P
.  P Q
Page  Q U
,  U V
request  W ^
.  ^ _
PageSize  _ g
)  g h
;  h i
var!! 
userClientDtos!! 
=!!  
mapper!!! '
.!!' (
Map!!( +
<!!+ ,
List!!, 0
<!!0 1
UserClientDto!!1 >
>!!> ?
>!!? @
(!!@ A
pagedUserClients!!A Q
)!!Q R
;!!R S
var"" 
pagedResult"" 
="" 
new"" !
PagedResult""" -
<""- .
UserClientDto"". ;
>""; <
(""< =
userClientDtos""= K
,""K L

totalCount""M W
)""W X
;""X Y
return## 
Result## 
<## 
PagedResult## %
<##% &
UserClientDto##& 3
>##3 4
>##4 5
.##5 6
Success##6 =
(##= >
pagedResult##> I
)##I J
;##J K
}$$ 	
}%% 
}&& Î
gD:\BuySmart\BuySmart\Application\QueryHandlers\UserClientQueryHandlers\GetAllUserClientsQueryHandler.cs
	namespace 	
Application
 
. 
QueryHandlers #
.# $#
UserClientQueryHandlers$ ;
{		 
public

 

class

 )
GetAllUserClientsQueryHandler

 .
:

/ 0
IRequestHandler

1 @
<

@ A"
GetAllUserClientsQuery

A W
,

W X
List

Y ]
<

] ^
UserClientDto

^ k
>

k l
>

l m
{ 
private 
readonly 
IUserRepository (
<( )

UserClient) 3
>3 4

repository5 ?
;? @
private 
readonly 
IMapper  
mapper! '
;' (
public )
GetAllUserClientsQueryHandler ,
(, -
IUserRepository- <
<< =

UserClient= G
>G H

repositoryI S
,S T
IMapperU \
mapper] c
)c d
{ 	
this 
. 

repository 
= 

repository (
;( )
this 
. 
mapper 
= 
mapper  
;  !
} 	
public 
async 
Task 
< 
List 
< 
UserClientDto ,
>, -
>- .
Handle/ 5
(5 6"
GetAllUserClientsQuery6 L
requestM T
,T U
CancellationTokenV g
cancellationTokenh y
)y z
{ 	
var 
userClients 
= 
await #

repository$ .
.. /
GetAllAsync/ :
(: ;
); <
;< =
return 
mapper 
. 
Map 
< 
List "
<" #
UserClientDto# 0
>0 1
>1 2
(2 3
userClients3 >
)> ?
;? @
} 	
} 
} ™
kD:\BuySmart\BuySmart\Application\QueryHandlers\UserBusinessQueryHandlers\GetUserBusinessByIdQueryHandler.cs
	namespace 	
Application
 
. 
QueryHandlers #
.# $%
UserBusinessQueryHandlers$ =
{		 
public

 

class

 +
GetUserBusinessByIdQueryHandler

 0
:

1 2
IRequestHandler

3 B
<

B C$
GetUserBusinessByIdQuery

C [
,

[ \
UserBusinessDto

] l
>

l m
{ 
private 
readonly 
IUserRepository (
<( )
UserBusiness) 5
>5 6

repository7 A
;A B
private 
readonly 
IMapper  
mapper! '
;' (
public +
GetUserBusinessByIdQueryHandler .
(. /
IUserRepository/ >
<> ?
UserBusiness? K
>K L

repositoryM W
,W X
IMapperY `
mappera g
)g h
{ 	
this 
. 

repository 
= 

repository (
;( )
this 
. 
mapper 
= 
mapper  
;  !
} 	
public 
async 
Task 
< 
UserBusinessDto )
>) *
Handle+ 1
(1 2$
GetUserBusinessByIdQuery2 J
requestK R
,R S
CancellationTokenT e
cancellationTokenf w
)w x
{ 	
var 
userBusiness 
= 
await $

repository% /
./ 0
GetByIdAsync0 <
(< =
request= D
.D E
IdE G
)G H
;H I
return 
mapper 
. 
Map 
< 
UserBusinessDto -
>- .
(. /
userBusiness/ ;
); <
;< =
} 	
} 
} º
qD:\BuySmart\BuySmart\Application\QueryHandlers\UserBusinessQueryHandlers\GetFilteredUserBusinessesQueryHandler.cs
	namespace 	
Application
 
. 
QueryHandlers #
.# $%
UserBusinessQueryHandlers$ =
{ 
public 

class 1
%GetFilteredUserBusinessesQueryHandler 6
:7 8
IRequestHandler9 H
<H I*
GetFilteredUserBusinessesQueryI g
,g h
Resulti o
<o p
PagedResultp {
<{ |
UserBusinessDto	| ã
>
ã å
>
å ç
>
ç é
{ 
private 
readonly 
IUserRepository (
<( )
UserBusiness) 5
>5 6

repository7 A
;A B
private 
readonly 
IMapper  
mapper! '
;' (
public 1
%GetFilteredUserBusinessesQueryHandler 4
(4 5
IUserRepository5 D
<D E
UserBusinessE Q
>Q R

repositoryS ]
,] ^
IMapper_ f
mapperg m
)m n
{ 	
this 
. 

repository 
= 

repository (
;( )
this 
. 
mapper 
= 
mapper  
;  !
} 	
public 
async 
Task 
< 
Result  
<  !
PagedResult! ,
<, -
UserBusinessDto- <
>< =
>= >
>> ?
Handle@ F
(F G*
GetFilteredUserBusinessesQueryG e
requestf m
,m n
CancellationToken	o Ä
cancellationToken
Å í
)
í ì
{ 	
var 
userBusinesses 
=  
await! &

repository' 1
.1 2
GetAllAsync2 =
(= >
)> ?
;? @
if 
( 
request 
. 
Filter 
!= !
null" &
)& '
{ 
userBusinesses 
=  
userBusinesses! /
./ 0
AsQueryable0 ;
(; <
)< =
.= >
Where> C
(C D
requestD K
.K L
FilterL R
)R S
;S T
} 
var 

totalCount 
= 
userBusinesses +
.+ ,
Count, 1
(1 2
)2 3
;3 4
var   
pagedUserBusinesses   #
=  $ %
userBusinesses  & 4
.  4 5
AsQueryable  5 @
(  @ A
)  A B
.  B C
ApplyPaging  C N
(  N O
request  O V
.  V W
Page  W [
,  [ \
request  ] d
.  d e
PageSize  e m
)  m n
;  n o
var!! 
userBusinessDtos!!  
=!!! "
mapper!!# )
.!!) *
Map!!* -
<!!- .
List!!. 2
<!!2 3
UserBusinessDto!!3 B
>!!B C
>!!C D
(!!D E
pagedUserBusinesses!!E X
)!!X Y
;!!Y Z
var"" 
pagedResult"" 
="" 
new"" !
PagedResult""" -
<""- .
UserBusinessDto"". =
>""= >
(""> ?
userBusinessDtos""? O
,""O P

totalCount""Q [
)""[ \
;""\ ]
return## 
Result## 
<## 
PagedResult## %
<##% &
UserBusinessDto##& 5
>##5 6
>##6 7
.##7 8
Success##8 ?
(##? @
pagedResult##@ K
)##K L
;##L M
}$$ 	
}%% 
}&& é
lD:\BuySmart\BuySmart\Application\QueryHandlers\UserBusinessQueryHandlers\GetAllUserBusinessesQueryHandler.cs
	namespace 	
Application
 
. 
QueryHandlers #
.# $%
UserBusinessQueryHandlers$ =
{		 
public

 

class

 ,
 GetAllUserBusinessesQueryHandler

 1
:

2 3
IRequestHandler

4 C
<

C D%
GetAllUserBusinessesQuery

D ]
,

] ^
List

_ c
<

c d
UserBusinessDto

d s
>

s t
>

t u
{ 
private 
readonly 
IUserRepository (
<( )
UserBusiness) 5
>5 6

repository7 A
;A B
private 
readonly 
IMapper  
mapper! '
;' (
public ,
 GetAllUserBusinessesQueryHandler /
(/ 0
IUserRepository0 ?
<? @
UserBusiness@ L
>L M

repositoryN X
,X Y
IMapperZ a
mapperb h
)h i
{ 	
this 
. 

repository 
= 

repository (
;( )
this 
. 
mapper 
= 
mapper  
;  !
} 	
public 
async 
Task 
< 
List 
< 
UserBusinessDto .
>. /
>/ 0
Handle1 7
(7 8%
GetAllUserBusinessesQuery8 Q
requestR Y
,Y Z
CancellationToken[ l
cancellationTokenm ~
)~ 
{ 	
var 
userBusinesses 
=  
await! &

repository' 1
.1 2
GetAllAsync2 =
(= >
)> ?
;? @
return 
mapper 
. 
Map 
< 
List "
<" #
UserBusinessDto# 2
>2 3
>3 4
(4 5
userBusinesses5 C
)C D
;D E
} 	
} 
} Œ
oD:\BuySmart\BuySmart\Application\QueryHandlers\ReviewBusinessQueryHandlers\GetReviewBusinessByIdQueryHandler.cs
	namespace 	
Application
 
. 
QueryHandlers #
.# $'
ReviewBusinessQueryHandlers$ ?
{ 
public		 

class		 -
!GetReviewBusinessByIdQueryHandler		 2
:		3 4
IRequestHandler		5 D
<		D E&
GetReviewBusinessByIdQuery		E _
,		_ `
	ReviewDto		a j
>		j k
{

 
private 
readonly %
IReviewBusinessRepository 2

repository3 =
;= >
private 
readonly 
IMapper  
mapper! '
;' (
public -
!GetReviewBusinessByIdQueryHandler 0
(0 1%
IReviewBusinessRepository1 J

repositoryK U
,U V
IMapperW ^
mapper_ e
)e f
{ 	
this 
. 

repository 
= 

repository (
;( )
this 
. 
mapper 
= 
mapper  
;  !
} 	
public 
async 
Task 
< 
	ReviewDto #
># $
Handle% +
(+ ,&
GetReviewBusinessByIdQuery, F
requestG N
,N O
CancellationTokenP a
cancellationTokenb s
)s t
{ 	
var 
reviewBusiness 
=  
await! &

repository' 1
.1 2
GetByIdAsync2 >
(> ?
request? F
.F G
IdG I
)I J
;J K
return 
mapper 
. 
Map 
< 
	ReviewDto '
>' (
(( )
reviewBusiness) 7
)7 8
;8 9
} 	
} 
} ‚
uD:\BuySmart\BuySmart\Application\QueryHandlers\ReviewBusinessQueryHandlers\GetFilteredReviewBusinessesQueryHandler.cs
	namespace

 	
Application


 
.

 
QueryHandlers

 #
.

# $'
ReviewBusinessQueryHandlers

$ ?
{ 
public 

class 3
'GetFilteredReviewBusinessesQueryHandler 8
:9 :
IRequestHandler; J
<J K,
 GetFilteredReviewBusinessesQueryK k
,k l
Resultm s
<s t
PagedResultt 
<	 Ä
	ReviewDto
Ä â
>
â ä
>
ä ã
>
ã å
{ 
private 
readonly %
IReviewBusinessRepository 2

repository3 =
;= >
private 
readonly 
IMapper  
mapper! '
;' (
public 3
'GetFilteredReviewBusinessesQueryHandler 6
(6 7%
IReviewBusinessRepository7 P

repositoryQ [
,[ \
IMapper] d
mappere k
)k l
{ 	
this 
. 

repository 
= 

repository (
;( )
this 
. 
mapper 
= 
mapper  
;  !
} 	
public 
async 
Task 
< 
Result  
<  !
PagedResult! ,
<, -
	ReviewDto- 6
>6 7
>7 8
>8 9
Handle: @
(@ A,
 GetFilteredReviewBusinessesQueryA a
requestb i
,i j
CancellationTokenk |
cancellationToken	} é
)
é è
{ 	
var 
reviewBusinesses  
=! "
await# (

repository) 3
.3 4
GetAllAsync4 ?
(? @
)@ A
;A B
if 
( 
request 
. 
Filter 
!= !
null" &
)& '
{ 
reviewBusinesses  
=! "
reviewBusinesses# 3
.3 4
AsQueryable4 ?
(? @
)@ A
.A B
WhereB G
(G H
requestH O
.O P
FilterP V
)V W
;W X
} 
var 

totalCount 
= 
reviewBusinesses -
.- .
Count. 3
(3 4
)4 5
;5 6
var !
pagedReviewBusinesses %
=& '
reviewBusinesses( 8
.8 9
AsQueryable9 D
(D E
)E F
.F G
ApplyPagingG R
(R S
requestS Z
.Z [
Page[ _
,_ `
requesta h
.h i
PageSizei q
)q r
;r s
var   
reviewBusinessDtos   "
=  # $
mapper  % +
.  + ,
Map  , /
<  / 0
List  0 4
<  4 5
	ReviewDto  5 >
>  > ?
>  ? @
(  @ A!
pagedReviewBusinesses  A V
)  V W
;  W X
var!! 
pagedResult!! 
=!! 
new!! !
PagedResult!!" -
<!!- .
	ReviewDto!!. 7
>!!7 8
(!!8 9
reviewBusinessDtos!!9 K
,!!K L

totalCount!!M W
)!!W X
;!!X Y
return"" 
Result"" 
<"" 
PagedResult"" %
<""% &
	ReviewDto""& /
>""/ 0
>""0 1
.""1 2
Success""2 9
(""9 :
pagedResult"": E
)""E F
;""F G
}## 	
}$$ 
}%% ≤
pD:\BuySmart\BuySmart\Application\QueryHandlers\ReviewBusinessQueryHandlers\GetAllReviewBusinessesQueryHandler.cs
	namespace 	
Application
 
. 
QueryHandlers #
.# $'
ReviewBusinessQueryHandlers$ ?
{ 
public		 

class		 .
"GetAllReviewBusinessesQueryHandler		 3
:		4 5
IRequestHandler		6 E
<		E F'
GetAllReviewBusinessesQuery		F a
,		a b
List		c g
<		g h
	ReviewDto		h q
>		q r
>		r s
{

 
private 
readonly %
IReviewBusinessRepository 2

repository3 =
;= >
private 
readonly 
IMapper  
mapper! '
;' (
public .
"GetAllReviewBusinessesQueryHandler 1
(1 2%
IReviewBusinessRepository2 K

repositoryL V
,V W
IMapperX _
mapper` f
)f g
{ 	
this 
. 

repository 
= 

repository (
;( )
this 
. 
mapper 
= 
mapper  
;  !
} 	
public 
async 
Task 
< 
List 
< 
	ReviewDto (
>( )
>) *
Handle+ 1
(1 2'
GetAllReviewBusinessesQuery2 M
requestN U
,U V
CancellationTokenW h
cancellationTokeni z
)z {
{ 	
var 
reviewBusinesses  
=! "
await# (

repository) 3
.3 4
GetAllAsync4 ?
(? @
)@ A
;A B
return 
mapper 
. 
Map 
< 
List "
<" #
	ReviewDto# ,
>, -
>- .
(. /
reviewBusinesses/ ?
)? @
;@ A
} 	
} 
} ¸
\D:\BuySmart\BuySmart\Application\QueryHandlers\ProductQueryHandlers\GetProductByIdHandler.cs
	namespace 	
Application
 
. 
QueryHandlers #
.# $ 
ProductQueryHandlers$ 8
{ 
public		 

class		 !
GetProductByIdHandler		 &
:		' (
IRequestHandler		) 8
<		8 9
GetProductByIdQuery		9 L
,		L M

ProductDto		N X
>		X Y
{

 
private 
readonly 
IMapper  
mapper! '
;' (
private 
readonly 
IProductRepository +

repository, 6
;6 7
public !
GetProductByIdHandler $
($ %
IMapper% ,
mapper- 3
,3 4
IProductRepository5 G

repositoryH R
)R S
{ 	
this 
. 
mapper 
= 
mapper  
;  !
this 
. 

repository 
= 

repository (
;( )
} 	
public 
async 
Task 
< 

ProductDto $
>$ %
Handle& ,
(, -
GetProductByIdQuery- @
requestA H
,H I
CancellationTokenJ [
cancellationToken\ m
)m n
{ 	
var 
product 
= 
await 

repository  *
.* +
GetByIdAsync+ 7
(7 8
request8 ?
.? @
	ProductId@ I
)I J
;J K
return 
mapper 
. 
Map 
< 

ProductDto (
>( )
() *
product* 1
)1 2
;2 3
} 	
} 
} ≤&
fD:\BuySmart\BuySmart\Application\QueryHandlers\ProductQueryHandlers\GetFilteredProductsQueryHandler.cs
	namespace

 	
Application


 
.

 
QueryHandlers

 #
.

# $ 
ProductQueryHandlers

$ 8
{ 
public 

class +
GetFilteredProductsQueryHandler 0
:1 2
IRequestHandler3 B
<B C$
GetFilteredProductsQueryC [
,[ \
Result] c
<c d
PagedResultd o
<o p

ProductDtop z
>z {
>{ |
>| }
{ 
private 
readonly 
IProductRepository +

repository, 6
;6 7
private 
readonly 
IMapper  
mapper! '
;' (
public +
GetFilteredProductsQueryHandler .
(. /
IProductRepository/ A

repositoryB L
,L M
IMapperN U
mapperV \
)\ ]
{ 	
this 
. 

repository 
= 

repository (
;( )
this 
. 
mapper 
= 
mapper  
;  !
} 	
public 
async 
Task 
< 
Result  
<  !
PagedResult! ,
<, -

ProductDto- 7
>7 8
>8 9
>9 :
Handle; A
(A B$
GetFilteredProductsQueryB Z
request[ b
,b c
CancellationTokend u
cancellationToken	v á
)
á à
{ 	
var 
products 
= 
await  

repository! +
.+ ,
GetAllAsync, 7
(7 8
)8 9
;9 :
if 
( 
request 
. 
Filter 
!= !
null" &
)& '
{ 
products 
= 
products #
.# $
AsQueryable$ /
(/ 0
)0 1
.1 2
Where2 7
(7 8
request8 ?
.? @
Filter@ F
)F G
;G H
} 
if 
( 
! 
string 
. 
IsNullOrEmpty %
(% &
request& -
.- .
SortDirection. ;
); <
)< =
{   
if!! 
(!! 
request!! 
.!! 
SortDirection!! )
?!!) *
.!!* +
Equals!!+ 1
(!!1 2
$str!!2 8
,!!8 9
StringComparison!!: J
.!!J K
OrdinalIgnoreCase!!K \
)!!\ ]
==!!^ `
true!!a e
)!!e f
{"" 
products## 
=## 
products## '
.##' (
AsQueryable##( 3
(##3 4
)##4 5
.##5 6
OrderByDescending##6 G
(##G H
p##H I
=>##J L
p##M N
.##N O
Price##O T
)##T U
;##U V
}$$ 
else%% 
{&& 
products'' 
='' 
products'' '
.''' (
AsQueryable''( 3
(''3 4
)''4 5
.''5 6
OrderBy''6 =
(''= >
p''> ?
=>''@ B
p''C D
.''D E
Price''E J
)''J K
;''K L
}(( 
})) 
var** 

totalCount** 
=** 
products** %
.**% &
Count**& +
(**+ ,
)**, -
;**- .
var++ 
pagedProducts++ 
=++ 
products++  (
.++( )
AsQueryable++) 4
(++4 5
)++5 6
.++6 7
ApplyPaging++7 B
(++B C
request++C J
.++J K
Page++K O
,++O P
request++Q X
.++X Y
PageSize++Y a
)++a b
;++b c
var,, 
productDtos,, 
=,, 
mapper,, $
.,,$ %
Map,,% (
<,,( )
List,,) -
<,,- .

ProductDto,,. 8
>,,8 9
>,,9 :
(,,: ;
pagedProducts,,; H
),,H I
;,,I J
var.. 
pagedResult.. 
=.. 
new.. !
PagedResult.." -
<..- .

ProductDto... 8
>..8 9
(..9 :
productDtos..: E
,..E F

totalCount..G Q
)..Q R
;..R S
return00 
Result00 
<00 
PagedResult00 %
<00% &

ProductDto00& 0
>000 1
>001 2
.002 3
Success003 :
(00: ;
pagedResult00; F
)00F G
;00G H
}11 	
}22 
}33 ˘
aD:\BuySmart\BuySmart\Application\QueryHandlers\ProductQueryHandlers\GetAllProductsQueryHandler.cs
	namespace 	
Application
 
. 
QueryHandlers #
.# $ 
ProductQueryHandlers$ 8
{ 
public		 

class		 &
GetAllProductsQueryHandler		 +
:		, -
IRequestHandler		. =
<		= >
GetAllProductsQuery		> Q
,		Q R
List		S W
<		W X

ProductDto		X b
>		b c
>		c d
{

 
private 
readonly 
IProductRepository +
productRepository, =
;= >
private 
readonly 
IMapper  
mapper! '
;' (
public &
GetAllProductsQueryHandler )
() *
IProductRepository* <
productRepository= N
,N O
IMapperP W
mapperX ^
)^ _
{ 	
this 
. 
productRepository "
=# $
productRepository% 6
;6 7
this 
. 
mapper 
= 
mapper  
;  !
} 	
public 
async 
Task 
< 
List 
< 

ProductDto )
>) *
>* +
Handle, 2
(2 3
GetAllProductsQuery3 F
requestG N
,N O
CancellationTokenP a
cancellationTokenb s
)s t
{ 	
var 
products 
= 
await  
productRepository! 2
.2 3
GetAllAsync3 >
(> ?
)? @
;@ A
List 
< 

ProductDto 
> 
productsDto (
=) *
new+ .
List/ 3
<3 4

ProductDto4 >
>> ?
(? @
)@ A
;A B
foreach 
( 
var 
product  
in! #
products$ ,
), -
{ 
var 
categoryDtos  
=! "
mapper# )
.) *
Map* -
<- .
List. 2
<2 3
CategoryDto3 >
>> ?
>? @
(@ A
productA H
.H I

CategoriesI S
)S T
;T U
var 

productDto 
=  
mapper! '
.' (
Map( +
<+ ,

ProductDto, 6
>6 7
(7 8
product8 ?
)? @
;@ A

productDto 
. 

Categories %
=& '
categoryDtos( 4
;4 5
productsDto 
. 
Add 
(  

productDto  *
)* +
;+ ,
} 
return 
productsDto 
; 
}   	
}!! 
}"" ¸
iD:\BuySmart\BuySmart\Application\QueryHandlers\CategoryQueryHandlers\GetFilteredcategoriesQueryHandler.cs
	namespace

 	
Application


 
.

 
QueryHandlers

 #
.

# $!
CategoryQueryHandlers

$ 9
{ 
public 

class -
!GetFilteredcategoriesQueryHandler 2
:3 4
IRequestHandler5 D
<D E&
GetFilteredCategoriesQueryE _
,_ `
Resulta g
<g h
PagedResulth s
<s t
CategoryDtot 
>	 Ä
>
Ä Å
>
Å Ç
{ 
private 
readonly 
ICategoryRepository ,

repository- 7
;7 8
private 
readonly 
IMapper  
mapper! '
;' (
public -
!GetFilteredcategoriesQueryHandler 0
(0 1
ICategoryRepository1 D

repositoryE O
,O P
IMapperQ X
mapperY _
)_ `
{ 	
this 
. 

repository 
= 

repository (
;( )
this 
. 
mapper 
= 
mapper  
;  !
} 	
public 
async 
Task 
< 
Result  
<  !
PagedResult! ,
<, -
CategoryDto- 8
>8 9
>9 :
>: ;
Handle< B
(B C&
GetFilteredCategoriesQueryC ]
request^ e
,e f
CancellationTokeng x
cancellationToken	y ä
)
ä ã
{ 	
var 

categories 
= 
await "

repository# -
.- .
GetAllAsync. 9
(9 :
): ;
;; <
if 
( 
request 
. 
Filter 
!= !
null" &
)& '
{ 

categories 
= 

categories '
.' (
AsQueryable( 3
(3 4
)4 5
.5 6
Where6 ;
(; <
request< C
.C D
FilterD J
)J K
;K L
} 
var"" 

totalCount"" 
="" 

categories"" '
.""' (
Count""( -
(""- .
)"". /
;""/ 0
var## 
pagedCategories## 
=##  !

categories##" ,
.##, -
AsQueryable##- 8
(##8 9
)##9 :
.##: ;
ApplyPaging##; F
(##F G
request##G N
.##N O
Page##O S
,##S T
request##U \
.##\ ]
PageSize##] e
)##e f
;##f g
var$$ 
categoryDtos$$ 
=$$ 
mapper$$ %
.$$% &
Map$$& )
<$$) *
List$$* .
<$$. /
CategoryDto$$/ :
>$$: ;
>$$; <
($$< =
pagedCategories$$= L
)$$L M
;$$M N
var&& 
pagedResult&& 
=&& 
new&& !
PagedResult&&" -
<&&- .
CategoryDto&&. 9
>&&9 :
(&&: ;
categoryDtos&&; G
,&&G H

totalCount&&I S
)&&S T
;&&T U
return(( 
Result(( 
<(( 
PagedResult(( %
<((% &
CategoryDto((& 1
>((1 2
>((2 3
.((3 4
Success((4 ;
(((; <
pagedResult((< G
)((G H
;((H I
})) 	
}** 
}++ ¬
cD:\BuySmart\BuySmart\Application\QueryHandlers\CategoryQueryHandlers\GetCategoryByIdQueryHandler.cs
	namespace 	
Application
 
. 
QueryHandlers #
.# $!
CategoryQueryHandlers$ 9
{ 
public		 

class		 '
GetCategoryByIdQueryHandler		 ,
:		, -
IRequestHandler		. =
<		= > 
GetCategoryByIdQuery		> R
,		R S
CategoryDto		T _
>		_ `
{

 
private 
readonly 
ICategoryRepository ,
categoryRepository- ?
;? @
private 
readonly 
IMapper  
mapper! '
;' (
public '
GetCategoryByIdQueryHandler *
(* +
ICategoryRepository+ >
categoryRepository? Q
,Q R
IMapperS Z
mapper[ a
)a b
{ 	
this 
. 
categoryRepository #
=$ %
categoryRepository& 8
;8 9
this 
. 
mapper 
= 
mapper  
;  !
} 	
public 
async 
Task 
< 
CategoryDto %
>% &
Handle' -
(- . 
GetCategoryByIdQuery. B
requestC J
,J K
CancellationTokenL ]
cancellationToken^ o
)o p
{ 	
var 
category 
= 
await  
categoryRepository! 3
.3 4
GetByIdAsync4 @
(@ A
requestA H
.H I

CategoryIdI S
)S T
;T U
return 
mapper 
. 
Map 
< 
CategoryDto )
>) *
(* +
category+ 3
)3 4
;4 5
} 	
} 
} û
dD:\BuySmart\BuySmart\Application\QueryHandlers\CategoryQueryHandlers\GetAllCategoriesQueryHandler.cs
	namespace 	
Application
 
. 
QueryHandlers #
.# $!
CategoryQueryHandlers$ 9
{ 
public		 

class		 (
GetAllCategoriesQueryHandler		 -
:		. /
IRequestHandler		0 ?
<		? @!
GetAllCategoriesQuery		@ U
,		U V
List		W [
<		[ \
CategoryDto		\ g
>		g h
>		h i
{

 
private 
readonly 
ICategoryRepository ,
categoryRepository- ?
;? @
private 
readonly 
IMapper  
mapper! '
;' (
public (
GetAllCategoriesQueryHandler +
(+ ,
ICategoryRepository, ?
categoryRepository@ R
,R S
IMapperT [
mapper\ b
)b c
{ 	
this 
. 
categoryRepository #
=$ %
categoryRepository& 8
;8 9
this 
. 
mapper 
= 
mapper  
;  !
} 	
public 
async 
Task 
< 
List 
< 
CategoryDto *
>* +
>+ ,
Handle- 3
(3 4!
GetAllCategoriesQuery4 I
requestJ Q
,Q R
CancellationTokenS d
cancellationTokene v
)v w
{ 	
var 

categories 
= 
await "
categoryRepository# 5
.5 6
GetAllAsync6 A
(A B
)B C
;C D
return 
mapper 
. 
Map 
< 
List "
<" #
CategoryDto# .
>. /
>/ 0
(0 1

categories1 ;
); <
;< =
} 	
} 
} ¸
iD:\BuySmart\BuySmart\Application\QueryHandlers\BusinessQueryHandlers\GetFilteredBusinessesQueryHandler.cs
	namespace

 	
Application


 
.

 
QueryHandlers

 #
.

# $!
BusinessQueryHandlers

$ 9
{ 
public 

class -
!GetFilteredBusinessesQueryHandler 2
:3 4
IRequestHandler5 D
<D E&
GetFilteredBusinessesQueryE _
,_ `
Resulta g
<g h
PagedResulth s
<s t
BusinessDtot 
>	 Ä
>
Ä Å
>
Å Ç
{ 
private 
readonly 
IBusinessRepository ,

repository- 7
;7 8
private 
readonly 
IMapper  
mapper! '
;' (
public -
!GetFilteredBusinessesQueryHandler 0
(0 1
IBusinessRepository1 D

repositoryE O
,O P
IMapperQ X
mapperY _
)_ `
{ 	
this 
. 

repository 
= 

repository (
;( )
this 
. 
mapper 
= 
mapper  
;  !
} 	
public 
async 
Task 
< 
Result  
<  !
PagedResult! ,
<, -
BusinessDto- 8
>8 9
>9 :
>: ;
Handle< B
(B C&
GetFilteredBusinessesQueryC ]
request^ e
,e f
CancellationTokeng x
cancellationToken	y ä
)
ä ã
{ 	
var 

businesses 
= 
await "

repository# -
.- .
GetAllAsync. 9
(9 :
): ;
;; <
if 
( 
request 
. 
Filter 
!= !
null" &
)& '
{ 

businesses 
= 

businesses '
.' (
AsQueryable( 3
(3 4
)4 5
.5 6
Where6 ;
(; <
request< C
.C D
FilterD J
)J K
;K L
} 
var 

totalCount 
= 

businesses '
.' (
Count( -
(- .
). /
;/ 0
var 
pagedBusinesses 
=  !

businesses" ,
., -
AsQueryable- 8
(8 9
)9 :
.: ;
ApplyPaging; F
(F G
requestG N
.N O
PageO S
,S T
requestU \
.\ ]
PageSize] e
)e f
;f g
var 
businessDtos 
= 
mapper %
.% &
Map& )
<) *
List* .
<. /
BusinessDto/ :
>: ;
>; <
(< =
pagedBusinesses= L
)L M
;M N
var   
pagedResult   
=   
new   !
PagedResult  " -
<  - .
BusinessDto  . 9
>  9 :
(  : ;
businessDtos  ; G
,  G H

totalCount  I S
)  S T
;  T U
return!! 
Result!! 
<!! 
PagedResult!! %
<!!% &
BusinessDto!!& 1
>!!1 2
>!!2 3
.!!3 4
Success!!4 ;
(!!; <
pagedResult!!< G
)!!G H
;!!H I
}"" 	
}## 
}$$ ∫
cD:\BuySmart\BuySmart\Application\QueryHandlers\BusinessQueryHandlers\GetBusinessByIdQueryHandler.cs
	namespace 	
Application
 
. 
QueryHandlers #
.# $!
BusinessQueryHandlers$ 9
{ 
public		 

class		 '
GetBusinessByIdQueryHandler		 ,
:		- .
IRequestHandler		/ >
<		> ? 
GetBusinessByIdQuery		? S
,		S T
BusinessDto		U `
>		` a
{

 
private 
readonly 
IBusinessRepository ,
businessRepository- ?
;? @
private 
readonly 
IMapper  
mapper! '
;' (
public '
GetBusinessByIdQueryHandler *
(* +
IBusinessRepository+ >
businessRepository? Q
,Q R
IMapperS Z
mapper[ a
)a b
{ 	
this 
. 
businessRepository #
=$ %
businessRepository& 8
;8 9
this 
. 
mapper 
= 
mapper  
;  !
} 	
public 
async 
Task 
< 
BusinessDto %
>% &
Handle' -
(- . 
GetBusinessByIdQuery. B
requestC J
,J K
CancellationTokenL ]
cancellationToken^ o
)o p
{ 	
var 
business 
= 
await  
businessRepository! 3
.3 4
GetByIdAsync4 @
(@ A
requestA H
.H I
IdI K
)K L
;L M
return 
mapper 
. 
Map 
< 
BusinessDto )
>) *
(* +
business+ 3
)3 4
;4 5
} 	
} 
} ò
bD:\BuySmart\BuySmart\Application\QueryHandlers\BusinessQueryHandlers\GetAllBusinessQueryHandler.cs
	namespace 	
Application
 
. 
QueryHandlers #
.# $!
BusinessQueryHandlers$ 9
{ 
public		 

class		 &
GetAllBusinessQueryHandler		 +
:		, -
IRequestHandler		. =
<		= >!
GetAllBusinessesQuery		> S
,		S T
List		U Y
<		Y Z
BusinessDto		Z e
>		e f
>		f g
{

 
private 
readonly 
IBusinessRepository ,
businessRepository- ?
;? @
private 
readonly 
IMapper  
mapper! '
;' (
public &
GetAllBusinessQueryHandler )
() *
IBusinessRepository* =
businessRepository> P
,P Q
IMapperR Y
mapperZ `
)` a
{ 	
this 
. 
businessRepository #
=$ %
businessRepository& 8
;8 9
this 
. 
mapper 
= 
mapper  
;  !
} 	
public 
async 
Task 
< 
List 
< 
BusinessDto *
>* +
>+ ,
Handle- 3
(3 4!
GetAllBusinessesQuery4 I
requestJ Q
,Q R
CancellationTokenS d
cancellationTokene v
)v w
{ 	
var 

businesses 
= 
await "
businessRepository# 5
.5 6
GetAllAsync6 A
(A B
)B C
;C D
return 
mapper 
. 
Map 
< 
List "
<" #
BusinessDto# .
>. /
>/ 0
(0 1

businesses1 ;
); <
;< =
} 	
} 
} À
TD:\BuySmart\BuySmart\Application\Queries\UserClientQueries\GetUserClientByIdQuery.cs
	namespace 	
Application
 
. 
Queries 
. 
UserClientQueries /
{ 
public 

class "
GetUserClientByIdQuery '
:( )
IRequest* 2
<2 3
UserClientDto3 @
>@ A
{ 
public 
Guid 
Id 
{ 
get 
; 
set !
;! "
}# $
}		 
}

 å	
YD:\BuySmart\BuySmart\Application\Queries\UserClientQueries\GetFilteredUserClientsQuery.cs
	namespace 	
Application
 
. 
Queries 
. 
UserClientQueries /
{		 
public

 

class

 '
GetFilteredUserClientsQuery

 ,
:

- .
IRequest

/ 7
<

7 8
Result

8 >
<

> ?
PagedResult

? J
<

J K
UserClientDto

K X
>

X Y
>

Y Z
>

Z [
{ 
public 
int 
Page 
{ 
get 
; 
set "
;" #
}$ %
public 
int 
PageSize 
{ 
get !
;! "
set# &
;& '
}( )
public 

Expression 
< 
Func 
< 

UserClient )
,) *
bool+ /
>/ 0
>0 1
?1 2
Filter3 9
{: ;
get< ?
;? @
setA D
;D E
}F G
} 
} Á
TD:\BuySmart\BuySmart\Application\Queries\UserClientQueries\GetAllUserClientsQuery.cs
	namespace 	
Application
 
. 
Queries 
. 
UserClientQueries /
{ 
public 

class "
GetAllUserClientsQuery '
:( )
IRequest* 2
<2 3
List3 7
<7 8
UserClientDto8 E
>E F
>F G
{ 
}

 
} ’
XD:\BuySmart\BuySmart\Application\Queries\UserBusinessQueries\GetUserBusinessByIdQuery.cs
	namespace 	
Application
 
. 
Queries 
. 
UserBusinessQueries 1
{ 
public 

class $
GetUserBusinessByIdQuery )
:* +
IRequest, 4
<4 5
UserBusinessDto5 D
>D E
{ 
public 
Guid 
Id 
{ 
get 
; 
set !
;! "
}# $
}		 
}

 ö	
^D:\BuySmart\BuySmart\Application\Queries\UserBusinessQueries\GetFilteredUserBusinessesQuery.cs
	namespace 	
Application
 
. 
Queries 
. 
UserBusinessQueries 1
{		 
public

 

class

 *
GetFilteredUserBusinessesQuery

 /
:

0 1
IRequest

2 :
<

: ;
Result

; A
<

A B
PagedResult

B M
<

M N
UserBusinessDto

N ]
>

] ^
>

^ _
>

_ `
{ 
public 
int 
Page 
{ 
get 
; 
set "
;" #
}$ %
public 
int 
PageSize 
{ 
get !
;! "
set# &
;& '
}( )
public 

Expression 
< 
Func 
< 
UserBusiness +
,+ ,
bool- 1
>1 2
>2 3
?3 4
Filter5 ;
{< =
get> A
;A B
setC F
;F G
}H I
} 
} Û
YD:\BuySmart\BuySmart\Application\Queries\UserBusinessQueries\GetAllUserBusinessesQuery.cs
	namespace 	
Application
 
. 
Queries 
. 
UserBusinessQueries 1
{ 
public 

class %
GetAllUserBusinessesQuery *
:+ ,
IRequest- 5
<5 6
List6 :
<: ;
UserBusinessDto; J
>J K
>K L
{ 
} 
}		 ◊
\D:\BuySmart\BuySmart\Application\Queries\ReviewBusinessQueries\GetReviewBusinessByIdQuery.cs
	namespace 	
Application
 
. 
Queries 
. !
ReviewBusinessQueries 3
{ 
public 

class &
GetReviewBusinessByIdQuery +
:, -
IRequest. 6
<6 7
	ReviewDto7 @
>@ A
{ 
public 
Guid 
Id 
{ 
get 
; 
set !
;! "
}# $
}		 
}

 ñ	
bD:\BuySmart\BuySmart\Application\Queries\ReviewBusinessQueries\GetFilteredReviewBusinessesQuery.cs
	namespace 	
Application
 
. 
Queries 
. !
ReviewBusinessQueries 3
{		 
public

 

class

 ,
 GetFilteredReviewBusinessesQuery

 1
:

2 3
IRequest

4 <
<

< =
Result

= C
<

C D
PagedResult

D O
<

O P
	ReviewDto

P Y
>

Y Z
>

Z [
>

[ \
{ 
public 
int 
Page 
{ 
get 
; 
set "
;" #
}$ %
public 
int 
PageSize 
{ 
get !
;! "
set# &
;& '
}( )
public 

Expression 
< 
Func 
< 
Review %
,% &
bool' +
>+ ,
>, -
?- .
Filter/ 5
{6 7
get8 ;
;; <
set= @
;@ A
}B C
} 
} ı
]D:\BuySmart\BuySmart\Application\Queries\ReviewBusinessQueries\GetAllReviewBusinessesQuery.cs
	namespace 	
Application
 
. 
Queries 
. !
ReviewBusinessQueries 3
{ 
public 

class '
GetAllReviewBusinessesQuery ,
:- .
IRequest/ 7
<7 8
List8 <
<< =
	ReviewDto= F
>F G
>G H
{ 
}		 
}

 √
ND:\BuySmart\BuySmart\Application\Queries\ProductQueries\GetProductByIdQuery.cs
	namespace 	
Application
 
. 
Queries 
. 
ProductQueries ,
{ 
public 

class 
GetProductByIdQuery $
:% &
IRequest' /
</ 0

ProductDto0 :
>: ;
{ 
public 
Guid 
	ProductId 
{ 
get  #
;# $
set% (
;( )
}* +
}		 
} ™

SD:\BuySmart\BuySmart\Application\Queries\ProductQueries\GetFilteredProductsQuery.cs
	namespace 	
Application
 
. 
Queries 
. 
ProductQueries ,
{		 
public

 

class

 $
GetFilteredProductsQuery

 )
:

* +
IRequest

, 4
<

4 5
Result

5 ;
<

; <
PagedResult

< G
<

G H

ProductDto

H R
>

R S
>

S T
>

T U
{ 
public 
int 
Page 
{ 
get 
; 
set "
;" #
}$ %
public 
int 
PageSize 
{ 
get !
;! "
set# &
;& '
}( )
public 

Expression 
< 
Func 
< 
Product &
,& '
bool( ,
>, -
>- .
?. /
Filter0 6
{7 8
get9 <
;< =
set> A
;A B
}C D
public 
string 
? 
SortDirection $
{% &
get' *
;* +
set, /
;/ 0
}1 2
} 
} ÿ
ND:\BuySmart\BuySmart\Application\Queries\ProductQueries\GetAllProductsQuery.cs
	namespace 	
Application
 
. 
Queries 
. 
ProductQueries ,
{ 
public 

class 
GetAllProductsQuery $
:% &
IRequest' /
</ 0
List0 4
<4 5

ProductDto5 ?
>? @
>@ A
{ 
}		 
}

 Ç	
VD:\BuySmart\BuySmart\Application\Queries\CategoryQueries\GetFilteredCategoriesQuery.cs
	namespace 	
Application
 
. 
Queries 
. 
CategoryQueries -
{		 
public

 

class

 &
GetFilteredCategoriesQuery

 +
:

, -
IRequest

. 6
<

6 7
Result

7 =
<

= >
PagedResult

> I
<

I J
CategoryDto

J U
>

U V
>

V W
>

W X
{ 
public 
int 
Page 
{ 
get 
; 
set "
;" #
}$ %
public 
int 
PageSize 
{ 
get !
;! "
set# &
;& '
}( )
public 

Expression 
< 
Func 
< 
Category '
,' (
bool) -
>- .
>. /
?/ 0
Filter1 7
{8 9
get: =
;= >
set? B
;B C
}D E
} 
} …
PD:\BuySmart\BuySmart\Application\Queries\CategoryQueries\GetCategoryByIdQuery.cs
	namespace 	
Application
 
. 
Queries 
. 
CategoryQueries -
{ 
public 

class  
GetCategoryByIdQuery %
:& '
IRequest( 0
<0 1
CategoryDto1 <
>< =
{ 
public 
Guid 

CategoryId 
{  
get! $
;$ %
set& )
;) *
}+ ,
}		 
}

 “
QD:\BuySmart\BuySmart\Application\Queries\CategoryQueries\GetAllCategoriesQuery.cs
	namespace 	
Application
 
. 
Queries 
. 
CategoryQueries -
{ 
public 

class !
GetAllCategoriesQuery &
:' (
IRequest) 1
<1 2
List2 6
<6 7
CategoryDto7 B
>B C
>C D
{ 
public !
GetAllCategoriesQuery $
($ %
)% &
{		 	
}

 	
} 
} Ç	
VD:\BuySmart\BuySmart\Application\Queries\BusinessQueries\GetFilteredBusinessesQuery.cs
	namespace 	
Application
 
. 
Queries 
. 
BusinessQueries -
{		 
public

 

class

 &
GetFilteredBusinessesQuery

 +
:

, -
IRequest

. 6
<

6 7
Result

7 =
<

= >
PagedResult

> I
<

I J
BusinessDto

J U
>

U V
>

V W
>

W X
{ 
public 
int 
Page 
{ 
get 
; 
set "
;" #
}$ %
public 
int 
PageSize 
{ 
get !
;! "
set# &
;& '
}( )
public 

Expression 
< 
Func 
< 
Business '
,' (
bool) -
>- .
>. /
?/ 0
Filter1 7
{8 9
get: =
;= >
set? B
;B C
}D E
} 
} ¡
PD:\BuySmart\BuySmart\Application\Queries\BusinessQueries\GetBusinessByIdQuery.cs
	namespace 	
Application
 
. 
Queries 
. 
BusinessQueries -
{ 
public 

class  
GetBusinessByIdQuery %
:& '
IRequest( 0
<0 1
BusinessDto1 <
>< =
{ 
public 
Guid 
Id 
{ 
get 
; 
set !
;! "
}# $
}		 
}

 “
QD:\BuySmart\BuySmart\Application\Queries\BusinessQueries\GetAllBusinessesQuery.cs
	namespace 	
Application
 
. 
Queries 
. 
BusinessQueries -
{ 
public 

class !
GetAllBusinessesQuery &
:' (
IRequest) 1
<1 2
List2 6
<6 7
BusinessDto7 B
>B C
>C D
{ 
public		 !
GetAllBusinessesQuery		 $
(		$ %
)		% &
{

 	
} 	
} 
} ”
0D:\BuySmart\BuySmart\Application\DTOs\UserDto.cs
	namespace 	
Application
 
. 
DTOs 
{ 
public 

class 
UserDto 
{ 
public 
Guid 
UserId 
{ 
get  
;  !
set" %
;% &
}' (
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
=) *
string+ 1
.1 2
Empty2 7
;7 8
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
=* +
string, 2
.2 3
Empty3 8
;8 9
public 
string 
Image 
{ 
get !
;! "
set# &
;& '
}( )
=* +
string, 2
.2 3
Empty3 8
;8 9
}		 
}

 ö
6D:\BuySmart\BuySmart\Application\DTOs\UserClientDto.cs
	namespace 	
Application
 
. 
DTOs 
{ 
public 

class 
UserClientDto 
:  
UserDto! (
{ 
public 
UserType 
UserType  
{! "
get# &
;& '
set( +
;+ ,
}- .
=/ 0
UserType1 9
.9 :
Client: @
;@ A
} 
}		 †
8D:\BuySmart\BuySmart\Application\DTOs\UserBusinessDto.cs
	namespace 	
Application
 
. 
DTOs 
{ 
public 

class 
UserBusinessDto  
:! "
UserDto# *
{ 
public 
UserType 
UserType  
{! "
get# &
;& '
set( +
;+ ,
}- .
=/ 0
UserType1 9
.9 :
Business: B
;B C
}		 
}

 è

2D:\BuySmart\BuySmart\Application\DTOs\ReviewDto.cs
	namespace 	
Application
 
. 
DTOs 
{ 
public 

class 
	ReviewDto 
{ 
public 
Guid 
ReviewId 
{ 
get "
;" #
set$ '
;' (
}) *
public 
Guid 
UserClientId  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
double 
Rating 
{ 
get "
;" #
set$ '
;' (
}) *
public 
string 
Comment 
{ 
get  #
;# $
set% (
;( )
}* +
=, -
string. 4
.4 5
Empty5 :
;: ;
public		 
Guid		 
?		 

BusinessId		 
{		  !
get		" %
;		% &
set		' *
;		* +
}		, -
public

 
Guid

 
?

 
	ProductId

 
{

  
get

! $
;

$ %
set

& )
;

) *
}

+ ,
} 
} ≤
3D:\BuySmart\BuySmart\Application\DTOs\ProductDto.cs
	namespace 	
Application
 
. 
DTOs 
{ 
public 

class 

ProductDto 
{ 
public 
Guid 
	ProductId 
{ 
get  #
;# $
set% (
;( )
}* +
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
=) *
string+ 1
.1 2
Empty2 7
;7 8
public 
string 
Description !
{" #
get$ '
;' (
set) ,
;, -
}. /
=0 1
string2 8
.8 9
Empty9 >
;> ?
public 
decimal 
Price 
{ 
get "
;" #
set$ '
;' (
}) *
public		 
double		 
Stock		 
{		 
get		 !
;		! "
set		# &
;		& '
}		( )
public

 
double

 
Rating

 
{

 
get

 "
;

" #
set

$ '
;

' (
}

) *
public 
ICollection 
< 
CategoryDto &
>& '

Categories( 2
{3 4
get5 8
;8 9
set: =
;= >
}? @
=A B
newC F
ListG K
<K L
CategoryDtoL W
>W X
(X Y
)Y Z
;Z [
} 
} ¯
4D:\BuySmart\BuySmart\Application\DTOs\CategoryDto.cs
	namespace 	
Application
 
. 
DTOs 
{ 
public 

class 
CategoryDto 
{ 
public 
Guid 

CategoryId 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
=) *
string+ 1
.1 2
Empty2 7
;7 8
public 
string 
Description !
{" #
get$ '
;' (
set) ,
;, -
}. /
=0 1
string2 8
.8 9
Empty9 >
;> ?
} 
}		 ´
0D:\BuySmart\BuySmart\Application\DTOs\CartDto.cs
	namespace 	
Application
 
. 
DTOs 
{ 
public 

class 
CartDto 
{ 
public 
Guid 
CartId 
{ 
get  
;  !
set" %
;% &
}' (
public 
Guid 
UserClientId  
{! "
get# &
;& '
set( +
;+ ,
}- .
} 
} ﬁ

4D:\BuySmart\BuySmart\Application\DTOs\BusinessDto.cs
	namespace 	
Application
 
. 
DTOs 
{ 
public 

class 
BusinessDto 
{ 
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
=) *
string+ 1
.1 2
Empty2 7
;7 8
public 
string 
Description !
{" #
get$ '
;' (
set) ,
;, -
}. /
=0 1
string2 8
.8 9
Empty9 >
;> ?
public 
string 
Address 
{ 
get  #
;# $
set% (
;( )
}* +
=, -
string. 4
.4 5
Empty5 :
;: ;
public		 
string		 
PhoneNumber		 !
{		" #
get		$ '
;		' (
set		) ,
;		, -
}		. /
=		0 1
string		2 8
.		8 9
Empty		9 >
;		> ?
public 
Guid 
UserBusinessId "
{# $
get% (
;( )
set* -
;- .
}/ 0
} 
} ÷
6D:\BuySmart\BuySmart\Application\DependecyInjection.cs
	namespace 	
Application
 
{ 
public		 

static		 
class		 
DependencyInjection		 +
{

 
public 
static 
IServiceCollection (
AddApplication) 7
(7 8
this8 <
IServiceCollection= O
servicesP X
)X Y
{ 	
services 
. 
AddAutoMapper "
(" #
typeof# )
() *
MappingProfile* 8
)8 9
)9 :
;: ;
services 
. 

AddMediatR 
(  
cfg  #
=>$ &
cfg' *
.* +(
RegisterServicesFromAssembly+ G
(G H
AssemblyH P
.P Q 
GetExecutingAssemblyQ e
(e f
)f g
)g h
)h i
;i j
services 
. %
AddValidatorsFromAssembly .
(. /
Assembly/ 7
.7 8 
GetExecutingAssembly8 L
(L M
)M N
)N O
;O P
services 
. 
AddTransient !
(! "
typeof" (
(( )
IPipelineBehavior) :
<: ;
,; <
>< =
)= >
,> ?
typeof@ F
(F G
ValidationBehaviorG Y
<Y Z
,Z [
>[ \
)\ ]
)] ^
;^ _
services 
. 
AddAutoMapper "
(" #
Assembly# +
.+ , 
GetExecutingAssembly, @
(@ A
)A B
)B C
;C D
return 
services 
; 
} 	
} 
} ¸
`D:\BuySmart\BuySmart\Application\Commands\UserClientCommands\UpdateUserClientCommandValidator.cs
	namespace 	
Application
 
. 
Commands 
. 
UserClientCommands 1
{ 
public 

class ,
 UpdateUserClientCommandValidator 1
:2 3
AbstractValidator4 E
<E F#
UpdateUserClientCommandF ]
>] ^
{ 
public ,
 UpdateUserClientCommandValidator /
(/ 0
)0 1
{		 	
RuleFor

 
(

 
uc

 
=>

 
uc

 
.

 
UserId

 #
)

# $
. 
NotEmpty 
( 
) 
. 
WithMessage 
( 
$str 2
)2 3
;3 4
RuleFor 
( 
uc 
=> 
uc 
. 
Name !
)! "
. 
NotEmpty 
( 
) 
. 
MaximumLength 
( 
$num "
)" #
. 
WithMessage 
( 
$str H
)H I
;I J
RuleFor 
( 
uc 
=> 
uc 
. 
Email "
)" #
. 
NotEmpty 
( 
) 
. 
EmailAddress 
( 
) 
. 
MaximumLength 
( 
$num "
)" #
. 
WithMessage 
( 
$str 4
)4 5
;5 6
RuleFor 
( 
uc 
=> 
uc 
. 
Password %
)% &
. 
NotEmpty 
( 
) 
. 
MinimumLength 
( 
$num  
)  !
. 
MaximumLength 
( 
$num "
)" #
. 
WithMessage 
( 
$str L
)L M
;M N
RuleFor 
( 
uc 
=> 
uc 
. 
UserType %
)% &
.   
Equal   
(   
UserType   
.    
Client    &
)  & '
.!! 
WithMessage!! 
(!! 
$str!! 7
)!!7 8
;!!8 9
RuleFor## 
(## 
uc## 
=>## 
uc## 
.## 
Image## "
)##" #
.$$ 
MaximumLength$$ 
($$ 
$num$$ "
)$$" #
.%% 
WithMessage%% 
(%% 
$str%% =
)%%= >
;%%> ?
}&& 	
}'' 
}(( ´
WD:\BuySmart\BuySmart\Application\Commands\UserClientCommands\UpdateUserClientCommand.cs
	namespace 	
Application
 
. 
Commands 
. 
UserClientCommands 1
{ 
public 

class #
UpdateUserClientCommand (
:) *
IRequest+ 3
<3 4
Result4 :
<: ;
object; A
>A B
>B C
{ 
public		 
Guid		 
UserId		 
{		 
get		  
;		  !
set		" %
;		% &
}		' (
public

 
string

 
Name

 
{

 
get

  
;

  !
set

" %
;

% &
}

' (
=

) *
string

+ 1
.

1 2
Empty

2 7
;

7 8
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
=* +
string, 2
.2 3
Empty3 8
;8 9
public 
string 
Password 
{  
get! $
;$ %
set& )
;) *
}+ ,
=- .
string/ 5
.5 6
Empty6 ;
;; <
public 
UserType 
UserType  
{! "
get# &
;& '
set( +
;+ ,
}- .
=/ 0
UserType1 9
.9 :
Client: @
;@ A
public 
string 
Image 
{ 
get !
;! "
set# &
;& '
}( )
=* +
string, 2
.2 3
Empty3 8
;8 9
} 
} Ø
`D:\BuySmart\BuySmart\Application\Commands\UserClientCommands\CreateUserClientCommandValidator.cs
	namespace 	
Application
 
. 
Commands 
. 
UserClientCommands 1
{ 
public 

class ,
 CreateUserClientCommandValidator 1
:2 3
AbstractValidator4 E
<E F#
CreateUserClientCommandF ]
>] ^
{ 
public ,
 CreateUserClientCommandValidator /
(/ 0
)0 1
{		 	
RuleFor

 
(

 
uc

 
=>

 
uc

 
.

 
Name

 !
)

! "
. 
NotEmpty 
( 
) 
. 
MaximumLength 
( 
$num "
)" #
. 
MinimumLength 
( 
$num  
)  !
. 
WithMessage 
( 
$str H
)H I
;I J
RuleFor 
( 
uc 
=> 
uc 
. 
Email "
)" #
. 
NotEmpty 
( 
) 
. 
EmailAddress 
( 
) 
. 
MaximumLength 
( 
$num "
)" #
. 
WithMessage 
( 
$str 4
)4 5
;5 6
RuleFor 
( 
uc 
=> 
uc 
. 
Password %
)% &
. 
NotEmpty 
( 
) 
. 
MinimumLength 
( 
$num  
)  !
. 
MaximumLength 
( 
$num "
)" #
. 
WithMessage 
( 
$str L
)L M
;M N
RuleFor 
( 
uc 
=> 
uc 
. 
UserType %
)% &
. 
Equal 
( 
UserType 
.  
Client  &
)& '
. 
WithMessage 
( 
$str 7
)7 8
;8 9
RuleFor!! 
(!! 
uc!! 
=>!! 
uc!! 
.!! 
Image!! "
)!!" #
."" 
Must"" 
("" 
BeValidBase64"" #
)""# $
.## 
WithMessage## 
(## 
$str## B
)##B C
.$$ 
MaximumLength$$ 
($$ 
$num$$ "
*$$# $
$num$$% &
/$$' (
$num$$) *
)$$* +
.%% 
WithMessage%% 
(%% 
$str%% Y
)%%Y Z
;%%Z [
}&& 	
private'' 
static'' 
bool'' 
BeValidBase64'' )
('') *
string''* 0
base64String''1 =
)''= >
{(( 	
Span)) 
<)) 
byte)) 
>)) 
buffer)) 
=)) 
new))  #
Span))$ (
<))( )
byte))) -
>))- .
()). /
new))/ 2
byte))3 7
[))7 8
base64String))8 D
.))D E
Length))E K
]))K L
)))L M
;))M N
return** 
Convert** 
.** 
TryFromBase64String** .
(**. /
base64String**/ ;
,**; <
buffer**= C
,**C D
out**E H
_**I J
)**J K
;**K L
}++ 	
},, 
}-- ë
WD:\BuySmart\BuySmart\Application\Commands\UserClientCommands\CreateUserClientCommand.cs
	namespace 	
Application
 
. 
Commands 
. 
UserClientCommands 1
{ 
public 

class #
CreateUserClientCommand (
:) *
IRequest+ 3
<3 4
Result4 :
<: ;
Guid; ?
>? @
>@ A
{ 
public		 
string		 
Name		 
{		 
get		  
;		  !
set		" %
;		% &
}		' (
=		) *
string		+ 1
.		1 2
Empty		2 7
;		7 8
public

 
string

 
Email

 
{

 
get

 !
;

! "
set

# &
;

& '
}

( )
=

* +
string

, 2
.

2 3
Empty

3 8
;

8 9
public 
string 
Password 
{  
get! $
;$ %
set& )
;) *
}+ ,
=- .
string/ 5
.5 6
Empty6 ;
;; <
public 
UserType 
UserType  
{! "
get# &
;& '
set( +
;+ ,
}- .
=/ 0
UserType1 9
.9 :
Client: @
;@ A
public 
string 
Image 
{ 
get !
;! "
set# &
;& '
}( )
=* +
string, 2
.2 3
Empty3 8
;8 9
} 
} ì-
dD:\BuySmart\BuySmart\Application\Commands\UserBusinessCommands\UpdateUserBusinessCommandValidator.cs
	namespace 	
Application
 
. 
Commands 
.  
UserBusinessCommands 3
{ 
public 

class .
"UpdateUserBusinessCommandValidator 3
:4 5
AbstractValidator6 G
<G H%
UpdateUserBusinessCommandH a
>a b
{		 
public

 .
"UpdateUserBusinessCommandValidator

 1
(

1 2
)

2 3
{ 	
ApplyStringRules 
( 
ub 
=>  "
ub# %
.% &
Name& *
,* +
$str, 2
,2 3
$num4 5
,5 6
$num7 :
): ;
;; <
ApplyEmailRules 
( 
ub 
=> !
ub" $
.$ %
Email% *
,* +
$str, 3
,3 4
$num5 8
)8 9
;9 :
ApplyStringRules 
( 
ub 
=>  "
ub# %
.% &
Password& .
,. /
$str0 :
,: ;
$num< =
,= >
$num? B
)B C
;C D
RuleFor 
( 
ub 
=> 
ub 
. 
UserType %
)% &
. 
Equal 
( 
UserType 
.  
Business  (
)( )
. 
WithMessage 
( 
$str 9
)9 :
;: ;
ApplyMaxLengthRule 
( 
ub !
=>" $
ub% '
.' (
Image( -
,- .
$str/ 6
,6 7
$num8 ;
); <
;< =
} 	
private 
void 
ApplyStringRules %
(% &

Expression& 0
<0 1
Func1 5
<5 6%
UpdateUserBusinessCommand6 O
,O P
stringQ W
>W X
>X Y
propertyExpressionZ l
,l m
stringn t
propertyName	u Å
,
Å Ç
int
É Ü
	minLength
á ê
,
ê ë
int
í ï
	maxLength
ñ ü
)
ü †
{ 	
RuleFor 
( 
propertyExpression &
)& '
. 
NotEmpty 
( 
) 
. 
WithMessage '
(' (
$"( *
{* +
propertyName+ 7
}7 8
$str8 D
"D E
)E F
. 
MinimumLength 
( 
	minLength (
)( )
.) *
WithMessage* 5
(5 6
$"6 8
{8 9
propertyName9 E
}E F
$strF X
{X Y
	minLengthY b
}b c
$strc s
"s t
)t u
. 
MaximumLength 
( 
	maxLength (
)( )
.) *
WithMessage* 5
(5 6
$"6 8
{8 9
propertyName9 E
}E F
$strF W
{W X
	maxLengthX a
}a b
$strb m
"m n
)n o
;o p
} 	
private   
void   
ApplyEmailRules   $
(  $ %

Expression  % /
<  / 0
Func  0 4
<  4 5%
UpdateUserBusinessCommand  5 N
,  N O
string  P V
>  V W
>  W X
propertyExpression  Y k
,  k l
string  m s
propertyName	  t Ä
,
  Ä Å
int
  Ç Ö
	maxLength
  Ü è
)
  è ê
{!! 	
RuleFor"" 
("" 
propertyExpression"" &
)""& '
.## 
NotEmpty## 
(## 
)## 
.## 
WithMessage## '
(##' (
$"##( *
{##* +
propertyName##+ 7
}##7 8
$str##8 D
"##D E
)##E F
.$$ 
EmailAddress$$ 
($$ 
)$$ 
.$$  
WithMessage$$  +
($$+ ,
$"$$, .
{$$. /
propertyName$$/ ;
}$$; <
$str$$< Z
"$$Z [
)$$[ \
.%% 
MaximumLength%% 
(%% 
	maxLength%% (
)%%( )
.%%) *
WithMessage%%* 5
(%%5 6
$"%%6 8
{%%8 9
propertyName%%9 E
}%%E F
$str%%F W
{%%W X
	maxLength%%X a
}%%a b
$str%%b m
"%%m n
)%%n o
;%%o p
}&& 	
private(( 
void(( 
ApplyMaxLengthRule(( '
(((' (

Expression((( 2
<((2 3
Func((3 7
<((7 8%
UpdateUserBusinessCommand((8 Q
,((Q R
string((S Y
>((Y Z
>((Z [
propertyExpression((\ n
,((n o
string((p v
propertyName	((w É
,
((É Ñ
int
((Ö à
	maxLength
((â í
)
((í ì
{)) 	
RuleFor** 
(** 
propertyExpression** &
)**& '
.++ 
MaximumLength++ 
(++ 
	maxLength++ (
)++( )
.++) *
WithMessage++* 5
(++5 6
$"++6 8
{++8 9
propertyName++9 E
}++E F
$str++F W
{++W X
	maxLength++X a
}++a b
$str++b m
"++m n
)++n o
;++o p
},, 	
}-- 
}.. µ
[D:\BuySmart\BuySmart\Application\Commands\UserBusinessCommands\UpdateUserBusinessCommand.cs
	namespace 	
Application
 
. 
Commands 
.  
UserBusinessCommands 3
{ 
public 

class %
UpdateUserBusinessCommand *
:+ ,
IRequest- 5
<5 6
Result6 <
<< =
object= C
>C D
>D E
{ 
public		 
Guid		 
UserId		 
{		 
get		  
;		  !
set		" %
;		% &
}		' (
public

 
string

 
Name

 
{

 
get

  
;

  !
set

" %
;

% &
}

' (
=

) *
string

+ 1
.

1 2
Empty

2 7
;

7 8
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
=* +
string, 2
.2 3
Empty3 8
;8 9
public 
string 
Password 
{  
get! $
;$ %
set& )
;) *
}+ ,
=- .
string/ 5
.5 6
Empty6 ;
;; <
public 
UserType 
UserType  
{! "
get# &
;& '
set( +
;+ ,
}- .
=/ 0
UserType1 9
.9 :
Business: B
;B C
public 
string 
Image 
{ 
get !
;! "
set# &
;& '
}( )
=* +
string, 2
.2 3
Empty3 8
;8 9
} 
} õ
[D:\BuySmart\BuySmart\Application\Commands\UserBusinessCommands\CreateUserBusinessCommand.cs
	namespace 	
Application
 
. 
Commands 
.  
UserBusinessCommands 3
{ 
public 

class %
CreateUserBusinessCommand *
:+ ,
IRequest- 5
<5 6
Result6 <
<< =
Guid= A
>A B
>B C
{ 
public		 
string		 
Name		 
{		 
get		  
;		  !
set		" %
;		% &
}		' (
=		) *
string		+ 1
.		1 2
Empty		2 7
;		7 8
public

 
string

 
Email

 
{

 
get

 !
;

! "
set

# &
;

& '
}

( )
=

* +
string

, 2
.

2 3
Empty

3 8
;

8 9
public 
string 
Password 
{  
get! $
;$ %
set& )
;) *
}+ ,
=- .
string/ 5
.5 6
Empty6 ;
;; <
public 
UserType 
UserType  
{! "
get# &
;& '
set( +
;+ ,
}- .
=/ 0
UserType1 9
.9 :
Business: B
;B C
public 
string 
Image 
{ 
get !
;! "
set# &
;& '
}( )
=* +
string, 2
.2 3
Empty3 8
;8 9
} 
} Ω
dD:\BuySmart\BuySmart\Application\Commands\UserBusinessCommands\CreateUserBuisnessCommandValidator.cs
	namespace 	
Application
 
. 
Commands 
.  
UserBusinessCommands 3
{ 
public 

class .
"CreateUserBuisnessCommandValidator 3
:4 5
AbstractValidator6 G
<G H%
CreateUserBusinessCommandH a
>a b
{ 
public .
"CreateUserBuisnessCommandValidator 1
(1 2
)2 3
{		 	
RuleFor

 
(

 
ub

 
=>

 
ub

 
.

 
Name

 !
)

! "
. 
NotEmpty 
( 
) 
. 
MaximumLength 
( 
$num "
)" #
. 
MinimumLength 
( 
$num  
)  !
. 
WithMessage 
( 
$str H
)H I
;I J
RuleFor 
( 
ub 
=> 
ub 
. 
Email "
)" #
. 
NotEmpty 
( 
) 
. 
EmailAddress 
( 
) 
. 
MaximumLength 
( 
$num "
)" #
. 
WithMessage 
( 
$str 4
)4 5
;5 6
RuleFor 
( 
ub 
=> 
ub 
. 
Password %
)% &
. 
NotEmpty 
( 
) 
. 
MinimumLength 
( 
$num  
)  !
. 
MaximumLength 
( 
$num "
)" #
. 
WithMessage 
( 
$str L
)L M
;M N
RuleFor 
( 
ub 
=> 
ub 
. 
UserType %
)% &
. 
Equal 
( 
UserType 
.  
Business  (
)( )
. 
WithMessage 
( 
$str 9
)9 :
;: ;
RuleFor!! 
(!! 
uc!! 
=>!! 
uc!! 
.!! 
Image!! "
)!!" #
."" 
Must"" 
("" 
BeValidBase64"" #
)""# $
.## 
WithMessage## 
(## 
$str## B
)##B C
.$$ 
MaximumLength$$ 
($$ 
$num$$ "
*$$# $
$num$$% &
/$$' (
$num$$) *
)$$* +
.%% 
WithMessage%% 
(%% 
$str%% Y
)%%Y Z
;%%Z [
}&& 	
private'' 
static'' 
bool'' 
BeValidBase64'' )
('') *
string''* 0
base64String''1 =
)''= >
{(( 	
Span)) 
<)) 
byte)) 
>)) 
buffer)) 
=)) 
new))  #
Span))$ (
<))( )
byte))) -
>))- .
()). /
new))/ 2
byte))3 7
[))7 8
base64String))8 D
.))D E
Length))E K
]))K L
)))L M
;))M N
return** 
Convert** 
.** 
TryFromBase64String** .
(**. /
base64String**/ ;
,**; <
buffer**= C
,**C D
out**E H
_**I J
)**J K
;**K L
}++ 	
}-- 
}.. Û
hD:\BuySmart\BuySmart\Application\Commands\ReviewBusinessCommands\UpdateReviewBusinessCommandValidator.cs
	namespace 	
Application
 
. 
Commands 
. "
ReviewBusinessCommands 5
{ 
public 

class 0
$UpdateReviewBusinessCommandValidator 5
:6 7
AbstractValidator8 I
<I J'
UpdateReviewBusinessCommandJ e
>e f
{ 
public 0
$UpdateReviewBusinessCommandValidator 3
(3 4
)4 5
{ 	
RuleFor		 
(		 
x		 
=>		 
x		 
.		 
Rating		 !
)		! "
.

 
NotEmpty

 
(

 
)

 
.

 
WithMessage

 '
(

' (
$str

( <
)

< =
. 
InclusiveBetween !
(! "
$num" #
,# $
$num% &
)& '
.' (
WithMessage( 3
(3 4
$str4 T
)T U
;U V
RuleFor 
( 
x 
=> 
x 
. 
Comment "
)" #
. 
NotEmpty 
( 
) 
. 
WithMessage '
(' (
$str( =
)= >
. 
MaximumLength 
( 
$num "
)" #
.# $
WithMessage$ /
(/ 0
$str0 X
)X Y
;Y Z
RuleFor 
( 
x 
=> 
x 
. 
ReviewId #
)# $
. 
NotEmpty 
( 
) 
. 
WithMessage '
(' (
$str( >
)> ?
;? @
RuleFor 
( 
x 
=> 
x 
. 
UserClientId '
)' (
. 
NotEmpty 
( 
) 
. 
WithMessage '
(' (
$str( B
)B C
;C D
RuleFor 
( 
x 
=> 
x 
. 

BusinessId %
)% &
. 
NotEmpty 
( 
) 
. 
WithMessage '
(' (
$str( @
)@ A
;A B
} 	
} 
} Ö
_D:\BuySmart\BuySmart\Application\Commands\ReviewBusinessCommands\UpdateReviewBusinessCommand.cs
	namespace 	
Application
 
. 
Commands 
. "
ReviewBusinessCommands 5
{ 
public 

class '
UpdateReviewBusinessCommand ,
:- .
IRequest/ 7
<7 8
Result8 >
<> ?
object? E
>E F
>F G
{ 
public 
Guid 
ReviewId 
{ 
get "
;" #
set$ '
;' (
}) *
public		 
Guid		 
UserClientId		  
{		! "
get		# &
;		& '
set		( +
;		+ ,
}		- .
public

 
Guid

 

BusinessId

 
{

  
get

! $
;

$ %
set

& )
;

) *
}

+ ,
public 
double 
Rating 
{ 
get "
;" #
set$ '
;' (
}) *
=+ ,
$num- .
;. /
public 
string 
Comment 
{ 
get  #
;# $
set% (
;( )
}* +
=, -
string. 4
.4 5
Empty5 :
;: ;
} 
} ®
hD:\BuySmart\BuySmart\Application\Commands\ReviewBusinessCommands\DeleteReviewBusinessCommandValidator.cs
	namespace 	
Application
 
. 
Commands 
. "
ReviewBusinessCommands 5
{ 
public 

class 0
$DeleteReviewBusinessCommandValidator 5
:6 7
AbstractValidator8 I
<I J'
DeleteReviewBusinessCommandJ e
>e f
{ 
public 0
$DeleteReviewBusinessCommandValidator 3
(3 4
)4 5
{ 	
RuleFor		 
(		 
x		 
=>		 
x		 
.		 
ReviewId		 #
)		# $
.

 
NotEmpty

 
(

 
)

 
.

 
WithMessage

 '
(

' (
$str

( >
)

> ?
;

? @
} 	
} 
} í
_D:\BuySmart\BuySmart\Application\Commands\ReviewBusinessCommands\DeleteReviewBusinessCommand.cs
	namespace 	
Application
 
. 
Commands 
. "
ReviewBusinessCommands 5
{ 
public 

class '
DeleteReviewBusinessCommand ,
:- .
IRequest/ 7
<7 8
Result8 >
<> ?
object? E
>E F
>F G
{ 
public 
Guid 
ReviewId 
{ 
get "
;" #
set$ '
;' (
}) *
}		 
}

 √
hD:\BuySmart\BuySmart\Application\Commands\ReviewBusinessCommands\CreateReviewBusinessCommandValidator.cs
	namespace 	
Application
 
. 
Commands 
. "
ReviewBusinessCommands 5
{ 
public 

class 0
$CreateReviewBusinessCommandValidator 5
:6 7
AbstractValidator8 I
<I J'
CreateReviewBusinessCommandJ e
>e f
{ 
public 0
$CreateReviewBusinessCommandValidator 3
(3 4
)4 5
{ 	
RuleFor		 
(		 
x		 
=>		 
x		 
.		 
Rating		 !
)		! "
.

 
NotEmpty

 
(

 
)

 
.

 
WithMessage

 '
(

' (
$str

( <
)

< =
. 
InclusiveBetween !
(! "
$num" #
,# $
$num% &
)& '
.' (
WithMessage( 3
(3 4
$str4 T
)T U
;U V
RuleFor 
( 
x 
=> 
x 
. 
Comment "
)" #
. 
NotEmpty 
( 
) 
. 
WithMessage '
(' (
$str( =
)= >
. 
MaximumLength 
( 
$num "
)" #
.# $
WithMessage$ /
(/ 0
$str0 X
)X Y
;Y Z
RuleFor 
( 
x 
=> 
x 
. 
UserClientId '
)' (
. 
NotEmpty 
( 
) 
. 
WithMessage '
(' (
$str( B
)B C
;C D
RuleFor 
( 
x 
=> 
x 
. 

BusinessId %
)% &
. 
NotEmpty 
( 
) 
. 
WithMessage '
(' (
$str( @
)@ A
;A B
} 	
} 
} È	
_D:\BuySmart\BuySmart\Application\Commands\ReviewBusinessCommands\CreateReviewBusinessCommand.cs
	namespace 	
Application
 
. 
Commands 
. "
ReviewBusinessCommands 5
{ 
public 

class '
CreateReviewBusinessCommand ,
:- .
IRequest/ 7
<7 8
Result8 >
<> ?
Guid? C
>C D
>D E
{ 
public 
Guid 
UserClientId  
{! "
get# &
;& '
set( +
;+ ,
}- .
public		 
Guid		 

BusinessId		 
{		  
get		! $
;		$ %
set		& )
;		) *
}		+ ,
public

 
double

 
Rating

 
{

 
get

 "
;

" #
set

$ '
;

' (
}

) *
=

+ ,
$num

- .
;

. /
public 
string 
Comment 
{ 
get  #
;# $
set% (
;( )
}* +
=, -
string. 4
.4 5
Empty5 :
;: ;
} 
} ˘
ZD:\BuySmart\BuySmart\Application\Commands\ProductCommands\UpdateProductCommandValidator.cs
	namespace 	
Application
 
. 
Commands 
. 
ProductCommands .
{ 
public 

class )
UpdateProductCommandValidator .
:/ 0
AbstractValidator1 B
<B C 
UpdateProductCommandC W
>W X
{ 
public		 )
UpdateProductCommandValidator		 ,
(		, -
)		- .
{

 	
ApplyNotEmptyRule 
( 
x 
=>  "
x# $
.$ %
	ProductId% .
,. /
$str0 ;
); <
;< =
ApplyStringRules 
( 
x 
=> !
x" #
.# $
Name$ (
,( )
$str* 0
,0 1
$num2 5
)5 6
;6 7
ApplyStringRules 
( 
x 
=> !
x" #
.# $
Description$ /
,/ 0
$str1 >
,> ?
$num@ C
)C D
;D E
ApplyNotEmptyRule 
( 
x 
=>  "
x# $
.$ %
Price% *
,* +
$str, 3
)3 4
;4 5
ApplyNotEmptyRule 
( 
x 
=>  "
x# $
.$ %
Stock% *
,* +
$str, 3
)3 4
;4 5
ApplyNotEmptyRule 
( 
x 
=>  "
x# $
.$ %
Rating% +
,+ ,
$str- 5
)5 6
;6 7
ApplyNotEmptyRule 
( 
x 
=>  "
x# $
.$ %
Image% *
,* +
$str, 3
)3 4
;4 5
ApplyNotEmptyRule 
( 
x 
=>  "
x# $
.$ %

BusinessId% /
,/ 0
$str1 =
)= >
;> ?
} 	
private 
void 
ApplyStringRules %
(% &

Expression& 0
<0 1
Func1 5
<5 6 
UpdateProductCommand6 J
,J K
stringL R
>R S
>S T
propertyExpressionU g
,g h
stringi o
propertyNamep |
,| }
int	~ Å
	maxLength
Ç ã
)
ã å
{ 	
RuleFor 
( 
propertyExpression &
)& '
. 
NotEmpty 
( 
) 
. 
WithMessage '
(' (
$"( *
{* +
propertyName+ 7
}7 8
$str8 D
"D E
)E F
. 
MaximumLength 
( 
	maxLength (
)( )
.) *
WithMessage* 5
(5 6
$"6 8
{8 9
propertyName9 E
}E F
$strF W
{W X
	maxLengthX a
}a b
$strb m
"m n
)n o
;o p
} 	
private 
void 
ApplyNotEmptyRule &
<& '
T' (
>( )
() *

Expression* 4
<4 5
Func5 9
<9 : 
UpdateProductCommand: N
,N O
TP Q
>Q R
>R S
propertyExpressionT f
,f g
stringh n
propertyNameo {
){ |
{ 	
RuleFor   
(   
propertyExpression   &
)  & '
.!! 
NotEmpty!! 
(!! 
)!! 
.!! 
WithMessage!! '
(!!' (
$"!!( *
{!!* +
propertyName!!+ 7
}!!7 8
$str!!8 D
"!!D E
)!!E F
;!!F G
}"" 	
}## 
}$$ ©
QD:\BuySmart\BuySmart\Application\Commands\ProductCommands\UpdateProductCommand.cs
	namespace 	
Application
 
. 
Commands 
. 
ProductCommands .
{ 
public 

class  
UpdateProductCommand %
:& '
IRequest( 0
<0 1
Result1 7
<7 8
object8 >
>> ?
>? @
{ 
public 
Guid 
	ProductId 
{ 
get  #
;# $
set% (
;( )
}* +
public		 
string		 
Name		 
{		 
get		  
;		  !
set		" %
;		% &
}		' (
=		) *
string		+ 1
.		1 2
Empty		2 7
;		7 8
public

 
string

 
Description

 !
{

" #
get

$ '
;

' (
set

) ,
;

, -
}

. /
=

0 1
string

2 8
.

8 9
Empty

9 >
;

> ?
public 
decimal 
Price 
{ 
get "
;" #
set$ '
;' (
}) *
public 
int 
Stock 
{ 
get 
; 
set  #
;# $
}% &
public 
double 
Rating 
{ 
get "
;" #
set$ '
;' (
}) *
public 
string 
Image 
{ 
get !
;! "
set# &
;& '
}( )
=* +
string, 2
.2 3
Empty3 8
;8 9
public 
Guid 

BusinessId 
{  
get! $
;$ %
set& )
;) *
}+ ,
} 
} Å
ZD:\BuySmart\BuySmart\Application\Commands\ProductCommands\DeleteProductCommandValidator.cs
	namespace 	
Application
 
. 
Commands 
. 
ProductCommands .
{ 
internal 
class )
DeleteProductCommandValidator 0
:1 2
AbstractValidator3 D
<D E 
DeleteProductCommandE Y
>Y Z
{ 
public )
DeleteProductCommandValidator ,
(, -
)- .
{ 	
RuleFor		 
(		 
x		 
=>		 
x		 
.		 
	ProductId		 $
)		$ %
.

 
NotEmpty

 
(

 
)

 
.

 
WithMessage

 '
(

' (
$str

( ?
)

? @
;

@ A
} 	
} 
} ˜
QD:\BuySmart\BuySmart\Application\Commands\ProductCommands\DeleteProductCommand.cs
	namespace 	
Application
 
. 
Commands 
. 
ProductCommands .
{ 
public 

class  
DeleteProductCommand %
:& '
IRequest( 0
<0 1
Result1 7
<7 8
object8 >
>> ?
>? @
{ 
public 
Guid 
	ProductId 
{ 
get  #
;# $
set% (
;( )
}* +
}		 
}

 ˚
ZD:\BuySmart\BuySmart\Application\Commands\ProductCommands\CreateProductCommandValidator.cs
	namespace 	
Application
 
. 
Commands 
. 
ProductCommands .
{ 
public 

class )
CreateProductCommandValidator .
:/ 0
AbstractValidator1 B
<B C 
CreateProductCommandC W
>W X
{ 
public		 )
CreateProductCommandValidator		 ,
(		, -
)		- .
{

 	
ApplyStringRules 
( 
x 
=> !
x" #
.# $
Name$ (
,( )
$str* 0
,0 1
$num2 5
)5 6
;6 7
ApplyStringRules 
( 
x 
=> !
x" #
.# $
Description$ /
,/ 0
$str1 >
,> ?
$num@ C
)C D
;D E
ApplyNotEmptyRule 
( 
x 
=>  "
x# $
.$ %
Price% *
,* +
$str, 3
)3 4
;4 5
ApplyNotEmptyRule 
( 
x 
=>  "
x# $
.$ %
Stock% *
,* +
$str, 3
)3 4
;4 5
ApplyNotEmptyRule 
( 
x 
=>  "
x# $
.$ %
Rating% +
,+ ,
$str- 5
)5 6
;6 7
ApplyNotEmptyRule 
( 
x 
=>  "
x# $
.$ %

BusinessId% /
,/ 0
$str1 =
)= >
;> ?
} 	
private 
void 
ApplyStringRules %
(% &

Expression& 0
<0 1
Func1 5
<5 6 
CreateProductCommand6 J
,J K
stringL R
>R S
>S T
propertyExpressionU g
,g h
stringi o
propertyNamep |
,| }
int	~ Å
	maxLength
Ç ã
)
ã å
{ 	
RuleFor 
( 
propertyExpression &
)& '
. 
NotEmpty 
( 
) 
. 
WithMessage '
(' (
$"( *
{* +
propertyName+ 7
}7 8
$str8 D
"D E
)E F
. 
MaximumLength 
( 
	maxLength (
)( )
.) *
WithMessage* 5
(5 6
$"6 8
{8 9
propertyName9 E
}E F
$strF W
{W X
	maxLengthX a
}a b
$strb m
"m n
)n o
;o p
} 	
private 
void 
ApplyNotEmptyRule &
<& '
T' (
>( )
() *

Expression* 4
<4 5
Func5 9
<9 : 
CreateProductCommand: N
,N O
TP Q
>Q R
>R S
propertyExpressionT f
,f g
stringh n
propertyNameo {
){ |
{ 	
RuleFor 
( 
propertyExpression &
)& '
. 
NotEmpty 
( 
) 
. 
WithMessage '
(' (
$"( *
{* +
propertyName+ 7
}7 8
$str8 D
"D E
)E F
;F G
} 	
}!! 
}"" Ò
QD:\BuySmart\BuySmart\Application\Commands\ProductCommands\CreateProductCommand.cs
	namespace 	
Application
 
. 
Commands 
. 
ProductCommands .
{ 
public 

class  
CreateProductCommand %
:& '
IRequest( 0
<0 1
Result1 7
<7 8
Guid8 <
>< =
>= >
{ 
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
=) *
string+ 1
.1 2
Empty2 7
;7 8
public		 
string		 
Description		 !
{		" #
get		$ '
;		' (
set		) ,
;		, -
}		. /
=		0 1
string		2 8
.		8 9
Empty		9 >
;		> ?
public

 
decimal

 
Price

 
{

 
get

 "
;

" #
set

$ '
;

' (
}

) *
public 
double 
Stock 
{ 
get !
;! "
set# &
;& '
}( )
public 
double 
Rating 
{ 
get "
;" #
set$ '
;' (
}) *
public 
string 
Image 
{ 
get !
;! "
set# &
;& '
}( )
=* +
string, 2
.2 3
Empty3 8
;8 9
public 
Guid 

BusinessId 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
List 
< 
string 
> 
CategoryNames )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
=8 9
new: =
List> B
<B C
stringC I
>I J
(J K
)K L
;L M
} 
} Â
\D:\BuySmart\BuySmart\Application\Commands\CategoryCommands\UpdateCategoryCommandValidator.cs
	namespace 	
Application
 
. 
Commands 
. 
CategoryCommands /
{ 
public 

class *
UpdateCategoryCommandValidator /
:0 1
AbstractValidator2 C
<C D!
UpdateCategoryCommandD Y
>Y Z
{ 
public *
UpdateCategoryCommandValidator -
(- .
). /
{ 	
RuleFor		 
(		 
x		 
=>		 
x		 
.		 

CategoryId		 %
)		% &
.		& '
NotEmpty		' /
(		/ 0
)		0 1
.		1 2
WithMessage		2 =
(		= >
$str		> N
)		N O
;		O P
RuleFor

 
(

 
x

 
=>

 
x

 
.

 
Name

 
)

  
.

  !
NotEmpty

! )
(

) *
)

* +
.

+ ,
WithMessage

, 7
(

7 8
$str

8 J
)

J K
;

K L
RuleFor 
( 
x 
=> 
x 
. 
Description &
)& '
.' (
NotEmpty( 0
(0 1
)1 2
.2 3
WithMessage3 >
(> ?
$str? X
)X Y
;Y Z
} 	
} 
} €
SD:\BuySmart\BuySmart\Application\Commands\CategoryCommands\UpdateCategoryCommand.cs
	namespace 	
Application
 
. 
Commands 
. 
CategoryCommands /
{ 
public 

class !
UpdateCategoryCommand &
:' (
IRequest) 1
<1 2
Result2 8
<8 9
object9 ?
>? @
>@ A
{ 
public 
Guid 

CategoryId 
{  
get! $
;$ %
set& )
;) *
}+ ,
public		 
string		 
Name		 
{		 
get		  
;		  !
set		" %
;		% &
}		' (
=		) *
string		+ 1
.		1 2
Empty		2 7
;		7 8
public

 
string

 
Description

 !
{

" #
get

$ '
;

' (
set

) ,
;

, -
}

. /
=

0 1
string

2 8
.

8 9
Empty

9 >
;

> ?
} 
} Æ
\D:\BuySmart\BuySmart\Application\Commands\CategoryCommands\DeleteCategoryCommandValidator.cs
	namespace 	
Application
 
. 
Commands 
. 
CategoryCommands /
{ 
public 

class *
DeleteCategoryCommandValidator /
:0 1
AbstractValidator2 C
<C D!
DeleteCategoryCommandD Y
>Y Z
{ 
public *
DeleteCategoryCommandValidator -
(- .
). /
{ 	
RuleFor		 
(		 
x		 
=>		 
x		 
.		 

CategoryId		 %
)		% &
.		& '
NotEmpty		' /
(		/ 0
)		0 1
;		1 2
}

 	
} 
} ˙
SD:\BuySmart\BuySmart\Application\Commands\CategoryCommands\DeleteCategoryCommand.cs
	namespace 	
Application
 
. 
Commands 
. 
CategoryCommands /
{ 
public 

class !
DeleteCategoryCommand &
:' (
IRequest) 1
<1 2
Result2 8
<8 9
Guid9 =
>= >
>> ?
{ 
public 
Guid 

CategoryId 
{  
get! $
;$ %
set& )
;) *
}+ ,
}		 
}

 ó
\D:\BuySmart\BuySmart\Application\Commands\CategoryCommands\CreateCategoryCommandValidator.cs
	namespace 	
Application
 
. 
Commands 
. 
CategoryCommands /
{ 
public 

class *
CreateCategoryCommandValidator /
:0 1
AbstractValidator2 C
<C D!
CreateCategoryCommandD Y
>Y Z
{ 
public *
CreateCategoryCommandValidator -
(- .
). /
{ 	
RuleFor		 
(		 
x		 
=>		 
x		 
.		 
Name		 
)		  
.

 
NotEmpty

 
(

 
)

 
.

 
WithMessage

 '
(

' (
$str

( :
)

: ;
. 
MaximumLength 
( 
$num "
)" #
.# $
WithMessage$ /
(/ 0
$str0 U
)U V
;V W
RuleFor 
( 
x 
=> 
x 
. 
Description &
)& '
. 
NotEmpty 
( 
) 
. 
WithMessage '
(' (
$str( A
)A B
. 
MaximumLength 
( 
$num "
)" #
.# $
WithMessage$ /
(/ 0
$str0 \
)\ ]
;] ^
} 	
} 
} Ω
SD:\BuySmart\BuySmart\Application\Commands\CategoryCommands\CreateCategoryCommand.cs
	namespace 	
Application
 
. 
Commands 
. 
CategoryCommands /
{ 
public 

class !
CreateCategoryCommand &
:' (
IRequest) 1
<1 2
Result2 8
<8 9
Guid9 =
>= >
>> ?
{ 
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
=) *
string+ 1
.1 2
Empty2 7
;7 8
public		 
string		 
Description		 !
{		" #
get		$ '
;		' (
set		) ,
;		, -
}		. /
=		0 1
string		2 8
.		8 9
Empty		9 >
;		> ?
}

 
} Ï
KD:\BuySmart\BuySmart\Application\Commands\CartCommands\CreateCartCommand.cs
	namespace 	
Application
 
. 
Commands 
. 
CartCommands +
{ 
public 

class 
CreateCartCommand "
:# $
IRequest% -
<- .
Result. 4
<4 5
Guid5 9
>9 :
>: ;
{ 
public 
Guid 
UserClientId  
{! "
get# &
;& '
set( +
;+ ,
}- .
}		 
}

 ∏
\D:\BuySmart\BuySmart\Application\Commands\BusinessCommands\UpdateBusinessCommandValidator.cs
	namespace 	
Application
 
. 
Commands 
. 
BusinessCommands /
{ 
public 

class *
UpdateBusinessCommandValidator /
:0 1
AbstractValidator2 C
<C D!
UpdateBusinessCommandD Y
>Y Z
{ 
public		 *
UpdateBusinessCommandValidator		 -
(		- .
)		. /
{

 	
ApplyCommonRules 
( 
x 
=> !
x" #
.# $
Name$ (
,( )
$str* 0
)0 1
;1 2
ApplyCommonRules 
( 
x 
=> !
x" #
.# $
Description$ /
,/ 0
$str1 >
)> ?
;? @
ApplyCommonRules 
( 
x 
=> !
x" #
.# $
Address$ +
,+ ,
$str- 6
)6 7
;7 8
ApplyCommonRules 
( 
x 
=> !
x" #
.# $
PhoneNumber$ /
,/ 0
$str1 >
)> ?
;? @
} 	
private 
void 
ApplyCommonRules %
(% &

Expression& 0
<0 1
Func1 5
<5 6!
UpdateBusinessCommand6 K
,K L
stringM S
>S T
>T U
propertyExpressionV h
,h i
stringj p
propertyNameq }
)} ~
{ 	
RuleFor 
( 
propertyExpression &
)& '
. 
NotEmpty 
( 
) 
. 
WithMessage '
(' (
$"( *
{* +
propertyName+ 7
}7 8
$str8 D
"D E
)E F
. 
MaximumLength 
( 
$num "
)" #
.# $
WithMessage$ /
(/ 0
$"0 2
{2 3
propertyName3 ?
}? @
$str@ _
"_ `
)` a
;a b
} 	
} 
} Ω
SD:\BuySmart\BuySmart\Application\Commands\BusinessCommands\UpdateBusinessCommand.cs
	namespace 	
Application
 
. 
Commands 
. 
BusinessCommands /
{ 
public 

class !
UpdateBusinessCommand &
:' (
IRequest) 1
<1 2
Result2 8
<8 9
object9 ?
>? @
>@ A
{ 
public 
Guid 

BusinessID 
{  
get! $
;$ %
set& )
;) *
}+ ,
public		 
string		 
Name		 
{		 
get		  
;		  !
set		" %
;		% &
}		' (
=		) *
string		+ 1
.		1 2
Empty		2 7
;		7 8
public

 
string

 
Description

 !
{

" #
get

$ '
;

' (
set

) ,
;

, -
}

. /
=

0 1
string

2 8
.

8 9
Empty

9 >
;

> ?
public 
string 
Address 
{ 
get  #
;# $
set% (
;( )
}* +
=, -
string. 4
.4 5
Empty5 :
;: ;
public 
string 
PhoneNumber !
{" #
get$ '
;' (
set) ,
;, -
}. /
=0 1
string2 8
.8 9
Empty9 >
;> ?
} 
} Ü
\D:\BuySmart\BuySmart\Application\Commands\BusinessCommands\DeleteBusinessCommandValidator.cs
	namespace 	
Application
 
. 
Commands 
. 
BusinessCommands /
{ 
public 

class *
DeleteBusinessCommandValidator /
:0 1
AbstractValidator2 C
<C D!
DeleteBusinessCommandD Y
>Y Z
{ 
public *
DeleteBusinessCommandValidator -
(- .
). /
{		 	
RuleFor

 
(

 
x

 
=>

 
x

 
.

 

BusinessID

 %
)

% &
. 
NotEmpty 
( 
) 
. 
WithMessage '
(' (
$str( @
)@ A
;A B
} 	
} 
} ¸
SD:\BuySmart\BuySmart\Application\Commands\BusinessCommands\DeleteBusinessCommand.cs
	namespace 	
Application
 
. 
Commands 
. 
BusinessCommands /
{ 
public 

class !
DeleteBusinessCommand &
:' (
IRequest) 1
<1 2
Result2 8
<8 9
object9 ?
>? @
>@ A
{ 
public 
Guid 

BusinessID 
{  
get! $
;$ %
set& )
;) *
}+ ,
}		 
}

 ì
\D:\BuySmart\BuySmart\Application\Commands\BusinessCommands\CreateBusinessCommandValidator.cs
	namespace 	
Application
 
. 
Commands 
. 
BusinessCommands /
{ 
public 

class *
CreateBusinessCommandValidator /
:0 1
AbstractValidator2 C
<C D!
CreateBusinessCommandD Y
>Y Z
{ 
public *
CreateBusinessCommandValidator -
(- .
). /
{ 	
RuleFor		 
(		 
x		 
=>		 
x		 
.		 
Name		 
)		  
.

 
NotEmpty

 
(

 
)

 
.

 
WithMessage

 '
(

' (
$str

( :
)

: ;
. 
MaximumLength 
( 
$num "
)" #
.# $
WithMessage$ /
(/ 0
$str0 U
)U V
;V W
RuleFor 
( 
x 
=> 
x 
. 
Description &
)& '
. 
NotEmpty 
( 
) 
. 
WithMessage '
(' (
$str( A
)A B
. 
MaximumLength 
( 
$num "
)" #
.# $
WithMessage$ /
(/ 0
$str0 \
)\ ]
;] ^
RuleFor 
( 
x 
=> 
x 
. 
Address "
)" #
. 
NotEmpty 
( 
) 
. 
WithMessage '
(' (
$str( =
)= >
. 
MaximumLength 
( 
$num "
)" #
.# $
WithMessage$ /
(/ 0
$str0 X
)X Y
;Y Z
RuleFor 
( 
x 
=> 
x 
. 
PhoneNumber &
)& '
. 
NotEmpty 
( 
) 
. 
WithMessage '
(' (
$str( A
)A B
. 
MaximumLength 
( 
$num "
)" #
.# $
WithMessage$ /
(/ 0
$str0 \
)\ ]
;] ^
RuleFor 
( 
x 
=> 
x 
. 
UserBusinessId )
)) *
. 
NotEmpty 
( 
) 
. 
WithMessage '
(' (
$str( D
)D E
;E F
} 	
} 
} ø
SD:\BuySmart\BuySmart\Application\Commands\BusinessCommands\CreateBusinessCommand.cs
	namespace 	
Application
 
. 
Commands 
. 
BusinessCommands /
{ 
public 

class !
CreateBusinessCommand &
:' (
IRequest) 1
<1 2
Result2 8
<8 9
Guid9 =
>= >
>> ?
{ 
public		 
string		 
Name		 
{		 
get		  
;		  !
set		" %
;		% &
}		' (
=		) *
string		+ 1
.		1 2
Empty		2 7
;		7 8
public

 
string

 
Description

 !
{

" #
get

$ '
;

' (
set

) ,
;

, -
}

. /
=

0 1
string

2 8
.

8 9
Empty

9 >
;

> ?
public 
string 
Address 
{ 
get  #
;# $
set% (
;( )
}* +
=, -
string. 4
.4 5
Empty5 :
;: ;
public 
string 
PhoneNumber !
{" #
get$ '
;' (
set) ,
;, -
}. /
=0 1
string2 8
.8 9
Empty9 >
;> ?
public 
Guid 
UserBusinessId "
{# $
get% (
;( )
set* -
;- .
}/ 0
} 
} É
lD:\BuySmart\BuySmart\Application\CommandHandlers\UserClientCommandHandlers\UpdateUserClientCommandHandler.cs
	namespace 	
Application
 
. 
CommandHandlers %
.% &%
UserClientCommandHandlers& ?
{		 
public

 

class

 *
UpdateUserClientCommandHandler

 /
:

0 1
IRequestHandler

2 A
<

A B#
UpdateUserClientCommand

B Y
,

Y Z
Result

[ a
<

a b
object

b h
>

h i
>

i j
{ 
private 
readonly 
IUserRepository (
<( )

UserClient) 3
>3 4 
userClientRepository5 I
;I J
private 
readonly 
IMapper  
mapper! '
;' (
public *
UpdateUserClientCommandHandler -
(- .
IUserRepository. =
<= >

UserClient> H
>H I 
userClientRepositoryJ ^
,^ _
IMapper` g
mapperh n
)n o
{ 	
this 
.  
userClientRepository %
=& ' 
userClientRepository( <
;< =
this 
. 
mapper 
= 
mapper  
;  !
} 	
public 
async 
Task 
< 
Result  
<  !
object! '
>' (
>( )
Handle* 0
(0 1#
UpdateUserClientCommand1 H
requestI P
,P Q
CancellationTokenR c
cancellationTokend u
)u v
{ 	
var 
user 
= 
await  
userClientRepository 1
.1 2
GetByIdAsync2 >
(> ?
request? F
.F G
UserIdG M
)M N
;N O
if 
( 
user 
== 
null 
) 
{ 
return 
Result 
< 
object $
>$ %
.% &
Failure& -
(- .
$str. >
)> ?
;? @
} 
user 
= 
mapper 
. 
Map 
< 

UserClient (
>( )
() *
request* 1
)1 2
;2 3
var 
result 
= 
await  
userClientRepository 3
.3 4
UpdateAsync4 ?
(? @
user@ D
)D E
;E F
if   
(   
result   
.   
	IsSuccess    
)    !
{!! 
return"" 
Result"" 
<"" 
object"" $
>""$ %
.""% &
Success""& -
(""- .
result"". 4
.""4 5
Data""5 9
)""9 :
;"": ;
}## 
return%% 
Result%% 
<%% 
object%%  
>%%  !
.%%! "
Failure%%" )
(%%) *
result%%* 0
.%%0 1
ErrorMessage%%1 =
)%%= >
;%%> ?
}&& 	
}'' 
}(( ≈
lD:\BuySmart\BuySmart\Application\CommandHandlers\UserClientCommandHandlers\CreateUserClientCommandHandler.cs
	namespace 	
Application
 
. 
CommandHandlers %
.% &%
UserClientCommandHandlers& ?
{		 
public

 

class

 *
CreateUserClientCommandHandler

 /
:

0 1
IRequestHandler

2 A
<

A B#
CreateUserClientCommand

B Y
,

Y Z
Result

[ a
<

a b
Guid

b f
>

f g
>

g h
{ 
private 
readonly 
IUserRepository (
<( )

UserClient) 3
>3 4
userRepository5 C
;C D
private 
readonly 
IMapper  
mapper! '
;' (
public *
CreateUserClientCommandHandler -
(- .
IUserRepository. =
<= >

UserClient> H
>H I
userRepositoryJ X
,X Y
IMapperZ a
mapperb h
)h i
{ 	
this 
. 
userRepository 
=  !
userRepository" 0
;0 1
this 
. 
mapper 
= 
mapper  
;  !
} 	
public 
async 
Task 
< 
Result  
<  !
Guid! %
>% &
>& '
Handle( .
(. /#
CreateUserClientCommand/ F
requestG N
,N O
CancellationTokenP a
cancellationTokenb s
)s t
{ 	
var 

userClient 
= 
mapper #
.# $
Map$ '
<' (

UserClient( 2
>2 3
(3 4
request4 ;
); <
;< =
var 
result 
= 
await 
userRepository -
.- .
AddAsync. 6
(6 7

userClient7 A
)A B
;B C
if 
( 
result 
. 
	IsSuccess  
)  !
{ 
return 
Result 
< 
Guid "
>" #
.# $
Success$ +
(+ ,
result, 2
.2 3
Data3 7
)7 8
;8 9
} 
return 
Result 
< 
Guid 
> 
.  
Failure  '
(' (
result( .
.. /
ErrorMessage/ ;
); <
;< =
}   	
}!! 
}"" £
pD:\BuySmart\BuySmart\Application\CommandHandlers\UserBusinessCommandHandlers\UpdateUserBusinessCommandHandler.cs
	namespace 	
Application
 
. 
CommandHandlers %
.% &'
UserBusinessCommandHandlers& A
{		 
public

 

class

 ,
 UpdateUserBusinessCommandHandler

 1
:

2 3
IRequestHandler

4 C
<

C D%
UpdateUserBusinessCommand

D ]
,

] ^
Result

_ e
<

e f
object

f l
>

l m
>

m n
{ 
private 
readonly 
IUserRepository (
<( )
UserBusiness) 5
>5 6"
userBusinessRepository7 M
;M N
private 
readonly 
IMapper  
mapper! '
;' (
public ,
 UpdateUserBusinessCommandHandler /
(/ 0
IUserRepository0 ?
<? @
UserBusiness@ L
>L M"
userBusinessRepositoryN d
,d e
IMapperf m
mappern t
)t u
{ 	
this 
. "
userBusinessRepository '
=( )"
userBusinessRepository* @
;@ A
this 
. 
mapper 
= 
mapper  
;  !
} 	
public 
async 
Task 
< 
Result  
<  !
object! '
>' (
>( )
Handle* 0
(0 1%
UpdateUserBusinessCommand1 J
requestK R
,R S
CancellationTokenT e
cancellationTokenf w
)w x
{ 	
var 
user 
= 
await "
userBusinessRepository 3
.3 4
GetByIdAsync4 @
(@ A
requestA H
.H I
UserIdI O
)O P
;P Q
if 
( 
user 
== 
null 
) 
{ 
return 
Result 
< 
object $
>$ %
.% &
Failure& -
(- .
$str. >
)> ?
;? @
} 
user 
= 
mapper 
. 
Map 
< 
UserBusiness *
>* +
(+ ,
request, 3
)3 4
;4 5
var 
result 
= 
await "
userBusinessRepository 5
.5 6
UpdateAsync6 A
(A B
userB F
)F G
;G H
if   
(   
result   
.   
	IsSuccess    
)    !
{!! 
return"" 
Result"" 
<"" 
object"" $
>""$ %
.""% &
Success""& -
(""- .
result"". 4
.""4 5
Data""5 9
)""9 :
;"": ;
}## 
return%% 
Result%% 
<%% 
object%%  
>%%  !
.%%! "
Failure%%" )
(%%) *
result%%* 0
.%%0 1
ErrorMessage%%1 =
)%%= >
;%%> ?
}&& 	
}'' 
}(( ›
pD:\BuySmart\BuySmart\Application\CommandHandlers\UserBusinessCommandHandlers\CreateUserBusinessCommandHandler.cs
	namespace 	
Application
 
. 
CommandHandlers %
.% &'
UserBusinessCommandHandlers& A
{		 
public

 

class

 ,
 CreateUserBusinessCommandHandler

 1
:

2 3
IRequestHandler

4 C
<

C D%
CreateUserBusinessCommand

D ]
,

] ^
Result

_ e
<

e f
Guid

f j
>

j k
>

k l
{ 
private 
readonly 
IUserRepository (
<( )
UserBusiness) 5
>5 6
userRepository7 E
;E F
private 
readonly 
IMapper  
mapper! '
;' (
public ,
 CreateUserBusinessCommandHandler /
(/ 0
IUserRepository0 ?
<? @
UserBusiness@ L
>L M
userRepositoryN \
,\ ]
IMapper^ e
mapperf l
)l m
{ 	
this 
. 
userRepository 
=  !
userRepository" 0
;0 1
this 
. 
mapper 
= 
mapper  
;  !
} 	
public 
async 
Task 
< 
Result  
<  !
Guid! %
>% &
>& '
Handle( .
(. /%
CreateUserBusinessCommand/ H
requestI P
,P Q
CancellationTokenR c
cancellationTokend u
)u v
{ 	
var 
userBusiness 
= 
mapper %
.% &
Map& )
<) *
UserBusiness* 6
>6 7
(7 8
request8 ?
)? @
;@ A
var 
result 
= 
await 
userRepository -
.- .
AddAsync. 6
(6 7
userBusiness7 C
)C D
;D E
if 
( 
result 
. 
	IsSuccess  
)  !
{ 
return 
Result 
< 
Guid "
>" #
.# $
Success$ +
(+ ,
result, 2
.2 3
Data3 7
)7 8
;8 9
} 
return 
Result 
< 
Guid 
> 
.  
Failure  '
(' (
result( .
.. /
ErrorMessage/ ;
); <
;< =
} 	
}   
}!! Ñ
tD:\BuySmart\BuySmart\Application\CommandHandlers\ReviewBusinessCommandHandlers\UpdateReviewBusinessCommandHandler.cs
	namespace 	
Application
 
. 
CommandHandlers %
.% &(
ReviewBusinessCommandHandler& B
{		 
public

 

class

 .
"UpdateReviewBusinessCommandHandler

 3
:

4 5
IRequestHandler

6 E
<

E F'
UpdateReviewBusinessCommand

F a
,

a b
Result

c i
<

i j
object

j p
>

p q
>

q r
{ 
private 
readonly %
IReviewBusinessRepository 2$
reviewBusinessRepository3 K
;K L
private 
readonly 
IMapper  
mapper! '
;' (
public .
"UpdateReviewBusinessCommandHandler 1
(1 2%
IReviewBusinessRepository2 K$
reviewBusinessRepositoryL d
,d e
IMapperf m
mappern t
)t u
{ 	
this 
. $
reviewBusinessRepository )
=* +$
reviewBusinessRepository, D
;D E
this 
. 
mapper 
= 
mapper  
;  !
} 	
public 
async 
Task 
< 
Result  
<  !
object! '
>' (
>( )
Handle* 0
(0 1'
UpdateReviewBusinessCommand1 L
requestM T
,T U
CancellationTokenV g
cancellationTokenh y
)y z
{ 	
var 
reviewBusiness 
=  
await! &$
reviewBusinessRepository' ?
.? @
GetByIdAsync@ L
(L M
requestM T
.T U
ReviewIdU ]
)] ^
;^ _
if 
( 
reviewBusiness 
== !
null" &
)& '
{ 
return 
Result 
< 
object $
>$ %
.% &
Failure& -
(- .
$str. @
)@ A
;A B
} 
reviewBusiness 
= 
mapper #
.# $
Map$ '
<' (
Review( .
>. /
(/ 0
request0 7
)7 8
;8 9
var 
result 
= 
await $
reviewBusinessRepository 7
.7 8
UpdateAsync8 C
(C D
reviewBusinessD R
)R S
;S T
if 
( 
result 
. 
	IsSuccess  
)  !
{   
return!! 
Result!! 
<!! 
object!! $
>!!$ %
.!!% &
Success!!& -
(!!- .
result!!. 4
.!!4 5
Data!!5 9
)!!9 :
;!!: ;
}"" 
return$$ 
Result$$ 
<$$ 
object$$  
>$$  !
.$$! "
Failure$$" )
($$) *
result$$* 0
.$$0 1
ErrorMessage$$1 =
)$$= >
;$$> ?
}%% 	
}&& 
}'' ∫
tD:\BuySmart\BuySmart\Application\CommandHandlers\ReviewBusinessCommandHandlers\DeleteReviewBusinessCommandHandler.cs
	namespace 	
Application
 
. 
CommandHandlers %
.% &)
ReviewBusinessCommandHandlers& C
{ 
public 

class .
"DeleteReviewBusinessCommandHandler 3
:4 5
IRequestHandler6 E
<E F'
DeleteReviewBusinessCommandF a
,a b
Resultc i
<i j
objectj p
>p q
>q r
{		 
private

 
readonly

 %
IReviewBusinessRepository

 2$
reviewBusinessRepository

3 K
;

K L
public .
"DeleteReviewBusinessCommandHandler 1
(1 2%
IReviewBusinessRepository2 K$
ReviewBusinessRepositoryL d
)d e
{ 	
this 
. $
reviewBusinessRepository )
=* +$
ReviewBusinessRepository, D
;D E
} 	
public 
async 
Task 
< 
Result  
<  !
object! '
>' (
>( )
Handle* 0
(0 1'
DeleteReviewBusinessCommand1 L
requestM T
,T U
CancellationTokenV g
cancellationTokenh y
)y z
{ 	
var 
reviewBusiness 
=  
await! &$
reviewBusinessRepository' ?
.? @
GetByIdAsync@ L
(L M
requestM T
.T U
ReviewIdU ]
)] ^
;^ _
if 
( 
reviewBusiness 
== !
null" &
)& '
{ 
return 
Result 
< 
object $
>$ %
.% &
Failure& -
(- .
$str. @
)@ A
;A B
} 
await $
reviewBusinessRepository *
.* +
DeleteAsync+ 6
(6 7
request7 >
.> ?
ReviewId? G
)G H
;H I
return 
Result 
< 
object  
>  !
.! "
Success" )
() *
new* -
object. 4
(4 5
)5 6
)6 7
;7 8
} 	
} 
} æ
tD:\BuySmart\BuySmart\Application\CommandHandlers\ReviewBusinessCommandHandlers\CreateReviewBusinessCommandHandler.cs
	namespace 	
Application
 
. 
CommandHandlers %
.% &(
ReviewBusinessCommandHandler& B
{		 
public

 

class

 .
"CreateReviewBusinessCommandHandler

 3
:

4 5
IRequestHandler

6 E
<

E F'
CreateReviewBusinessCommand

F a
,

a b
Result

c i
<

i j
Guid

j n
>

n o
>

o p
{ 
private 
readonly 
IMapper  
mapper! '
;' (
private 
readonly %
IReviewBusinessRepository 2$
reviewBusinessRepository3 K
;K L
public .
"CreateReviewBusinessCommandHandler 1
(1 2%
IReviewBusinessRepository2 K$
ReviewBusinessRepositoryL d
,d e
IMapperf m
mappern t
)t u
{ 	
this 
. $
reviewBusinessRepository )
=* +$
ReviewBusinessRepository, D
;D E
this 
. 
mapper 
= 
mapper  
;  !
} 	
public 
async 
Task 
< 
Result  
<  !
Guid! %
>% &
>& '
Handle( .
(. /'
CreateReviewBusinessCommand/ J
requestK R
,R S
CancellationTokenT e
cancellationTokenf w
)w x
{ 	
var 
reviewBusiness 
=  
mapper! '
.' (
Map( +
<+ ,
Review, 2
>2 3
(3 4
request4 ;
); <
;< =
var 
result 
= 
await $
reviewBusinessRepository 7
.7 8
AddAsync8 @
(@ A
reviewBusinessA O
)O P
;P Q
if 
( 
result 
. 
	IsSuccess  
)  !
{ 
return 
Result 
< 
Guid "
>" #
.# $
Success$ +
(+ ,
result, 2
.2 3
Data3 7
)7 8
;8 9
} 
return 
Result 
< 
Guid 
> 
.  
Failure  '
(' (
result( .
.. /
ErrorMessage/ ;
); <
;< =
}   	
}!! 
}"" ÿ
fD:\BuySmart\BuySmart\Application\CommandHandlers\ProductCommandHandlers\UpdateProductCommandHandler.cs
	namespace 	
Application
 
. 
CommandHandlers %
.% &"
ProductCommandHandlers& <
{		 
public

 

class

 '
UpdateProductCommandHandler

 ,
:

- .
IRequestHandler

/ >
<

> ? 
UpdateProductCommand

? S
,

S T
Result

U [
<

[ \
object

\ b
>

b c
>

c d
{ 
private 
readonly 
IMapper  
mapper! '
;' (
private 
readonly 
IProductRepository +

repository, 6
;6 7
public '
UpdateProductCommandHandler *
(* +
IMapper+ 2
mapper3 9
,9 :
IProductRepository; M

repositoryN X
)X Y
{ 	
this 
. 
mapper 
= 
mapper  
;  !
this 
. 

repository 
= 

repository (
;( )
} 	
public 
async 
Task 
< 
Result  
<  !
object! '
>' (
>( )
Handle* 0
(0 1 
UpdateProductCommand1 E
requestF M
,M N
CancellationTokenO `
cancellationTokena r
)r s
{ 	
var 
product 
= 
await 

repository  *
.* +
GetByIdAsync+ 7
(7 8
request8 ?
.? @
	ProductId@ I
)I J
;J K
if 
( 
product 
== 
null 
)  
{ 
return 
Result 
< 
object $
>$ %
.% &
Failure& -
(- .
$str. A
)A B
;B C
} 
product 
= 
mapper 
. 
Map  
<  !
Product! (
>( )
() *
request* 1
)1 2
;2 3
var 
result 
= 
await 

repository )
.) *
UpdateAsync* 5
(5 6
product6 =
)= >
;> ?
if 
( 
result 
. 
	IsSuccess  
)  !
{ 
return 
Result 
< 
object #
># $
.$ %
Success% ,
(, -
result- 3
.3 4
Data4 8
)8 9
;9 :
}   
return!! 
Result!! 
<!! 
object!!  
>!!  !
.!!! "
Failure!!" )
(!!) *
result!!* 0
.!!0 1
ErrorMessage!!1 =
)!!= >
;!!> ?
}$$ 	
}%% 
}&& õ
fD:\BuySmart\BuySmart\Application\CommandHandlers\ProductCommandHandlers\DeleteProductCommandHandler.cs
	namespace 	
Application
 
. 
CommandHandlers %
.% &"
ProductCommandHandlers& <
{ 
public 

class '
DeleteProductCommandHandler ,
:- .
IRequestHandler/ >
<> ? 
DeleteProductCommand? S
,S T
ResultU [
<[ \
object\ b
>b c
>c d
{		 
private

 
readonly

 
IProductRepository

 +

repository

, 6
;

6 7
public '
DeleteProductCommandHandler *
(* +
IProductRepository+ =

repository> H
)H I
{ 	
this 
. 

repository 
= 

repository (
;( )
} 	
public 
async 
Task 
< 
Result  
<  !
object! '
>' (
>( )
Handle* 0
(0 1 
DeleteProductCommand1 E
requestF M
,M N
CancellationTokenO `
cancellationTokena r
)r s
{ 	
var 
product 
= 
await 

repository  *
.* +
GetByIdAsync+ 7
(7 8
request8 ?
.? @
	ProductId@ I
)I J
;J K
if 
( 
product 
== 
null 
)  
{ 
return 
Result 
< 
object $
>$ %
.% &
Failure& -
(- .
$str. A
)A B
;B C
} 
await 

repository 
. 
DeleteAsync (
(( )
request) 0
.0 1
	ProductId1 :
): ;
;; <
return 
Result 
< 
object  
>  !
.! "
Success" )
() *
new* -
object. 4
(4 5
)5 6
)6 7
;7 8
} 	
} 
} ú%
fD:\BuySmart\BuySmart\Application\CommandHandlers\ProductCommandHandlers\CreateProductCommandHandler.cs
	namespace 	
Application
 
. 
CommandHandlers %
.% &"
ProductCommandHandlers& <
{		 
public

 

class

 '
CreateProductCommandHandler

 ,
:

- .
IRequestHandler

/ >
<

> ? 
CreateProductCommand

? S
,

S T
Result

U [
<

[ \
Guid

\ `
>

` a
>

a b
{ 
private 
readonly 
IMapper  
mapper! '
;' (
private 
readonly 
IProductRepository +
productRepository, =
;= >
private 
readonly 
ICategoryRepository ,
categoryRepository- ?
;? @
public '
CreateProductCommandHandler *
(* +
IMapper+ 2
mapper3 9
,9 :
IProductRepository; M
productRepositoryN _
,_ `
ICategoryRepositorya t
categoryRepository	u á
)
á à
{ 	
this 
. 
mapper 
= 
mapper  
;  !
this 
. 
productRepository "
=# $
productRepository% 6
;6 7
this 
. 
categoryRepository #
=$ %
categoryRepository& 8
;8 9
} 	
public 
async 
Task 
< 
Result  
<  !
Guid! %
>% &
>& '
Handle( .
(. / 
CreateProductCommand/ C
requestD K
,K L
CancellationTokenM ^
cancellationToken_ p
)p q
{ 	
var 
existingCategories "
=# $
await% *
categoryRepository+ =
.= >
GetByNamesAsync> M
(M N
requestN U
.U V
CategoryNamesV c
)c d
;d e
var !
categoriesToAssociate %
=& '
new( +
List, 0
<0 1
Category1 9
>9 :
(: ;
); <
;< =
foreach 
( 
var 
categoryName %
in& (
request) 0
.0 1
CategoryNames1 >
)> ?
{ 
var 
existingCategory $
=% &
existingCategories' 9
.9 :
FirstOrDefault: H
(H I
cI J
=>K M
cN O
.O P
NameP T
==U W
categoryNameX d
)d e
;e f
if   
(   
existingCategory   $
!=  % '
null  ( ,
)  , -
{!! !
categoriesToAssociate"" )
."") *
Add""* -
(""- .
existingCategory"". >
)""> ?
;""? @
}## 
else$$ 
{%% 
return&& 
Result&& !
<&&! "
Guid&&" &
>&&& '
.&&' (
Failure&&( /
(&&/ 0
$"&&0 2
$str&&2 <
{&&< =
categoryName&&= I
}&&I J
$str&&J [
"&&[ \
)&&\ ]
;&&] ^
}'' 
}(( 
var** 
product** 
=** 
mapper**  
.**  !
Map**! $
<**$ %
Domain**% +
.**+ ,
Entities**, 4
.**4 5
Product**5 <
>**< =
(**= >
request**> E
)**E F
;**F G
product++ 
.++ 

Categories++ 
=++  !
categoriesToAssociate++! 6
;++6 7
var-- 
result-- 
=-- 
await-- 
productRepository-- 0
.--0 1
AddAsync--1 9
(--9 :
product--: A
)--A B
;--B C
if.. 
(.. 
result.. 
... 
	IsSuccess..  
)..  !
{// 
return00 
Result00 
<00 
Guid00 "
>00" #
.00# $
Success00$ +
(00+ ,
result00, 2
.002 3
Data003 7
)007 8
;008 9
}11 
return22 
Result22 
<22 
Guid22 
>22 
.22  
Failure22  '
(22' (
result22( .
.22. /
ErrorMessage22/ ;
)22; <
;22< =
}33 	
}44 
}55 ¥
hD:\BuySmart\BuySmart\Application\CommandHandlers\CategoryCommandHandlers\UpdateCategoryCommandHandler.cs
	namespace 	
Application
 
. 
CommandHandlers %
.% &#
CategoryCommandHandlers& =
{ 
public		 

class		 (
UpdateCategoryCommandHandler		 -
:		. /
IRequestHandler		0 ?
<		? @!
UpdateCategoryCommand		@ U
,		U V
Result		W ]
<		] ^
object		^ d
>		d e
>		e f
{

 
private 
readonly 
ICategoryRepository ,
categoryRepository- ?
;? @
private 
readonly 
IMapper  
mapper! '
;' (
public (
UpdateCategoryCommandHandler +
(+ ,
ICategoryRepository, ?
categoryRepository@ R
,R S
IMapperT [
mapper\ b
)b c
{ 	
this 
. 
categoryRepository #
=$ %
categoryRepository& 8
;8 9
this 
. 
mapper 
= 
mapper  
;  !
} 	
public 
async 
Task 
< 
Result  
<  !
object! '
>' (
>( )
Handle* 0
(0 1!
UpdateCategoryCommand1 F
requestG N
,N O
CancellationTokenP a
cancellationTokenb s
)s t
{ 	
var 
category 
= 
mapper !
.! "
Map" %
<% &
Domain& ,
., -
Entities- 5
.5 6
Category6 >
>> ?
(? @
request@ G
)G H
;H I
var 
result 
= 
await 
categoryRepository 1
.1 2
UpdateAsync2 =
(= >
category> F
)F G
;G H
if 
( 
result 
. 
	IsSuccess  
)  !
{ 
return 
Result 
< 
object $
>$ %
.% &
Success& -
(- .
result. 4
.4 5
Data5 9
)9 :
;: ;
} 
return 
Result 
< 
object  
>  !
.! "
Failure" )
() *
result* 0
.0 1
ErrorMessage1 =
)= >
;> ?
} 	
} 
} …
hD:\BuySmart\BuySmart\Application\CommandHandlers\CategoryCommandHandlers\DeleteCategoryCommandHandler.cs
	namespace 	
Application
 
. 
CommandHandlers %
.% &#
CategoryCommandHandlers& =
{ 
public 

class (
DeleteCategoryCommandHandler -
:. /
IRequestHandler0 ?
<? @!
DeleteCategoryCommand@ U
,U V
ResultW ]
<] ^
Guid^ b
>b c
>c d
{		 
private

 
readonly

 
ICategoryRepository

 ,
categoryRepository

- ?
;

? @
public (
DeleteCategoryCommandHandler +
(+ ,
ICategoryRepository, ?
categoryRepository@ R
)R S
{ 	
this 
. 
categoryRepository #
=$ %
categoryRepository& 8
;8 9
} 	
public 
async 
Task 
< 
Result  
<  !
Guid! %
>% &
>& '
Handle( .
(. /!
DeleteCategoryCommand/ D
requestE L
,L M
CancellationTokenN _
cancellationToken` q
)q r
{ 	
var 
category 
= 
await  
categoryRepository! 3
.3 4
GetByIdAsync4 @
(@ A
requestA H
.H I

CategoryIdI S
)S T
;T U
if 
( 
category 
== 
null  
)  !
{ 
return 
Result 
< 
Guid "
>" #
.# $
Failure$ +
(+ ,
$str, @
)@ A
;A B
} 
await 
categoryRepository $
.$ %
DeleteAsync% 0
(0 1
request1 8
.8 9

CategoryId9 C
)C D
;D E
return 
Result 
< 
Guid 
> 
.  
Success  '
(' (
request( /
./ 0

CategoryId0 :
): ;
;; <
} 	
} 
} ©
hD:\BuySmart\BuySmart\Application\CommandHandlers\CategoryCommandHandlers\CreateCategoryCommandHandler.cs
	namespace 	
Application
 
. 
CommandHandlers %
.% &#
CategoryCommandHandlers& =
{ 
public		 

class		 (
CreateCategoryCommandHandler		 -
:		. /
IRequestHandler		0 ?
<		? @!
CreateCategoryCommand		@ U
,		U V
Result		W ]
<		] ^
Guid		^ b
>		b c
>		c d
{

 
private 
readonly 
ICategoryRepository ,
categoryRepository- ?
;? @
private 
readonly 
IMapper  
mapper! '
;' (
public (
CreateCategoryCommandHandler +
(+ ,
ICategoryRepository, ?
categoryRepository@ R
,R S
IMapperT [
mapper\ b
)b c
{ 	
this 
. 
categoryRepository #
=$ %
categoryRepository& 8
;8 9
this 
. 
mapper 
= 
mapper  
;  !
} 	
public 
async 
Task 
< 
Result  
<  !
Guid! %
>% &
>& '
Handle( .
(. /!
CreateCategoryCommand/ D
requestE L
,L M
CancellationTokenN _
cancellationToken` q
)q r
{ 	
var 
category 
= 
mapper !
.! "
Map" %
<% &
Domain& ,
., -
Entities- 5
.5 6
Category6 >
>> ?
(? @
request@ G
)G H
;H I
var 
result 
= 
await 
categoryRepository 1
.1 2
AddAsync2 :
(: ;
category; C
)C D
;D E
if 
( 
result 
. 
	IsSuccess  
)  !
{ 
return 
Result 
< 
Guid "
>" #
.# $
Success$ +
(+ ,
result, 2
.2 3
Data3 7
)7 8
;8 9
} 
return 
Result 
< 
Guid 
> 
.  
Failure  '
(' (
result( .
.. /
ErrorMessage/ ;
); <
;< =
} 	
} 
} —
`D:\BuySmart\BuySmart\Application\CommandHandlers\CartCommandHandlers\CreateCartCommandHandler.cs
	namespace 	
Application
 
. 
CommandHandlers %
.% &
CartCommandHandlers& 9
{ 
public		 

class		 $
CreateCartCommandHandler		 )
:		* +
IRequestHandler		, ;
<		; <
CreateCartCommand		< M
,		M N
Result		O U
<		U V
Guid		V Z
>		Z [
>		[ \
{

 
private 
readonly 
ICartRepository (

repository) 3
;3 4
private 
readonly 
IMapper  
mapper! '
;' (
public $
CreateCartCommandHandler '
(' (
ICartRepository( 7

repository8 B
,B C
IMapperD K
mapperL R
)R S
{ 	
this 
. 

repository 
= 

repository (
;( )
this 
. 
mapper 
= 
mapper  
;  !
} 	
public 
async 
Task 
< 
Result  
<  !
Guid! %
>% &
>& '
Handle( .
(. /
CreateCartCommand/ @
requestA H
,H I
CancellationTokenJ [
cancellationToken\ m
)m n
{ 	
var 
Cart 
= 
mapper 
. 
Map !
<! "
Domain" (
.( )
Entities) 1
.1 2
Cart2 6
>6 7
(7 8
request8 ?
)? @
;@ A
var 
result 
= 
await 

repository )
.) *
AddAsync* 2
(2 3
Cart3 7
)7 8
;8 9
if 
( 
result 
. 
	IsSuccess  
)  !
{ 
return 
Result 
< 
Guid "
>" #
.# $
Success$ +
(+ ,
result, 2
.2 3
Data3 7
)7 8
;8 9
} 
return 
Result 
< 
Guid 
> 
.  
Failure  '
(' (
result( .
.. /
ErrorMessage/ ;
); <
;< =
} 	
} 
} Ï
hD:\BuySmart\BuySmart\Application\CommandHandlers\BusinessCommandHandlers\UpdateBusinessCommandHandler.cs
	namespace 	
Application
 
. 
CommandHandlers %
.% &#
BusinessCommandHandlers& =
{		 
public

 

class

 (
UpdateBusinessCommandHandler

 -
:

. /
IRequestHandler

0 ?
<

? @!
UpdateBusinessCommand

@ U
,

U V
Result

W ]
<

] ^
object

^ d
>

d e
>

e f
{ 
private 
readonly 
IBusinessRepository ,
businessRepository- ?
;? @
private 
readonly 
IMapper  
mapper! '
;' (
public (
UpdateBusinessCommandHandler +
(+ ,
IBusinessRepository, ?
businessRepository@ R
,R S
IMapperT [
mapper\ b
)b c
{ 	
this 
. 
businessRepository #
=$ %
businessRepository& 8
;8 9
this 
. 
mapper 
= 
mapper  
;  !
} 	
public 
async 
Task 
< 
Result  
<  !
object! '
>' (
>( )
Handle* 0
(0 1!
UpdateBusinessCommand1 F
requestG N
,N O
CancellationTokenP a
cancellationTokenb s
)s t
{ 	
var 
business 
= 
mapper !
.! "
Map" %
<% &
Business& .
>. /
(/ 0
request0 7
)7 8
;8 9
var 
result 
= 
await 
businessRepository 1
.1 2
UpdateAsync2 =
(= >
business> F
)F G
;G H
if 
( 
result 
. 
	IsSuccess  
)  !
{ 
return 
Result 
< 
object $
>$ %
.% &
Success& -
(- .
result. 4
.4 5
Data5 9
)9 :
;: ;
} 
return 
Result 
< 
object  
>  !
.! "
Failure" )
() *
result* 0
.0 1
ErrorMessage1 =
)= >
;> ?
}   	
}!! 
}"" ÿ
hD:\BuySmart\BuySmart\Application\CommandHandlers\BusinessCommandHandlers\DeleteBusinessCommandHandler.cs
	namespace 	
Application
 
. 
CommandHandlers %
.% &#
BusinessCommandHandlers& =
{ 
public 

class (
DeleteBusinessCommandHandler -
:. /
IRequestHandler0 ?
<? @!
DeleteBusinessCommand@ U
,U V
ResultW ]
<] ^
object^ d
>d e
>e f
{		 
private

 
readonly

 
IBusinessRepository

 ,
businessRepository

- ?
;

? @
public (
DeleteBusinessCommandHandler +
(+ ,
IBusinessRepository, ?
businessRepository@ R
)R S
{ 	
this 
. 
businessRepository #
=$ %
businessRepository& 8
;8 9
} 	
public 
async 
Task 
< 
Result  
<  !
object! '
>' (
>( )
Handle* 0
(0 1!
DeleteBusinessCommand1 F
requestG N
,N O
CancellationTokenP a
cancellationTokenb s
)s t
{ 	
var 
business 
= 
await  
businessRepository! 3
.3 4
GetByIdAsync4 @
(@ A
requestA H
.H I

BusinessIDI S
)S T
;T U
if 
( 
business 
== 
null  
)  !
{ 
return 
Result 
< 
object $
>$ %
.% &
Failure& -
(- .
$str. B
)B C
;C D
} 
await 
businessRepository $
.$ %
DeleteAsync% 0
(0 1
request1 8
.8 9

BusinessID9 C
)C D
;D E
return 
Result 
< 
object  
>  !
.! "
Success" )
() *
new* -
object. 4
(4 5
)5 6
)6 7
;7 8
} 	
} 
} ©
hD:\BuySmart\BuySmart\Application\CommandHandlers\BusinessCommandHandlers\CreateBusinessCommandHandler.cs
	namespace 	
Application
 
. 
CommandHandlers %
.% &#
BusinessCommandHandlers& =
{ 
public		 

class		 (
CreateBusinessCommandHandler		 -
:		. /
IRequestHandler		0 ?
<		? @!
CreateBusinessCommand		@ U
,		U V
Result		W ]
<		] ^
Guid		^ b
>		b c
>		c d
{

 
private 
readonly 
IBusinessRepository ,
businessRepository- ?
;? @
private 
readonly 
IMapper  
mapper! '
;' (
public (
CreateBusinessCommandHandler +
(+ ,
IBusinessRepository, ?
businessRepository@ R
,R S
IMapperT [
mapper\ b
)b c
{ 	
this 
. 
businessRepository #
=$ %
businessRepository& 8
;8 9
this 
. 
mapper 
= 
mapper  
;  !
} 	
public 
async 
Task 
< 
Result  
<  !
Guid! %
>% &
>& '
Handle( .
(. /!
CreateBusinessCommand/ D
requestE L
,L M
CancellationTokenN _
cancellationToken` q
)q r
{ 	
var 
business 
= 
mapper !
.! "
Map" %
<% &
Domain& ,
., -
Entities- 5
.5 6
Business6 >
>> ?
(? @
request@ G
)G H
;H I
var 
result 
= 
await 
businessRepository 1
.1 2
AddAsync2 :
(: ;
business; C
)C D
;D E
if 
( 
result 
. 
	IsSuccess  
)  !
{ 
return 
Result 
< 
Guid "
>" #
.# $
Success$ +
(+ ,
result, 2
.2 3
Data3 7
)7 8
;8 9
} 
return 
Result 
< 
Guid 
> 
.  
Failure  '
(' (
result( .
.. /
ErrorMessage/ ;
); <
;< =
} 	
}   
}!! ˆ
OD:\BuySmart\BuySmart\Application\Authentication\VerifyPasswordCommandHandler.cs
	namespace 	
Application
 
. 
Authentication $
{ 
public		 

class		 (
VerifyPasswordCommandHandler		 -
:		. /
IRequestHandler		0 ?
<		? @!
VerifyPasswordCommand		@ U
,		U V
Result		W ]
<		] ^
string		^ d
>		d e
>		e f
{

 
private 
readonly 
IUserAuthRepository ,
<, -
User- 1
>1 2
userRepository3 A
;A B
public (
VerifyPasswordCommandHandler +
(+ ,
IUserAuthRepository, ?
<? @
User@ D
>D E
userRepositoryF T
)T U
{ 	
this 
. 
userRepository 
=  !
userRepository" 0
;0 1
} 	
public 
async 
Task 
< 
Result  
<  !
string! '
>' (
>( )
Handle* 0
(0 1!
VerifyPasswordCommand1 F
requestG N
,N O
CancellationTokenP a
cancellationTokenb s
)s t
{ 	
var 
result 
= 
await 
userRepository -
.- .
VerifyPassword. <
(< =
request= D
.D E
UserIdE K
,K L
requestM T
.T U
PasswordU ]
)] ^
;^ _
if 
( 
result 
. 
	IsSuccess  
)  !
{ 
return 
Result 
< 
string $
>$ %
.% &
Success& -
(- .
result. 4
.4 5
Data5 9
)9 :
;: ;
} 
return 
Result 
< 
string  
>  !
.! "
Failure" )
() *
result* 0
.0 1
ErrorMessage1 =
)= >
;> ?
} 	
} 
} ∂
HD:\BuySmart\BuySmart\Application\Authentication\VerifyPasswordCommand.cs
	namespace 	
Application
 
. 
Authentication $
{ 
public 

class !
VerifyPasswordCommand &
:' (
IRequest) 1
<1 2
Result2 8
<8 9
string9 ?
>? @
>@ A
{ 
public 
Guid 
UserId 
{ 
get  
;  !
set" %
;% &
}' (
public		 
string		 
Password		 
{		  
get		! $
;		$ %
set		& )
;		) *
}		+ ,
=		- .
string		/ 5
.		5 6
Empty		6 ;
;		; <
}

 
} œ
MD:\BuySmart\BuySmart\Application\Authentication\UpdateUserCommandValidator.cs
	namespace 	
Application
 
. 
Authentication $
{ 
public 

class &
UpdateUserCommandValidator +
:, -
AbstractValidator. ?
<? @
UpdateUserCommand@ Q
>Q R
{ 
public &
UpdateUserCommandValidator )
() *
)* +
{ 	
RuleFor		 
(		 
uc		 
=>		 
uc		 
.		 
UserId		 #
)		# $
.

 
NotEmpty

 
(

 
)

 
. 
WithMessage 
(  
$str  5
)5 6
;6 7
RuleFor 
( 
uc 
=> 
uc 
. 
Name !
)! "
. 
NotEmpty 
( 
) 
. 
MaximumLength 
( 
$num "
)" #
. 
WithMessage 
( 
$str H
)H I
;I J
RuleFor 
( 
uc 
=> 
uc 
. 
Email "
)" #
. 
NotEmpty 
( 
) 
. 
EmailAddress 
( 
) 
. 
MaximumLength 
( 
$num "
)" #
. 
WithMessage 
( 
$str 4
)4 5
;5 6
RuleFor 
( 
uc 
=> 
uc 
. 
Password %
)% &
. 
NotEmpty 
( 
) 
. 
MinimumLength 
( 
$num  
)  !
. 
MaximumLength 
( 
$num "
)" #
. 
WithMessage 
( 
$str L
)L M
;M N
RuleFor 
( 
uc 
=> 
uc 
. 
Image "
)" #
. 
Must 
( 
BeValidBase64 #
)# $
. 
WithMessage 
( 
$str B
)B C
. 
MaximumLength 
( 
$num %
*& '
$num( )
/* +
$num, -
)- .
. 
WithMessage 
( 
$str Y
)Y Z
;Z [
} 	
private   
static   
bool   
BeValidBase64   )
(  ) *
string  * 0
base64String  1 =
)  = >
{!! 	
Span"" 
<"" 
byte"" 
>"" 
buffer"" 
="" 
new""  #
Span""$ (
<""( )
byte"") -
>""- .
("". /
new""/ 2
byte""3 7
[""7 8
base64String""8 D
.""D E
Length""E K
]""K L
)""L M
;""M N
return## 
Convert## 
.## 
TryFromBase64String## .
(##. /
base64String##/ ;
,##; <
buffer##= C
,##C D
out##E H
_##I J
)##J K
;##K L
}$$ 	
}%% 
}&& ∏
KD:\BuySmart\BuySmart\Application\Authentication\UpdateUserCommandHandler.cs
	namespace		 	
Application		
 
.		 
CommandHandlers		 %
.		% &%
UserClientCommandHandlers		& ?
{

 
public 

class $
UpdateUserCommandHandler )
:* +
IRequestHandler, ;
<; <
UpdateUserCommand< M
,M N
ResultO U
<U V
objectV \
>\ ]
>] ^
{ 
private 
readonly 
IUserAuthRepository ,
<, -
User- 1
>1 2
userAuthRepository3 E
;E F
private 
readonly 
IMapper  
mapper! '
;' (
public $
UpdateUserCommandHandler '
(' (
IUserAuthRepository( ;
<; <
User< @
>@ A
userAuthRepositoryB T
,T U
IMapperV ]
mapper^ d
)d e
{ 	
this 
. 
userAuthRepository #
=$ %
userAuthRepository& 8
;8 9
this 
. 
mapper 
= 
mapper  
;  !
} 	
public 
async 
Task 
< 
Result  
<  !
object! '
>' (
>( )
Handle* 0
(0 1
UpdateUserCommand1 B
requestC J
,J K
CancellationTokenL ]
cancellationToken^ o
)o p
{ 	
var 
user 
= 
await 
userAuthRepository /
./ 0
GetByIdAsync0 <
(< =
request= D
.D E
UserIdE K
)K L
;L M
if 
( 
user 
== 
null 
) 
{ 
return 
Result 
< 
object $
>$ %
.% &
Failure& -
(- .
$str. >
)> ?
;? @
} 
user 
= 
mapper 
. 
Map 
< 
User "
>" #
(# $
request$ +
)+ ,
;, -
var   
result   
=   
await   
userAuthRepository   1
.  1 2
UpdateUserAsync  2 A
(  A B
user  B F
)  F G
;  G H
if!! 
(!! 
result!! 
.!! 
	IsSuccess!!  
)!!  !
{"" 
return## 
Result## 
<## 
object## $
>##$ %
.##% &
Success##& -
(##- .
result##. 4
.##4 5
Data##5 9
)##9 :
;##: ;
}$$ 
return&& 
Result&& 
<&& 
object&&  
>&&  !
.&&! "
Failure&&" )
(&&) *
result&&* 0
.&&0 1
ErrorMessage&&1 =
)&&= >
;&&> ?
}'' 	
}(( 
})) Ù
DD:\BuySmart\BuySmart\Application\Authentication\UpdateUserCommand.cs
	namespace 	
Application
 
. 
Authentication $
{ 
public 

class 
UpdateUserCommand "
:# $
IRequest% -
<- .
Result. 4
<4 5
object5 ;
>; <
>< =
{		 
public

 
Guid

 
UserId

 
{

 
get

  
;

  !
set

" %
;

% &
}

' (
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
=) *
string+ 1
.1 2
Empty2 7
;7 8
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
=* +
string, 2
.2 3
Empty3 8
;8 9
public 
string 
Password 
{  
get! $
;$ %
set& )
;) *
}+ ,
=- .
string/ 5
.5 6
Empty6 ;
;; <
public 
string 
Image 
{ 
get !
;! "
set# &
;& '
}( )
=* +
string, 2
.2 3
Empty3 8
;8 9
} 
} ü
WD:\BuySmart\BuySmart\Application\Authentication\SendVerificationCodeCommandValidator.cs
	namespace 	
Application
 
. 
Commands 
. 
UserClientCommands 1
{ 
public 

class 0
$SendVerificationCodeCommandValidator 5
:6 7
AbstractValidator8 I
<I J'
SendVerificationCodeCommandJ e
>e f
{ 
public		 0
$SendVerificationCodeCommandValidator		 3
(		3 4
)		4 5
{

 	
RuleFor 
( 
uc 
=> 
uc 
. 
Name !
)! "
. 
NotEmpty 
( 
) 
. 
MaximumLength 
( 
$num "
)" #
. 
MinimumLength 
( 
$num  
)  !
. 
WithMessage 
( 
$str H
)H I
;I J
RuleFor 
( 
uc 
=> 
uc 
. 
Email "
)" #
. 
NotEmpty 
( 
) 
. 
EmailAddress 
( 
) 
. 
MaximumLength 
( 
$num "
)" #
. 
WithMessage 
( 
$str 4
)4 5
;5 6
RuleFor 
( 
uc 
=> 
uc 
. 
Password %
)% &
. 
NotEmpty 
( 
) 
. 
MinimumLength 
( 
$num  
)  !
. 
MaximumLength 
( 
$num "
)" #
. 
WithMessage 
( 
$str L
)L M
;M N
RuleFor 
( 
uc 
=> 
uc 
. 
UserType %
)% &
. 
Must 
( 
userType 
=> !
userType" *
==+ -
UserType. 6
.6 7
Client7 =
||> @
userTypeA I
==J L
UserTypeM U
.U V
BusinessV ^
)^ _
. 
WithMessage 
( 
$str J
)J K
;K L
}   	
}!! 
}"" Ã
UD:\BuySmart\BuySmart\Application\Authentication\SendVerificationCodeCommandHandler.cs
	namespace 	
Application
 
. 
Authentication $
{ 
public		 

class		 .
"SendVerificationCodeCommandHandler		 3
:		4 5
IRequestHandler		6 E
<		E F'
SendVerificationCodeCommand		F a
,		a b
Result		c i
<		i j
string		j p
>		p q
>		q r
{

 
private 
readonly 
IUserAuthRepository ,
<, -
User- 1
>1 2

repository3 =
;= >
private 
readonly 
IMapper  
mapper! '
;' (
public .
"SendVerificationCodeCommandHandler 1
(1 2
IUserAuthRepository2 E
<E F
UserF J
>J K

repositoryL V
,V W
IMapperX _
mapper` f
)f g
{ 	
this 
. 

repository 
= 

repository (
;( )
this 
. 
mapper 
= 
mapper  
;  !
} 	
public 
async 
Task 
< 
Result  
<  !
string! '
>' (
>( )
Handle* 0
(0 1'
SendVerificationCodeCommand1 L
requestM T
,T U
CancellationTokenV g
cancellationTokenh y
)y z
{ 	
var 
user 
= 
mapper 
. 
Map !
<! "
User" &
>& '
(' (
request( /
)/ 0
;0 1
user 
. 
Password 
= 
BCrypt "
." #
Net# &
.& '
BCrypt' -
.- .
HashPassword. :
(: ;
request; B
.B C
PasswordC K
)K L
;L M
var 
result 
= 
await 

repository )
.) * 
SendVerificationCode* >
(> ?
user? C
,C D
cancellationTokenE V
)V W
;W X
if 
( 
result 
. 
	IsSuccess  
)  !
{ 
return 
Result 
< 
string $
>$ %
.% &
Success& -
(- .
result. 4
.4 5
Data5 9
)9 :
;: ;
} 
return 
Result 
< 
string  
>  !
.! "
Failure" )
() *
result* 0
.0 1
ErrorMessage1 =
)= >
;> ?
} 	
} 
} Â
ND:\BuySmart\BuySmart\Application\Authentication\SendVerificationCodeCommand.cs
	namespace 	
Application
 
. 
Authentication $
{ 
public 

class '
SendVerificationCodeCommand ,
:- .
IRequest/ 7
<7 8
Result8 >
<> ?
string? E
>E F
>F G
{ 
public		 
string		 
Name		 
{		 
get		  
;		  !
set		" %
;		% &
}		' (
=		) *
string		+ 1
.		1 2
Empty		2 7
;		7 8
public

 
string

 
Email

 
{

 
get

 !
;

! "
set

# &
;

& '
}

( )
=

* +
string

, 2
.

2 3
Empty

3 8
;

8 9
public 
string 
Password 
{  
get! $
;$ %
set& )
;) *
}+ ,
=- .
string/ 5
.5 6
Empty6 ;
;; <
public 
UserType 
UserType  
{! "
get# &
;& '
set( +
;+ ,
}- .
=/ 0
UserType1 9
.9 :
Client: @
;@ A
public 
string 
Image 
{ 
get !
;! "
set# &
;& '
}( )
=* +
string, 2
.2 3
Empty3 8
;8 9
} 
} ±
OD:\BuySmart\BuySmart\Application\Authentication\RegisterUserCommandValidator.cs
	namespace 	
Application
 
. 
Commands 
. 
UserClientCommands 1
{ 
public 

class (
RegisterUserCommandValidator -
:. /
AbstractValidator0 A
<A B
RegisterUserCommandB U
>U V
{ 
public (
RegisterUserCommandValidator +
(+ ,
), -
{		 	
RuleFor

 
(

 
uc

 
=>

 
uc

 
.

 
confirmationCode

 ,
)

, -
. 
NotEmpty 
( 
) 
. 
MaximumLength 
( 
$num  
)  !
. 
MinimumLength 
( 
$num  
)  !
. 
WithMessage 
( 
$str E
)E F
;F G
} 	
} 
} ı
MD:\BuySmart\BuySmart\Application\Authentication\RegisterUserCommandHandler.cs
	namespace 	
Application
 
. 
Authentication $
{ 
public		 

class		 &
RegisterUserCommandHandler		 +
:		, -
IRequestHandler		. =
<		= >
RegisterUserCommand		> Q
,		Q R
Result		S Y
<		Y Z
Guid		Z ^
>		^ _
>		_ `
{

 
private 
readonly 
IUserAuthRepository ,
<, -
User- 1
>1 2

repository3 =
;= >
public &
RegisterUserCommandHandler )
() *
IUserAuthRepository* =
<= >
User> B
>B C

repositoryD N
)N O
{ 	
this 
. 

repository 
= 

repository (
;( )
} 	
public 
async 
Task 
< 
Result  
<  !
Guid! %
>% &
>& '
Handle( .
(. /
RegisterUserCommand/ B
requestC J
,J K
CancellationTokenL ]
cancellationToken^ o
)o p
{ 	
int 
confirmationCode  
=! "
int# &
.& '
Parse' ,
(, -
request- 4
.4 5
confirmationCode5 E
)E F
;F G
var 
result 
= 
await 

repository )
.) *
Register* 2
(2 3
confirmationCode3 C
,C D
cancellationTokenE V
)V W
;W X
if 
( 
result 
. 
	IsSuccess  
)  !
{ 
return 
Result 
< 
Guid "
>" #
.# $
Success$ +
(+ ,
result, 2
.2 3
Data3 7
)7 8
;8 9
} 
return 
Result 
< 
Guid 
> 
.  
Failure  '
(' (
result( .
.. /
ErrorMessage/ ;
); <
;< =
} 	
} 
} †
FD:\BuySmart\BuySmart\Application\Authentication\RegisterUserCommand.cs
	namespace 	
Application
 
. 
Authentication $
{ 
public 

class 
RegisterUserCommand $
:% &
IRequest' /
</ 0
Result0 6
<6 7
Guid7 ;
>; <
>< =
{ 
public 
string 
confirmationCode &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
=5 6
string7 =
.= >
Empty> C
;C D
}		 
}

 ñ
LD:\BuySmart\BuySmart\Application\Authentication\LoginUserCommandValidator.cs
	namespace 	
Application
 
. 
Authentication $
{ 
public 

class %
LoginUserCommandValidator *
:+ ,
AbstractValidator- >
<> ?
LoginUserCommand? O
>O P
{ 
public %
LoginUserCommandValidator (
(( )
)) *
{ 	
RuleFor		 
(		 
x		 
=>		 
x		 
.		 
Email		  
)		  !
.

 
NotEmpty

 
(

 
)

 
.

 
WithMessage

 '
(

' (
$str

( ;
)

; <
. 
EmailAddress 
( 
) 
.  
WithMessage  +
(+ ,
$str, @
)@ A
;A B
RuleFor 
( 
x 
=> 
x 
. 
Password #
)# $
. 
NotEmpty 
( 
) 
. 
WithMessage '
(' (
$str( >
)> ?
. 
MinimumLength 
( 
$num  
)  !
. 
MaximumLength 
( 
$num "
)" #
. 
WithMessage 
( 
$str L
)L M
;M N
} 	
} 
} ø
JD:\BuySmart\BuySmart\Application\Authentication\LoginUserCommandHandler.cs
	namespace 	
Application
 
. 
Authentication $
{ 
public		 

class		 #
LoginUserCommandHandler		 (
:		) *
IRequestHandler		+ :
<		: ;
LoginUserCommand		; K
,		K L
Result		M S
<		S T
string		T Z
>		Z [
>		[ \
{

 
private 
readonly 
IUserAuthRepository ,
<, -
User- 1
>1 2
userRepository3 A
;A B
private 
readonly 
IMapper  
mapper! '
;' (
public #
LoginUserCommandHandler &
(& '
IUserAuthRepository' :
<: ;
User; ?
>? @
userRepositoryA O
,O P
IMapperQ X
mapperY _
)_ `
{ 	
this 
. 
userRepository 
=  !
userRepository" 0
;0 1
this 
. 
mapper 
= 
mapper  
;  !
} 	
public 
async 
Task 
< 
Result  
<  !
string! '
>' (
>( )
Handle* 0
(0 1
LoginUserCommand1 A
requestB I
,I J
CancellationTokenK \
cancellationToken] n
)n o
{ 	
var 
user 
= 
mapper 
. 
Map !
<! "
User" &
>& '
(' (
request( /
)/ 0
;0 1
var 
result 
= 
await 
userRepository -
.- .
Login. 3
(3 4
user4 8
)8 9
;9 :
if 
( 
result 
. 
	IsSuccess  
)  !
{ 
return 
Result 
< 
string $
>$ %
.% &
Success& -
(- .
result. 4
.4 5
Data5 9
)9 :
;: ;
} 
return 
Result 
< 
string  
>  !
.! "
Failure" )
() *
result* 0
.0 1
ErrorMessage1 =
)= >
;> ?
} 	
}   
}!! Å
CD:\BuySmart\BuySmart\Application\Authentication\LoginUserCommand.cs
	namespace 	
Application
 
. 
Authentication $
{ 
public 

class 
LoginUserCommand !
:" #
IRequest$ ,
<, -
Result- 3
<3 4
string4 :
>: ;
>; <
{ 
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
=* +
string, 2
.2 3
Empty3 8
;8 9
public		 
string		 
Password		 
{		  
get		! $
;		$ %
set		& )
;		) *
}		+ ,
=		- .
string		/ 5
.		5 6
Empty		6 ;
;		; <
}

 
} Ã
MD:\BuySmart\BuySmart\Application\Authentication\DeleteUserCommandValidator.cs
	namespace 	
Application
 
. 
Authentication $
{ 
public 

class &
DeleteUserCommandValidator +
:, -
AbstractValidator. ?
<? @
DeleteUserCommand@ Q
>Q R
{ 
public &
DeleteUserCommandValidator )
() *
)* +
{		 	
RuleFor

 
(

 
command

 
=>

 
command

 &
.

& '
UserId

' -
)

- .
. 
NotEmpty 
( 
) 
. 
WithMessage 
( 
$str 8
)8 9
;9 :
} 	
} 
} Å
KD:\BuySmart\BuySmart\Application\Authentication\DeleteUserCommandHandler.cs
	namespace 	
Application
 
. 
CommandHandlers %
.% &%
UserClientCommandHandlers& ?
{ 
public		 

class		 $
DeleteUserCommandHandler		 )
:		* +
IRequestHandler		, ;
<		; <
DeleteUserCommand		< M
,		M N
Result		O U
<		U V
object		V \
>		\ ]
>		] ^
{

 
private 
readonly 
IUserAuthRepository ,
<, -
User- 1
>1 2
userAuthRepository3 E
;E F
public $
DeleteUserCommandHandler '
(' (
IUserAuthRepository( ;
<; <
User< @
>@ A
userAuthRepositoryB T
)T U
{ 	
this 
. 
userAuthRepository #
=$ %
userAuthRepository& 8
;8 9
} 	
public 
async 
Task 
< 
Result  
<  !
object! '
>' (
>( )
Handle* 0
(0 1
DeleteUserCommand1 B
requestC J
,J K
CancellationTokenL ]
cancellationToken^ o
)o p
{ 	
var 
user 
= 
await 
userAuthRepository /
./ 0
GetByIdAsync0 <
(< =
request= D
.D E
UserIdE K
)K L
;L M
if 
( 
user 
== 
null 
) 
{ 
return 
Result 
< 
object $
>$ %
.% &
Failure& -
(- .
$str. >
)> ?
;? @
} 
await 
userAuthRepository $
.$ %
DeleteUserAsync% 4
(4 5
request5 <
.< =
UserId= C
)C D
;D E
return 
Result 
< 
object  
>  !
.! "
Success" )
() *
new* -
object. 4
(4 5
)5 6
)6 7
;7 8
} 	
} 
} æ
DD:\BuySmart\BuySmart\Application\Authentication\DeleteUserCommand.cs
	namespace 	
Application
 
. 
Authentication $
{ 
public 

class 
DeleteUserCommand "
:# $
IRequest% -
<- .
Result. 4
<4 5
object5 ;
>; <
>< =
{ 
public 
Guid 
UserId 
{ 
get  
;  !
set" %
;% &
}' (
}		 
}

 Ì,
DD:\BuySmart\BuySmart\Application\AIML\ProductPricePredictionModel.cs
	namespace 	
Application
 
. 
AIML 
{ 
public 

class '
ProductPricePredictionModel ,
{ 
private		 
readonly		 
	MLContext		 "
	mlContext		# ,
;		, -
private

 
TransformerChain

  
<

  !+
RegressionPredictionTransformer

! @
<

@ A+
LinearRegressionModelParameters

A `
>

` a
>

a b
?

b c
model

d i
;

i j
public '
ProductPricePredictionModel *
(* +
)+ ,
=>- /
	mlContext0 9
=: ;
new< ?
	MLContext@ I
(I J
)J K
;K L
public 
void 
Train 
( 
List 
< 
ProductData *
>* +
trainingData, 8
)8 9
{ 	
var 
data 
= 
	mlContext  
.  !
Data! %
.% &
LoadFromEnumerable& 8
(8 9
trainingData9 E
)E F
;F G
var 
pipeline 
= 
	mlContext $
.$ %

Transforms% /
./ 0
Text0 4
.4 5
FeaturizeText5 B
(B C
$strC Z
,Z [
nameof\ b
(b c
ProductDatac n
.n o
Descriptiono z
)z {
){ |
. 
Append 
( 
	mlContext !
.! "

Transforms" ,
., -
Concatenate- 8
(8 9
$str9 C
,C D
$strE \
)\ ]
)] ^
. 
Append 
( 
	mlContext !
.! "

Transforms" ,
., -
CopyColumns- 8
(8 9
$str9 @
,@ A
nameofB H
(H I
ProductDataI T
.T U
PriceU Z
)Z [
)[ \
)\ ]
. 
Append 
( 
	mlContext !
.! "

Regression" ,
., -
Trainers- 5
.5 6
Sdca6 :
(: ;
labelColumnName; J
:J K
$strL S
,S T
featureColumnNameU f
:f g
$strh r
,r s&
maximumNumberOfIterations	t ç
:
ç é
$num
è í
)
í ì
)
ì î
;
î ï
model 
= 
pipeline 
. 
Fit  
(  !
data! %
)% &
;& '
Evaluate 
( 
trainingData !
)! "
;" #
} 	
public 
float 
Predict 
( 
ProductData (
product) 0
)0 1
{ 	
var 
predictionEngine  
=! "
	mlContext# ,
., -
Model- 2
.2 3"
CreatePredictionEngine3 I
<I J
ProductDataJ U
,U V"
ProductPricePredictionW m
>m n
(n o
modelo t
)t u
;u v
var   

prediction   
=   
predictionEngine   -
.  - .
Predict  . 5
(  5 6
product  6 =
)  = >
;  > ?
Console!! 
.!! 
	WriteLine!! 
(!! 
$"!!  
$str!!  -
{!!- .
product!!. 5
.!!5 6
Description!!6 A
}!!A B
$str!!B U
{!!U V

prediction!!V `
.!!` a
Price!!a f
}!!f g
"!!g h
)!!h i
;!!i j
return"" 

prediction"" 
."" 
Price"" #
;""# $
}## 	
public%% 
void%% 
Evaluate%% 
(%% 
List%% !
<%%! "
ProductData%%" -
>%%- .
testData%%/ 7
)%%7 8
{&& 	
if'' 
('' 
model'' 
=='' 
null'' 
)'' 
{(( 
Console)) 
.)) 
	WriteLine)) !
())! "
$str))" q
)))q r
;))r s
return** 
;** 
}++ 
var-- 
data-- 
=-- 
	mlContext--  
.--  !
Data--! %
.--% &
LoadFromEnumerable--& 8
(--8 9
testData--9 A
)--A B
;--B C
var.. 
predictions.. 
=.. 
model.. #
...# $
	Transform..$ -
(..- .
data... 2
)..2 3
;..3 4
var00 
metrics00 
=00 
	mlContext00 #
.00# $

Regression00$ .
.00. /
Evaluate00/ 7
(007 8
predictions008 C
)00C D
;00D E
Console11 
.11 
	WriteLine11 
(11 
$"11  
$str11  %
{11% &
metrics11& -
.11- .
RSquared11. 6
}116 7
"117 8
)118 9
;119 :
Console22 
.22 
	WriteLine22 
(22 
$"22  
$str22  @
{22@ A
metrics22A H
.22H I 
RootMeanSquaredError22I ]
}22] ^
"22^ _
)22_ `
;22` a
}33 	
}44 
}55 ë
?D:\BuySmart\BuySmart\Application\AIML\ProductPricePrediction.cs
	namespace 	
Application
 
. 
AIML 
{ 
public 

class "
ProductPricePrediction '
{ 
[ 	

ColumnName	 
( 
$str 
) 
] 
public 
float 
Price 
{ 
get  
;  !
set" %
;% &
}' (
}		 
}

 Í
=D:\BuySmart\BuySmart\Application\AIML\ProductDataGenerator.cs
	namespace 	
Application
 
. 
AIML 
{ 
public 

static 
class  
ProductDataGenerator ,
{ 
public		 
static		 
List		 
<		 
ProductData		 &
>		& '
GetProducts		( 3
(		3 4
string		4 :
filePath		; C
)		C D
{

 	
var 
products 
= 
new 
List #
<# $
ProductData$ /
>/ 0
(0 1
)1 2
;2 3
using 
( 
var 
reader 
= 
new  #
StreamReader$ 0
(0 1
filePath1 9
)9 :
): ;
using 
( 
var 
csv 
= 
new  
	CsvReader! *
(* +
reader+ 1
,1 2
new3 6
CsvConfiguration7 G
(G H
CultureInfoH S
.S T
InvariantCultureT d
)d e
)e f
)f g
{ 
var 
records 
= 
csv !
.! "

GetRecords" ,
<, -
dynamic- 4
>4 5
(5 6
)6 7
.7 8
ToList8 >
(> ?
)? @
;@ A
foreach 
( 
var 
record #
in$ &
records' .
). /
{ 
var 
description #
=$ %
record& ,
., -
	ITEM_DESC- 6
?6 7
.7 8
ToString8 @
(@ A
)A B
;B C
var 
priceString #
=$ %
record& ,
., -
PRICE- 2
?2 3
.3 4
ToString4 <
(< =
)= >
;> ?
if 
( 
string 
. 
IsNullOrEmpty ,
(, -
description- 8
)8 9
||: <
string= C
.C D
IsNullOrEmptyD Q
(Q R
priceStringR ]
)] ^
||_ a
priceStringb m
==n p
$strq v
||w y
priceString	z Ö
==
Ü à
$str
â å
)
å ç
{ 
continue  
;  !
} 
float 
price 
=  !
$num" #
;# $
products   
.   
Add    
(    !
new  ! $
ProductData  % 0
{!! 
Description"" #
=""$ %
description""& 1
??""2 4
string""5 ;
.""; <
Empty""< A
,""A B
Price## 
=## 
price##  %
}$$ 
)$$ 
;$$ 
}&& 
}'' 
return)) 
products)) 
;)) 
}** 	
}++ 
},, à
4D:\BuySmart\BuySmart\Application\AIML\ProductData.cs
	namespace 	
Application
 
. 
AIML 
{ 
public 

class 
ProductData 
{ 
public 
string 
Description !
{" #
get$ '
;' (
set) ,
;, -
}. /
=0 1
string2 8
.8 9
Empty9 >
;> ?
public 
float 
Price 
{ 
get  
;  !
set" %
;% &
}' (
} 
} 