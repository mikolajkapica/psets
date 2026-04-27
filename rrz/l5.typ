#import "../lib.typ": *
#import "@preview/diverential:0.3.0": *
#show: styling

#let dx = $"d"x$
#let dy = $"d"y$
#let dz = $"d"z$
#let df = $"d"f$
#let dF = $"d"F$
#let dPhi = $"d"Phi$
#let RL = $"RL"$

#set enum(numbering: "(a)")

MIKOŁAJ KAPICA 272729 | Równania różniczkowe zwyczajne | lista 5

Problem

In problems 5.1-5.5 we consider the equation
$ P(x,y) d x + Q(x,y) d y = 0 $ <RL>
where $P, Q : D -> RR$ ($D subset RR^2$ is a region) are functions of class $C^1$. We assume moreover, that every point of the region $D$ is regular.

Mamy $(dPhi)/(dy) P - (dPhi)/(dx) Q = 0$, wtedy $df/dPhi dPhi/dy P - df/dPhi
dPhi dx Q = 0$

$
gradient Phi = mat(df/dPhi, dPhi/dx; df/dPhi, dPhi/dy)
$

$ Phi "to całką RL" <=> Phi "to całka" mu "RL" $

Problem

Assume that $mu in C^1(D)$ is non-zero on $D$. Show that then $Phi : D -> RR$ is an integral of equation (RL) if and only if it is an integral of equation
$ mu(x,y)P(x,y) d x + mu(x,y)Q(x,y) d y = 0. $ <RLmi>

$ P(x,y) dx + Q(x,y) dy = 0 \
F "i" D -> RR \
"że" F_x = P, F_y = Q "w D" \
F - "f.pierwotna"  \
F_x dx + F_y dy = 0 \
dF = 0 \
F(x,y) = C
$

chyba jakas intuicja ze $gradient F || (P, Q)$, wektor jest rownolegly do samego
siebie.

Problem

Let $J$ be an interval and $Phi : D -> J$ an integral of equation (RL). Let $f : J -> RR$ be a function of class $C^1$ such that $f' != 0$ on $J$. Justify that $f compose Phi$ is an integral of this equation.

Equation (RL) is called exact if the vector field $(P,Q)$ is exact. The function $mu(x,y)$ is called an integrating factor of equation (RL) if equation (RLmi) is exact.

Problem

Justify that the primitive function of the exact equation (RL) is an integral of this equation.

Problem

Justify that equation (RL) has an integrating factor if and only if there exists an integral of this equation.

$ "RL ma czynnik całkujący" <=> "istnieje całka tego równania" $

$(=>)$

$RL_mu "? jest zupełne"$

Zatem istnieje $F(x, y)$ taka ze $dF = mu(x,y) P(x,y) dx + mu(x,y) Q(x,y) dy =
mu(x,y) (P(x,y) dx + Q(x,y) dy)$

jakieś średnie to rozwiązanie, lepiej

$
F = integral_(x_0, y_0)^(x, y) P dx + Q dy
$

cos twierdzenie greena. ze droga calkowania nie jest istotna.


$(<==)$

Zatem istnieje $h(x,y) != 0$ taka ze
$
dPhi = h(x,y)( P(x,y) dx + Q(x,y) dy) = underbrace(h(x,y) P dx, Phi_y) +
underbrace((x,y) Q(x,y) dy, Phi_x)
$

Problem

Find the necessary and sufficient condition for the differential equation (RL) to have an integrating factor of the form:
+ $mu(x+y)$

  $
    mu(x+y)P(x,y) dx + mu(x+y)Q(x,y) dy = 0 \
    "aby było zupełne: " partial/(partial x) mu(x+y)P = partial/(partial y) mu(x+y)Q  \
    mu' P + mu P_x = mu' Q + mu Q_y \
    mu' (P - Q) = mu (Q_y - P_x) \
    mu'/mu = (Q_y - P_x)/(P - Q) \
  $

  Zatem $u'/u$ musi zależeć wyłącznie od $x + y$.

+ $mu(x y)$

  $ partial/(partial y) (mu(x y) P) = partial/(partial x) (mu(x y) Q) $

  $ mu' x P + mu P_y = mu' y Q + mu Q_x $

  $ mu' (x P - y Q) = mu (Q_x - P_y) $

  $ mu' / mu = (Q_x - P_y)/(x P - y Q) $

  Zatem $u'/u$ musi zależeć wyłącznie od $x y$.

+ $mu(x^2 - y^2)$

  $
    dvps(mu(x^2 - y^2) P, y) = dvps(mu(x^2 - y^2) Q, x) \
    mu' (-2y) P + mu P_y =  mu' (-2x) Q + mu Q_x \
    mu' ((-2y) P - (-2x) Q) = mu (Q_x - P_y)  \
    mu' / mu = (Q_x - P_y)/(- 2y P + 2x Q)  \
  $

  Zatem $u'/u$ musi zależeć wyłącznie od $x^2 - y^2$.

