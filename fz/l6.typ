#import "../lib.typ": *
#show: styling

Mikołaj Kapica | Funkcje Zespolone | Lista 6

#let sum1 = $sum_(n=1)^oo$


#note[
*Criteria for convergence:*

- *Comparison test:*
  - for large $n$: $0 <= a_n <= b_n$
  - $sum b_n$ converges
    - then $sum a_n$ converges absolutely.

- *Limit comparison test:*
  - $0 < lim_(n->oo) a_n/b_n < +oo$,
    - then the series $sum a_n$ and $sum b_n$ either both converge absolutely or both diverge.

- *Root test (Cauchy):*
  - $q = limsup_(n->oo) root(n, abs(a_n))$.
    - If $q < 1$, the series converges absolutely;
    - If $q > 1$, it diverges.

- *Ratio test (d'Alembert):*
  - $q = lim_(n->oo) abs(a_(n+1)/a_n)$.
    - If $q < 1$, the series converges absolutely
    - If $q > 1$, it diverges.

- *Integral test:*
  - $a_n = f(n)$
  - $f > 0$,
  - $f$ continuous,
  - $f$ non-increasing function on $[1, oo)$,
    - $sum_(n=1)^oo a_n$ converges if and only if $integral_1^oo f(x) d x$ converges.

- *Dirichlet test:*
  - $a_n in RR$,
  - $a_n >= 0$
  - $a_n$ is decreasing to 0
  - $abs(sum_(k=1)^N b_k) <= M$
  Then $sum_(n=1)^oo a_n dot b_n$ converges.
]

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

$
  forall_(z in V) forall_(epsilon > 0) exists_n_0 forall_(n >= n_0) |f_n (z) -
  f(z)| < epsilon
$

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

$
  forall_(epsilon > 0) exists_n_0 forall_(n >= n_0) forall_(z in V) |f_n (z) -
  f(z)| < epsilon
$

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

a) $sum_(n=1)^oo z^(-2n) 1/n^2, quad A = {z in CC: |z| > 1}$

$
  abs(f_n (z)) = abs(z^(-2n) 1/n^2) = 1/abs(z)^(2n) dot 1/n^2 space <=^(|z| > 1 "na" A) space 1/1 dot 1/n^2 = a_n
$

Skoro
- $forall_(z in A) abs(f_n (z)) <= a_n$
- $sum_(n=1)^oo a_n "zbieżny"$

To na mocy tw. Weirstrassa $sum_(n=1)^oo z^(-2n) 1/n^2$ jest zbieżny
jednostajnie na $A$.

b) $sum_(n=1)^oo sqrt(n) e^(-n z), quad B_delta = {z in CC: "Re"(z) >= delta}$ gdzie $delta > 0$ - ustalona.


$
  abs(f_n (z)) & = sqrt(n) abs(e^(-n z)) = sqrt(n) abs((e^z)^(-n)) = sqrt(n)
                 abs(e^z)^(-n) = sqrt(n) (e^"Re"(z))^(-n) \
               & = sqrt(n) e^(-n "Re"(z)) <=^("Re"(z)
                 >= space delta "na" B_delta) sqrt(n) e^(-n delta) = a_n
$

$
  lim_(n -> oo) a_(n+1) / a_n = lim_(n -> oo) sqrt((n+1)/n) e^(-(n-1) delta) /
  e^(-n delta) = lim_(n -> oo) sqrt((n+1)/n) e^(-delta) = e^(-delta) < 1
$

Skoro:
- $|f_n| <= a_n$
- $lim_(n->oo) a_(n+1) / a_n < 1$

To na mocy kryterium d'Alemberta $sum1 f_n (z)$ jest zbieżny jednostajnie na $B_delta$.

Problem
Uzasadnij, że jeśli $"Re"(z_n) >= 0$ i szeregi $sum_(n=1)^oo z_n$, $sum_(n=1)^oo z_n^2$ są zbieżne, to szereg $sum_(n=1)^oo z_n^2$ jest zbieżny bezwzględnie.

