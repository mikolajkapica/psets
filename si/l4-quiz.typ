#import "../lib.typ": *
#show: styling

sztuczna inteligencja - lista 4 - Rachunek predykatów

Zadanie

Następujące zdania matematyczne zapisać w formalnym języku arytmetyki (ze stałymi 0 i 1 oraz funkcjami dwuargumentowymi i zapisywanymi w składni infiksowej).  Dla wygody można definiować pomocnicze predykaty (np Pierwsza(x) albo Dzieli(a, b)), ale oczywiście definicję każdego z nich trzeba zapisać formalnie.

Zdania:

a) Pewne liczby są parzyste, a inne nie są.

#let Parzysta = "Parzysta"

$
  Parzysta(x) <=> (exists n) ((1+1) dot n = x)
$

$
  (exists x) (exists y) Parzysta(x) and not Parzysta(y)
$

b) Liczba a jest dzielnikiem liczby b.

#let Dzieli = "Dzieli"
#let Mniejsza = "Mniejsza"

$
  Mniejsza(a, b) <=> (exists n) (n != 0 and a + n = b) \
  Dzieli(a, b) <=> (exists n) (a dot n = b) \
$

$
  Dzieli(a, b)
$

c) Liczba a jest największym wspólnym dzielnikiem liczb b i c, chyba, że jest parzysta.

#let NWD = "NWD"

$
  NWD(a, b, c) <=> Dzieli(a, b) and Dzieli(a, c) and (forall n) (Dzieli(n, b) and Dzieli(n, c) => not Mniejsza(a, n))
$

$
  NWD(a, b, c) or Parzysta(a)
$

d) Żadna liczba parzysta nie jest mniejsza od każdej liczby pierwszej.

$(star star star)$

$
  Pr(a) <=> (a != 0) and (a != 1) and (forall n) (Dzieli(n, a) => n = 1 or n = a)
$


$
  (forall n) (Parzysta(n) => (exists m) (Pr(m) => not Mniejsza(n, m)))
$

e) Liczba a jest mniejsza lub równa liczbie b.

$
  Mniejsza(a, b) or (a = b)
$

f) Liczba a jest pierwsza.

$
  Pr(a)
$

g) Zbiór liczb pierwszych jest nieskończony.

$
  (forall n) (exists m) (Mniejsza(n, m) and Pr(m))
$

h) Pewne liczby są kwadratami, a inne nie są.

$
  (exists n) (exists m) (m dot m = n) and (exists n) (not exists m) (m dot m = n)
$

i) Nie każda liczba jest parzysta.

$
  (exists n) (not Parzysta(n))
$

j) Liczby z i y mają te same dzielniki pierwsze.

$
  (forall n) ((Dzieli(n, z) and Pr(n) => Dzieli(n, y)) and (Dzieli(n, y) and Pr(n) => Dzieli(n, z)))
$

k) Warunkiem koniecznym na to, aby n było nieparzyste, jest aby n było podzielne przez 6.

$
  not Dzieli(6, n) => not not Parzysta(n)
$

lub

$
  not Parzysta(n) => Dzieli(6, n)
$

l) Prawie wszystkie liczby naturalne (wszystkie z wyjątkiem skończenie wielu) są parzyste.

$
  (exists n) (forall m) (m > n => Parzysta(m))
$

m) Liczba a jest resztą z dzielenia liczby b przez c.

$
  c != 0 and Mniejsza(a, c) and (exists n) (a + c dot n = b)
$

Zadanie

W języku arytmetyki liczb rzeczywistych (ze stałymi 0 i 1, funkcjami
dwuargumentowymi $dot$ i $plus$, predykatem $<=$) rozszerzonym o symbol
funkcyjny $f$ zapisać następujące zdania/formuły:

a) Liczba a jest dodatnia.

#let Eq = "Eq"

$
  Eq(a, b) <=> a <= b and b <= a
$
$
  Mniejsza(a, b) <=> a <= b and not Eq(a, b)
$

$
  not Eq(0, a) and 0 <= a
$


b) Funkcja f nie jest ciągła w punkcie a.

$
  not (forall epsilon) (Mniejsza(0, epsilon) => \
    (exists delta) (Mniejsza(0, delta) and (forall x) ((Mniejsza(x, a + delta) and Mniejsza(a, x + delta)) \
        => (Mniejsza(f(x), f(a) + epsilon) and Mniejsza(f(a), f(x) + epsilon)))))
