#import "../lib.typ": *
#show: styling

sztuczna inteligencja - lista 5 - algorytmy wnioskowania w rachunku predykatów

Zadanie 1

Wykorzystać narzędzie Prover9, aby wygenerować dowód zasady szufladkowej dla 5 przedmiotów i 4 szufladek. W wariancie prostym można nie używać narzędzi rachunku predykatów (czyli kwantyfikatorów, predykatów, zmiennych), zapisując warunki po prostu w języku rachunku zdań, ale warto spróbować też wersji z kwantyfikatorami i predykatami. Przedyskutować wyniki i ewentualne trudności.

Zadanie 2

Przekształcić następujące formuły do postaci Skolema:

a) $forall x (P(x) => exists y Q(x, y))$

$theta = {y \/ f(x)}$

$P(x) => Q(x, f(x))$

#line(length: 100%)

b) $(forall x P(x)) => exists y Q(y)$

$not (forall x P(x)) or exists y Q(y)$

$(exists x not P(x)) or exists y Q(y)$

$(exists x) (exists y) not P(x) or Q(y)$

$not P(a) or (Q(b))$

$theta = {x/a, y/b}$

#line(length: 100%)

c) $(exists x P(x)) => forall x P(x)$

$not (exists x P(x)) or forall x P(x)$

$(forall x not P(x)) or forall x P(x)$

$forall x forall y not P(x) or P(y)$

$not P(x) or P(y)$

#line(length: 100%)

d) $(forall x exists y Q(x, y)) => forall x Q(x, x)$

$not (forall x exists y Q(x, y)) or forall x Q(x, x)$

$exists x forall y forall z (not Q(x, y)) or Q(z, z)$

$not Q(a, y) or Q(z, z)$

Zadanie 3

Znaleźć najbardziej ogólny unifikator dla każdej z następujących par formuł (lub uzasadnić, że nie istnieje). Stosujemy taką konwencję, że litery $x, y, z$ oznaczają zmienne, a pozostałe litery oznaczają stałe.

a) $P(x, y), P(a, b)$

$theta = {x \/ a, y \/ b}$

#line(length: 100%)

b) $P(x, y), P(a, x)$

$theta = {x \/ a, y \/ a}$

#line(length: 100%)

c) $P(x, x), P(x, f(x))$

Tutaj nie możemy znaleźć MGU, ponieważ jeden z termów to zmienna (x) a drugie to początek termu, w który x występuje.Algorytm MGU robi occur-check - czyli sprawdza czy zachodzą nieskończone cykle. Gdybyśmy postawili $x/f(x)$ to z powodu tego że term zastępujący zależy od zastępowanej zmiennej prowadziłoby do nieskończenie zagnieżdżonych $f(f(...))$.

#line(length: 100%)

d) $P(x, g(z)), P(g(y), x)$

$theta = {x\/g(y), z\/y}$

e) $P(x, x, a), P(g(y), g(a), y)$

$theta = {x\/g(y), y\/a}$

f) $P(x, x, x), P(g(y), g(a), y)$

Tutaj znowu się nie uda znaleźć MGU. Najpierw widzimy parę $(x, g(y))$. Dlatego musimy dodać do $theta = {x\/g(y)}$. Wtedy dostajemy:

$ P(g(y), g(y), g(y)), P(g(y), g(a), y) $

Następnie widzimy parę $(g(y), g(a))$, zatem musimy dodać do $theta = {x\/g(y), y\/a}$. Zatem

$ P(g(a), g(a), g(a)), P(g(a), g(a), a) $

Teraz pozostaje do zunifikowania para $(g(a), a)$. Nie możemy podstawić jednak nic za $g(a)$ i $a$ ponieważ nie są to zmienne (a podstawienie to $theta : V -> T$, gdzie $V$ to zmienne, $T$ termy). Same termy są różne więc MGU jest niemożliwe do uzyskania.

Zadanie 4

Rozważmy następujący zbiór klauzul: $P(a) or Q(a), not P(x) or R(x), not Q(a)$. Za pomocą rezolucji wyprowadzić klauzulę $R(a)$.

+ $P(a) or Q(a)$

+ $not P(x) or R(x)$

+ $not Q(a)$

Rozwiązanie:

+ $P(a) or Q(a), not Q(a) tack.r P(a)$

+ Podstawiamy $x := a$ w klauzuli 2: $not P(a) or R(a)$

+ $(P(a), not P(a) or R(a) tack.r R(a)$


Zadanie 5

Za pomocą rezolucji uzasadnić, że następujące zbiory klauzul są niespełnialne:

a) $P(x) or P(f(x)), not P(y) or not P(f(y)), not P(w) or P(f(z))$

Podstawmy za $w := x$. Wtedy możemy połączyć (1) i (3).

