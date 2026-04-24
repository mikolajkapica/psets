#import "../lib.typ": * 
#show: styling

#let dx = $"d"x$
#let dy = $"d"y$
#let dz = $"d"z$
#let df = $"d"f$
#let dF = $"d"F$
#let dPhi = $"d"Phi$
#let RL = $"RL"$

MIKOŁAJ KAPICA 272729 | Równania różniczkowe zwyczajne | lista 5

Problem

$ Phi "to całką RL" <=> Phi "to całka" mu "RL" $


Problem

Mamy $(dPhi)/(dy) P - (dPhi)/(dx) Q = 0$, wtedy $df/dPhi dPhi/dy P - df/dPhi
dPhi dx Q = 0$

$
gradient Phi = mat(df/dPhi, dPhi/dx; df/dPhi, dPhi/dy)
$

Problem

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





