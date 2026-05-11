#import "../lib.typ": *
#show: styling

sztuczna inteligencja - lista 3 - algorytmiczne wnioskanie w rachunku zdań

Zadanie

Uzasadnić metodą rezolucji zasadę szufladkową Dirichleta dla czterech obiektów i
trzech szufladek: zapisać odpowiednie warunki jako formuły rachunku zdań i
uzasadnić, że taki zbiór formuł jest sprzeczny, wyprowadzając z niego formułę
pustą. Warunków będzie dużo (ile?), więc nie trzeba wszystkich zapisywać
explicite, wystarczy podać ich ogólną postać. Podobnie nie trzeba wyp  rowadzać
wszystkich zbędnych rezolwent, wystarczą te potrzebne do otrzymania formuły
pustej. Warto jednak zastanowić się, ile rezolwent powstałoby, gdybyśmy
faktycznie systematycznie wyprowadzali wszystkie możliwe rezolwenty w kolejnych
iteracjach.


Zadanie

Rozważmy następujący graf z czterema wierzchołkami:

#image("assets/Zrzut ekranu 2026-04-15 201909.png")

Uzasadnić, że w grafie tym nie istnieje cykl Hamiltona, czyli droga zamknięta,
która przechodzi przez każdy wierzchołek dokładnie raz. W tym celu zapisać
odpowiedni zbiór formuł i uzasadnić, że nie jest on spełnialny (podobnie jak w
przypadku zasady szufladkowej, formuł będzie dużo i niektóre będą bardzo
podobne, więc można tylko opisać ich ogólną postać). Uzasadnić też, że jeśli z
grafu usuniemy wierzchołek C, to odpowiedni zbiór formuł będzie spełnialny.
Ciekawostka: można pokazać, że każdy problem 3SAT (czyli problem SAT z
klauzulami zawierającymi po trzy literały) da się sprowadzić w czasie
wielomianowym do problemu znalezienia cyklu Hamiltona w pewnym grafie, co
oznacza, że problem istnienia cyklu Hamiltona jest NP-zupełny.



Zadanie

Uzasadnić, że każda formuła 3-CNF składająca się z siedmiu lub mniej klauzul
jest spełnialna (za formułę 3-CNF uznajemy formułę CNF, w której każda klauzula
składa się dokładnie z trzech literałów).

Zadanie 4

Uzasadnić, że jeśli baza wiedzy składa się wyłącznie z klauzul 2-CNF, to
algorytm rezolucji będzie miał złożoność wielomianową (względem liczby
symboli).\
_Wskazówka:_ ile różnych (nierównoważnych) klauzul dwuliterałowych można
utworzyć z n symboli?

Zajmijmy się wskazówką.
- 2-CNF czyli każda klauzala ma maksymalnie dwa literały np. $A or not B$
- Dla n symboli mozemy mieć 2n literałów ($X, not X$)
- Klauzul jednoelementowych mamy 2n (wybieramy 1 z 2n literałów)
- Klauzul dwuelementowych mamy maksymalnie $binom(2n, 2) = 2n^2 - n$
- Czyli maksymalnie mamy $2n^2 + n$ klauzul

Fakt. Rezolucja nie zwiększa długości
- $(A or B)$ z ($not B or C)$, dostajemy ($A or C$) (nadal 2-CNF)
- $(A or B)$ z ($not B)$, dostajemy ($A$) (1-CNF)
- $(A)$ z ($not A)$, dostajemy sprzeczność

Pomyślmy o najbardziej pesymistycznym przypadku. W każdej iteracji z bazy wiedzy
dostajemy tylko 1 nową klauzulę w (2-CNF). Tych klauzul maksymalnie może być
$2n^2 + n$ dla $n$ symboli. W każdej iteracji musimy dokonać maksymalnie
$binom(2n^2 + n, 2) = (4n^4 + 4n^3 - n^2 - n)/2$ porównań dla $n$ symboli. Zatem
traktując każde porównanie jako pojedyńcza instrukcja $O(1)$ to złożoność
algorytmu rezoluzji wynosi $O((2n^2 + n) dot (4n^4 + 4n^3 - n^2 - n)/2) =
O(n^6)$. Jest to czas wielomianowy.