$ P(f(x)) or P(f(z)) quad (3) $

Faktoryzacja $z := x$

$ P(f(x)) quad (4) $

Łączymy z (2) z podstawieniem $y := x$:

$ not P(x) quad (5) $

Teraz możemy podstawić $x := u w (4)$ i $x := f(u)$ w (5):

$ P(f(u)), not P(f(u)) $

Zatem $ bot $

$qed$

b) $not P(x, y) or Q(x, y, f(x, y)), not R(y, z) or Q(a, y, z), R(y, z) or Q(a, y, z), P(x, g(x)) or Q(x, g(x), z), not R(x, y) or Q(x, w, z)$

+ $not P(x, y) or Q(x, y, f(x, y))$

+ $not R(y, z) or Q(a, y, z)$

+ $R(y, z) or Q(a, y, z)$

+ $P(x, g(x)) or Q(x, g(x), z)$

+ $not R(x, y) or Q(x, w, z)$

Ten zbiór jest spełnialny, bo wystarczy że $forall u, v, w Q(u, v, w) = top$. Wtedy każde zdanie jest prawdziwe.

Zadanie 6

Uzasadnić, że jeśli para klauzul w rachunku zdań ma dwie różne rezolwenty (przez dobór dwóch różnych par literałów), to każda rezolwenta jest tautologią. Podać przykład, że w rachunku predykatów nie musi tak być.

W rachunku zdań mamy sytuację typu:

1. $C = L or K or A$
2. $D = not L or not K or B$

Możemy do rezolucji użyć L i not L, ale też K i not K.

- Jak L i not L: to dostajemy $K or not K or A or B = top$
- Jak K i not K: to dostajemy $L or not L or A or B = top$

W rachunku predykatów:

1. $C = P(x) or Q(x)$
2. $D = not P(a) or not Q(b)$

Możemy rezolwować po podstawieniu $x := a$ lub $x := b$.

Wtedy dostajemy $Q(a) or not Q(b)$ albo $P(b) or not P(a)$ - to nie są tautologie.





Zadanie 7 ($star star star$)

Rozważmy następującą zagadkę (źródło: Russell & Norvig):

#quote(block: true)[
  Everyone who loves all animals is loved by someone. Anyone who kills an animal is loved by no one. Jack loves all animals. Either Jack or Curiosity killed the cat, who is named Tuna. Did Curiosity kill the cat?
]

Zapisać odpowiednie zdania w rachunku predykatów, a następnie za pomocą rezolucji udowodnić, że faktycznie kot padł ofiarą Ciekawości. Zwrócić uwagę na:

- Fakty „zdroworozsądkowe", które trzeba dodać do bazy wiedzy, mimo że nie są bezpośrednio wymienione w zagadce
- Konieczność wykorzystania faktoryzacji w celu wyprowadzenia jednej z klauzul.

Rozwiązanie:

#let Loves = "Loves"
#let Killed = "Killed"
#let Jack = "Jack"
#let Animal = "Animal"
#let Tuna = "Tuna"
#let Curiosity = "Curiosity"

1. $forall x (forall y (Animal(y) => Loves(x, y)) => exists z Loves(z, x))$
2. $forall x (exists y (Animal(y) and Killed(x, y)) => not exists z Loves(z, x))$
3. $forall x (Animal(x) => Loves(Jack, x))$
4. $Killed(Jack, Tuna) or Killed(Curiosity, Tuna)$

Musimy założyć, że $Animal(Tuna)$ i, że czas "killed" nie ma znaczenia. Teraz przekształcamy na CNF przez skolemizację, i uruchamiamy algorytm rezolucji:

1. $Animal(f(x)) or Loves(g(x), x)$
2. $not Loves(x, f(x)) or Loves(g(x), x)$
3. $not Animal(y) or not Killed(x, y) or not Loves(z, x)$
4. $not Animal(x) or Loves(Jack, x)$
5. $Killed(Jack, Tuna) or Killed(Curiosity, Tuna)$
6. $Animal(Tuna)$
7. (1 gdzie $x := Jack$): $Animal(f(Jack)) or Loves(g(Jack), Jack)$
8. (2 gdzie $x := Jack$): $not Loves(Jack, f(Jack)) or Loves(g(Jack), Jack)$
9. (4 gdzie $x := f(Jack)$): $not Animal(f(Jack)) or Loves(Jack, f(Jack))$
10. (8 + 9): $not Animal(f(Jack)) or Loves(g(Jack), Jack)$
11. (10 + 7): $Loves(g(Jack), Jack) or Loves(g(Jack), Jack)$
12. (Faktoryzacja) $Loves(g(Jack), Jack)$
13. (3 gdzie $x := Jack$, $y := Tuna$, $z := g(Jack)$): \ $not Animal(Tuna) or not Killed(Jack, Tuna) or not Loves(g(Jack), Jack)$
14. (12 + 6 + 13) $not Killed(Jack, Tuna)$
15. (14 + 5) $Killed(Curiosity, Tuna)$