+ $mu(x^2 + y^2)$

  $
    dvps(mu(x^2 + y^2) P, y) = dvps(mu(x^2 + y^2) Q, x) \
    mu' (2y) P + mu P_y =  mu' (2x) Q + mu Q_x \
    mu' (2y P - 2x Q) = mu (Q_x - P_y)  \
    mu' / mu = (Q_x - P_y)/(2y P - 2x Q)  \
  $

  Zatem $u'/u$ musi zależeć wyłącznie od $x^2 + y^2$.

Problem

Find the integrals of the differential equations:

+ $2x y d x + (x^2 - y^2) d y = 0$

  $P(x,y) = 2x y \
   Q(x,y) = x^2 - y^2$

  Czy zupełne?

  $P_y (x,y) = 2x \
   Q_x (x,y) = 2x$

  Tak.

  $Phi_x = 2x y quad => quad Phi(x,y) = x^2 y + f(y) quad => quad Phi_y = x^2 + f'(y)$

  $Q = Phi_y <==> x^2 - y^2 = x^2 + f'(y) <==> f'(y) = -y^2 => f(y) = -1/3 y^3 + C$

  Zatem $Phi(x,y) = x^2 y -1/3 y^3$.

  Całka: $x^2 y - 1/3 y^3 = C$

  #note[
    A co gdyby to równanie nie było zupełne (czyli inne pochodne dla P i Q)?
  ]

+ $(1 - x^2 y) d x + x^2(y - x) d y = 0$

  $
    P(x,y) = 1 - x^2 y \
    Q(x,y) = x^2(y - x)
  $

  Czy zupełne?
  $
    P_y (x,y) = - x^2 \
    Q_x (x,y) = 2x y - 3x^2
  $
  Nie.

  #note[
    Teraz moge sobie odpowiedziec na pytanie

    $Phi_x = 1 - x^2 y quad => Phi (x,y) = x - 1/3 x^3 y => Phi_y = -1/3 x^3 + f'(y)$

    $Q = Phi_y <==> x^2(y - x) = -1/3 x^3 + f'(y) <==> x^2(y - x) = -1/3 x^3 + f'(y)$

    Nie da się wyciągnąć $f'(y)$ bo $x$ się nie znoszą.
  ]

  $ Q_x - P_y = 2 x y - 2 x^2 $
  $ P - Q = (1 - x^2 y) - (x^2 y - x^3) $

  Spróbujmy $mu(x)$:

  $
    dvps(mu(x) P, y) = dvps(mu(x) Q, x) \
    mu P_y = mu' Q + mu Q_x \
    mu'/mu  = (P_y - Q_x)/Q \
  $

  Ten iloraz musi zależeć od x.

  $
    (P_y - Q_x)/(Q)
    = (2 x^2 - 2 x y)/(x^2 y - x^3)
    = (2 x^2 - 2 x y)/(-x (x^2 - x y))
    = -2/x
  $

  Zależy od $x$. Znajdźmy $mu$:

  $
    mu'/mu = -2/x => ln(mu)' = -2/x => ln(mu) = -2 ln(x) + C(x) => mu = exp(-2 ln(x)) = 1/x^2
  $


  Zatem przemnożmy obie stron równania postaci Lebiniza:

  $
    1/x^2 dot (1 - x^2 y) d x + 1/x^2 dot x^2(y - x) d y = 0 \
    (1/x^2 - y) d x + (y - x) d y = 0 \
  $

  $P_y = -1, Q_x = -1$, zgadza się!

  $Phi_x = 1/x^2 - y quad => Phi = -1/x - y x + C(y) quad => Phi_y = -x + C'(y) $

  $Phi_y = Q <==> y-x = -x + C'(y) => C'(y) = y => C(y) = 1/2 y^2 + C $

  Zatem całka ogólna wynosi:

  $-1/x -y x + 1/2 y^2 = C$

  #note[
    Sprawdźmy czy dobrze: różniczkując?

    Różniczkujemy po $x$ obie strony $-1/x -y x + 1/2 y^2 = C$

    $1/x^2 - y = 0$

    Po $y$:

    $-x + y = 0$

    Czyli:

    $1/x^2 - y dx + -x + y dy = 0$

    Jak przemnożmy całość przez $x^2$: *(czy to jest legalne sprawdzenie?)*

    $1 - x^2 y dx + x^2 (y - x) dy = 0$
  ]

+ $frac(x d x - y d y, x^2 + y^2) = 0$

+ $frac(y, x) d x + (y^3 + ln x) d y = 0$

+ $(x^2 y^3 + y) d x + (x^3 y^2 - x) d y = 0$

+ $(x - x y) d x + (x^2 + y) d y = 0$

Problem

Show that the differential equation $y d x - x d y = 0$ does not have an integral defined on the region $D = RR^2 - {(0,0)}$.

*Hint:* Assume by contradiction that $Phi : D -> RR$ is such an integral. Consider the regular closed curve $gamma : [0, 2 pi] -> D$ of class $C^1$, $gamma(s) = (cos s, sin s)$. The derivative $d/(d s)(Phi compose gamma)$ takes non-zero values for every $s in [0, 2 pi]$ (why?). And what is the integral of this derivative over the interval $[0, 2 pi]$ equal to?