$

c) Uporządkowanie jest gęste.

$
  (forall x) (forall y) (Mniejsza(x, y) => (exists z) (Mniejsza(x, z) and Mniejsza(z, y)))
$

d) Funkcja f ma co najmniej dwa punkty stałe.

$
  (exists x) (exists y) (not Eq(x, y) and f(x) = x and f(y) = y)
$

e) Liczba a jest kresem górnym zbioru punktów stałych funkcji f.

$(star star star)$


a jest ograniczeniem górnym
$
  (forall x) (Eq(f(x), x) => x <= a) and
$

każde inne ograniczenie górne jest większe

$
  (forall x) (((forall y) (Eq(f(y), y) => y <= x)) => a <= x)
$

Zadanie

#let Kobieta = "Kobieta"
#let Rodzic = "Rodzic"
#let Ojciec = "Ojciec"
#let Matka = "Matka"
#let Dziecko = "Dziecko"
#let Rodzenstwo = "Rodzenstwo"
#let Mezczyzna = "Mezczyzna"

W tym zadaniu użyjemy rachunku predykatów, żeby opisać relacje pokrewieństwa.
Przyjmiemy następujące predykaty wyjściowe: $Kobieta(x)$ oznacza, że z jest
kobietą; $Rodzic(, y)$ oznacza, że jest rodzicem $y$.

a) Zdefiniować predykaty $Mezczyzna(x)$ (przyjmujemy upraszczające założenie, że są dwie płcie i każdy ma dokładnie jedną z nich), $Ojciec(x, y)$, $Matka(x, y)$, $Dziecko(x, y)$.

$
  (forall x) (Mezczyzna(x) <=> not Kobieta(x))
$

$
  (forall x) (forall y) (Ojciec(x, y) <=> Rodzic(x, y) and Mezczyzna(x))
$

$
  (forall x) (forall y) (Matka(x, y) <=> Rodzic(x, y) and Kobieta(x))
$

$
  (forall x) (forall y) (Dziecko(x, y) <=> Rodzic(y, x))
$

b) Zdefiniujmy predykat $Rodzenstwo(x, y)$ poprzez aksjomat

$ forall_(x,y) (Rodzenstwo(x, y) <=> exists_r (Rodzic(r, x) and Rodzic(r, y))) $

i. Uzasadnić, że $forall_(x,y) (Rodzenstwo(x, y) <=> Rodzenstwo(y, x))$

Ustalmy $x, y$. Wtedy:

$
  Rodzenstwo(x, y) & <=> exists_r (Rodzic(r, x) and Rodzic(r, y)) \
                   & <=> exists_r (Rodzic(r, y) and Rodzic(r, x)) \
                   & <=> Rodzenstwo(y, x)
$

ii. Uzasadnić, że $forall_x Rodzenstwo(x, x)$. Jak skorygować definicję predykatu $Rodzenstwo$, aby uniemożliwić ten wynik?

Ustalmy $x$. Wtedy:

$
  Rodzenstwo(x, x) & <=> exists_r (Rodzic(r, x) and Rodzic(r, x)) \
                   & <=> exists_r (Rodzic(r, x)) \
$

Jeśli założymy, że każda osoba ma rodzica to jest to prawda.

Aby tego uniknąć, możemy dodać dodatkowy warunek:

$
  forall_(x,y) (Rodzenstwo (x, y) <=> x != y and exists_r (Rodzic(r, x) and Rodzic(r, y)))
$

c) Sprawdzić, jaki rodzaj relacji oznacza sformułowanie m-th cousin n times removed" (np. third cousin twice removed), zapisać odpowiedni predykat.


Zadanie
Opisać następujące problemy za pomocą rachunku predykatów (zdefiniować przydatne predykaty i zapisać odpowiednie formuły).  W razie potrzeby można korzystać z predykatów, stałych i funkcji arytmetycznych (np. $x < y$ czy $y = x + 7$) bez ich definiowania.

a) Zasada szufladkowa.

b) problem n-kolorowania grafów (czyli przypisania do każdego wierzchołka grafu jednego z n kolorów, tak aby każda para sąsiadujących wierzchołków miała różny kolor)

c) problem 8 hetmanów (należy rozstawić na szachownicy 8 hetmanów tak, aby żadne dwa nie zagrażały sobie nawzajem).

Zadanie 6
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