Zadanie 8

Jak zaadaptować rozwiązanie poprzedniego zadania, żeby uzyskać odpowiedź na pytanie „kto zabił kota" (zamiast dowodzenia z góry, kto to był)?

chuj wie moze jutro sobie na to odpowiem

#note[
  *Dlaczego to jest niepełne:* Brakuje odpowiedzi. Aby znaleźć sprawcę, zamiast
  dowodzić konkretnego zdania, dodajemy zaprzeczenie zapytania z nową stałą i
  śledzimy podstawienia użyte w refutacji.

  *Poprawnie:* Pytanie zapisujemy jako $exists x Killed(x, Tuna)$. Do bazy
  klauzul dodajemy jego zaprzeczenie:

  $not Killed(x, Tuna)$.

  Następnie wykonujemy rezolucję tak jak w zadaniu 7. Klauzula
  $Killed(Jack, Tuna) or Killed(Curiosity, Tuna)$ oraz wyprowadzona klauzula
  $not Killed(Jack, Tuna)$ dają

  $Killed(Curiosity, Tuna)$.

  Po rezolucji z klauzulą zapytania $not Killed(x, Tuna)$ otrzymujemy klauzulę
  pustą przy podstawieniu $x := Curiosity$. Odpowiedzią jest więc
  $x = Curiosity$.
]

Zadanie 9

Rozważmy następujący zbiór aksjomatów:

#block[
  #set enum(numbering: "a)")
  + $0 <= 3$.
  + $7 <= 9$.
  + $forall x, x <= x$.
  + $forall x, x <= x + 0$.
  + $forall x, x + 0 <= x$.
  + $forall x, x + y <= y + x$.
  + $forall x, y, x + y <= y + x$.
  + $forall x, y, s, t, ((x <= s and y <= t) => (x + y <= s + t))$.
  + $forall x, y, z, ((x <= y and y <= z) => (x <= z))$.
]

Przedstawić wyprowadzenie z tych aksjomatów zdania $7 <= 3 + 9$:

a) Metodą forward-chaining.

+ h with a, b
+ i with (d with 7), j

#note[
  *Dlaczego źle:* Zapis nie wskazuje otrzymanych formuł. Odwołuje się też do
  nieistniejącego aksjomatu (j), ponieważ lista kończy się na (i).

  *Poprawnie:* Z aksjomatu (h), korzystając z $7 <= 9$ oraz $0 <= 3$, dla
  $x = 7$, $s = 9$, $y = 0$ i $t = 3$ otrzymujemy

  $7 + 0 <= 9 + 3$.

  Z aksjomatu (d) mamy $7 <= 7 + 0$. Aksjomat (i) daje więc

  $7 <= 9 + 3$.

  Z aksjomatu (f), dla $x = 9$ i $y = 3$, otrzymujemy

  $9 + 3 <= 3 + 9$.

  Ponowne użycie (i) daje ostatecznie

  $7 <= 3 + 9$.
]


b) Metodą backward-chaining.

+ uzywamy (i) dostajemy np $7 <= 7 + 0 and 7 + 0 <= 3 + 9$
+ lewą stronę mamy przed (d)
+ prawą stronę mozemy udowodnic poprzez zastowowanie (h) z argumentami (7, 0, 9, 3) -> dostajemy 7 + 0 <= 9 + 3.
+ Skoro 7 <=^(d) 7 + 0 <= 9 + 3 to 7 <= 9 + 3.
+ Skoro (i) 7 <= 9 + 3 <= 3 + 9 to 7 <= 3 + 9

(pewnie można zgrabniej ale idc)

#note[
  *Dlaczego zapis jest niepoprawny:* Podstawienie do (h) podano w złej
  kolejności. Aksjomat wymaga przesłanek $x <= s$ oraz $y <= t$. Ponadto
  przejście z $9 + 3$ do $3 + 9$ korzysta z aksjomatu (f), a dopiero potem
  z przechodniości (i).

  *Poprawnie, metodą backward-chaining:* Aby wykazać $7 <= 3 + 9$, używamy
  (i) i wybieramy element pośredni $9 + 3$. Wystarczy wykazać:

  $7 <= 9 + 3$ oraz $9 + 3 <= 3 + 9$.

  Drugi cel wynika z (f). Dla pierwszego celu ponownie używamy (i), z elementem
  pośrednim $7 + 0$. Cel $7 <= 7 + 0$ wynika z (d). Cel
  $7 + 0 <= 9 + 3$ wynika z (h), ponieważ z aksjomatów (b) i (a) mamy
  odpowiednio $7 <= 9$ oraz $0 <= 3$.
]

