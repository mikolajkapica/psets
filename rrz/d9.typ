MIKOŁAJ KAPICA 272729

Zadanie 9

Dana jest macierz $A = mat(2, 1; -1, 4)$

Obliczyć $e^(t A)$.

Podaj wartość $tr(e^(2 A)) =$

wynik podaj z dokładnością do dwóch miejsc po przecinku.

#line(length: 100%)

$
  A = mat(2, 1; -1, 4)
$

$
  w(lambda) = det(A - lambda I) = mat(
    delim: "|",
    2 - lambda, 1;
    -1, 4 - lambda
  ) & = (2-lambda)(4-lambda) + 1 \
    & = 8 - 6 lambda + lambda^2 + 1 \
    & = 9 - 6 lambda + lambda^2 \
    & = (3 - lambda)^2 => lambda = 3
$

Wartość własna $lambda = 3$. Szukamy wektor własny

$
  mat(-1, 1; -1, 1) mat(a; b) = mat(0; 0) ==> - a + b = 0 ==> v = mat(1; 1)
$

Szukamy uogólnionego wektora własnego:

$
  (A - 3 I) w = v ==> mat(-1, 1; -1, 1) mat(a; b) = mat(1; 1) ==> - a + b = 1 ==> a = 1, b = 2 ==> w = mat(1; 2)
$

$
  P = mat(1, 1; 1, 2), quad P^(-1) = mat(2, -1; -1, 1)
$

$
  A v = 3v + 0w \
  A w = v + 3 w \
  "więc" J = mat(3, 1; 0, 3)
$

$
  e^(t A)
  = e^(t P J P^-1)
  = P e^(t J) P^-1 & = mat(1, 1; 1, 2) mat(e^(3t), t e^(3t); 0, e^(3t)) mat(2, -1; -1, 1) \
                   & = mat(e^(3t), (t + 1) e^(3t); e^(3t), (t + 2) e^(3t)) mat(2, -1; -1, 1) \
                   & = mat((1 - t) e^(3t), t e^(3t); -t e^(3t), (1 + t) e^(3t)) \
$

$
  tr(e^(2 A)) = tr(mat(-1 e^6, .; ., 3 e^6)) = 2 e^6 approx 806.86
$
