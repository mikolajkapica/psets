#import "../lib.typ": * 
#show: styling

Mikołaj Kapica | Funkcje Zespolone | Lista 6

#let sum1 = $sum_(n=1)^oo$

Problem

Dany jest ciąg funkcji $(f_n(z))$, gdzie $f_n(z) = 1 / (|z|^n + 1)$. Wyznacz zbiór, na którym ciąg ten jest zbieżny punktowo. Czy zbieżność jest jednostajna?

Dany  jest ciąg funkcji $(f_n (z))$, gdzie $f_n (z) = 1/(|z|^n + 1)$. Wyznacz zbiór,
na którym ten ciąg jest zbieżny punktowo. Czy zbieżność jest jednostajna?

Najpierw intuicyjnie:

$
f_n (z) --> cases(
  1 "dla" |z| < 1,
  1/2 "dla" |z| = 1, 
  0 "dla" |z| > 1, 
)
$



Zbieżność punktowa:

$ forall_(z in V) forall_(epsilon > 0) exists_n_0 forall_(n >= n_0) |f_n (z) -
f(z)| < epsilon $ 

Rozdzielmy $V$ na trzy zbiory:
- $V_1 = {z in CC mid(|) |z| < 1}$,
- $V_2 = {z in CC mid(|) |z| = 1}$,
- $V_3 = {z in CC mid(|) |z| > 1}$.

+ Dla $z in V_1$.
  Ustalmy dowolny $epsilon > 0$.

  $ abs(1/(|z|^n + 1) - 1) < epsilon $
  $ -epsilon < 1/(|z|^n + 1) - 1 < epsilon $
  $ -epsilon + 1 < 1/(|z|^n + 1) < epsilon + 1 $

  dla małych $epsilon < 1$

  $ 1/(-epsilon + 1) > |z|^n + 1 > 1 / (epsilon + 1) $

  $ 1/(-epsilon + 1) - 1 > |z|^n > 1 / (epsilon + 1) - 1 $

  $1/(epsilon + 1) - 1 < 0$, zatem na pewno $|z|^n > 1/(epsilon + 1) - 1$

  $ 1/(-epsilon + 1) - 1 > |z|^n $

  $ ln(1/(-epsilon + 1) - 1) > n ln(|z|) $


  Skoro $|z| < 1$ to  $ln(|z|) < 0$.

  $ n > ln(1/(-epsilon + 1) - 1) / ln(|z|) $

  Zatem 

  $ n_0 = ln(1/(-epsilon + 1) - 1) / ln(|z|) $

+ Dla $z in V_2$.
  Ustalmy dowolny $epsilon > 0$.

  $ abs(1/(|z|^n + 1) - 1/2) < epsilon $

  $ abs(1/(1^n + 1) - 1/2) < epsilon $

  $ abs(1/2 - 1/2) < epsilon $

  $ 0 < epsilon $

  Zatem 

  $ n_0 = 0 $

+ Dla $z in V_3$.
  Ustalmy dowolny $epsilon > 0$.

  $ abs(1/(|z|^n + 1) - 0) < epsilon $

  $ 1/(|z|^n + 1) < epsilon $

  $ |z|^n + 1 > 1 / epsilon $

  $ |z|^n > 1 / epsilon - 1 $

  Dla $epsilon >= 1$ zawsze. Dla $epsilon < 1$:

  $ n ln|z| > ln(1 / epsilon - 1) $

  $ n > ln(1 / epsilon - 1) / (ln|z|) $

  Zatem 

  $ n_0 = ln(1 / epsilon - 1) / (ln|z|) $


Zbieżność jednostajna:

$ forall_(epsilon > 0) exists_n_0 forall_(n >= n_0) forall_(z in V)  |f_n (z) -
f(z)| < epsilon $ 

Aby tak mogło być to nasze $n_0$ musiałoby być wolne od $z$ i większe od
aktualnego n_0.