W obu przypadkach wystarczy wskazać kroki prowadzące do celu (ale warto zwrócić uwagę, ile niepotrzebnych wyprowadzeń mogłoby się pojawić w „mechanicznym" algorytmie).

Zadanie 10

Rozważmy następujące dwa zdania:

$(A) quad forall x exists y space x <= y$ \
$(B) quad exists y forall x space x <= y$

a) Podać przykład interpretacji, w której oba zdania są prawdziwe, oraz interpretacji, w której tylko jedno z nich jest prawdziwe.

- oba są prawdziwe - liczby całkowite ujemne
- tylko jedno z nich jest prawdziwe - liczby całkowite dodatnie

b) Uzasadnić metodą rezolucji, że z (B) wynika (A).

Czyli mamy za zadanie udowodnić poniższą formułę:

$ (exists y forall x space x <= y) => (forall x exists y space x <= y) $

Spróbujmy przez dowód nie wprost. Załóżmy przeciwną tezę:

$ not ((exists y forall x space x <= y) => (forall x exists y space x <= y)) $

$ (exists y forall x space x <= y) and not (forall x exists y space x <= y) $

Czyli dostajemy dwie formuły:

1. $(exists y forall x space x <= y)$
2. $not (forall x exists y space x <= y)$

Możemy przesunąć $exists forall$ na $forall exists$ - szczegółowy przypadek

1. $(forall x exists y space x <= y)$
2. $not (forall x exists y space x <= y)$

Zatem mamy bazę typu $P and not P tack bot$. Zatem przyjmujemy tezę przeciwną $qed$

#note[
  *Dlaczego źle:* Nie wolno po prostu zamieniać kolejności kwantyfikatorów
  $exists y forall x$ na $forall x exists y$. Te formuły nie są równoważne.
  Pierwsza jest silniejsza: wskazuje jeden wspólny element $y$ dla wszystkich
  $x$.

  *Poprawnie, przez rezolucję:* Negacja implikacji daje:

  $exists y forall x space x <= y$

  oraz

  $exists x forall y space not (x <= y)$.

  Skolemizujemy obie formuły, używając różnych stałych $a$ i $b$. Dostajemy
  klauzule:

  1. $x <= a$,
  2. $not (b <= y)$.

  W pierwszej klauzuli podstawiamy $x := b$, a w drugiej $y := a$. Otrzymujemy
  $b <= a$ oraz $not (b <= a)$. Rezolucja daje klauzulę pustą. Zatem z (B)
  wynika (A).
]

c) Wyjaśnić, w którym miejscu nie udaje się próba dowodu metodą rezolucji, że z (A) wynika (B) (oczywiście próba nie może się udać, bo z (A) nie wynika (B)).

$ not ((forall x exists y space x <= y) => (exists y forall x space x <= y)) $

$ ((forall x exists y space x <= y) and (not exists y forall x space x <= y)) $

Czyli mamy:

1. $(forall x exists y space x <= y)$
2. $(not exists y forall x space x <= y)$

Teraz nie możemy poprzestawiać $forall exists$ na $exists forall$.

#note[
  *Uzupełnienie:* Po zanegowaniu implikacji otrzymujemy:

  $forall x exists y space x <= y$

  oraz

  $forall y exists x space not (x <= y)$.

  Po skolemizacji dostajemy klauzule

  $x <= f(x)$

  oraz

  $not (g(y) <= y)$.

  Nie muszą one zawierać literałów dopełniających się po unifikacji. Funkcje
  Skolema $f$ i $g$ mogą wybierać różne elementy zależnie od argumentu.
  Dlatego nie da się wyprowadzić klauzuli pustej. Przykładem modelu jest zbiór
  liczb naturalnych z relacją $<=$: każdy element ma element nie mniejszy, ale
  nie istnieje największa liczba naturalna.
]


Zadanie 11

Niech predykat $S(x, y)$ oznacza „osoba $x$ strzyże osobę $y$".

a) Wyrazić za pomocą tego predykatu zdanie „Istnieje osoba, która strzyże każdego, kto nie strzyże się sam, i nie strzyże nikogo, kto strzyże się sam" (zakładamy, że dziedziną jest zbiór osób, czyli nie potrzebujemy predykatu „być osobą").

$
  exists x forall y ((not S(y,y) => S(x, y)) and (S(y,y) => not S(x, y))) \
  <=> \
  exists x forall y (S(y,y) <=> not S(x, y)) \
$

#note[
  *Dlaczego wcześniej było źle:* Bez nawiasów nie było jasne, czy spójnik
  $and$ łączy dwie implikacje. Nawiasy pokazują właściwą strukturę zdania.
]


