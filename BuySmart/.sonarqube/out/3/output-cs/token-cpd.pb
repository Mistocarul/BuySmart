Å
BD:\Repos\BuySmart\BuySmart\Application\Utils\ValidationBehavior.cs
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
} ≥$
>D:\Repos\BuySmart\BuySmart\Application\Utils\MappingProfile.cs
	namespace 	
Application
 
. 
Utils 
{ 
public 

class 
MappingProfile 
:  !
Profile" )
{ 
public 
MappingProfile 
( 
) 
{ 	
	CreateMap 
< 
Product 
, 

ProductDto )
>) *
(* +
)+ ,
., -

ReverseMap- 7
(7 8
)8 9
;9 :
	CreateMap 
<  
CreateProductCommand *
,* +
Product, 3
>3 4
(4 5
)5 6
.6 7

ReverseMap7 A
(A B
)B C
;C D
	CreateMap 
<  
UpdateProductCommand *
,* +
Product, 3
>3 4
(4 5
)5 6
.6 7

ReverseMap7 A
(A B
)B C
;C D
	CreateMap 
< 

UserClient  
,  !
UserClientDto" /
>/ 0
(0 1
)1 2
.2 3

ReverseMap3 =
(= >
)> ?
;? @
	CreateMap 
< #
CreateUserClientCommand -
,- .

UserClient/ 9
>9 :
(: ;
); <
.< =

ReverseMap= G
(G H
)H I
;I J
	CreateMap 
< #
UpdateUserClientCommand -
,- .

UserClient/ 9
>9 :
(: ;
); <
.< =

ReverseMap= G
(G H
)H I
;I J
	CreateMap 
< %
CreateUserBusinessCommand /
,/ 0
UserBusiness1 =
>= >
(> ?
)? @
.@ A

ReverseMapA K
(K L
)L M
;M N
	CreateMap 
< %
UpdateUserBusinessCommand /
,/ 0
UserBusiness1 =
>= >
(> ?
)? @
.@ A

ReverseMapA K
(K L
)L M
;M N
	CreateMap 
< 
UserBusiness "
," #
UserBusinessDto$ 3
>3 4
(4 5
)5 6
.6 7

ReverseMap7 A
(A B
)B C
;C D
	CreateMap 
< !
CreateBusinessCommand +
,+ ,
Business- 5
>5 6
(6 7
)7 8
.8 9

ReverseMap9 C
(C D
)D E
;E F
	CreateMap 
< !
UpdateBusinessCommand +
,+ ,
Business- 5
>5 6
(6 7
)7 8
.8 9

ReverseMap9 C
(C D
)D E
;E F
	CreateMap 
< 
Business 
, 
BusinessDto  +
>+ ,
(, -
)- .
.. /

ReverseMap/ 9
(9 :
): ;
;; <
	CreateMap 
< '
CreateReviewBusinessCommand 1
,1 2
Review3 9
>9 :
(: ;
); <
.< =

ReverseMap= G
(G H
)H I
;I J
	CreateMap   
<   '
UpdateReviewBusinessCommand   1
,  1 2
Review  3 9
>  9 :
(  : ;
)  ; <
.  < =

ReverseMap  = G
(  G H
)  H I
;  I J
	CreateMap!! 
<!! 
Review!! 
,!! 
	ReviewDto!! '
>!!' (
(!!( )
)!!) *
.!!* +

ReverseMap!!+ 5
(!!5 6
)!!6 7
;!!7 8
	CreateMap"" 
<"" 
CreateCartCommand"" '
,""' (
Cart"") -
>""- .
("". /
)""/ 0
.""0 1

ReverseMap""1 ;
(""; <
)""< =
;""= >
	CreateMap## 
<## 
Cart## 
,## 
CartDto## #
>### $
(##$ %
)##% &
.##& '

ReverseMap##' 1
(##1 2
)##2 3
;##3 4
	CreateMap$$ 
<$$ 
Product$$ 
,$$ 

ProductDto$$ )
>$$) *
($$* +
)$$+ ,
.$$, -

ReverseMap$$- 7
($$7 8
)$$8 9
;$$9 :
}'' 	
}(( 
})) ¥
mD:\Repos\BuySmart\BuySmart\Application\QueryHandlers\UserClientQueryHandlers\GetUserClientByIdQueryHandler.cs
	namespace 	
Application
 
. 
QueryHandlers #
.# $#
UserClientQueryHandlers$ ;
{ 
public		 

class		 )
GetUserClientByIdQueryHandler		 .
:		/ 0
IRequestHandler		1 @
<		@ A"
GetUserClientByIdQuery		A W
,		W X
UserClientDto		Y f
>		f g
{

 
private 
readonly !
IUserClientRepository .

repository/ 9
;9 :
private 
readonly 
IMapper  
mapper! '
;' (
public )
GetUserClientByIdQueryHandler ,
(, -!
IUserClientRepository- B

repositoryC M
,M N
IMapperO V
mapperW ]
)] ^
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
< 
UserClientDto '
>' (
Handle) /
(/ 0"
GetUserClientByIdQuery0 F
requestG N
,N O
CancellationTokenP a
cancellationTokenb s
)s t
{ 	
var 

userClient 
= 
await "

repository# -
.- .
GetByIdAsync. :
(: ;
request; B
.B C
IdC E
)E F
;F G
return 
mapper 
. 
Map 
< 
UserClientDto +
>+ ,
(, -

userClient- 7
)7 8
;8 9
} 	
} 
} ñ
mD:\Repos\BuySmart\BuySmart\Application\QueryHandlers\UserClientQueryHandlers\GetAllUserClientsQueryHandler.cs
	namespace 	
Application
 