Let $z_n = x_n + i y_n$

$
  |z_n^2| = |x_n^2 - y_n^2 + 2 i x_n y_n| & = sqrt(
                                              (x_n^2 - y_n^2)^2 + (2x_n
                                                y_n)^2
                                            ) = sqrt(x_n^4 - 2 x_n^2 y_n^2 + y_n^4 + 4 x_n^2 y_n^2) \
                                          & = sqrt(
                                              x_n^4 +
                                              2x_n^2 y_n^2 + y_n^4
                                            ) = x_n^2 + y_n^2
$

We have to make sure that both (1) $sum_(n=0)^oo x_n^2$ and (2) $sum_(n=0)^oo y_n^2$
converges.

#set enum(numbering: "1.")

1. part:
  - $x_n >= 0$ because $"Re"(z_n) >= 0$
  - $sum_(n=1)^oo x_n$ converges since $sum_(n=1)^oo z_n$ converges
  - for big enough n (since $x_n -->_(n -> oo) 0$, $x_n in [0,1)$, thus $x_n >= x_n^2$
  - By direct comparison test $sum_(n=1)^oo x_n^2$ also converges (absolutely)

2. part:
  - $z_n^2 = x_n^2 - y_n^2 + 2 i x_n y_n$ converges
  - $x_n^2 - y_n^2$ converges because both real and imaginary part has to converge
  - $sum_(n=1)^oo y_n^2 = sum_(n=1)^oo x_n^2 - sum_(n=1)^oo (x_n^2 - y_n^2)$ also converges
  - both parts on the right converge thus $sum_(n=1)^oo y_n^2$ converges

  #set enum(numbering: "(a)")

Problem
Znajdź promienie zbieżności szeregów potęgowych i zbadaj zachowanie szeregu na brzegu koła zbieżności:

+ $sum_(n=0)^oo 1/(3-4i)^n (z-4i)^n = S$

  $w := (z-4i)/(3-4i)$

  $forall_(w != 1) quad S = sum_(n=0)^oo w^n = lim_(N->oo) (1 - w^(N+1))/(1-w)$

  - For $abs(w) < 1$:
    - $S = 1/(1-w) < oo$

  - For $abs(w) = 1$
    - if $w = 1$ then $S = sum_(n=0)^oo 1 = oo$
    - if $w != 1$ then $S = lim_(N->oo) (1 -
      w^(N+1))/(1-w) = lim_(N->oo) (1 - |w|^(N+1) e^(N i phi))/(1-w)=
      lim_(N->oo) (1 - e^(N i phi))/(1-w)$, $phi !=0$, thus it spins around the
      circle for $e^(N i phi)$ forever, never converging to any value.
  - For $abs(w) > 1$:
    - $S > sum_(n=0)^oo 1 = oo$


  $abs(w) < 1 <=> abs(z-4i) < 5 => R =5$

  #v(20pt)


+ $sum_(n=1)^oo i^n/(n(1+i)) z^(3n) = S$

  $1/R = lim_(n->oo) abs((i)/(1+1/n)) = 1 ==> R = 1$

  Edge ($abs(z) = 1$)

  Dirichlet test:

  - $a_n = 1/n$ #h(4pt) ($in RR$, $arrow.br 0$)

  - $b_n = i^n/(1+i) dot 1$ #h(4pt) ($abs(sum_(k=1)^N i^n/(1+i) 1^(3n)) <= sum_(k=1)^N 1/sqrt(2)$ - bounded)

  Then $S = sum_(n=1)^oo a_n b_n$ converges

  #v(20pt)

+ $sum_(n=1)^oo (-1)^n/(n 2^n) (z-1)^n = S$

  $1/R = lim_(n->oo) abs(((n+1) 2^(n+1))/(n 2^n)) = lim_(n->oo) abs((2n+2)/(n))
  = 2$

  Edge ($abs(z - 1) = 2$)

  Dirichlet test:

  - $a_n = 1/n$

  - $b_n = (-1)^n/2^n dot 2$ #h(4pt) ($abs(sum_(k=0)^N (-1)^k/2^k dot 2) <= sum_(k=0)^N 1/2^(k+1) = 1$ - bounded)

  Then $S = sum_(n=1)^oo a_n b_n$ converges

  #v(20pt)

+ $sum_(n=0)^oo (n!)/(2i)^n z^n = S$

  $1/R = lim_(n->oo) abs((n+1)/(2i)) = lim_(n->oo) (n+1)/2 = +oo$

  $S$ is divergent everywhere.

+ $sum_(n=0)^oo z^(n!) = S$

  $1/R = lim_(n->oo) 1 = 1 <==> R = 1$

  For $z = 1$ $space S = +oo$

  Thus convergent on $abs(z) < 1$

+ $sum_(n=1)^oo (((1+i)/sqrt(2))^n)/n z^(2n)$

  $R = lim_(n->oo) abs(((1+i)(n+1))/(n sqrt(2))) = lim_(n->oo) abs(((1 + i + 1/n + i/n))/(sqrt(2))) = 1$

  At $abs(z) = 1$

  $sum_(n=1)^oo abs((((1+i)/sqrt(2))^n)/n z^(2n)) =
  sum_(n=1)^oo 1/n = +oo$

  Nie ma zbieżności bezwzględnej.

  Sprawdźmy Dirichleta (chociaz chyba nie zadziała):

  $a_n = 1/n$

  $q = ((1+i)/sqrt(2)) dot z^2$

  $b_n = q^n$ - geom.

  $abs(sum_(k=1)^N b_k) <= sum_(k=1)^N abs((1-q^(N+1))/(1-q)) <= sum_(k=1)^N (1+1)/abs(1-q) <= M$, o ile $q != 1$

  $q = 1 <==> (1+i)/sqrt(2) dot z^2 = 1 <==> z^2 = sqrt(2)/(1+i) = (sqrt(2) (1-i)) / 2 = sqrt(2)/2 - sqrt(2)/2 i = e^(- i pi/4)$

  $z = plus.minus e^(-i pi/8)$

  Thus the series converges on ${z in CC mid(|) abs(z)<=1 and z != plus.minus e^(-i pi/8) }$




+ $sum_(n=1)^oo z^(3n)/n^3$

+ $sum_(n=0)^oo ((-1)^n (z-i)^n)/((n+2) 3^n)$

+ $sum_(n=0)^oo n^2/(n^2+1) z^n$

Problem
Rozważmy szereg potęgowy $sum_(n=1)^oo a_n (z-1-2i)^n$. Czy szereg ten, dla pewnego ciągu $a_n$ może być jednocześnie zbieżny w punkcie $z_1 = -3+i$ i rozbieżny w $z_2 = 5-3i$?

If $|-3 + i - 1 - 2i| < R <=> |-4 - i| < R <=>
sqrt(17) < R$ then ps is convergent at $z_1$.

If $|5 - 3i - 1 - 2i| > R <=> |4 - 5i| > R <=>
sqrt(41) > R$ then ps is divergent at $z_2$.

Goal: find $a_n$ such that with some $R$ satisfying $sqrt(17) < R < sqrt(41)$.

Let's find a sequence that "produces" $R = 5 = sqrt(25)$.

By definition $1/R = lim_(n -> oo) abs(a_(n+1) / a_n)$.

So we want $lim_(n->oo) abs(a_(n+1) / a_n)) "to be" 1/5$.

Simplest case: $a_n = 1/5^n$ then $a_(n+1) / a_n = (1/5^(n+1)) / (1/5^n) =
(5^n) / (5^(n+1)) = 1/5$.


Problem
Rozwiń funkcję $f(z)$ w szereg potęgowy wokół punktu $a$ i oblicz promień zbieżności otrzymanego szeregu dla:

a) $f(z) = z/(1-z)$, $a=i$

b) $f(z) = 1/(z^2-5z+6)$, $a=0$

c) $f(z) = 1/(3-z)$, $a=4i$

d) $f(z) = e^z$, $a=2$