b) Przekształcić to zdanie w zbiór klauzul w postaci Skolema, a następnie uzasadnić za pomocą rezolucji, że jest to zbiór niespełnialny.

$
  S(y,y) <=> not S(C, y)
$

Teraz do CNF:

$
  S(y,y) <=> not S(C, y) equiv (not S(y,y) or not S(C, y)) and (S(C, y) or S(y,y))
$

Czyli mamy dwa zdania
+ $not S(y,y) or not S(C, y)$
+ $S(C, y) or S(y,y)$

Używamy podstawienia $theta = {y\/C}$, a następnie faktoryzacji:
+ $not S(C,C) or not S(C, C) equiv not S(C, C)$
+ $S(C, C) or S(C,C) equiv S(C, C)$

Zatem wykorzystując metodę rezolucji na $S(C, C)$:

$square$. Skoro metodą rezolucji wyprowadzono klauzulę pustą to zbiór formuł jest sprzeczny.

Zadanie 12

Rozważmy następujące zdania:

+ Konie, krowy i świnie to ssaki.
+ Potomek konia jest koniem.
+ Bluebeard jest koniem.
+ Bluebeard jest rodzicem Charliego.
+ „Być potomkiem" i „być rodzicem" to relacje odwrotne.
+ Każdy ssak ma rodzica.

#let Kon = "Koń"
#let Krowa = "Krowa"
#let Swinia = "Świnia"
#let Ssak = "Ssak"
#let Bluebeard = "Bluebeard"
#let Rodzic = "Rodzic"
#let Charlie = "Charlie"
#let Potomek = "Potomek"

Najpierw w języku logiki pierwszego rzędu:

+ $forall x ((Kon(x) or Krowa(x) or Swinia(x)) => Ssak(x))$
+ $forall x forall y ((Potomek(x, y) and Kon(y)) => Kon(x))$
+ $Kon(Bluebeard)$
+ $Rodzic(Bluebeard, Charlie)$
+ $forall x forall y (Rodzic(x, y) <=> Potomek(y, x))$
+ $forall x (Ssak(x) => exists y Rodzic(y, x))$

a) Na podstawie tych zdań zapisać odpowiednie formuły w postaci Skolema.

+ $not Kon(x) or Ssak(x)$
+ $not Krowa(x) or Ssak(x)$
+ $not Swinia(x) or Ssak(x)$
+ $not Potomek(x, y) or not Kon(y) or Kon(x)$
+ $Kon(Bluebeard)$
+ $Rodzic(Bluebeard, Charlie)$
+ $not Rodzic(x, y) or Potomek(y, x)$
+ $Rodzic(x, y) or not Potomek(y, x)$
+ $not Ssak(x) or Rodzic(f(x), x)$

b) Rozważyć różne sposoby znalezienia wszystkich koni w bazie danych (czyli wszystkich $x$, takich że $"Horse"(x)$).

#note[
  *Poprawne rozwiązanie:* Możemy użyć forward-chaining. Z faktu
  $Kon(Bluebeard)$ wiemy, że Bluebeard jest koniem. Z
  $Rodzic(Bluebeard, Charlie)$ i relacji odwrotnej otrzymujemy
  $Potomek(Charlie, Bluebeard)$. Reguła o potomkach koni daje wtedy
  $Kon(Charlie)$.

  Możemy też użyć backward-chaining dla zapytania $Kon(x)$. Pierwsza odpowiedź
  pochodzi bezpośrednio z faktu i daje $x = Bluebeard$. Druga korzysta z reguły
  o potomkach: szukamy $Potomek(x, y)$ oraz $Kon(y)$. Dla
  $y = Bluebeard$ relacja rodzica daje $x = Charlie$.

  Wszystkie odpowiedzi, które wynikają z podanej bazy, to zatem
  $x = Bluebeard$ oraz $x = Charlie$.
]





Zadanie 13

Aksjomaty Boole'a: Rozważmy teorię z dwoma stałymi $0$ i $1$, dwoma funkcjami dwuargumentowymi $+$ i $dot$ (które będziemy zapisywać w formie infiksowej) oraz jedną funkcją jednoargumentową $'$ (którą zapisujemy w formie postfiksowej, np. $x'$) i następującymi aksjomatami (wszystkie z odpowiednimi kwantyfikatorami ogólnymi):

a) $x + y = y + x$
b) $x dot y = y dot x$
c) $(x + y) + z = x + (y + z)$
d) $(x dot y) dot z = x dot (y dot z)$
e) $x dot (y + z) = (x dot y) + (x dot z)$
f) $x + (y dot z) = (x + y) dot (x + z)$
g) $x + (x dot y) = x$
h) $x dot (x + y) = x$
i) $x + 0 = x$
j) $x dot 1 = x$
k) $x + x' = 1$
l) $x dot x' = 0$

