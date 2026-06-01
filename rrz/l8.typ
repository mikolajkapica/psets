#align(center)[
  = RÓWNANIA RÓŻNICZKOWE ZWYCZAJNE
  == Lista zadań nr 8
  === 19 maja 2026 r.
]

*8.1.* Rozwiązać poniższe zagadnienia początkowe przez sprowadzenie układu do równania drugiego rzędu o stałych współczynnikach.

#grid(
  columns: (1fr, 1fr, 1fr),
  column-gutter: 1em,
  [(a) $cases(
    x' = 3x + 4y,
    y' = 2x + 5y,
    x(0) = 1, y(0) = -1
  )$],
  [(b) $cases(
    x' = x + y,
    y' = -2x - y,
    x(0) = 3, y(0) = -1
  )$],
  [(c) $cases(
    x' = x + 5y,
    y' = -x - 3y,
    x(0) = 1, y(0) = 1
  )$]
)

*8.2.* Przy pomocy metody uzmienniania stałych znaleźć rozwiązanie ogólne równania

#grid(
  columns: (1fr, 1fr),
  [(a) $y'' + 4y = 1 / cos(2t)$],
  [(b) $y'' + 3y' + 2y = 1 / (1 + e^t)$]
)

*8.3.* Przy pomocy metody współczynników nieoznaczonych (metody przewidywania) znaleźć rozwiązanie ogólne równania

#grid(
  columns: (1fr, 1fr),
  [(a) $y'' - 4y' + 4y = t^2,$],
  [(b) $y'' + 4y' + 4y = 8e^(-2t),$],
  [(c) $y'' + 9y = 3 sin(2t) + 2 cos(3t).$]
)

(Metoda przewidywania polega na szukaniu rozwiązania w szczególnej postaci: wielomianu, wielomianu pomnożonego przez $e^(lambda t)$, kombinacji liniowej funkcji trygonometrycznych (np. $a cos(lambda t) + b sin(lambda t)$), itd...)

*8.4.* Znaleźć rozwiązanie ogólne równania
$ t^2 x''(t) + t x'(t) - 4x(t) = 0 $

Wsk.: Podstawiając $t = e^s$, można otrzymać równanie o stałych współczynnikach.

*8.5.*

(a) Niech $p_1, dots, p_n: (a, b) -> bb(R)$ będą funkcjami ciągłymi. Uzasadnić, że Wrońskjan $W(t)$ równania różniczkowego
$ x^((n)) + p_1(t) x^((n-1)) + dots + p_n(t) x = 0, $
spełnia tożsamość $W' + p_1(t)W = 0$, czyli
$ W(t) = W(s) exp(- integral_s^t p_1(r) dif r), quad s, t in (a, b). $

(b) Niech $phi$ będzie rozwiązaniem równania $x'' + p(t)x' + q(t)x = 0$. Używając punktu a) zaproponowac metodę znalezienia drugiego niezależnego rozwiązania tego równania.

*8.6.* Rozważmy równanie $x'' + p(t)x' + q(t)x = 0$.

(a) Niech $phi$ będzie rozwiązaniem powyższego równania. Pokazać, że podstawiając $x = phi y$ dostajemy równanie $y'' + p_1(t)y' = 0$.

(b) Zastosować tę metodę do zadania 8.4 szukając najpierw rozwiązania wśród wielomianów.

*8.7.* Niech $phi$ i $psi$ tworzą układ fundamentalny równania różniczkowego liniowego
$ y'' + p(t)y' + q(t)y = 0, $
gdzie $p: (a, b) -> bb(R)$ i $q: (a, b) -> bb(R)$ są ciągłe. Wykazać, że $phi$ i $psi$ nie mogą osiągać ekstremum lokalnego w tym samym punkcie $t_0 in (a, b)$.

*8.8.* Niech $phi(dot)$ będzie nietrywialnym rozwiązaniem równania różniczkowego liniowego jednorodnego drugiego rzędu
$ x'' - q(t)x = 0, $
gdzie $q: (a, b) -> (0, infinity)$ jest ciągłe. Wykazać, że niemożliwa jest sytuacja, gdy istnieją $t_1 < t_2$, $t_1, t_2 in (a, b)$, takie, że $phi(t_1) = phi(t_2) = 0$ i $phi(t) > 0$ dla $t in (t_1, t_2)$.
