1.

$
  cases(
    x' = 2x + y + 2 e^t,
    y' = x + 2y - 3 e^(4t)
  )
$

$
  X'(t) = A(t) X(t) + h(t)
$

$
  A(t) = mat(2, 1; 1, 2)
$

$
  omega(lambda) = (2-lambda)^2 - 1 = (lambda - 3)(lambda - 1)
$

$
  lambda = 3: mat(-1, 1; 1, -1) mat(x; y) = mat(0; 0) => x = y => v_1 = mat(1; 1)
$

$
  lambda = 1: mat(1, 1; 1, 1) mat(x; y) = mat(0; 0) => x = -y => v_2 = mat(1; -1)
$

$
  phi(t) = c_1 e^(3t) mat(1; 1) + c_2 e^(t) mat(1; -1) = underbrace(mat(e^(3t), e^t; e^(3t), - e^t), Psi(t)) C(t)
$

Teraz:

$
  A(t) Psi(t) C(t) + h(t) & = (Psi(t) C(t))' \
                          & = Psi' (t) C(t) + Psi(t) C'(t) \
                          & = A(t) Psi(t) C(t) + Psi(t) C'(t)
$

Zatem $h(t) = Psi(t) C'(t)$. Więc $C'(t) = Psi^(-1) (t) h(t)$.

$
  C(t) = integral Psi^(-1) (t) h(t) dif t
$

$
  abs(Psi (t)) = abs(-1 -1) = 2
$

$
  Psi^(-1) (t) = 1/2 mat(e^(t), - e^(t); - e^(3t), e^(3t))
$

$
  ...
$

#pagebreak()

2. Podać dziedzinę nieprzedłużalnego rozwiązania:

$
  cases(
    x' + 2 x e^t - x^2 = e^(2t) + e^t,
    x(0) = 3
  )
$

$
  x' -e^t = x^2 -2 x e^t + e^(2t) \
  x' - e^t = (x - e^t)^2 \
$

Niech $u = x - e^t$. Wtedy $u' = x' - e^t$. Czyli mamy:

$
  u' = u^2
$

$
  (dif u) / (dif t) = u^2 \
  (dif u) / u^2 = dif t mid(|) integral \
  - 1/u = t + C \
  u = - 1/(t + C)
$

$
  x - e^t = -1/(t+C) \
  x = -1/(t+C) + e^t \
$

$
  x(0) = 3 => 3 = -1/C + 1 => C = -1/2
$

$
  x(t) = -1/(t + 1/2) + e^t
$

Dziedzina nieprzedłużalnego rozwiązania: $D_t = (-1/2; oo)$.

#pagebreak()

3. W układzie równań znaleźć punkty krytyczne oraz zbadać ich stabilność.

$
  cases(
    x′ = −x(1 + x^2 − 2 x y),
    y′ = y(1 − x y)
  )
$

Znajdujemy punkty krytyczne:

$
  cases(
    x' = 0 <=> -x(1 + x^2 - 2 x y) = 0,
    y' = 0 <=> y(1 - x y) <=>
  )
$

$
  1) quad x = 0 and y = 0 \
  2) quad 1 + x^2 - 2 x y = 0 and 1 - x y = 0 ==> x^2 = 1 => cases(x=1, y=1) or cases(x=-1, y = -1)
$

Czyli 3 punkty krytyczne $(1,1), (-1,-1), (0,0)$.

Macierz Jacobiego:

$
  J(x,y) = mat(
    -1 - 3x^2 + 4 x y, 2x^2;
    -y^2, 1 - 2 x y
  )
$

1. Punkt (1,1) lub (-1,-1):

$
  J(x,y) = mat(
    0, 2;
    -1, -1
  )
$

$
  (-lambda)(-1-lambda) + 2 = 0 => lambda^2 + lambda + 2 = 0 => lambda = (-1 plus.minus i sqrt(7))/2
$

Część rzeczywista jest ujemna zatem ognisko stabilne.

2. Punkt (0,0)

$
  J(x,y) = mat(-1, 0; 0, 1)
$

To jest siodło -> niestabilny.


#pagebreak()

4. Scałkować metodą czynnika cąłkującego:

$
  (2/y + y/x^3) dif x + (1/(x y) - 2/x^2) dif y = 0
$

$
  P = (2/y + y/x^3), quad Q = (1/(x y) - 2/x^2)
$

$
  (dif P)/(dif y) = - 2/y^2 + 1/x^3 \
  (dif Q)/(dif x) = - 1/(x^2 y) + 4/(x^3)
$

Nie jest to samo, zatem to nie jest równanie zupełne. Szukamy czynnika całkującego $mu(S(x,y))$ tż

$ (dif mu P)/(dif y) = (dif mu Q)/(dif x) $

$
  mu' S_y P + mu P_y = mu'S_x Q + mu Q_x \
  mu' (P S_y - S_x Q) = mu(Q_x - P_y) \
  mu' / mu = (Q_x - P_y) / (P S_y - Q S_x)
$

Weźmy $S(x,y) = x y$. Wtedy:

$
  mu' / mu = (-1/(x^2 y) + 4/x^3 + 2/y^2 - 1/x^3) / ((2/y + y/x^3) x - (1/(x y) - 2/x^2) y)
  = (-1/(x^2 y) + 3/x^3 + 2/y^2) / ((2 x) / y + y/x^2 - 1/x + (2y)/(x^2))
  = (-1/(x^2 y) + 3/x^3 + 2/y^2) / ((2 x) / y + (3 y)/x^2 - 1/x)
  = (-1/(x^2 y) + 3/x^3 + 2/y^2) / ((x y) dot ((2) / y^2 + (3)/x^3 - 1/(y x^2))) = 1/(x y) = 1/S
$

$
  (ln mu)' = 1/(x y) \
  ln mu = integral 1/(S) dif S \
  ln mu = ln S + C\
  mu = x y C \
$

$
  Phi_x = mu P, quad Phi_y = mu Q
$

$
  Phi = integral 2x + y^2/x^2 dif x = x^2 - y^2/x + C (y)
$

$
  Phi_y = - (2 y)/x + C' (y)
$

Przyrównujemy $Phi_y$:

$
  - (2 y)/x + C'(y) = 1 - (2 y)/x
$


$
  C'(y) = 1 ==> C(y) = y + C
$

$
  x^2 - y^2/x + y = C
$

#pagebreak()

5.

$
  4 t x′′ + 2x′ − x = sqrt(t)
$

Zastosować $s = sqrt(t)$.

Niech $u(s) = x(s^2)$.

$
  dif / (dif t) x = (dif s) / (dif t) dif / (dif s) u(s) = 1 / (2s) u'
$