Każdy model tej teorii (czyli zbiór z odpowiednimi działaniami i stałymi, które spełniają te warunki) nazywamy algebrą Boole'a.

a) Podać przykłady kilku różnych algebr Boole'a.

+ $({0, 1}, +, dot, ', 0, 1)$ - algebra boolowska na dwuelementowym zbiorze (klasyczna logika)
+ $(2^X, union, inter, complement, emptyset, X)$ - algebra zbiorów (potęga zbioru X)
+ Zbiór wszystkich podzbiorów zbioru skończonego n-elementowego

b) Udowodnić równość $x'' = x$.

Z aksjomatów mamy:
- $x + x' = 1$ (k)
- $x dot x' = 0$ (l)

Podstawiając $x'$ do (k) i (l):
- $x' + x'' = 1$
- $x' dot x'' = 0$

Z jednoznaczności dopełnienia (skoro $x$ i $x''$ spełniają te same warunki co dopełnienie $x'$), wynika $x'' = x$.

c) Udowodnić prawa De Morgana: $(x + y)' = x' dot y'$ oraz $(x dot y)' = x' + y'$.

Dowód $(x + y)' = x' dot y'$:

Korzystając z dystrybutywności (f):
$(x + y) + (x' dot y') = (x + x') dot (x + y') dot (y + x') dot (y + y') = 1 dot 1 dot 1 dot 1 = 1$

$(x + y) dot (x' dot y') = (x dot x' dot y') + (y dot x' dot y') = 0 + 0 = 0$

Zatem $x' dot y'$ jest dopełnieniem $x + y$, więc $(x + y)' = x' dot y'$.

Analogicznie dla $(x dot y)' = x' + y'$.

Zadanie 14

Aksjomaty Huntingtona: Tym razem mamy tylko jedną funkcję dwuargumentową $+$ oraz jedną funkcję jednoargumentową $'$ i następujące aksjomaty:

a) $x + y = y + x$.
b) $(x + y) + z = x + (y + z)$.
c) $(x' + y)' + (x' + y')' = x$.

Uzasadnić, że:

a) Aksjomaty Huntingtona wynikają z aksjomatów Boole'a.

b) $x + x' = x' + x''$

c) $x'' = x$

d) $x + x' = y + y'$ (to oznacza, że wyrażenie $x + x'$ ma stałą wartość, którą oznaczymy symbolem $1$. Oznaczmy też $0 = 1'$).

e) $1 + x = 1$ oraz $0 + 0 = 0$

f) $x + 0 = x + x$

g) Jeśli dodatkowo założymy $x + x = x$, to możemy wyprowadzić wszystkie aksjomaty Boole'a (z działaniem $dot$ zdefiniowanym jako $x dot y = (x' + y')'$).

h) $(*)\ x + x = x$ wynika z aksjomatów Huntingtona (czyli każda „algebra Huntingtona” jest de facto algebrą Boole'a).

Rozwiązanie.

Oznaczmy trzeci aksjomat przez $H(x, y)$:

$H(x, y): quad (x' + y)' + (x' + y')' = x$.

Punkt a). W algebrze Boole'a przemienność i łączność $+$ są aksjomatami. Z praw De Morgana mamy

$(x' + y)' = x dot y'$

oraz

$(x' + y')' = x dot y$.

Dlatego

$(x' + y)' + (x' + y')' = (x dot y') + (x dot y) = x dot (y' + y) = x dot 1 = x$.

Aksjomat Huntingtona wynika więc z aksjomatów Boole'a.

Punkt b). Z podstawień do $H$ dostajemy cztery równości:

$H(x, x''): quad (x' + x'')' + (x' + x''')' = x$,

$H(x', x''): quad (x'' + x'')' + (x'' + x''')' = x'$,

$H(x', x'): quad (x'' + x')' + (x'' + x'')' = x'$,

$H(x'', x'): quad (x''' + x')' + (x''' + x'')' = x''$.

Korzystamy teraz tylko z przemienności i łączności $+$. Mamy

$ x + x' = ((x' + x'')' + (x' + x''')') + ((x'' + x'')' + (x'' + x''')') $.

Po przestawieniu składników dostajemy

$ x + x' = ((x'' + x')' + (x'' + x'')') + ((x''' + x')' + (x''' + x'')') = x' + x'' $.

To daje punkt b).

Punkt c). Stosujemy punkt b) do $x'$. Wtedy

$x' + x'' = x'' + x'''$.

Z przemienności mamy też $x' + x'' = x''' + x''$. Porównujemy teraz wzory $H(x, x'')$ oraz $H(x'', x')$. Ich lewe strony są takie same, więc

$x'' = x$.

Punkt d). Najpierw zapisujemy $x$ i $x'$ z aksjomatu $H$. Dzięki punktowi c) możemy usunąć podwójne negacje:

$ x = (x' + y)' + (x' + y')' $,

$ x' = (x + y)' + (x + y')' $.

Zatem

$ x + x' = (x' + y)' + (x' + y')' + (x + y)' + (x + y')' $.

Ten sam rachunek dla $y$ i $y'$ daje

$ y + y' = (y' + x)' + (y' + x')' + (y + x)' + (y + x')' $.

Po użyciu przemienności $+$ widzimy te same cztery składniki. Stąd

$x + x' = y + y'$.

Możemy więc zdefiniować stałą

$1 = x + x'$

oraz

$0 = 1'$.

Z punktu c) wynika od razu $0' = 1$. Ponadto dla $x = 0$ mamy

$0 + 0' = 1$,

czyli

$0 + 1 = 1$.

Udowodnimy teraz punkt h), bo po nim punkty e), f) i g) są krótkie.