Zadanie

Ile formuł k-CNF można utworzyć z n symboli (niekoniecznie wykorzystując
wszystkie symbole)?

Zakładam, że formuła k-CNF ma zawsze k elementów w każdej klauzuli. Z n symboli
wybieramy k symboli, które będą w klauzulach $binom(n, k)$. Teraz wybieramy,
które z tych symboli są zaprzeczone na $2^k$ sposobów. Mam teraz $binom(n, k)
dot
2^k$ klauzul. Formuła to podzbiór klauzul, czyli jest ich $2^(binom(n, k) dot 2^k)$.


Zadanie

Rozważmy następującą bazę wiedzy:
- $P => Q$ (1)
- $L and M => P$ (2)
- $B and L => M$ (3)
- $A and P => L$ (4)
- $A and B => L$ (5)
- $A$ (6)
- $B$ (7)

+ Porównać zachowanie algorytmów forward-chaining, backward-chaining oraz
  rezolucji przy zadaniu wyprowadzenia Q z tej bazy wiedzy.
+ Jak zastosować algorytm DPLL do wyprowadzenia Q z tej bazy wiedzy? Który
  algorytm wnioskowania będzie to najbardziej przypominać w działaniu?

Algorytm forward-chaining:

- Mamy $A$ (6) i $B$ (7), korzystając z (5) mamy L (8).
- Mamy $B$ (7) i $L$ (8), korzystając z (3) mamy M (9).
- Mamy $L$ (8) i $M$ (9), korzystając z (2) mamy P (10).
- Mamy $P$ (10) więc mamy Q.

Algorytm backward-chaining:

- Aby dostać $Q$ musimy mieć $P$.
- Aby mieć $P$ musimy mieć $L and M$
- Aby mieć $L$ musimy mieć $A and P$ lub $A and B$. Mamy $A and B$ więc mamy
  $L$.
- Aby mieć $M$ potrzebujemy mieć $B and L$. Mamy $B$ i mamy $L$, zatem mamy $M$.
- Zatem mamy $Q$.

Algorytm rezolucji:

Zakładamy nie wprost że $not Q$.
Musimy przetransformować bazę wiedzy na CNF.

1. $not P or Q$
2. $not L or not M or P$
3. $not B or not L or M$
4. $not A or not P or L$
5. $not A or not B or L$
6. $A$
7. $B$

- Zaczynamy z $not Q$
- Wrzucamy $not P or Q$ (1) dostajemy $not P$
- Wrzucamy $not L or not M or P$ dostajemy $not L or not M$
- Wrzucamy $not B or not L or M$ dostajemy $not B or not L$
- Wrzucamy $not A or not B or L$ dostajemy $not B or not A$
- Wrzucamy $A$ i dostajemy $not B$
- Wrzucamy $B$ i dostajemy sprzeczność $square$
- Zatem $Q$.

Porównanie:

- forward-chaining to podejście oparte na danych (od faktów aż natrafi na cel)
- backward-chaining to podejście zorientowane na cel (od celu, do faktów)
- rezolucja to podejście dowodu nie wprost.

Algorytm DPLL:

1. $not P or Q$
2. $not L or not M or P$
3. $not B or not L or M$
4. $not A or not P or L$
5. $not A or not B or L$
6. $A$
7. $B$

- $Q = bot$ (nie wprost)
- $A$, $B$ jednostkowe wiec $A = top, B = top$
- $L = top$
- $M = top$
- $P = top$ Ale wtedy 1. nie spełniona. Sprzeczność $square$

Działanie na tej bazie wiedzy najbardziej przypomina forward-chaining, bo
zaczynamy od klauzul unarnych $A$, $B$ i korzystamy dalej z propagacji (jak $A$
to wystąpienia $not A$ możemy usunąć.
