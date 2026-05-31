MIKOŁAJ KAPICA 272729

== Zadanie 11

#set enum(numbering: "a)")

Stosując metodę szeregów potęgowych znaleźć rozwiązanie zagadnienia początkowego

$
  cases(
    (1-t^2) x'' - 4 t x' - 2x = 0,
    x(0) = 1"," x'(0) = -1
  )
$

Podaj wartość $x(4) = ???$

$
  (1-t^2) x'' - 4 t x' - 2x = 0,
$

$
  x(t)
  = sum_(n=0)^oo c_n t^n
$

$
  t x'
  = t sum_(n=1)^oo c_n n t^(n-1)
  = sum_(n=1)^oo c_n n t^(n)
  = sum_(n=0)^oo c_n n t^(n)
$

$
  (1 - t^2) x'' & = sum_(n=2)^oo c_n n (n-1) t^(n-2)
                  - t^2 sum_(n=2)^oo c_n n (n-1) t^(n-2) \
                & = sum_(n=0)^oo c_(n+2) (n+2) (n+1) t^n
                  - sum_(n=0)^oo c_n n (n-1) t^n
$

Zatem:

$
  (1-t^2) x'' - 4 t x' - 2x
  = t^n sum_(n=0)^oo underbrace(
    (
      c_(n+2) (n+2) (n+1)
      - c_n n (n-1)
      - 4 c_n n
      - 2 c_n
    ), = 0
  ) = 0
$

$
  & ==> c_(n+2) (n+2) (n+1) = c_n (n (n-1) + 4 n + 2) \
  & ==> c_(n+2) = (n (n-1) + 4 n + 2)/((n+2) (n+1)) c_n \
  & ==> c_(n+2) = (n^2 + 3 n + 2)/(n^2 + 3n + 2) c_n \
  & ==> c_(n+2) = c_n
$

Zatem dla $|t| < 1$:

$
  x(t)
  = sum_(n=0)^oo c_n t^n
  = sum_(n=0)^oo c_0 t^(2n) + sum_(n=0)^oo c_1 t^(2n+1)
  = c_0 1/(1- t^2) + c_1 t/(1 - t^2)
$

Zatem układ fundamentalny: ${1/(1-t^2), t/(1-t^2)}$.

$
  x'(t) & = c_0 (2t)/(1-t^2)^2 + c_1 (1 dot (1-t^2) - t dot (-2t))/(1-t^2)^2 \
        & = c_0 (2t)/(1-t^2)^2 + c_1 (1+t^2)/(1-t^2)^2
$

Dla warunków początkowych $x(0) = 1"," x'(0) = -1$:

$
  cases(
    x(0) = c_0 = 1,
    x'(0) = c_1 = -1
  )
$

Zatem:

$
  x(t) = 1/(1- t^2) - t/(1 - t^2) = (1 - t)/(1 - t^2) = 1/(1 + t)
$

Możemy przedłużyć nasze rozwiązanie do

$
  cal(D)_t in (-1, +oo)
$

Wtedy:

$
  x(4) = 1/5 = 0.2
$