Najpierw pokażemy $0 + 0 = 0$. Z $H(0, 1)$ mamy

$0 = (0' + 1)' + (0' + 1')' = (1 + 1)' + (1 + 0)'$.

Ponieważ $0 + 1 = 1$, drugi składnik to $1' = 0$. Zatem

$0 = (1 + 1)' + 0$. #h(1em) $(*)$

Dodajemy $1 + 1$ do obu stron równości $(*)$. Po lewej stronie dostajemy

$(1 + 1) + 0 = 1 + (1 + 0) = 1 + 1$.

Po prawej stronie dostajemy

$(1 + 1) + (1 + 1)' + 0 = 1 + 0 = 1$.

Stąd $1 + 1 = 1$. Wracamy do $(*)$ i dostajemy

$0 = (1 + 1)' + 0 = 1' + 0 = 0 + 0$.

Teraz pokażemy, że $0$ jest elementem neutralnym dla $+$. Stosujemy $H$ do elementu $(x + 0)'$ i parametru $0$:

$(x + 0)' = ((x + 0) + 0)' + ((x + 0) + 0')'$.

Ponieważ $0 + 0 = 0$ oraz $0 + 0' = 1$, mamy

$(x + 0)' = (x + 0)' + (x + 1)'$.

Z drugiej strony $H(x', 0)$ daje

$x' = (x + 0)' + (x + 1)'$.

Zatem $(x + 0)' = x'$. Po użyciu punktu c) dostajemy

$x + 0 = x$.

Na końcu stosujemy $H(x', x)$:

$x' = (x + x)' + (x + x')'$.

Ponieważ $x + x' = 1$, drugi składnik to $1' = 0$. Korzystamy też z $a + 0 = a$:

$x' = (x + x)'$.

Jeszcze raz używamy punktu c). Otrzymujemy

$x + x = x$.

To dowodzi punktu h).

Punkt e). Mamy już $0 + 0 = 0$. Ponadto

$1 + x = (x + x') + x = (x + x) + x' = x + x' = 1$.

Punkt f). Skoro $x + 0 = x$ oraz $x + x = x$, to

$x + 0 = x + x$.

Punkt g). Załóżmy dodatkowo $x + x = x$. Wtedy poprzedni rachunek daje $x + 0 = x$, więc $0$ jest zerem dla $+$. Definiujemy

$x dot y = (x' + y')'$.

Sprawdzamy aksjomaty Boole'a:

+ $+$ jest przemienne, łączne i idempotentne.
+ $x + 0 = x$ oraz $x + x' = 1$.
+ $1 + x = 1$, więc $1$ jest elementem największym względem $+$.
+ $x'' = x$.
+ $dot$ jest przemienne, bo $+$ jest przemienne.
+ $dot$ jest łączne, bo
  $(x dot y) dot z = (((x' + y')')' + z')' = ((x' + y') + z')' = (x' + (y' + z'))' = x dot (y dot z)$.
+ $x dot 1 = (x' + 1')' = (x' + 0)' = x$.
+ $x dot x' = (x' + x'')' = (x' + x)' = 1' = 0$.
+ Prawo De Morgana $(x + y)' = x' dot y'$ wynika bezpośrednio z definicji $dot$.
+ Aksjomat Huntingtona ma postać $(x dot y') + (x dot y) = x$. Razem z idempotentnością daje absorpcję. Przez De Morgana dostajemy też absorpcję dualną.
+ Z absorpcji i dopełnień wynika dystrybutywność w zwykły sposób dla krat dopełnionych.

Dostajemy więc wszystkie aksjomaty Boole'a z działania $dot$ zdefiniowanego wyżej.

Zadanie 15

Aksjomaty Robbinsa: Zastąpmy trzeci z aksjomatów Huntingtona następującym:

$((x + y)' + (x + y')')' = x$.

Każdy model takiej teorii nazwiemy algebrą Robbinsa.

a) Uzasadnić, że jeśli dla każdego $x$ mamy $x'' = x$, to algebra Robbinsa jest algebrą Boole'a.

b) Można pokazać (ale nie trzeba w ramach ćwiczeń), że jeśli istnieją takie elementy $a, b$, że $a + b = a$, to algebra Robbinsa jest algebrą Boole'a. Korzystając z tego faktu (lub inaczej), uzasadnić, że każdy skończony model aksjomatów Robbinsa jest algebrą Boole'a.

