#import "../lib.typ": * 
#show: styling

#let dx = $"d"x$
#let dy = $"d"y$
#let dz = $"d"z$

Mikołaj Kapica 272729 | Równania Różniczkowe Zwyczajne | Zadanie dodatkowe 6

Problem 

Dane jest równania 

$ 
(x^2/y - y/x^2) dx + 1/x dy = 0
$

a) Znajdź czynnik całkujący spośród

1) $mu(x)$, 2) $mu(y)$, 3) $mu(x y)$, 4) $mu(x/y)$

Uwaga: należy to poprzeć rachunkami, a nie tylko wpisać wynik.

b) Znajdź rozwiązanie $y(x)$ przechodzące przez punkt $(1/2, -1/2)$.

Podaj numer czynnika całkującego: 4

Podaj wartość $y(1) = -1/2$


a) 

$ (x^2/y - y/x^2) dx + 1/x dy = 0 $

Wypisujemy P i Q:

$ P(x, y) = x^2/y - y/x^2 $

$ Q(x, y) = 1/x $

Pochodne cząstkowe: 

$ P_y = partial/(partial y) P(x, y) = - x^2/y^2 - 1/x^2 $

$ Q_x = partial/(partial x) Q(x, y) = -1/x^2 $

+ Szukamy $mu = mu(x)$:

  $ partial/(partial y) (mu(x) P(x,y)) = partial/(partial x) (mu(x) Q(x,y)) $
  
  $ mu P_y = mu' Q + mu Q_x $
  
  $ mu' Q = mu (P_y - Q_x) $
  
  $ mu'/mu = (P_y - Q_x) / Q $
  
  Ponieważ $(P_y - Q_x) / Q = (- x^2/y^2) / (1/x) = -x^3/y^2 $ zależy od y to $mu(x)$
  nie może być szukanym czynnikiem całkującym.


+ Szukamy $mu = mu(y)$:
  
  $ partial/(partial y) (mu(y) P(x,y)) = partial/(partial x) (mu(y) Q(x,y)) $
  
  $ mu' P + mu P_y = mu Q_x $
  
  $ mu' P = mu (Q_x - P_y) $
  
  $ mu'/mu = (Q_x - P_y) / P $
  
  
  Ponieważ $
  (Q_x - P_y) / P 
  = (x^2/y^2) / (x^2/y - y/x^2) 
  = (x^2/y^2) / ((x^4 - y^2)/(y x^2))
  = (x^2/y^2 dot y x^2) / (x^4 - y^2)
  = (x^4/y) / (x^4 - y^2)
  = (x^4) / (x^4 y - y^3)
  $ 
  zależy od x to $mu(y)$
  nie może być szukanym czynnikiem całkującym.

+ Szukamy $mu = mu(x y)$
  
  $ partial/(partial y) (mu(x y) P(x,y)) = partial/(partial x) (mu(x y) Q(x,y)) $

  $ mu' x P + mu P_y = mu' y Q + mu Q_x $

  $ mu' (x P - y Q) = mu (Q_x - P_y) $

  $ mu' / mu = (Q_x - P_y)/(x P - y Q) $

  Ponieważ

  $
  (Q_x - P_y)/(x P - y Q)
  = (x^2/y^2) / (x dot (x^2/y - y/x^2) - y dot 1/x)
  = (x^2/y^2) / (x^3/y - y/x - y/x)
  = (x^2/y^2) / (x^3/y - 2 dot y/x)
  = (x^3) / (x^4 y - 2 y^3)
  = (x y)^3 / ((x y)^4 - 2 y^6)
  $
  zależy od $y^6$ to $mu(x y)$
  nie może być szukanym czynnikiem całkującym.

+ Szukamy $mu = mu(x / y)$

  $ partial/(partial y) (mu(x / y) P(x,y)) = partial/(partial x) (mu(x / y) Q(x,y)) $

  $ mu' (-x/y^2) P + mu P_y = mu' (1/y) Q + mu Q_x $

  $ mu' ((-x/y^2) P - (1/y) Q) = mu (Q_x - P_y) $

  $ mu'/mu = (Q_x - P_y)/((-x/y^2) P - (1/y) Q) $

  Ponieważ
  $
  (Q_x - P_y)/((-x/y^2) P - (1/y) Q)
  &= (-1/x^2 - (- x^2/y^2 - 1/x^2))/((-x/y^2) (x^2/y - y/x^2) - (1/y) (1/x))
  = (-1/x^2 + x^2/y^2 + 1/x^2)/((-x/y^2) (x^2/y - y/x^2) - (1/y) (1/x)) \
  &= (x^2 / y^2)/(-x^3/y^3 + 1/(x y) - 1/(x y)) 
  = (x^2 / y^2)/(-x^3/y^3)
  = -y/x = - (1 / (x/y))
  $

  zależy wyłącznie od $x/y$ to $mu(x/y)$, czyli $mu$ będzie czynnikiem
  całkującym. 

Wyliczmy ten czynnik całkujący. Ustalmy $z := x/y$.

$
(mu'(z)) / (mu(z)) = h(z) ==> (ln(mu(z)))' = h(z) \

ln(mu(z)) = integral h(z) dz \

mu(z) = exp(integral h(z) dz) = exp(integral - 1/z dz) = 1/z \

$

Podstawiając z powrotem za $z := x/y$:

$
mu(x/y) = y/x
$

Po przemnożeniu:

$
mu P dx + mu Q dy = y/x dot (x^2/y - y/x^2) dx + y/x dot 1/x dy = 0 \
(x - y^2/x^3) dx + y/x^2 = 0
$

mamy równanie zupełne, co łatwo sprawdzić:

$
partial/(partial y) (x - y^2/x^3) = -2y/x^3 = partial/(partial x) (y/x^2)
$

Szukamy potencjału $Phi$:

$
Phi_y = y/x^2 => Phi(x, y) = y^2/(2x^2) + f(x) => Phi_x = - y^2/x^3 + f'(x).
$

Przyrównując do nowego P, otrzymujemy 

$
- y^2/x^3 + f'(x) =  x - y^2 / x^3 \
f'(x) = x => f(x) = 1/2 x^2 + C
$

Stąd potencjał to $Phi(x,y) = y^2/(2x^2) + 1/2 x^2$, a rozwiązanie (całka
ogólna) ma postać

$
y^2/(2x^2) + 1/2 x^2 = C
$

Korzystając z warunku że krzywa przechodzi przez punkt $(1/2, -1/2)$, możemy go
podstawić:

$
(-1/2)^2/(2(1/2)^2) + 1/2 (1/2)^2 = C \

1/2 + 1/8 = C => C = 5/8
$

Więc równanie krzywej to:

$
1/2 x^2 + y^2/(2x^2) = 5/8
$

Należało policzyć $y(1)$:

$
y^2 = (2x^2) dot (5/8 - 1/2 x^2) = 5/4 x^2 - x^4
$

Skoro w warunku $y = -1/2$ to wybieramy:

$
y = - sqrt(5/4 x^2 - x^4)
$

$
y(1) = - sqrt(5/4 - 1) = - sqrt(1/4) = - 1/2
$






