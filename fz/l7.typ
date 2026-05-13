#import "../lib.typ": *
#show: styling

funckje zespolone | lista 7

#v(0.6em)

Zadanie

Rozwiń poniższe funkcje w szereg potęgowy o środku w $z_0$ i znajdź koło zbieżności otrzymanego szeregu:

a) $f(z) = e^(z^2)$, $z_0 = 0$; \

$
  e^z = sum_(n=0)^infinity frac(z^n, n!) => e^(z^2) = sum_(n=0)^infinity frac(z^(2n), (n)!)
$

Możemy zweryfikować licząc taylora bezposrednio

$
  e^z^2 -->^("d"z)
  e^z^2 2z -->^("d"z)
  e^z^2 (4z^2 + 2) -->^("d"z)
  e^z^2 (8z^3 + 12z) -->^("d"z) \
  -->^("d"z)
  e^z^2 (16z^4 + 48z^2 + 12)
  -->^("d"z)
  e^z^2 (...)
  -->^("d"z)
  e^z^2 (... + 120)
$

$
  f(0)/0! = 1 \
  (f'(0))/1! = 0 \
  (f''(0))/2! = 1 \
  (f'''(0))/3! = 0 \
  (f''''(0))/4! = 12/24 = 1/2 \
  (f^((5)) (0))/5! = 0 \
  (f^((6)) (0))/6! = (24 * 5)/(24 * 5 * 6) = 1/6 \
$

i korzystając z naszego rozwinięcia wsp. to: $1, 1, 1/2, 1/6$



b) $f(z) = e^z$, $z_0 = pi i$; \
c) $f(z) = sin z$, $z_0 = 3 pi$; \
d) $f(z) = sin z$, $z_0 = pi i$.


Zadanie

Załóżmy, że $f(z) = sum_(n=0)^infinity a_n z^n$ jest funkcją holomorficzną na domkniętym kole jednostkowym
$K = {z in CC: abs(z) <= 1}$ oraz dla $z in K$ wiadomo, że $abs(f(z)) <= 1$.
Stosując nierówność Cauchy’ego pokaż, że dla $k in NN$ i $z$ takich, że $abs(z) < 1$ mamy

$
  abs(sum_(n=k)^infinity a_n z^n) <= frac(abs(z)^k, 1 - abs(z)).
$

Zadanie

Załóżmy, że $f(z)$ jest funkcją całkowitą taką, że dla dowolnego $z in CC$ mamy
$abs(f(z)) >= 1$. Pokaż, że $f$ musi być stała.

Zadanie

Załóżmy, że $f : CC -> CC$ jest funkcją całkowitą. Pokaż, że jeśli $f$ nie jest stała, to obraz
$f(CC)$ jest zbiorem gęstym w $CC$.

Zadanie

Wykaż, że jeśli funkcja $f(z)$ jest funkcją całkowitą i jej część rzeczywista albo urojona
jest ograniczona z dołu albo z góry, to $f(z)$ jest stała.

Zadanie

Udowodnij, że jeśli $P(z)$ jest wielomianem stopnia $n$ oraz istnieje stała $M in RR$ taka, że
$abs(P(z)) <= M$ dla $abs(z) = 1$, to
$abs(P(z)) <= M abs(z)^n$ dla $abs(z) > 1$.

Zadanie

Znajdź błąd w następującym rozumowaniu: Ponieważ mamy

$
  0
  = frac(1, z - 1) + frac(1, 1 - z)
  = frac(1, z) frac(1, 1 - frac(1, z)) + frac(1, 1 - z)
  = sum_(n=1)^infinity frac(1, z^n) + sum_(n=0)^infinity z^n
  = sum_(n=-infinity)^infinity z^n,
$

więc rozwinięcie w szereg Laurenta nie jest jednoznaczne.

zapisac jako geom.

Szeregi nie mają wspólnego zbioru na którym są zbieżne.. z>1, z < 1

Zadanie

Znajdź rozwinięcie funkcji
$f(z) = frac(1, (z - 1) z^2)$
w szereg Laurenta dla otoczeń pierścieniowych punktu

a) $z = 0$; \
b) $z = 1$.

a)

rozlam na ułamki proste

$
f(z) 
= 1/((z-1) z^2)
= 1/(z-1) underbrace(- 1/z - 1/z^2, "część główna")
$

$
  1/(z-1) = - 1/(1-z) = - sum_(n=0)^oo z^n 
$

Więc:

$
 f(z) = sum_(n = -2)^oo (-z^n)
$

b)

$
z = 1 quad 0 < abs(z-1) < 1
$

teraz $1/(z-1)$ to część główna



Zadanie

Rozwiń funkcję
$f(z) = frac(1, (z - a)(z - b))$,
$0 < abs(a) < abs(b)$, w szereg Laurenta dla

a) $abs(z) < abs(a)$; \
b) $abs(a) < abs(z) < abs(b)$; \
c) $abs(z) > abs(b)$.

Zadanie

Znajdź rozwinięcie funkcji $f(z)$ w szereg Laurenta w otoczeniu pierścieniowym $0$:

a) $f(z) = frac(e^(-1 / z^2), z)$; \
b) $f(z) = frac(e^(z^2), z)$; \
c) $f(z) = z^7 sin frac(1, z)$; \
d) $f(z) = frac(1 - cos z, z^2)$; \
e) $f(z) = frac(sin^2 z, z^2)$; \
f) $f(z) = z cos frac(1, z)$.

Jakiego rodzaju osobliwość funkcje $f$ mają w $0$?