#note[
  Uwaga: Robbins postawił (około 1933 r.) hipotezę, że jego aksjomaty pociągają za sobą aksjomaty Boole'a bez dodatkowych założeń (czyli że każda algebra Robbinsa jest de facto algebrą Boole'a); udowodnił to McCune w 1996 r. za pomocą programu EQP.
]

c) $(*)$ Spróbować udowodnić, że z aksjomatów Robbinsa wynikają aksjomaty Boole'a, za pomocą narzędzia Prover9 (lub innego preferowanego).

Rozwiązanie.

Punkt a). Załóżmy, że $x'' = x$ dla każdego $x$. Aksjomat Robbinsa ma postać

$((x + y)' + (x + y')')' = x$.

Podstawiamy $x'$ za $x$:

$((x' + y)' + (x' + y')')' = x'$.

Stosujemy negację do obu stron. Dzięki założeniu $t'' = t$ dostajemy

$(x' + y)' + (x' + y')' = x$.

To jest dokładnie aksjomat Huntingtona. Z zadania 14 wynika więc, że taka algebra Robbinsa jest algebrą Boole'a.

Punkt b). Niech algebra Robbinsa będzie skończona i niepusta. Wybierzmy dowolny element $c$. Rozważmy ciąg

$s_1 = c, quad s_2 = c + c, quad s_3 = (c + c) + c, quad dots$

czyli $s_n$ jest sumą $n$ kopii elementu $c$. Algebra jest skończona, więc istnieją $m < n$ takie, że

$s_m = s_n$.

Z łączności mamy

$s_n = s_m + s_(n - m)$.

Jeśli oznaczymy $a = s_m$ oraz $b = s_(n - m)$, to dostajemy

$a + b = a$.

Korzystamy teraz z faktu podanego w treści zadania: jeśli w algebrze Robbinsa istnieją $a, b$ takie, że $a + b = a$, to algebra jest Boole'owska. Stąd każdy skończony model aksjomatów Robbinsa jest algebrą Boole'a.

Punkt c). W notacji $n(x) = x'$ bezpośredni cel dla Prover9 wygląda tak:

```prover9
formulas(assumptions).
  plus(x,y) = plus(y,x).
  plus(plus(x,y),z) = plus(x,plus(y,z)).
  n(plus(n(plus(x,y)), n(plus(x,n(y))))) = x.
end_of_list.

formulas(goals).
  plus(n(plus(n(x),y)), n(plus(n(x),n(y)))) = x.
end_of_list.
```

Celem jest aksjomat Huntingtona. Sprawdziłem jednak, że w zwykłym trybie Prover9 ten plik nie kończy dowodu szybko. U mnie nie zakończył się w limicie 180 sekund.

Działa natomiast następujący sprawdzalny krok pośredni. Jeśli dodamy założenie $c + c = c$, to Prover9 szybko dowodzi aksjomatu Huntingtona:

```prover9
assign(max_seconds, 120).
assign(pick_given_ratio, 4).
assign(max_weight, 21).

formulas(assumptions).
  plus(x,y) = plus(y,x).
  plus(plus(x,y),z) = plus(x,plus(y,z)).
  n(plus(n(plus(x,y)), n(plus(x,n(y))))) = x.
  plus(c,c) = c.
end_of_list.

formulas(goals).
  plus(n(plus(n(x),y)), n(plus(n(x),n(y)))) = x.
end_of_list.
```

Ten plik daje wynik `THEOREM PROVED`. Jest to wersja lematu McCune'a/Winkera: algebra Robbinsa z elementem idempotentnym jest Boole'owska.

Pełny dowód ogólny polega jeszcze na automatycznym pokazaniu, że w każdej algebrze Robbinsa istnieją $C, D$ takie, że $C + D = C$. To jest zasadniczy krok z dowodu McCune'a. Oryginalnie został znaleziony przez EQP, a Prover9 bez odpowiedniego proof objectu nie odtworzył go u mnie w krótkim limicie.
