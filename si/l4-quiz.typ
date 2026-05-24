#import "../lib.typ": *
#show: styling
#set enum(
  full: true,
  numbering: (..nums) => {
    let ns = nums.pos()
    if ns.len() == 1 {
      numbering("a)", ns.last())
    } else if ns.len() == 2 {
      numbering("i.", ns.last())
    } else {
      numbering("1.", ns.last())
    }
  },
)

sztuczna inteligencja - lista 4 - Rachunek predykatów

Zadanie

Następujące zdania matematyczne zapisać w formalnym języku arytmetyki (ze stałymi 0 i 1 oraz funkcjami dwuargumentowymi i zapisywanymi w składni infiksowej).  Dla wygody można definiować pomocnicze predykaty (np Pierwsza(x) albo Dzieli(a, b)), ale oczywiście definicję każdego z nich trzeba zapisać formalnie.

Zdania:

+ Pewne liczby są parzyste, a inne nie są.

  #let Parzysta = "Parzysta"

  $
    Parzysta(x) <=> (exists n) ((1+1) dot n = x)
  $

  $
    (exists x) (exists y) Parzysta(x) and not Parzysta(y)
  $

+ Liczba a jest dzielnikiem liczby b.

  #let Dzieli = "Dzieli"
  #let Mniejsza = "Mniejsza"

  $
    Mniejsza(a, b) <=> (exists n) (n != 0 and a + n = b) \
    Dzieli(a, b) <=> (exists n) (a dot n = b) \
  $

  $
    Dzieli(a, b)
  $

+ Liczba a jest największym wspólnym dzielnikiem liczb b i c, chyba, że jest parzysta.

  #let NWD = "NWD"

  $
    NWD(a, b, c) <=> Dzieli(a, b) and Dzieli(a, c) and (forall n) (Dzieli(n, b) and Dzieli(n, c) => not Mniejsza(a, n))
  $

  $
    NWD(a, b, c) or Parzysta(a)
  $

+ Żadna liczba parzysta nie jest mniejsza od każdej liczby pierwszej.

  $(star star star)$

  $
    Pr(a) <=> (a != 0) and (a != 1) and (forall n) (Dzieli(n, a) => n = 1 or n = a)
  $


  $
    (forall n) (Parzysta(n) => (exists m) (Pr(m) => not Mniejsza(n, m)))
  $

+ Liczba a jest mniejsza lub równa liczbie b.

  $
    Mniejsza(a, b) or (a = b)
  $

+ Liczba a jest pierwsza.

  $
    Pr(a)
  $

+ Zbiór liczb pierwszych jest nieskończony.

  $
    (forall n) (exists m) (Mniejsza(n, m) and Pr(m))
  $

+ Pewne liczby są kwadratami, a inne nie są.

  $
    (exists n) (exists m) (m dot m = n) and (exists n) (not exists m) (m dot m = n)
  $

+ Nie każda liczba jest parzysta.

  $
    (exists n) (not Parzysta(n))
  $

+ Liczby z i y mają te same dzielniki pierwsze.

  $
    (forall n) ((Dzieli(n, z) and Pr(n) => Dzieli(n, y)) and (Dzieli(n, y) and Pr(n) => Dzieli(n, z)))
  $

+ Warunkiem koniecznym na to, aby n było nieparzyste, jest aby n było podzielne przez 6.

  $
    not Dzieli(6, n) => not not Parzysta(n)
  $

  lub

  $
    not Parzysta(n) => Dzieli(6, n)
  $

+ Prawie wszystkie liczby naturalne (wszystkie z wyjątkiem skończenie wielu) są parzyste.

  $
    (exists n) (forall m) (m > n => Parzysta(m))
  $

+ Liczba a jest resztą z dzielenia liczby b przez c.

  $
    c != 0 and Mniejsza(a, c) and (exists n) (a + c dot n = b)
  $

Zadanie

W języku arytmetyki liczb rzeczywistych (ze stałymi 0 i 1, funkcjami
dwuargumentowymi $dot$ i $plus$, predykatem $<=$) rozszerzonym o symbol
funkcyjny $f$ zapisać następujące zdania/formuły:

+ Liczba a jest dodatnia.

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


+ Funkcja f nie jest ciągła w punkcie a.

  $
    not (forall epsilon) (Mniejsza(0, epsilon) => \
      (exists delta) (Mniejsza(0, delta) and (forall x) ((Mniejsza(x, a + delta) and Mniejsza(a, x + delta)) \
          => (Mniejsza(f(x), f(a) + epsilon) and Mniejsza(f(a), f(x) + epsilon)))))
  $