Aktualnie: 

$
n_0 = cases(
  ln(1/(-epsilon + 1) - 1)/(ln(|z|)) "dla" |z| < 1,
  0 "dla" |z| = 1,
  ln(1/epsilon - 1)/ln(|z|) "dla" |z| > 1,
)
$

$ n_0 ' > ln(1/(-epsilon + 1) - 1)/(ln(|z|)) "dla" |z| < 1 $

Ale dla dużych $|z|$ bliskich $1$ mamy $ln|z|$ blisko $0$, zatem n_0 
eksploduje do nieskończoności. Więc nie da się uwolnić $n_0$ od z. Nie jest
zbieżność jednostajna.





Problem
Wykaż zbieżność jednostajną szeregów na podanym zbiorze:

a) $sum_(n=1)^oo z^(-2n) 1/n^2$, $A = {z in CC: |z| > 1}$

$
abs(z^(-2n) 1/n^2) = 1/abs(z)^(2n) dot 1/n^2 <= 1/1 dot 1/n^2
$

Zatem $sum 1/(n^2) -->$ zbiega jednostajnie

b) $sum_(n=1)^oo sqrt(n) e^(-n z)$, $B_delta = {z in CC: "Re"(z) >= delta}$ gdzie $delta > 0$ - ustalona.

$f_n (z) = sqrt(n) e^(-n z)$

$abs(f_n (z)) = sqrt(n) abs(e^(-n z)) = sqrt(n) e^(-n z) < sqrt(n) e^(-n delta)$

$
lim_(n -> oo) a_(n+1) / a_n = lim_(n -> oo) sqrt((n+1)/n) e^(-(n-1) delta) /
e^(-n delta) = lim_(n -> oo) sqrt((n+1)/n) e^(-delta) = e^(-delta) < 1
$

Z kryterium d'Alemberta $sum1 sqrt(n) e^(-n delta)$ - zbieżny.

Z tw. Weirstrassa $sum1 f_n (z)$ - zbieżny jednostajnie

Problem
Uzasadnij, że jeśli $"Re"(z_n) >= 0$ i szeregi $sum_(n=1)^oo z_n$, $sum_(n=1)^oo z_n^2$ są zbieżne, to szereg $sum_(n=1)^oo z_n^2$ jest zbieżny bezwzględnie.

Problem
Znajdź promienie zbieżności szeregów potęgowych i zbadaj zachowanie szeregu na brzegu koła zbieżności:

a) $sum_(n=0)^oo 1/(3-4i)^n (z-4i)^n$

b) $sum_(n=1)^oo i^n/(n(1+i)) z^(3n)$

c) $sum_(n=1)^oo (-1)^n/(n 2^n) (z-1)^n$

d) $sum_(n=0)^oo n!/(2i)^n z^n$

e) $sum_(n=0)^oo z^(n!)$

f) $sum_(n=1)^oo ((1+i)/sqrt(2))^n / n z^(2n)$

g) $sum_(n=1)^oo z^(3n)/n^3$

h) $sum_(n=0)^oo ((-1)^n (z-i)^n) / ((n+2)3^n)$

i) $sum_(n=0)^oo n^2/(n^2+1) z^n$

Problem
Rozważmy szereg potęgowy $sum_(n=1)^oo a_n (z-1-2i)^n$. Czy szereg ten, dla pewnego ciągu $a_n$ może być jednocześnie zbieżny w punkcie $z_1 = -3+i$ i rozbieżny w $z_2 = 5-3i$?

Problem
Rozwiń funkcję $f(z)$ w szereg potęgowy wokół punktu $a$ i oblicz promień zbieżności otrzymanego szeregu dla:

a) $f(z) = z/(1-z)$, $a=i$

b) $f(z) = 1/(z^2-5z+6)$, $a=0$

c) $f(z) = 1/(3-z)$, $a=4i$

d) $f(z) = e^z$, $a=2$