$
  dif^2 / (dif t^2) x = dif / (dif t) (u'(s)) / (2s) = (dif s)/(dif t) dif/(dif s) u' / (2s) = 1/(2 s) (u'' 2s - u' 2 )/(4s^2) = u''/(4s^2) - (u')/(4s^3)
$

$
  4 s^2 [u''/(4s^2) - (u')/(4s^3)] + 2 1/(2s) u' - u = s \
  u'' - u'/s + 1/s u' - u = s \
  u'' - u = s
$

Pomijamy stałą:

$
  u'' - u = 0 \
  lambda^2 - 1 = 0 => lambda = plus.minus 1 \
  u_j = C_1 e^s + C_2 e^(-s) \
$

Wrzucamy do pierwotnego układu:

$
  C_1 e^s + C_2 e^(-s) - C_1 e^s + C_2 e^(-s) = 0
$

Jakie zakłócenie musi wejść do rozwiązania:

$
  u = C_1 e^s + C_2 e^(-s) - s \
$

I wracamy do $x(t)$:

$
  x(t) = C_1 e^(sqrt(t)) + C_2 e^(-sqrt(t)) - sqrt(t) \
$

#pagebreak()

6. Pokazać, że tylko jedno rozwiązanie równania:

$
  t x′ − (2 t^2 + 1)x = t^2
$

ma skończoną granicę, gdy $t -> oo$. Wyznaczyć tę granicę.

$
  x' = f(t, x) = (2t^2 + 1)/t x + t
$

To jest równanie liniowe pierwszego rzędu.

$
  (x e^(- t^2 - ln t))' = e^(-t^2 - ln t) t
$

$
  x e^(- t^2 - ln t) = integral e^(-t^2 - ln t) t + C \
  x/(t e^(t^2)) = integral e^(-t^2) + C \
  x(t) = t e^(t^2) (integral_(t_0)^t e^(-t^2) + C) \
$


Zauważmy, że to jest całka Gaussa (skończona):

$
  integral_(t_0)^oo e^(-t^2)
$

a

$
  t e^(t^2) -->^(n -> oo) oo
$

Aby równanie było skończone to $C = - integral_(t_0)^oo e^(-t^2)$.
Tylko wtedy równanie jest skończone.

$
  lim_(t->oo) t e^(t^2) (integral_(t_0)^t e^(-t^2) dif t - integral_(t_0)^oo e^(-t^2)) = lim_(t->oo) - ( integral_(t)^oo e^(-w^2) dif w)/(1/(t e^(t^2))) =^(H) - (- e^(-t^2))/(- (e^(t^2) + 2t^2 e^(t^2))/(t e^(t^2))^2) = - t^2 / (1+t^2) -->^(n->oo) - 1/2
$

#pagebreak()

7. Rozwiązać równanie różniczkowe:

$
  t x′ + x = x^2 ln t", dla" t > 0
$

$
  x' + 1/t x = x^2 ln t \
  u := x^(1-2) =1/x \
  u' = - 1/x^2 x' = - 1/x^2 (x^2 ln t - 1/t x) = - ln t + 1/(t x) = -ln t + 1/t u
$

$
  u' - 1/t u = ln t \
  (u/t)' = 1/t ln t \
  u/t = 1/t ln t + C \
  u = ln t + C \
  x = 1/(ln t + C)
$

#pagebreak()

8. Wyznaczyć macierz fundamentalną układu równań oraz podać jego rozwiązanie ogólne
$
  cases(
    x' = 3x - y,
    y' = x + y
  )
$

$
  X' = A X
$

$
  A = mat(3, -1; 1, 1)
$

Diagonalizujemy:

$
  w(lambda) = (3-lambda)(1-lambda) + 1 = 4 - 4 lambda + lambda^2 = (2 - lambda)^2 ==> lambda = 2
$

Pierwszy ww.

$
  mat(1, -1; 1, -1) mat(x; y) = mat(0; 0) ==> x = y ==> v_1 = mat(1; 1)
$

Drugi ww. (pseudo)

$
  mat(1, -1; 1, -1) mat(x; y) = mat(1; 1) ==> x = y - 1 => v_2 = mat(1; 0)
$

Zatem $phi(t) = C_1 (t) e^(2t) mat(1; 1) + C_2 (t) e^(2t) (t mat(1; 1) + mat(1; 0))$

bo $phi(t) = Psi(t) c(t)$

$Psi(t) = e^(2t) mat(1, (t+1); 1, t)$

$
  mat(x; y)= Psi(t) C(t) = e^(2t) mat(C_1 + (t+1)C_2; C_1+t C_2)
$

Zatem:

$
  cases(
    x = e^(2t) (C_1 + (t+1)C_2),
    y = e^(2t) (C_1 + t C_2)
  )
$


#pagebreak()


9. Korzystając z transformaty Laplace’a, rozwiązać zagadnienie początkowe:

$
  cases(
    x'' - 2x' + x = t e^t,
    x (0) = 0,
    x' (0) = 1
  )
$

Niech $X(s) = cal(L)[x(t)](s)$:

$
  cal(L) [x'' - 2x' + x] = cal(L) [t e^t] \
  s^2 X(s) - s x(0^+) - x'(0^+) -2 (s X(s) - f(0^+)) + X(s) = - dif/(dif s) (1/(s-1)) \
  s^2 X(s) - 1 - 2 (s X(s)) + X(s) = - dif/(dif s) (1/(s-1)) \
  X(s) (s^2 - 2 s + 1) - 1 = 1/(s-1)^2 \
  X(s) = 1/(s-1)^4 + 1/(s-1)^2 \
  cal(L)[x(t)](s) = 1/(s-1)^4 + 1/(s-1)^2 \
  x = cal(L)^(-1) [1/(s-1)^4 + 1/(s-1)^2] \
  x = cal(L)^(-1) [1/(s-1)^4] + cal(L)^(-1) [1/(s-1)^2] = t^3/3! e^(t) + t/1! e^t = e^t (t^3 / 6 + t) \
$

$
  cal(L) [t^n f(t)](s) = (-1)^n dif^n / (dif s^n) F(s)
$

$
  integral_0^oo e^(-s t) e^t dif t
  = integral_0^oo e^(t(-s + 1)) dif t
  = - 1/(s-1) integral_0^oo e^(-u) dif u
  = - 1/(s-1) [0 - 1] = 1 /(s-1)
$

#pagebreak()


10. Dla zagadnienia

$
  y'' + t y' + 3 y = 0, quad y(0) = 2, quad y'(0) = -1
$

i szeregu $y(t) = sum_(n=0)^oo a_n t^n$ wyznaczyć $a_n$ dla $0 <= n <= 5$

$
  a_0 + a_1 t + a_2 t^2 + ... quad | dif / (dif t) \
  0 + a_1 + 2 a_2 t + ... quad | dif / (dif t) \
  0 + 0 + 2 a_2 + ...
$

$
  sum_(n=2)^oo n (n-1) a_n t^(n-2) + t sum_(n=1)^oo n a_n t^(n-1) + 3 sum_(n=0)^oo a_n t^n = 0 \
  sum_(n=0)^oo (n+2) (n+1) a_(n+2) t^n + sum_(n=0)^oo n a_(n) t^n + 3 sum_(n=0)^oo a_n t^n = 0 \
  sum_(n=0)^oo [(n+2) (n+1) a_(n+2) + n a_(n) + 3 a_n ] t^n = 0 \
  (n+2) (n+1) a_(n+2) + n a_(n) + 3 a_n = 0 \
  ==> a_(n+2) = - ((n + 3) a_n)/((n+2) (n+1))
$

Skoro: $y(0) = 2 "i" y'(0) = -1$:

$
  a_0 = 2, quad a_1 = -1
$

Zatem:

$
  a_2 = - (3 dot 2) / 2 = - 3, a_4 = - ((5) (-3))/(4 dot 3) = 5/4
$

i

$
  a_3 = - (4 dot (-1))/(3 dot 2) = 2/3, quad a_5 = - (6 dot 2\/3) / (5 dot 4) = - 1/5
$

Zatem pierwsze 5 wyrazów ciągu $a_n$:

$
  (
    2, space
    -1, space
    -3, space
    2\/3, space
    5\/4, space
    -1\/5
  )
$



#pagebreak()


11. Stosując $x' = u$, rozwiązać równanie Clairauta

$
  x = t x' + (x')^2
$

i znaleźć rozwiązanie osobliwe.

$
  x = t u + u^2
$

Różniczkujemy po $t$:

$
  u = u + t u' + 2 u u'
$

$
  0 = u'(t + 2u) <=> u' = 0 or u = -t/2
$

Pierwszy przypadek: $u' = 0 => u = C$:

$
  x = t C + C^2
$

Drugi przypadek: $u = -t/2$:

$
  x = - t^2 /2 + t^2/4 = - t^2 / 4
$

Rozwiązanie $- t^2 / 4$ jest osobliwe. Jest to tzw. obwiednia rodziny ogólnej rozwiązań $x = t C + C^2$.

#pagebreak()

12. Dla poniższego liniowego układu równań określić typ punktu równowagi (np. węzeł, ognisko, siodło, środek), zbadać jego stabilność i naszkicować portret fazowy:

$
  mat(x'; y') = mat(1, -4; 1, 1) mat(x; y)
$


Liczymy wartości własne:

$
  (1 - lambda)^2 + 4 = 0
  => lambda^2 - 2 lambda + 5
$

$
  lambda^2 - 2 lambda + 5 = 0, quad Delta = 4 - 4 dot 5 = -16 => sqrt(Delta) = plus.minus 4 i
$

$
  lambda_1 = 1 + 2i, quad lambda_2 = 1 - 2i
$

Części rzeczywiste obu wartości własnych są dodatnie zatem mamy ognisko niestabilne.