+ Uporządkowanie jest gęste.

  $
    (forall x) (forall y) (Mniejsza(x, y) => (exists z) (Mniejsza(x, z) and Mniejsza(z, y)))
  $

+ Funkcja f ma co najmniej dwa punkty stałe.

  $
    (exists x) (exists y) (not Eq(x, y) and f(x) = x and f(y) = y)
  $

+ Liczba a jest kresem górnym zbioru punktów stałych funkcji f.

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

+ Zdefiniować predykaty $Mezczyzna(x)$ (przyjmujemy upraszczające założenie, że są dwie płcie i każdy ma dokładnie jedną z nich), $Ojciec(x, y)$, $Matka(x, y)$, $Dziecko(x, y)$.

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

+ Zdefiniujmy predykat $Rodzenstwo(x, y)$ poprzez aksjomat

  $ forall_(x,y) (Rodzenstwo(x, y) <=> exists_r (Rodzic(r, x) and Rodzic(r, y))) $

  + Uzasadnić, że $forall_(x,y) (Rodzenstwo(x, y) <=> Rodzenstwo(y, x))$

    Ustalmy $x, y$. Wtedy:

    $
      Rodzenstwo(x, y) & <=> exists_r (Rodzic(r, x) and Rodzic(r, y)) \
                       & <=> exists_r (Rodzic(r, y) and Rodzic(r, x)) \
                       & <=> Rodzenstwo(y, x)
    $

  + Uzasadnić, że $forall_x Rodzenstwo(x, x)$. Jak skorygować definicję predykatu $Rodzenstwo$, aby uniemożliwić ten wynik?

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

+ Sprawdzić, jaki rodzaj relacji oznacza sformułowanie m-th cousin n times removed" (np. third cousin twice removed), zapisać odpowiedni predykat.


Zadanie
Opisać następujące problemy za pomocą rachunku predykatów (zdefiniować przydatne predykaty i zapisać odpowiednie formuły).  W razie potrzeby można korzystać z predykatów, stałych i funkcji arytmetycznych (np. $x < y$ czy $y = x + 7$) bez ich definiowania.

+ Zasada szufladkowa.

  Jeśli mamy $n$ szufladek i $m$ przedmiotów, przy czym $m > n > 0$ to przynejmniej jedna szufladka ma przynajmniej dwa przedmioty.

  #let PwS = "PwS"

  $PwS(a, b)$ (przedmiot a w szufladzie b)

  Zakładam, że kwantyfikujemy po naturalnych

  $
    (forall m) (forall n) ((m > n and (forall a) (a < m => (exists s) (s < n and PwS(a, s)))) \
      => ((exists s) (s < n and ((exists a) (a < m and ((exists b) (b < m and a != b and PwS(a, s) and PwS(b, s))))))))
  $

+ problem n-kolorowania grafów (czyli przypisania do każdego wierzchołka grafu jednego z n kolorów, tak aby każda para sąsiadujących wierzchołków miała różny kolor)

  #let Edge = "Edge"
  #let Color = "Color"

  $Edge(a, b)$ (krawędź pomiędzy węzłem a i b)

  $Color(a, n)$ (węzeł a ma n-ty kolor)

  $
    (n > 0) and ((forall a) ((a < w) => (exists k) (k < n and Color(a, k) and (forall k') ((k' < n and k' != k) => not Color(a, k'))))) \
    and (forall a) (forall b) (a < b and b < w and Edge(a, b) => (exists k) (exists l) (k < n and and l < n and k != l and Color(a, k) and Color(b, l))))
  $

+ problem 8 hetmanów (należy rozstawić na szachownicy 8 hetmanów tak, aby żadne dwa nie zagrażały sobie nawzajem).

  #let Hetman = "Hetman"

  $Hetman(x, y)$ (hetman w x-tym rzędzie i y-tej kolumnie)

  $
    (exists r) (exists c) (r < 8 and c < 8 and Hetman(r, c))
  $

Zadanie 6
Formuła rachunku predykatów jest spełnialna, jeśli jest prawdziwa w pewnej strukturze, a jest tautologią, jeśli jest prawdziwa we wszystkich strukturach.  Dla każdej z poniższych formuł ustalić, czy są spełnialne i czy są tautologiami.