. 
QueryHandlers #
.# $#
UserClientQueryHandlers$ ;
{ 
public		 

class		 )
GetAllUserClientsQueryHandler		 .
:		/ 0
IRequestHandler		1 @
<		@ A"
GetAllUserClientsQuery		A W
,		W X
List		Y ]
<		] ^
UserClientDto		^ k
>		k l
>		l m
{

 
private 
readonly !
IUserClientRepository .

repository/ 9
;9 :
private 
readonly 
IMapper  
mapper! '
;' (
public )
GetAllUserClientsQueryHandler ,
(, -!
IUserClientRepository- B

repositoryC M
,M N
IMapperO V
mapperW ]
)] ^
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
< 
UserClientDto ,
>, -
>- .
Handle/ 5
(5 6"
GetAllUserClientsQuery6 L
requestM T
,T U
CancellationTokenV g
cancellationTokenh y
)y z
{ 	
var 
userClients 
= 
await #

repository$ .
.. /
GetAllAsync/ :
(: ;
request; B
.B C

pageNumberC M
,M N
requestO V
.V W
pageSizeW _
)_ `
;` a
return 
mapper 
. 
Map 
< 
List "
<" #
UserClientDto# 0
>0 1
>1 2
(2 3
userClients3 >
)> ?
;? @
} 	
} 
} –
qD:\Repos\BuySmart\BuySmart\Application\QueryHandlers\UserBusinessQueryHandlers\GetUserBusinessByIdQueryHandler.cs
	namespace 	
Application
 
. 
QueryHandlers #
.# $%
UserBusinessQueryHandlers$ =
{ 
public		 

class		 +
GetUserBusinessByIdQueryHandler		 0
:		1 2
IRequestHandler		3 B
<		B C$
GetUserBusinessByIdQuery		C [
,		[ \
UserBusinessDto		] l
>		l m
{

 
private 
readonly #
IUserBusinessRepository 0

repository1 ;
;; <
private 
readonly 
IMapper  
mapper! '
;' (
public +
GetUserBusinessByIdQueryHandler .
(. /#
IUserBusinessRepository/ F

repositoryG Q
,Q R
IMapperS Z
mapper[ a
)a b
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
public 
async 
Task 
< 
UserBusinessDto )
>) *
Handle+ 1
(1 2$
GetUserBusinessByIdQuery2 J
requestK R
,R S
CancellationTokenT e
cancellationTokenf w
)w x
{ 	
var 
userBusiness 
= 
await $

repository% /
./ 0
GetByIdAsync0 <
(< =
request= D
.D E
IdE G
)G H
;H I
return 
mapper 
. 
Map 
< 
UserBusinessDto -
>- .
(. /
userBusiness/ ;
); <
;< =
} 	
} 
} π
rD:\Repos\BuySmart\BuySmart\Application\QueryHandlers\UserBusinessQueryHandlers\GetAllUserBusinessesQueryHandler.cs
	namespace 	
Application
 
. 
QueryHandlers #
.# $%
UserBusinessQueryHandlers$ =
{ 
public		 

class		 ,
 GetAllUserBusinessesQueryHandler		 1
:		2 3
IRequestHandler		4 C
<		C D%
GetAllUserBusinessesQuery		D ]
,		] ^
List		_ c
<		c d
UserBusinessDto		d s
>		s t
>		t u
{

 
private 
readonly #
IUserBusinessRepository 0

repository1 ;
;; <
private 
readonly 
IMapper  
mapper! '
;' (
public ,
 GetAllUserBusinessesQueryHandler /
(/ 0#
IUserBusinessRepository0 G

repositoryH R
,R S
IMapperT [
mapper\ b
)b c
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
< 
List 
< 
UserBusinessDto .
>. /
>/ 0
Handle1 7
(7 8%
GetAllUserBusinessesQuery8 Q
requestR Y
,Y Z
CancellationToken[ l
cancellationTokenm ~
)~ 
{ 	
var 
userBusinesses 
=  
await! &

repository' 1
.1 2
GetAllAsync2 =
(= >
request> E
.E F

pageNumberF P
,P Q
requestR Y
.Y Z
pageSizeZ b
)b c
;c d
return 
mapper 
. 
Map 
< 
List "
<" #
UserBusinessDto# 2
>2 3
>3 4
(4 5
userBusinesses5 C
)C D
;D E
} 	
} 
} ‘
uD:\Repos\BuySmart\BuySmart\Application\QueryHandlers\ReviewBusinessQueryHandlers\GetReviewBusinessByIdQueryHandler.cs
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
} ∏
vD:\Repos\BuySmart\BuySmart\Application\QueryHandlers\ReviewBusinessQueryHandlers\GetAllReviewBusinessesQueryHandler.cs
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
} Ç
bD:\Repos\BuySmart\BuySmart\Application\QueryHandlers\ProductQueryHandlers\GetProductByIdHandler.cs
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
} Â$
gD:\Repos\BuySmart\BuySmart\Application\QueryHandlers\ProductQueryHandlers\GetAllProductsQueryHandler.cs
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
(> ?
request? F
.F G

pageNumberG Q
,Q R
requestS Z
.Z [
pageSize[ c
,c d
requeste l
.l m
orderm r
)r s
;s t
if 
( 
! 
string 
. 
IsNullOrEmpty %
(% &
request& -
.- .
Name. 2
)2 3
)3 4
{ 
products 
= 
products #
.# $
Where$ )
() *
p* +
=>, .
p/ 0
.0 1
Name1 5
.5 6
Contains6 >
(> ?
request? F
.F G
NameG K
)K L
)L M
.M N
ToListN T
(T U
)U V
;V W
} 
if 
( 
request 
. 

CategoryId !
.! "
HasValue" *
)* +
{ 
products 
= 
products #
.# $
Where$ )
() *
p* +
=>, .
p/ 0
.0 1

