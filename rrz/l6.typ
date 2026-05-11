#import "../lib.typ": *
#show: styling

#let dt = $"d"t$
#let du = $"d"u$
#let dx = $"d"x$
#let dy = $"d"y$
#let dz = $"d"z$
#let df = $"d"f$
#let dF = $"d"F$
#let dPhi = $"d"Phi$
#let RL = $"RL"$
#let dv = $"d"v$
#let dtau = $"d"tau$

Zadanie 1

Znaleźć rozwiązania ogólne układów równań różniczkowych:
a) $cases(x' = x sin t, y' = x e^(cos t))$
b) $cases(x' + (2x)/t = 0, y' = (1 + 2/t)x + y)$

Zadanie 2

Znaleźć rozwiązania ogólne równań różniczkowych:
a) $(1 + t^2)x'' + (x')^2 + 1 = 0$
b) $t x'' = x' ln(x'/t)$
c) $(t ln t)x'' - x' = 0$
d) $x x'' = (x')^3$
e) $1 + (x')^2 = 2x x''$
f) $2x x'' + (x')^2 + (x')^4 = 0$

Zadanie 3

Znaleźć rozwiązania zagadnień początkowych:
a) $2x x'' - 3(x')^2 = 4x^2$, $x(0) = 1$, $x'(0) = 0$
b) $3x' x'' = e^x$, $x(-3) = 0$, $x'(-3) = 1$

Zadanie 4

Znaleźć równanie ruchu ciała o masie $m$ spadającego swobodnie, uwzględniając opór powietrza opisany wzorem $G = k v^2$, gdzie $k$ jest dodatnią stałą, a $v$ jest prędkością ruchu. Znaleźć rozwiązanie tego równania.

Dowód

Z II zasady Newtona:
$
  m (partial v)/(partial t) = m g - k v^2,
  quad v(0) = 0.
$

Niech
$
  v_T = sqrt((m g) / k)
$
oznacza prędkość graniczną. Wtedy
$
  (partial v)/(partial t) = g / v_T^2 (v_T^2 - v^2).
$

Rozdzielamy zmienne i całkujemy oznaczenie, ponieważ warunek początkowy $v(0) = 0$ od razu wyznacza granice całkowania:
$
  integral_0^v dv / (v_T^2 - v^2)
  = g / v_T^2 integral_0^t #dtau
  = g / v_T^2 t.
$

Rozkład na ułamki proste:
$
  1 / (v_T^2 - v^2)
  = 1 / ((v_T - v)(v_T + v))
  = 1 / (2 v_T) (1 / (v_T - v) + 1 / (v_T + v)).
$

Stąd
$
  integral_0^v #dv / (v_T^2 - v^2)
  = 1 / (2 v_T)
  integral_0^v (1 / (v_T - v) + 1 / (v_T + v)) #dv
$
$
  = 1 / (2 v_T)
  (-ln(abs(v_T - v)) + ln(abs(v_T + v))) |_0^v
$
$
  = 1 / (2 v_T) ln(abs((v_T + v) / (v_T - v))).
$

Ponieważ ciało startuje z prędkości $0$ i podczas spadania zachodzi $0 <= v < v_T$, mamy $v_T + v > 0$ oraz $v_T - v > 0$. Dlatego wartość bezwzględną można opuścić:
$
  ln(abs((v_T + v) / (v_T - v)))
  = ln((v_T + v) / (v_T - v)).
$

Otrzymujemy więc
$
  1 / (2 v_T) ln((v_T + v) / (v_T - v))
  = g / v_T^2 t.
$

Po rozwiązaniu względem $v$:
$
  v(t)
  = v_T tanh(g t / v_T)
  = sqrt((m g) / k) tanh(sqrt((g k) / m) t).
$

Ponieważ $v = (partial x)/(partial t)$ oraz $x(0) = 0$,
$
  x(t)
  = v_T integral_0^t tanh(g tau / v_T) #dtau
  = v_T^2 / g ln(cosh(g t / v_T))
  = m / k ln(cosh(sqrt((g k) / m) t)).
$

Zadanie 5

Znaleźć rozwiązanie ogólne równania różniczkowego:
$t^2 x x'' = (x - t x')^2$

$v = x' / x$ ale nie wiem skąd to niby

Zadanie 6

Znaleźć rozwiązanie zagadnienia początkowego:
$
  cases(x' = y, y' = y^2 / x),
  quad
  cases(x(0) = 1, y(0) = 2)
$

$
  x' = dx/dt = y, quad y' = dy/dt = y^2/x
$

$
  1/y dx = dt = x/(y^2) dy quad | dot y^2 \
  y dx - x dy = 0 \
$

$
  (mu' (S)) / (mu (S)) = (Q_x - P_y)/(S_y P - S_x Q) quad "musi zależeć wyłącznie od " S
$

Niech $S = x$. Wtedy

$
  mu'/mu = (-1 - 1)/(x) = -2/x quad "zależy tylko od x" checkmark \
  ln(mu)' = -2/x \
  mu = exp(integral -2/x dx) = exp(-2 ln |x|) = 1 / x^2
$

Przemnażając przez $mu$ obie strony:

$
  y/x^2 dx - 1/x dy = 0 \
  "sprawdzenie: " (y/x^2)_y = 1/x^2 = (-1/x)_x quad checkmark
$

$
  Phi_y = -1/x ==> Phi = - y/x + C(x) ==> Phi_x = y/x^2 + C'(x) \
  ==> C'(x) = 0 => C(x) = C
$

Zatem
$
  Phi(x, y) = -y/x = C ==> y = - C x
$

Wtedy podstawiamy $y$ do pierwszego równania:

$
  x' = -C x \
  dx/x = -C dt | integral \
  ln|x| = -C t + D \
  x(t) = plus.minus exp(-C t + D)
$

$
  cases(
    x(t) = plus.minus exp(-C t + D),
    y(t) = - C x(t)
  )
$

Skoro $x(0) = 1$ i $y(0) = 2$ to:

$
  x(0) = plus.minus exp(-C t + D) = 1 \
  y(0) = - C / x(0) = 2
$

$
  1 = plus.minus exp(D) => D = 0 space "i wybieramy" plus
$

$
  2 = - C / 1 => C = -2
$

Zatem:

$
  cases(
    x(t) = e^(2 t),
    y(t) = 2 e^(2 t)
  )
$

#pagebreak()

Zadanie 7

Znaleźć rozwiązanie zagadnienia początkowego:
$
  cases(x' = 1 - 1 / y, y' = 1 / (x - t)),
  quad
  cases(x(0) = -1, y(0) = 1)
$

$
  (d (x - t)) / dt = x' - 1 = - 1/y \
$

Podstawmy $u = x - t$:

$
  cases(
    u' = -1/y,
    y' = 1/u
  )
$

Teraz możemy napisać:

$
  -y du = dt = u dy \
  u dy + y du = 0 \
$

To jest po prostu

$
  Phi(y, u) = y u = C ==> u = C / y
$

Podstawmy do wcześniejszego równania

$
  y' = 1/u = y/C \
  dy/y = 1/C dt \
  ln|y| = t/C + D \
  y = plus.minus exp(t/C + D)
$

oraz

$
  u = C / y => x = C / y + t
$

Podstawmy do warunków początkowych:

$
  1 = y(0) = plus.minus exp(D) => D = 0 "i bierzemy wariant dodatni"
$

$
  -1 = x(0) = C / y(0) + 0 = C / 1 => C = -1
$

Zatem:

$
  cases(
    y = e^(-t),
    x = -1/e^(-t) + t = -e^t + t
  )
$
