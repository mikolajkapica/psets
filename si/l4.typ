#import "../lib.typ": *
#show: styling

sztuczna inteligencja - lista 4 - Rachunek predykatów

Problem

Następujące zdania matematyczne zapisać w formalnym języku arytmetyki (ze stałymi 0 i 1 oraz funkcjami dwuargumentowymi i zapisywanymi w składni infiksowej).  Dla wygody można definiować pomocnicze predykaty (np Pierwsza(x) albo Dzieli(a, b)), ale oczywiście definicję każdego z nich trzeba zapisać formalnie.

Predykaty:

1. $"Dzieli"(a, b) <=> exists n (b = a dot n)$
2. $"Parzysta"(x) <=> "Dzieli"(1 + 1, x)$
3. $"MniejszaRowna"(a, b) <=> exists k (b = a + k)$
4. $"Mniejsza"(a, b) <=> "MniejszaRowna"(a, b) and not(a = b)$
5. $"Pierwsza"(x) <=> not(x = 1) and forall d ("Dzieli"(d, x) => (d = 1 or d = x))$
6. $"NWD"(a, b, c) <=> "Dzieli"(a, b) and "Dzieli"(a, c) and forall d (("Dzieli"(d, b) and "Dzieli"(d, c)) => "MniejszaRowna"(d, a))$
7. $"Kwadrat"(x) <=> exists k (x = k dot k)$

Zdania:

a) Pewne liczby są parzyste, a inne nie są.

$(exists n)("Parzysta"(n)) and (exists n)(not "Parzysta"(n))$

b) Liczba a jest dzielnikiem liczby b.

$"Dzieli"(a, b)$

c) Liczba a jest największym wspólnym dzielnikiem liczb bi c, chyba, że jest parzysta.

$not "Parzysta"(a) => "NWD"(a, b, c)$

d) Żadna liczba parzysta nie jest mniejsza od każdej liczby pierwszej.

$not exists x ("Parzysta"(x) and forall y ("Pierwsza"(y) => "Mniejsza"(x, y)))$

e) Liczba a jest mniejsza lub równa liczbie b.

$"MniejszaRowna"(a, b)$

f) Liczba a jest pierwsza.

$"Pierwsza"(a)$

g) Zbiór liczb pierwszych jest nieskończony.

$forall x exists y ("Mniejsza"(x, y) and "Pierwsza"(y))$

h) Pewne liczby są kwadratami, a inne nie są.

$(exists x "Kwadrat"(x)) and (exists y not "Kwadrat"(y))$

i) Nie każda liczba jest parzysta.

$not forall x "Parzysta"(x)$

j) Liczby ziy mają te same dzielniki pierwsze.

$forall d ("Pierwsza"(d) => ("Dzieli"(d, z) <=> "Dzieli"(d, y)))$

k) Warunkiem koniecznym na to, aby n było nieparzyste, jest aby n było podzielne przez 6.

$not "Parzysta"(n) => "Dzieli"(1 + 1 + 1 + 1 + 1 + 1, n)$

l) Prawie wszystkie liczby naturalne (wszystkie z wyjątkiem skończenie wielu) są parzyste.

$exists k forall n ("Mniejsza"(k, n) => "Parzysta"(n))$

m) Liczba a jest resztą z dzielenia liczby b przez c.

$exists q (b = c dot q + a) and "Mniejsza"(a, c)$

Problem

W języku arytmetyki liczb rzeczywistych (ze stałymi 0 i 1, funkcjami
dwuargumentowymi $dot$ i $plus$, predykatem $<=$) rozszerzonym o symbol
funkcyjny $f$ zapisać następujące zdania/formuły:

Predykaty:
1. $a < b <=> a <= b and not (a = b)$

a) Liczba a jest dodatnia.

$0 < a$

b) Funkcja f nie jest ciągła w punkcie a.


$not(
  (forall epsilon)(epsilon > 0 => (exists delta)(delta > 0 => ((forall a_d)
        (|a_d - a| < delta => |f(a) - f(a_d)| < epsilon))))
)$

Trzeba usunąć wartość bezwględną, minus, odwrócić nierówności.

c) Uporządkowanie jest gęste.

$forall x forall y (x < y => exists z (x < z and z < y))$

d) Funkcja f ma co najmniej dwa punkty stałe.

$(exists x_1) ((exists x_2) (not(x_1 = x_2) and f(x_1) = x_1 and f(x_2) = x_2$

e) Liczba a jest kresem górnym zbioru punktów stałych funkcji f.

$(forall x)(f(x) = x => x <= a) and (forall u)((forall x)(f(x) = x => x < u) => a
  <= u)$


Problem

W tym zadaniu użyjemy rachunku predykatów, żeby opisać relacje pokrewieństwa.
Przyjmiemy następujące predykaty wyjściowe: $"Kobieta"(x)$ oznacza, że z jest
kobietą; $"Rodzic"( , y)$ oznacza, że jest rodzicem $y$.

a) Zdefiniować predykaty Mezczyzna (x) (przyjmujemy upraszczające założenie, że są dwie płcie i każdy ma dokładnie jedną z nich), $"Ojciec"(x,y)$, $"Matka"(x,y)$, "Dziecko"(x,y).

b) Zdefiniujmy predykat $"Rodzenstwo"(x, y)$ poprzez aksjomat
$forall_(x,y) ("Rodzenstwo"(x,y) <=> exists_r ("Rodzic"(r,x) and "Rodzic"(r,y)))$