Categories1 ;
.; <
Any< ?
(? @
c@ A
=>B D
cE F
.F G

CategoryIdG Q
==R T
requestU \
.\ ]

CategoryId] g
)g h
)h i
.i j
ToListj p
(p q
)q r
;r s
} 
if!! 
(!! 
request!! 
.!! 
MinPrice!!  
.!!  !
HasValue!!! )
)!!) *
{"" 
products## 
=## 
products## #
.### $
Where##$ )
(##) *
p##* +
=>##, .
p##/ 0
.##0 1
Price##1 6
>=##7 9
request##: A
.##A B
MinPrice##B J
.##J K
Value##K P
)##P Q
.##Q R
ToList##R X
(##X Y
)##Y Z
;##Z [
}$$ 
if&& 
(&& 
request&& 
.&& 
MaxPrice&&  
.&&  !
HasValue&&! )
)&&) *
{'' 
products(( 
=(( 
products(( #
.((# $
Where(($ )
((() *
p((* +
=>((, .
p((/ 0
.((0 1
Price((1 6
<=((7 9
request((: A
.((A B
MaxPrice((B J
.((J K
Value((K P
)((P Q
.((Q R
ToList((R X
(((X Y
)((Y Z
;((Z [
})) 
return++ 
mapper++ 
.++ 
Map++ 
<++ 
List++ "
<++" #

ProductDto++# -
>++- .
>++. /
(++/ 0
products++0 8
)++8 9
;++9 :
},, 	
}-- 
}.. ¿
iD:\Repos\BuySmart\BuySmart\Application\QueryHandlers\BusinessQueryHandlers\GetBusinessByIdQueryHandler.cs
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
} û
hD:\Repos\BuySmart\BuySmart\Application\QueryHandlers\BusinessQueryHandlers\GetAllBusinessQueryHandler.cs
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
} —
ZD:\Repos\BuySmart\BuySmart\Application\Queries\UserClientQueries\GetUserClientByIdQuery.cs
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
 °
ZD:\Repos\BuySmart\BuySmart\Application\Queries\UserClientQueries\GetAllUserClientsQuery.cs
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
{ 
public 
int 

pageNumber 
{ 
get  #
;# $
set% (
;( )
}* +
public		 
int		 
pageSize		 
{		 
get		 !
;		! "
set		# &
;		& '
}		( )
}

 
} €
^D:\Repos\BuySmart\BuySmart\Application\Queries\UserBusinessQueries\GetUserBusinessByIdQuery.cs
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
 ≠
_D:\Repos\BuySmart\BuySmart\Application\Queries\UserBusinessQueries\GetAllUserBusinessesQuery.cs
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
{ 
public 
int 

pageNumber 
{ 
get  #
;# $
set% (
;( )
}* +
public		 
int		 
pageSize		 
{		 
get		 !
;		! "
set		# &
;		& '
}		( )
}

 
} ›
bD:\Repos\BuySmart\BuySmart\Application\Queries\ReviewBusinessQueries\GetReviewBusinessByIdQuery.cs
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
 ˚
cD:\Repos\BuySmart\BuySmart\Application\Queries\ReviewBusinessQueries\GetAllReviewBusinessesQuery.cs
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
} 
}		 …
TD:\Repos\BuySmart\BuySmart\Application\Queries\ProductQueries\GetProductByIdQuery.cs
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
} €
TD:\Repos\BuySmart\BuySmart\Application\Queries\ProductQueries\GetAllProductsQuery.cs
	namespace

 	
Application


 
.

 
Queries

 
.

 
ProductQueries

 ,
{ 
public 

class 
GetAllProductsQuery $
:% &
IRequest' /
</ 0
List0 4
<4 5

ProductDto5 ?
>? @
>@ A
{ 
public 
string 
? 
Name 
{ 
get !
;! "
set# &
;& '
}( )
public 
Guid 
? 

CategoryId 
{  !
get" %
;% &
set' *
;* +
}, -
public 
decimal 
? 
MinPrice  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
decimal 
? 
MaxPrice  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
int 

pageNumber 
{ 
get  #
;# $
set% (
;( )
}* +
public 
int 
pageSize 
{ 
get !
;! "
set# &
;& '
}( )
public 
ProductOrder 
order !
{" #
get$ '
;' (
set) ,
;, -
}. /
} 
} «
VD:\Repos\BuySmart\BuySmart\Application\Queries\BusinessQueries\GetBusinessByIdQuery.cs
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
 ÿ
WD:\Repos\BuySmart\BuySmart\Application\Queries\BusinessQueries\GetAllBusinessesQuery.cs
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
} 
} ⁄

<D:\Repos\BuySmart\BuySmart\Application\DTOs\UserClientDto.cs
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
{ 
public 
Guid 
UserId 
{ 
get  
;  !
set" %
;% &
}' (
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
string		 
Email		 
{		 
get		 !
;		! "
set		# &
;		& '
}		( )
=		* +
string		, 2
.		2 3
Empty		3 8
;		8 9
public

 
UserType

 
UserType

  
{

! "
get

# &
;

& '
set

( +
;

+ ,
}

- .
=

/ 0
UserType

1 9
.

9 :
Client

: @
;

@ A
public 
string 
Image 
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
;8 9
} 
} ‡

>D:\Repos\BuySmart\BuySmart\Application\DTOs\UserBusinessDto.cs
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
{ 
public 
Guid 
UserId 
{ 
get  
;  !
set" %
;% &
}' (
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
string		 
Email		 
{		 
get		 !
;		! "
set		# &
;		& '
}		( )
=		* +
string		, 2
.		2 3
Empty		3 8
;		8 9
public

 
UserType

 
UserType

  
{

! "
get

# &
;

& '
set

( +
;

+ ,
}

- .
=

/ 0
UserType

1 9
.

9 :
Business

: B
;

B C
public 
string 
Image 
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
;8 9
} 
} ï

8D:\Repos\BuySmart\BuySmart\Application\DTOs\ReviewDto.cs
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
} »

9D:\Repos\BuySmart\BuySmart\Application\DTOs\ProductDto.cs
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
) *
} 
} ±
6D:\Repos\BuySmart\BuySmart\Application\DTOs\CartDto.cs
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
} ‰

:D:\Repos\BuySmart\BuySmart\Application\DTOs\BusinessDto.cs
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
} Ç
fD:\Repos\BuySmart\BuySmart\Application\Commands\UserClientCommands\UpdateUserClientCommandValidator.cs
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
}(( ‹
<D:\Repos\BuySmart\BuySmart\Application\DependecyInjection.cs
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
} ±
]D:\Repos\BuySmart\BuySmart\Application\Commands\UserClientCommands\UpdateUserClientCommand.cs
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
} †
fD:\Repos\BuySmart\BuySmart\Application\Commands\UserClientCommands\DeleteUserClientCommandValidator.cs
	namespace 	
Application
 
. 
Commands 
. 
UserClientCommands 1
{ 
public 

class ,
 DeleteUserClientCommandValidator 1
:2 3
AbstractValidator4 E
<E F#
DeleteUserClientCommandF ]
>] ^
{ 
public ,
 DeleteUserClientCommandValidator /
(/ 0
)0 1
{ 	
RuleFor		 
(		 
command		 
=>		 
command		 &
.		& '
UserId		' -
)		- .
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
. 
WithMessage 
( 
$str 8
)8 9
;9 :
} 	
} 
} Ü
]D:\Repos\BuySmart\BuySmart\Application\Commands\UserClientCommands\DeleteUserClientCommand.cs
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
class #
DeleteUserClientCommand (
:) *
IRequest+ 3
<3 4
Result4 :
<: ;
object; A
>A B
>B C
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
 ¨
fD:\Repos\BuySmart\BuySmart\Application\Commands\UserClientCommands\CreateUserClientCommandValidator.cs
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
RuleFor   
(   
uc   
=>   
uc   
.   
Image   "
)  " #
.!! 
MaximumLength!! 
(!! 
$num!! "
)!!" #
."" 
WithMessage"" 
("" 
$str"" =
)""= >
;""> ?
}## 	
}$$ 
}%% ó
]D:\Repos\BuySmart\BuySmart\Application\Commands\UserClientCommands\CreateUserClientCommand.cs
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
} ∫
jD:\Repos\BuySmart\BuySmart\Application\Commands\UserBusinessCommands\UpdateUserBusinessCommandValidator.cs
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
"UpdateUserBusinessCommandValidator 3
:4 5
AbstractValidator6 G
<G H%
UpdateUserBusinessCommandH a
>a b
{ 
public .
"UpdateUserBusinessCommandValidator 1
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
RuleFor   
(   
ub   
=>   
ub   
.   
Image   "
)  " #
.!! 
MaximumLength!! 
(!! 
$num!! "
)!!" #
."" 
WithMessage"" 
("" 
$str"" =
)""= >
;""> ?
}## 	
}$$ 
}%% ª
aD:\Repos\BuySmart\BuySmart\Application\Commands\UserBusinessCommands\UpdateUserBusinessCommand.cs
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
} ¢
jD:\Repos\BuySmart\BuySmart\Application\Commands\UserBusinessCommands\DeleteUserBusinessCommandValidator.cs
	namespace 	
Application
 
. 
Commands 
.  
UserBusinessCommands 3
{ 
public 

class .
"DeleteUserBusinessCommandValidator 3
:4 5
AbstractValidator6 G
<G H%
DeleteUserBusinessCommandH a
>a b
{ 
public .
"DeleteUserBusinessCommandValidator 1
(1 2
)2 3
{ 	
RuleFor		 
(		 
ub		 
=>		 
ub		 
.		 
UserId		 #
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
. 
WithMessage 
( 
$str 7
)7 8
;8 9
} 	
} 
} é
aD:\Repos\BuySmart\BuySmart\Application\Commands\UserBusinessCommands\DeleteUserBusinessCommand.cs
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
class %
DeleteUserBusinessCommand *
:+ ,
IRequest- 5
<5 6
Result6 <
<< =
object= C
>C D
>D E
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
 °
aD:\Repos\BuySmart\BuySmart\Application\Commands\UserBusinessCommands\CreateUserBusinessCommand.cs
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
} ∫
jD:\Repos\BuySmart\BuySmart\Application\Commands\UserBusinessCommands\CreateUserBuisnessCommandValidator.cs
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
RuleFor   
(   
ub   
=>   
ub   
.   
Image   "
)  " #
.!! 
MaximumLength!! 
(!! 
$num!! "
)!!" #
."" 
WithMessage"" 
("" 
$str"" =
)""= >
;""> ?
}## 	
}%% 
}&& ˘
nD:\Repos\BuySmart\BuySmart\Application\Commands\ReviewBusinessCommands\UpdateReviewBusinessCommandValidator.cs
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
} ã
eD:\Repos\BuySmart\BuySmart\Application\Commands\ReviewBusinessCommands\UpdateReviewBusinessCommand.cs
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
} Æ
nD:\Repos\BuySmart\BuySmart\Application\Commands\ReviewBusinessCommands\DeleteReviewBusinessCommandValidator.cs
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
} ò
eD:\Repos\BuySmart\BuySmart\Application\Commands\ReviewBusinessCommands\DeleteReviewBusinessCommand.cs
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
 …
nD:\Repos\BuySmart\BuySmart\Application\Commands\ReviewBusinessCommands\CreateReviewBusinessCommandValidator.cs
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
} Ô	
eD:\Repos\BuySmart\BuySmart\Application\Commands\ReviewBusinessCommands\CreateReviewBusinessCommand.cs
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
} 
} Ø
`D:\Repos\BuySmart\BuySmart\Application\Commands\ProductCommands\UpdateProductCommandValidator.cs
	namespace 	
Application
 
. 
Commands 
. 
ProductCommands .
{		 
public

 

class

 )
UpdateProductCommandValidator

 .
:

/ 0
AbstractValidator

1 B
<

B C 
UpdateProductCommand

C W
>

W X
{ 
public )
UpdateProductCommandValidator ,
(, -
)- .
{ 	
RuleFor 
( 
x 
=> 
x 
. 
	ProductId $
)$ %
. 
NotEmpty 
( 
) 
. 
WithMessage '
(' (
$str( ?
)? @
;@ A
RuleFor 
( 
x 
=> 
x 
. 
Name 
)  
. 
NotEmpty 
( 
) 
. 
WithMessage '
(' (
$str( :
): ;
. 
MaximumLength 
( 
$num "
)" #
.# $
WithMessage$ /
(/ 0
$str0 U
)U V
;V W
RuleFor 
( 
x 
=> 
x 
. 
Description &
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
. 
Price  
)  !
. 
NotEmpty 
( 
) 
. 
WithMessage '
(' (
$str( ;
); <
;< =
RuleFor 
( 
x 
=> 
x 
. 
Stock  
)  !
. 
NotEmpty 
( 
) 
. 
WithMessage '
(' (
$str( ;
); <
;< =
RuleFor 
( 
x 
=> 
x 
. 
Rating !
)! "
.   
NotEmpty   
(   
)   
.   
WithMessage   '
(  ' (
$str  ( <
)  < =
;  = >
RuleFor"" 
("" 
x"" 
=>"" 
x"" 
."" 
Image""  
)""  !
.## 
NotEmpty## 
(## 
)## 
.## 
WithMessage## '
(##' (
$str##( ;
)##; <
;##< =
RuleFor%% 
(%% 
x%% 
=>%% 
x%% 
.%% 

BusinessId%% %
)%%% &
.&& 
NotEmpty&& 
(&& 
)&& 
.&& 
WithMessage&& '
(&&' (
$str&&( @
)&&@ A
;&&A B
}'' 	
}(( 
})) Ø
WD:\Repos\BuySmart\BuySmart\Application\Commands\ProductCommands\UpdateProductCommand.cs
	namespace		 	
Application		
 
.		 
Commands		 
.		 
ProductCommands		 .
{

 
public 

class  
UpdateProductCommand %
:& '
IRequest( 0
<0 1
Result1 7
<7 8
object8 >
>> ?
>? @
{ 
public 
Guid 
	ProductId 
{ 
get  #
;# $
set% (
;( )
}* +
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
=) *
string+ 1
.1 2
Empty2 7
;7 8
public 
string 
Description !
{" #
get$ '
;' (
set) ,
;, -
}. /
=0 1
string2 8
.8 9
Empty9 >
;> ?
public 
decimal 
Price 
{ 
get "
;" #
set$ '
;' (
}) *
public 
int 
Stock 
{ 
get 
; 
set  #
;# $
}% &
public 
double 
Rating 
{ 
get "
;" #
set$ '
;' (
}) *
public 
string 
Image 
{ 
get !
;! "
set# &
;& '
}( )
=* +
string, 2
.2 3
Empty3 8
;8 9
public 
Guid 

BusinessId 
{  
get! $
;$ %
set& )
;) *
}+ ,
} 
} á
`D:\Repos\BuySmart\BuySmart\Application\Commands\ProductCommands\DeleteProductCommandValidator.cs
	namespace 	
Application
 
. 
Commands 
. 
ProductCommands .
{		 
internal

 
class

 )
DeleteProductCommandValidator

 0
:

1 2
AbstractValidator

3 D
<

D E 
DeleteProductCommand

E Y
>

Y Z
{ 
public )
DeleteProductCommandValidator ,
(, -
)- .
{ 	
RuleFor 
( 
x 
=> 
x 
. 
	ProductId $
)$ %
. 
NotEmpty 
( 
) 
. 
WithMessage '
(' (
$str( ?
)? @
;@ A
} 	
} 
} ˝
WD:\Repos\BuySmart\BuySmart\Application\Commands\ProductCommands\DeleteProductCommand.cs
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
 Ä
`D:\Repos\BuySmart\BuySmart\Application\Commands\ProductCommands\CreateProductCommandValidator.cs
	namespace 	
Application
 
. 
Commands 
. 
ProductCommands .
{		 
internal

 
class

 )
CreateProductCommandValidator

 0
:

1 2
AbstractValidator

3 D
<

D E 
CreateProductCommand

E Y
>

Y Z
{ 
public )
CreateProductCommandValidator ,
(, -
)- .
{ 	
RuleFor 
( 
x 
=> 
x 
. 
Name 
)  
. 
NotEmpty !
(! "
)" #
.# $
WithMessage$ /
(/ 0
$str0 B
)B C
. 
MaximumLength &
(& '
$num' *
)* +
.+ ,
WithMessage, 7
(7 8
$str8 ]
)] ^
;^ _
RuleFor 
( 
x 
=> 
x 
. 
Description &
)& '
. 
NotEmpty 
( 
) 
. 
WithMessage '
(' (
$str( A
)A B
. 
MaximumLength 
( 
$num "
)" #
.# $
WithMessage$ /
(/ 0
$str0 \
)\ ]
;] ^
RuleFor 
( 
x 
=> 
x 
. 
Price  
)  !
. 
NotEmpty 
( 
) 
. 
WithMessage '
(' (
$str( ;
); <
;< =
RuleFor 
( 
x 
=> 
x 
. 
Stock  
)  !
. 
NotEmpty 
( 
) 
. 
WithMessage '
(' (
$str( ;
); <
;< =
RuleFor 
( 
x 
=> 
x 
. 
Rating !
)! "
. 
NotEmpty 
( 
) 
. 
WithMessage '
(' (
$str( <
)< =
;= >
RuleFor   
(   
x   
=>   
x   
.   
Image    
)    !
.!! 
NotEmpty!! 
(!! 
)!! 
.!! 
WithMessage!! '
(!!' (
$str!!( ;
)!!; <
;!!< =
RuleFor## 
(## 
x## 
=>## 
x## 
.## 

BusinessId## %
)##% &
.$$ 
NotEmpty$$ 
($$ 
)$$ 
.$$ 
WithMessage$$ '
($$' (
$str$$( @
)$$@ A
;$$A B
}%% 	
}&& 
}'' ˜
WD:\Repos\BuySmart\BuySmart\Application\Commands\ProductCommands\CreateProductCommand.cs
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
} Ú
QD:\Repos\BuySmart\BuySmart\Application\Commands\CartCommands\CreateCartCommand.cs
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
 „
bD:\Repos\BuySmart\BuySmart\Application\Commands\BusinessCommands\UpdateBusinessCommandValidator.cs
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
UpdateBusinessCommandValidator /
:0 1
AbstractValidator2 C
<C D!
UpdateBusinessCommandD Y
>Y Z
{ 
public *
UpdateBusinessCommandValidator -
(- .
). /
{ 	
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
. 
NotEmpty 
( 
) 
. 
WithMessage '
(' (
$str( :
): ;
. 
MaximumLength 
( 
$num "
)" #
.# $
WithMessage$ /
(/ 0
$str0 U
)U V
;V W
RuleFor 
( 
x 
=> 
x 
. 
Description &
)& '
. 
NotEmpty 
( 
) 
. 
WithMessage '
(' (
$str( A
)A B
. 
MaximumLength 
( 
$num "
)" #
.# $
WithMessage$ /
(/ 0
$str0 \
)\ ]
;] ^
RuleFor 
( 
x 
=> 
x 
. 
Address "
)" #
. 
NotEmpty 
( 
) 
. 
WithMessage '
(' (
$str( =
)= >
. 
MaximumLength 
( 
$num "
)" #
.# $
WithMessage$ /
(/ 0
$str0 X
)X Y
;Y Z
RuleFor 
( 
x 
=> 
x 
. 
PhoneNumber &
)& '
. 
NotEmpty 
( 
) 
. 
WithMessage '
(' (
$str( A
)A B
. 
MaximumLength 
( 
$num "
)" #
.# $
WithMessage$ /
(/ 0
$str0 \
)\ ]
;] ^
} 	
} 
} √
YD:\Repos\BuySmart\BuySmart\Application\Commands\BusinessCommands\UpdateBusinessCommand.cs
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
} å
bD:\Repos\BuySmart\BuySmart\Application\Commands\BusinessCommands\DeleteBusinessCommandValidator.cs
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
} Ç
YD:\Repos\BuySmart\BuySmart\Application\Commands\BusinessCommands\DeleteBusinessCommand.cs
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
 ô
bD:\Repos\BuySmart\BuySmart\Application\Commands\BusinessCommands\CreateBusinessCommandValidator.cs
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
} ≈
YD:\Repos\BuySmart\BuySmart\Application\Commands\BusinessCommands\CreateBusinessCommand.cs
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
} ©
rD:\Repos\BuySmart\BuySmart\Application\CommandHandlers\UserClientCommandHandlers\UpdateUserClientCommandHandler.cs
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
readonly !
IUserClientRepository . 
userClientRepository/ C
;C D
private 
readonly 
IMapper  
mapper! '
;' (
public *
UpdateUserClientCommandHandler -
(- .!
IUserClientRepository. C 
userClientRepositoryD X
,X Y
IMapperZ a
mapperb h
)h i
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
}(( Ï
rD:\Repos\BuySmart\BuySmart\Application\CommandHandlers\UserClientCommandHandlers\DeleteUserClientCommandHandler.cs
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
class		 *
DeleteUserClientCommandHandler		 /
:		0 1
IRequestHandler		2 A
<		A B#
DeleteUserClientCommand		B Y
,		Y Z
Result		[ a
<		a b
object		b h
>		h i
>		i j
{

 
private 
readonly !
IUserClientRepository . 
userClientRepository/ C
;C D
public *
DeleteUserClientCommandHandler -
(- .!
IUserClientRepository. C 
userClientRepositoryD X
)X Y
{ 	
this 
.  
userClientRepository %
=& ' 
userClientRepository( <
;< =
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
(0 1#
DeleteUserClientCommand1 H
requestI P
,P Q
CancellationTokenR c
cancellationTokend u
)u v
{ 	
var 
user 
= 
await  
userClientRepository 1
.1 2
GetByIdAsync2 >
(> ?
request? F
.F G
UserIdG M
)M N
;N O
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
await  
userClientRepository &
.& '
DeleteAsync' 2
(2 3
request3 :
.: ;
UserId; A
)A B
;B C
return 
Result 
< 
object  
>  !
.! "
Success" )
() *
new* -
object. 4
(4 5
)5 6
)6 7
;7 8
} 	
} 
} â
rD:\Repos\BuySmart\BuySmart\Application\CommandHandlers\UserClientCommandHandlers\CreateUserClientCommandHandler.cs
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
readonly !
IUserClientRepository . 
userClientRepository/ C
;C D
private 
readonly 
IMapper  
mapper! '
;' (
public *
CreateUserClientCommandHandler -
(- .!
IUserClientRepository. C 
userClientRepositoryD X
,X Y
IMapperZ a
mapperb h
)h i
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
await  
userClientRepository 3
.3 4
AddAsync4 <
(< =

userClient= G
)G H
;H I
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
}"" …
vD:\Repos\BuySmart\BuySmart\Application\CommandHandlers\UserBusinessCommandHandlers\UpdateUserBusinessCommandHandler.cs
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
readonly #
IUserBusinessRepository 0"
userBusinessRepository1 G
;G H
private 
readonly 
IMapper  
mapper! '
;' (
public ,
 UpdateUserBusinessCommandHandler /
(/ 0#
IUserBusinessRepository0 G"
userBusinessRepositoryH ^
,^ _
IMapper` g
mapperh n
)n o
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
}(( ä
vD:\Repos\BuySmart\BuySmart\Application\CommandHandlers\UserBusinessCommandHandlers\DeleteUserBusinessCommandHandler.cs
	namespace 	
Application
 
. 
CommandHandlers %
.% &'
UserBusinessCommandHandlers& A
{ 
public		 

class		 ,
 DeleteUserBusinessCommandHandler		 1
:		2 3
IRequestHandler		4 C
<		C D%
DeleteUserBusinessCommand		D ]
,		] ^
Result		_ e
<		e f
object		f l
>		l m
>		m n
{

 
private 
readonly #
IUserBusinessRepository 0"
userBusinessRepository1 G
;G H
public ,
 DeleteUserBusinessCommandHandler /
(/ 0#
IUserBusinessRepository0 G"
userBusinessRepositoryH ^
)^ _
{ 	
this 
. "
userBusinessRepository '
=( )"
userBusinessRepository* @
;@ A
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
(0 1%
DeleteUserBusinessCommand1 J
requestK R
,R S
CancellationTokenT e
cancellationTokenf w
)w x
{ 	
var 
user 
= 
await "
userBusinessRepository 3
.3 4
GetByIdAsync4 @
(@ A
requestA H
.H I
UserIdI O
)O P
;P Q
if 
( 
user 
== 
null 
) 
{ 
return 
Result 
< 
object $
>$ %
.% &
Failure& -
(- .
$str. >
)> ?
;? @
} 
await "
userBusinessRepository (
.( )
DeleteAsync) 4
(4 5
request5 <
.< =
UserId= C
)C D
;D E
return 
Result 
< 
object  
>  !
.! "
Success" )
() *
new* -
object. 4
(4 5
)5 6
)6 7
;7 8
} 	
} 
} ´
vD:\Repos\BuySmart\BuySmart\Application\CommandHandlers\UserBusinessCommandHandlers\CreateUserBusinessCommandHandler.cs
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
readonly #
IUserBusinessRepository 0"
userBusinessRepository1 G
;G H
private 
readonly 
IMapper  
mapper! '
;' (
public ,
 CreateUserBusinessCommandHandler /
(/ 0#
IUserBusinessRepository0 G"
userBusinessRepositoryH ^
,^ _
IMapper` g
mapperh n
)n o
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
await "
userBusinessRepository 5
.5 6
AddAsync6 >
(> ?
userBusiness? K
)K L
;L M
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
}!! ä
zD:\Repos\BuySmart\BuySmart\Application\CommandHandlers\ReviewBusinessCommandHandlers\UpdateReviewBusinessCommandHandler.cs
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
}'' ¿
zD:\Repos\BuySmart\BuySmart\Application\CommandHandlers\ReviewBusinessCommandHandlers\DeleteReviewBusinessCommandHandler.cs
	namespace 	
Application
 
. 
CommandHandlers %
.% &)
ReviewBusinessCommandHandlers& C
{ 
public		 

class		 .
"DeleteReviewBusinessCommandHandler		 3
:		4 5
IRequestHandler		6 E
<		E F'
DeleteReviewBusinessCommand		F a
,		a b
Result		c i
<		i j
object		j p
>		p q
>		q r
{

 
private 
readonly %
IReviewBusinessRepository 2$
reviewBusinessRepository3 K
;K L
public .
"DeleteReviewBusinessCommandHandler 1
(1 2%
IReviewBusinessRepository2 K$
ReviewBusinessRepositoryL d
)d e
{ 	
this 
. $
reviewBusinessRepository )
=* +$
ReviewBusinessRepository, D
;D E
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
(0 1'
DeleteReviewBusinessCommand1 L
requestM T
,T U
CancellationTokenV g
cancellationTokenh y
)y z
{ 	
var 
reviewBusiness 
=  
await! &$
reviewBusinessRepository' ?
.? @
GetByIdAsync@ L
(L M
requestM T
.T U
ReviewIdU ]
)] ^
;^ _
if 
( 
reviewBusiness 
== !
null" &
)& '
{ 
return 
Result 
< 
object $
>$ %
.% &
Failure& -
(- .
$str. @
)@ A
;A B
} 
await $
reviewBusinessRepository *
.* +
DeleteAsync+ 6
(6 7
request7 >
.> ?
ReviewId? G
)G H
;H I
return 
Result 
< 
object  
>  !
.! "
Success" )
() *
new* -
object. 4
(4 5
)5 6
)6 7
;7 8
} 	
} 
} ƒ
zD:\Repos\BuySmart\BuySmart\Application\CommandHandlers\ReviewBusinessCommandHandlers\CreateReviewBusinessCommandHandler.cs
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
}"" ﬁ
lD:\Repos\BuySmart\BuySmart\Application\CommandHandlers\ProductCommandHandlers\UpdateProductCommandHandler.cs
	namespace 	
Application
 
. 
CommandHandlers %
.% &"
ProductCommandHandlers& <
{ 
public 

class '
UpdateProductCommandHandler ,
:- .
IRequestHandler/ >
<> ? 
UpdateProductCommand? S
,S T
ResultU [
<[ \
object\ b
>b c
>c d
{ 
private 
readonly 
IMapper  
mapper! '
;' (
private 
readonly 
IProductRepository +

repository, 6
;6 7
public '
UpdateProductCommandHandler *
(* +
IMapper+ 2
mapper3 9
,9 :
IProductRepository; M

repositoryN X
)X Y
{ 	
this 
. 
mapper 
= 
mapper  
;  !
this 
. 

repository 
= 

repository (
;( )
} 	
public 
async 
Task 
< 
Result  
<  !
object! '
>' (
>( )
Handle* 0
(0 1 
UpdateProductCommand1 E
requestF M
,M N
CancellationTokenO `
cancellationTokena r
)r s
{ 	
var 
product 
= 
await 

repository  *
.* +
GetByIdAsync+ 7
(7 8
request8 ?
.? @
	ProductId@ I
)I J
;J K
if 
( 
product 
== 
null 
)  
{ 
return 
Result 
< 
object $
>$ %
.% &
Failure& -
(- .
$str. A
)A B
;B C
} 
product 
= 
mapper 
. 
Map  
<  !
Product! (
>( )
() *
request* 1
)1 2
;2 3
var!! 
result!! 
=!! 
await!! 

repository!! )
.!!) *
UpdateAsync!!* 5
(!!5 6
product!!6 =
)!!= >
;!!> ?
if"" 
("" 
result"" 
."" 
	IsSuccess""  
)""  !
{## 
return$$ 
Result$$ 
<$$ 
object$$ #
>$$# $
.$$$ %
Success$$% ,
($$, -
result$$- 3
.$$3 4
Data$$4 8
)$$8 9
;$$9 :
}%% 
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
})) 	
}** 
}++ °
lD:\Repos\BuySmart\BuySmart\Application\CommandHandlers\ProductCommandHandlers\DeleteProductCommandHandler.cs
	namespace 	
