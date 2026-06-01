#align(center)[
  = RÓWNANIA RÓŻNICZKOWE ZWYCZAJNE
  == Lista zadań nr 8
  === 19 maja 2026 r.
]

#set enum(numbering: "(a)")
#set math.mat(delim: "[")

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
    )$],
)

*8.2.* Przy pomocy metody uzmienniania stałych znaleźć rozwiązanie ogólne równania

#grid(
  columns: (1fr, 1fr),
  [(a) $y'' + 4y = 1 / cos(2t)$], [(b) $y'' + 3y' + 2y = 1 / (1 + e^t)$],
)

+ $
    y'' + 4y = 1 / cos(2t)
  $

  Istnieje bezpośredni związek równania liniowego $n$-tego rzędu z układem liniowym $Y' = A Y$:

  $
    cases(
      y_1 = y,
      y_2 = y' = y'_1
    )
  $

  $
    y'_2 = - 0 y_2 - 4 y_1
  $

  $
    mat(y'_1; y'_2) = mat(0, 1; -4, 0;) mat(y_1; y_2)
  $

  $
    omega(lambda) = mat(delim: "|", -lambda, 1; -4, -lambda) = lambda^2 + 4 = 0
  $

  $
    lambda_1 = 2i, quad lambda_2 = -2i
  $

  $
    lambda_1 = 2i: mat(-2i, 1; -4, -2i)mat(a; b) = 0 => v_1 = mat(1; 2i)
  $

  $
    phi_1 (t)
    = e^(2 i t) mat(1; 2i)
    = (cos(2t) + i sin(2t)) mat(1; 2i)
    = mat(cos(2t); -2 sin(2t)) + i mat(sin(2t); 2 cos(2t))
  $

  Zatem macierz fundamentalna układu jednorodnego:

  $
    Phi = mat(cos(2t), sin(2t); -2 sin(2t), 2 cos(2t)), quad det Phi = 2
  $

  $
    Phi^(-1) = 1/2 mat(2 cos(2t), -sin(2t); 2 sin(2t), cos(2t))
  $

  $
    c'(t) = Phi^(-1) h(t), space "gdzie" h(t) = mat(0; 1/cos(2t))
  $

  $
    mat(c'_1; c'_2) = 1/2 mat(2 cos(2t), -sin(2t); 2 sin(2t), cos(2t)) mat(0; 1/cos(2t))
  $

  Z tego mamy:

  $
    c'_1 = - 1/2 tg(2t), quad c'_2 = 1/2
  $

  Odcałkowujemy:

  $
    c_1 = 1/4 ln abs(cos(2t)) + C_1, quad c_2 = t/2 + C_2
  $

  Zatem:

  $
    Y(t) = Phi(t) c(t) = mat(cos(2t) c_1 + sin(2t) c_2; -2 sin(2t) c_1 + 2 cos(2t) c_2)
  $

  Zatem:

  $
    y(t) = y_1 (t) = cos(2t) c_1 + sin(2t) c_2
  $








*8.3.* Przy pomocy metody współczynników nieoznaczonych (metody przewidywania) znaleźć rozwiązanie ogólne równania

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  [(a) $y'' - 4y' + 4y = t^2,$], [(b) $y'' + 4y' + 4y = 8e^(-2t),$],
  [(c) $y'' + 9y = 3 sin(2t) + 2 cos(3t).$],
)

(Metoda przewidywania polega na szukaniu rozwiązania w szczególnej postaci: wielomianu, wielomianu pomnożonego przez $e^(lambda t)$, kombinacji liniowej funkcji trygonometrycznych (np. $a cos(lambda t) + b sin(lambda t)$), itd...)

*8.4.* Znaleźć rozwiązanie ogólne równania

$ t^2 x''(t) + t x'(t) - 4x(t) = 0 $

Wsk.: Podstawiając $t = e^s$, można otrzymać równanie o stałych współczynnikach.

Niech $t = e^s$ i $y(s) = x(e^s)$:

Wtedy $s = ln t$ i:

$
  x(t) = y(s) \
  x'(t) = (y(s))' = (y(ln t))' = (y'(s)) / t \
  x''(t) = ((y'(s))/t)' = ((y''(s)) / cancel(t) dot cancel(t) - y'(s)) / t^2 = (y''(s) - y'(s)) / t^2
$

Przepiszmy równanie za pomocą $y$:

$
  cancel(t^2) (y''(s) - y'(s)) / cancel(t^2) + cancel(t) (y'(s)) / cancel(t) - 4 y(s) = 0
$

Zatem:

$
  y'' - cancel(y') + cancel(y') - 4 y = 0
$

Więc:

$
  y'' - 4 y = 0
$

To jest równanie jednorodne o stałych współczynnikach. Zatem szukamy wielomianu charakterystycznego:

$
  omega (lambda) = lambda^2 - 4 = 0 <=> lambda = plus.minus 2
$

Zatem układ fundamentalny:

$
  phi_1 (s) = e^(2 s), quad phi_2 (s) = e^(-2 s)
$

Więc:

$
  y(s) = C_1 e^(2 s) + C_2 e^(-2 s)
$

Wracamy do $x$'a (za pomocą $x(t) = y(s)$ i $s = ln t$):

$
  x(t) = t^2 C_1 + C_2 / t^2
$ <rozwiazanie84>


Na $t > 0$ albo $t < 0$.

*8.5.*

(a) Niech $p_1, dots, p_n: (a, b) -> bb(R)$ będą funkcjami ciągłymi. Uzasadnić, że Wrońskjan $W(t)$ równania różniczkowego
$ x^((n)) + p_1(t) x^((n-1)) + dots + p_n(t) x = 0, $
spełnia tożsamość $W' + p_1(t)W = 0$, czyli
$ W(t) = W(s) exp(- integral_s^t p_1(r) dif r), quad s, t in (a, b). $

(b) Niech $phi$ będzie rozwiązaniem równania $x'' + p(t)x' + q(t)x = 0$. Używając punktu a) zaproponowac metodę znalezienia drugiego niezależnego rozwiązania tego równania.







*8.6.* Rozważmy równanie $x'' + p(t)x' + q(t)x = 0$.

(a) Niech $phi$ będzie rozwiązaniem powyższego równania. Pokazać, że podstawiając $x = phi y$ dostajemy równanie $y'' + p_1(t)y' = 0$.

(b) Zastosować tę metodę do zadania 8.4 szukając najpierw rozwiązania wśród wielomianów.

+ $
    x'' + p(t)x' + q(t)x = 0
  $

  $
    phi'' + p phi' + q phi = 0, quad x = y phi
  $

  $
    x'' + p x' + q x = 0
    => y'' phi + 2 y' phi' + y phi'' + p (y' phi + y phi') + q y phi = 0
  $

  $
    y'' phi + y' (2 phi' + p phi) + y underbrace((phi'' + p phi' + q phi), = 0) = 0 mid(|) div phi
  $

  $
    y'' + y' underbrace((2 phi'/phi + p), p_1) = 0
  $

  Zatem dostajemy:

  $
    y'' + p_1 (t) y' = 0
  $

  gdzie $p_1 (t) = 2 phi'/phi + p(t)$

+ $
    t^2 x'' (t) + t x' (t) - 4 x (t) = 0
  $

  Najpierw sprawdźmy czy istnieje rozwiązanie, które jest wielomianem 2-stopnia czyli:

  $
    x = a t^2 + b t + c
  $

  Wstawiając $x$ do równania różniczkowego otrzymujemy:

  $
    t^2 (2 a) + t (2 a t + b) - 4(a t^2 + b t + c) = 0
  $

  Grupując t:

  $
    t^2 (2a + 2a -4a) + t(b - 4b) - 4 c = 0
  $

  Czyli $a$ dowolne, $b = 0, c = 0$. Możemy więc wziąć np. $x = t^2 =: phi$

  Teraz użyjmy naszej metody. Podzielmy równanie przez $t^2$:

  $
    x'' (t) + t/t^2 x' (t) - 4/t^2 x (t) = 0
  $

  Mamy $p(t) = t/t^2 i q(t) = - 4/t^2$. Z tego co policzyliśmy:

  $
    y'' + y' (2 phi'/phi + p) = 0
  $

  Wstawiamy $phi$ i $p$:

  $
    y'' + y' (2 (2t)/t^2 + t/t^2) = 0 \
    y'' + y' 5/t = 0 \
  $

  Niech $u = y'$. Wtedy $y'' = u'$:

  $
    u' + u 5/t = 0
  $

  Rozdzielmy:

  $
    u'/u = -5/t
  $

  $
    ln |u| = -5 ln|t| + C \
    u = C t^(-5)
  $

  $
    y' = C t^(-5)
  $

  I odcałkowujemy:

  $
    y = C t^(-4) + D
  $

  Zatem $x = y phi$:

  $
    x = (C t^(-4) + D) t^2 = C t^(-2) + D t^2
  $

  Czyli to samo co dostaliśmy w zadaniu 8.4.

*8.7.* Niech $phi$ i $psi$ tworzą układ fundamentalny równania różniczkowego liniowego
$ y'' + p(t)y' + q(t)y = 0, $
gdzie $p: (a, b) -> bb(R)$ i $q: (a, b) -> bb(R)$ są ciągłe. Wykazać, że $phi$ i $psi$ nie mogą osiągać ekstremum lokalnego w tym samym punkcie $t_0 in (a, b)$.

Z wykładu wiemy, że $(phi, psi)$ jest układem rozwiązań RJn $space <==> space$ $forall t in (a, b) space W(phi, psi)(t) != 0$.

Załóżmy nie wprost, że $phi$ i $psi$ osiągają ekstremum lokalne w punkcie $t_0 in (a, b)$.

Skoro osiągają ekstrema lokalne to $phi' (t_0) = psi' (t_0) = 0$.

Wrońskian układu fundamentalnego:

$
  W(t_0)
  = mat(delim: "|", phi(t_0), psi(t_0); phi'(t_0), psi'(t_0))
  = mat(delim: "|", phi(t_0), psi(t_0); 0, 0)
  = 0
$

Ale to jest sprzeczne z tym, że $(phi, psi)$ jest układem fundamentalnym rozwiązań.





*8.8.* Niech $phi(dot)$ będzie nietrywialnym rozwiązaniem równania różniczkowego liniowego jednorodnego drugiego rzędu
$ x'' - q(t)x = 0, $
gdzie $q: (a, b) -> (0, infinity)$ jest ciągłe. Wykazać, że niemożliwa jest sytuacja, gdy istnieją $t_1 < t_2$, $t_1, t_2 in (a, b)$, takie, że $phi(t_1) = phi(t_2) = 0$ i $phi(t) > 0$ dla $t in (t_1, t_2)$.
