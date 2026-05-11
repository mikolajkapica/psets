#import "../lib.typ": *
#show: styling

#let dx = $"d"x$
#let dy = $"d"y$
#let dz = $"d"z$
#let df = $"d"f$
#let dF = $"d"F$
#let dPhi = $"d"Phi$
#let RL = $"RL"$
#let dv = $"d"v$
#let dtau = $"d"tau$

6.1. Znaleźć rozwiązania ogólne układów równań różniczkowych:
a) $cases(x' = x sin t, y' = x e^(cos t))$
b) $cases(x' + (2x)/t = 0, y' = (1 + 2/t)x + y)$

Zadanie

6.2. Znaleźć rozwiązania ogólne równań różniczkowych:
a) $(1 + t^2)x'' + (x')^2 + 1 = 0$
b) $t x'' = x' ln(x'/t)$
c) $(t ln t)x'' - x' = 0$
d) $x x'' = (x')^3$
e) $1 + (x')^2 = 2x x''$
f) $2x x'' + (x')^2 + (x')^4 = 0$

Zadanie

6.3. Znaleźć rozwiązania zagadnień początkowych:
a) $2x x'' - 3(x')^2 = 4x^2$, $x(0) = 1$, $x'(0) = 0$
b) $3x' x'' = e^x$, $x(-3) = 0$, $x'(-3) = 1$

Zadanie

6.4. Znaleźć równanie ruchu ciała o masie $m$ spadającego swobodnie, uwzględniając opór powietrza opisany wzorem $G = k v^2$, gdzie $k$ jest dodatnią stałą, a $v$ jest prędkością ruchu. Znaleźć rozwiązanie tego równania.

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

qed

Zadanie

6.5. Znaleźć rozwiązanie ogólne równania różniczkowego:
$t^2 x x'' = (x - t x')^2$

Dowód

Podstawiamy
$
  x = t u(t).
$

Wtedy
$
  x' = u + t u',
  quad
  x'' = 2u' + t u''.
$

Ponadto
$
  x - t x'
  = t u - t(u + t u')
  = -t^2 u'.
$

Po podstawieniu do równania:
$
  t^2 dot t u dot (2u' + t u'') = t^4 (u')^2.
$

Dla $t != 0$ dostajemy
$
  u(2u' + t u'') = t (u')^2.
$

Czyli
$
  2u u' + t u u'' - t (u')^2 = 0.
$

Mnożymy przez $t / u^2$:
$
  2t u' / u + t^2 u'' / u - t^2 (u' / u)^2 = 0.
$

Zauważamy, że
$
  (t^2 u' / u)'
  = 2t u' / u + t^2 u'' / u - t^2 (u' / u)^2.
$

Zatem
$
  (t^2 u' / u)' = 0.
$

Stąd
$
  t^2 u' / u = C_1.
$

Czyli
$
  u' / u = C_1 / t^2.
$

Całkujemy:
$
  ln abs(u) = - C_1 / t + C_2.
$

Zatem
$
  u = C e^(-C_1 / t).
$

Ponieważ $x = t u$, dostajemy rozwiązanie ogólne
$
  x(t) = C_2 t e^(C_1 / t).
$

qed

Zadanie

6.6. Znaleźć rozwiązanie zagadnienia początkowego:
$
  cases(x' = y, y' = y^2 / x),
  quad
  cases(x(0) = 1, y(0) = 2)
$

Zadanie

6.7. Znaleźć rozwiązanie zagadnienia początkowego:
$
  cases(x' = 1 - 1 / y, y' = 1 / (x - t)),
  quad
  cases(x(0) = -1, y(0) = 1)
$