+ $(forall_x exists_y P(x,y)) => (exists_x forall_y P(x,y))$

  Spełnialność.

  $
    S = {a} \
    sigma = {P subset S^2} \
    I: P(a,a) equiv top
  $

  Wtedy możemy wziąć tylko $a$, $a$ z obu stron. $P(a,a) = top$, więc $top => top$ a to jest prawda.

  Tautologia.

  $
    S = {a, b} \
    sigma = {P subset S^2} \
    I: P(a, a) equiv P(b, b) equiv top , P(a,b) equiv P(b, a) equiv bot
  $

  Dla każdego $x$ znajdziemy $y = x$, taki że $P(x,y) = top$. Jednak dla wybranego $x$ będzie $y != x$, a zatem $P(x,y) = bot$. Zatem $top => bot equiv bot$.

+ $(forall_x exists_y P(x,y)) => (exists_y forall_x P(x,y))$

  to samo co w a

+ $(exists_x forall_y P(x,y)) => (forall_y exists_x P(x, y))$

  To jest tautologia. Lewa strona to założenie. Zajmijmy się prawą stroną. Ustalmy y. Wiemy że istnieje x taki że dla wszystkich y-ków P(x,y). Zatem istnieje x taki że dla naszego ustalonego y-ka też zachodzi.

+ $(exists_x forall_y P(x,y)) => (forall_x exists_y P(x,y))$

  Spełnialność. to co w a.

  Tautologia. Niech
  $
    S = {a, b} \
    sigma = {P subset S^2} \
    I: P(a,a) equiv P(a, b) equiv top, P(b, a) equiv P(b, b) equiv bot
  $

  Wtedy lewa strona zachodzi, bo dla x=a dla wszystkich y-ków w S zachodzi P(x, y). Ale dla x=b nie istnieje taki y-ek w S żeby P(b,y). Zatem $1 => 0 equiv 0$

+ $(forall x P(x) => Q(y)) => forall x (P(x) => Q(y))$

  Spełnialność.
  $
    S = {a} \
    sigma = {P subset S, Q subset S} \
    I: P(a) equiv Q(a) equiv top
  $

  Wtedy dla każdego x P, Q jest spełnione zatem cała formuła jest $top$.

  Tautologia. Niech

  $
    S = {a, b} \
    sigma = {P subset S, Q subset S} \
    I: P(a) equiv top, P(b) equiv Q equiv bot
  $

  Wtedy:
  $forall x P(x) equiv bot$, $Q(y) equiv bot$. Skoro dziedzina nie jest pusta to lewa strona $top$. Prawa strona. $P(a) => Q(y) equiv top => bot equiv 0$. Zatem $forall x (P(x) => Q(y)) equiv bot$. Zatem całość: $top => bot$. Czyli $bot$. Zatem nie jest to tautologia.

+ $(P(x) => exists y Q(y)) => exists y (P(x) => Q(y))$

  To jest tautologia.
  + $P(x) = top, exists y Q(y)$:

    Obie strony zachodzą.

  + $P(x) = top, not exists y Q(y)$:

    Lewa strona to 1 => 0 czyli $bot$.

    Prawa strona to dla wszystkich y-ków mamy ($1 => 0 equiv 0$), zatem $bot$.

    Zatem $bot => bot equiv top$

  + $P(x) = bot$:

    Lewa strona $(0 => exists y Q(y)) equiv 1$, czyli $top$.

    Prawa strona $exists y (0 => Q(y))$, nie ważne czy $Q(y)$ to $(0 => 0$ lub $(0 => 1)$, to cała prawa strona $top$.

    Zatem $top => top equiv top$

+ $(forall x P(x) => Q(y)) => exists x (P(x) => Q(y))$

  To jest tautologia.

  Spróbujmy podstawić coś aby wyszedł fałsz. Aby tak było lewa strona musi być równa 1, a prawa 0. Aby prawa strona była 0 to nie może istnieć x tz P(x) => Q(y). Inaczej dla kazdego x P(x) => Q(y) musi dawac 0. Czyli Q(y) musi być 0, a P(x) dla kazdego x 1. Jednak wtedy mamy, że lewa strona to 1 => 0 czyli 0, a 0 => 0 to prawda.

+ $(forall x P(x) => Q(x)) => exists x (P(x) => Q(x))$

  tuaj rozumiem że po lewej stronie Q(x) jest wolne z x-em niezwiązanym z kwantyfikatorem ogólnym.

  Załóżmy że nie jest to tautologia. Zaczynamy od prawej strony, aby to bylo nieprawdziwe to dla wszystkich x P(x) = 1 i Q(x) = 0. Ale wtedy lewa strona jest 1 => 0, czyli całość 0 => 0 equiv 1. Tautologia.