i. Uzasadnić, że $forall_(x,y) ("Rodzenstwo"(x, y) "..." "Rodzenstwo"(y, x))$

ii. Uzasadnić, że $forall_x "Rodzenstwo"(x,x)$. Jak skorygować definicję predykatu "Rodzenstwo", aby uniemożliwić ten wynik?

c) Sprawdzić, jaki rodzaj relacji oznacza sformułowanie m-th cousin n times removed" (np. third cousin twice removed), zapisać odpowiedni predykat.

Problem
Opisać następujące problemy za pomocą rachunku predykatów (zdefiniować przydatne predykaty i zapisać odpowiednie formuły).  W razie potrzeby można korzystać z predykatów, stałych i funkcji arytmetycznych (np. $x < y$ czy $y = x + 7$) bez ich definiowania.
a) Zasada szufladkowa.
b) problem n-kolorowania grafów (czyli przypisania do każdego wierzchołka grafu jednego z n kolorów, tak aby każda para sąsiadujących wierzchołków miała różny kolor)
c) problem 8 hetmanów (należy rozstawić na szachownicy 8 hetmanów tak, aby żadne dwa nie zagrażały sobie nawzajem).

Problem

#let inv = "inv"

Rozważmy teorię języka formalnego ze stałą e, funkcją dwuargumentową (zapisywaną w składni infiksowej) oraz funkcją jednoargumentową inv i następującymi aksjomatami:
- $forall_x forall_y forall_z (x dot y) dot z = x dot (y dot z)$
- $forall_x x dot e = x$
- $forall_x x dot inv(x) = e$

a) Podać kilka różnych modeli tej teorii.


+ $ZZ, e=0, x dot y = x + y, inv(x) = -x$
+ $RR \\ 0, e=1, x dot y = x dot y, inv(x) = 1/x$
+ $0, e=0, x dot y = 0, inv(x) = 0$
+ $MM^(n, m), e = II, x dot y = x y, inv(x) = x^(-1)$

b) Czy da się w tej teorii udowodnić twierdzenie $forall_x forall_y x dot y = y dot x$?

dla macierzy nie zachodzi wiec dla teorii też.

c) Udowodnic twierdzenie $forall_x e dot x = x$ (formalnie, korzystając tylko z aksjomatów teorii oraz z aksjomatów i reguł wnioskowania rachunku zdań i predykatów podanych na wykładzie i listach lub wyprowadzonych wcześniej).

ogarnijmy $inv(x) dot x = e$

wstawmy do pierwszego $(inv(x) dot x) dot inv(x) = inv(x) dot (x dot inv(x)) =
inv(x) dot e$

przemnóżmy przez $x = inv(inv(x))$

$(inv(x) dot x) dot inv(x) dot (inv(inv(x)) = inv(x) dot e dot inv(inv(x))$

$(inv(x) dot x) dot e = inv(x) dot inv(inv(x))$

#box(stroke: 1pt + gray)[
  #pad(8pt, bottom: 10pt)[
    $(inv(x) dot x) = e$
  ]
]

$e dot x = (e dot x) dot e = ((x dot inv(x)) dot x) dot e = (x dot (inv(x) dot x)) dot e = (x dot e) dot e = (x dot e) = x$

Zatem $e dot x = x$.













Problem
Formuła rachunku predykatów jest spełnialna, jeśli jest prawdziwa w pewnej strukturze, a jest tautologią, jeśli jest prawdziwa we wszystkich strukturach.  Dla każdej z poniższych formuł ustalić, czy są spełnialne i czy są tautologiami.
a) $(forall_x exists_y P(x,y)) => (exists_x forall_y P(x,y))$
b) $(forall_x exists_y P(x,y)) => (exists_y forall_x P(x,y))$
c) (P(x,y))
(P( ,y))
d) $(exists_x forall_y P(x,y)) => (forall_x exists_y P(x,y))$
e) $(forall x P(x) => Q(y)) => forall x (P(x) => Q(y))$
f) $(P(x) => exists y Q(y)) => exists y (P(x) => Q(y))$
g) $(forall x P(x) => Q(y)) => exists x (P(x) => Q(y))$
h) $(forall x P(x) => Q(x)) => exists x (P(x) => Q(x))$

Problem
Rozważmy aksjomatyzację rachunku zdań z tymi samymi aksjomatami co na poprzedniej liście i z trzema aksjomatami dotyczącymi kwantyfikatorów:
a) $forall_x (A => B) => ((exists_x A) => B)$
b) $forall_x A => A[x/t]$, gdzie t jest dowolnym termem, zaś $A[x/t]$ to formuła A, w której wszystkie wolne wystąpienia zastępujemy przez term t (ograniczenie: wt nie może występować żadna zmienna Y, która jest w A objęta kwantyfikatorem Qy).
c) $exists x A <=> not forall_x not A$
Uzasadnić w tym systemie formalnym prawa De Morgana, czyli
$not exists_x A <=> forall_x not A$ i $not forall_x A <=> exists_x not A$
Uwaga: możemy korzystać tylko z aksjomatów i twierdzeń podanych tutaj i na poprzedniej liście (czyli z aksjomatów rachunku zdań, reguły modus ponens oraz twierdzenia o dedukcji), a także z pomocniczych twierdzeń i reguł dedukcji, które z nich wyprowadzimy (lub wyprowadziliśmy);  w przypadku formuł dotyczących czystego rachunku zdań możemy pominąć niektóre kroki a nawet uznać je za oczywiste, skupmy się na przejściach dotyczących kwantyfikatorów.