Application
 
. 
CommandHandlers %
.% &"
ProductCommandHandlers& <
{ 
public 

class '
DeleteProductCommandHandler ,
:- .
IRequestHandler/ >
<> ? 
DeleteProductCommand? S
,S T
ResultU [
<[ \
object\ b
>b c
>c d
{ 
private 
readonly 
IProductRepository +

repository, 6
;6 7
public '
DeleteProductCommandHandler *
(* +
IProductRepository+ =

repository> H
)H I
{ 	
this 
. 

repository 
= 

repository (
;( )
} 	
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
DeleteProductCommand1 E
requestF M
,M N
CancellationTokenO `
cancellationTokena r
)r s
{ 	
var 
product 
= 
await 

repository  *
.* +
GetByIdAsync+ 7
(7 8
request8 ?
.? @
	ProductId@ I
)I J
;J K
if 
( 
product 
== 
null 
)  
{ 
return 
Result 
< 
object $
>$ %
.% &
Failure& -
(- .
$str. A
)A B
;B C
} 
await 

repository 
. 
DeleteAsync (
(( )
request) 0
.0 1
	ProductId1 :
): ;
;; <
return 
Result 
< 
object  
>  !
.! "
Success" )
() *
new* -
object. 4
(4 5
)5 6
)6 7
;7 8
}   	
}!! 
}"" ¢%
lD:\Repos\BuySmart\BuySmart\Application\CommandHandlers\ProductCommandHandlers\CreateProductCommandHandler.cs
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
}55 ◊
fD:\Repos\BuySmart\BuySmart\Application\CommandHandlers\CartCommandHandlers\CreateCartCommandHandler.cs
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
} Ú
nD:\Repos\BuySmart\BuySmart\Application\CommandHandlers\BusinessCommandHandlers\UpdateBusinessCommandHandler.cs
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
}"" ﬁ
nD:\Repos\BuySmart\BuySmart\Application\CommandHandlers\BusinessCommandHandlers\DeleteBusinessCommandHandler.cs
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
DeleteBusinessCommandHandler		 -
:		. /
IRequestHandler		0 ?
<		? @!
DeleteBusinessCommand		@ U
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
IBusinessRepository ,
businessRepository- ?
;? @
public (
DeleteBusinessCommandHandler +
(+ ,
IBusinessRepository, ?
businessRepository@ R
)R S
{ 	
this 
. 
businessRepository #
=$ %
businessRepository& 8
;8 9
} 	
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
(0 1!
DeleteBusinessCommand1 F
requestG N
,N O
CancellationTokenP a
cancellationTokenb s
)s t
{ 	
var 
business 
= 
await  
businessRepository! 3
.3 4
GetByIdAsync4 @
(@ A
requestA H
.H I

BusinessIDI S
)S T
;T U
if 
( 
business 
== 
null  
)  !
{ 
return 
Result 
< 
object $
>$ %
.% &
Failure& -
(- .
$str. B
)B C
;C D
} 
await 
businessRepository $
.$ %
DeleteAsync% 0
(0 1
request1 8
.8 9

BusinessID9 C
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
} Ø
nD:\Repos\BuySmart\BuySmart\Application\CommandHandlers\BusinessCommandHandlers\CreateBusinessCommandHandler.cs
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
}!! 