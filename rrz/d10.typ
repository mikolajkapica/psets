MIKOŁAJ KAPICA 272729

== Zadanie 10

#set enum(numbering: "a)")

Dane jest równanie

$
  (1 - t^2) x'' - t x' + 1/4 x = 0
$

+ Dla jakiego $p$ funckja $eta(t) = (1 + t)^p$ jest jego rozwiązaniem.

  $p = ???$

+ Znaleźć rozwiązanie tego równania przy warunkach początkowych $x(0) = 4$ oraz $x'(0) = 1$

  Podaj wartość $x(1/2) = ???$

Wynik podać z dokładnością do dwóch miejsc po przecinku.

== Rozwiązanie

+
  $
    (1-t^2)((1 + t)^p)'' - t ((1 + t)^p)' + 1/4 x = 0 \
    (1-t^2)p(p-1)(1 + t)^(p-2) - t p (1 + t)^(p-1) + 1/4 (1 + t)^p = 0 \
    (1-t)p(p-1)(1 + t)^(p-1) - t p (1 + t)^(p-1) + 1/4 (1 + t)^p = 0 \
    (1 + t)^(p-1) [(1-t)p(p-1) - t p + 1/4 (1 + t)] = 0 \
    (1 + t)^(p-1) [p^2 - p^2 t - 1 p + cancel(t p) - cancel(t p) + 1/4 (1 + t)] = 0 \
    (1 + t)^(p-1) [t(1/4 - p^2) + p^2 - p + 1/4] = 0 \
  $

  $p = 1/2$

  Rozwiązanie bazowe: $(1 + t)^(1/2)$

  Dzielimy przez $(1 - t^2)$

  Niech $p_1 (t) = - t/(1-t^2), quad p_2 (t) = 1/(4 - 4t^2)$

  Stąd $phi'' + p_1 phi' + p_2 phi = 0$. Niech $x = y phi$
  $
    x'' + p_1 x' + p_2 x = 0 & => y'' phi + 2 y' phi' + y phi'' + p_1 (y' phi + y phi') + p_2 y phi = 0 \
                             & => y'' phi + y' (2 phi' + p_1 phi) + y underbrace((phi'' + p_1 phi' + p_2 phi), = 0) = 0
  $

  Bierzemy $z = y'$. Wtedy $z' phi + z (2 phi' + p_1 phi) = 0$. to jest równanie I rzędu.

  $
    z'/z = - (2 phi' + p_1 phi)/phi \
    (ln z)' = - (2 phi' + p_1 phi)/phi \
  $

  $
    z = exp (integral - (2 phi' + p_1 phi)/phi dif t)
    &= exp (- integral ((1 + t)^(-1/2) - t/(1-t^2)(1+t)^(1/2))/(1+t)^(1/2) dif t) \
    &= exp (- integral (1/(1 + t) - t/((1-t)(1+t))) dif t) \
    &= exp (- (ln |1 + t| - integral (t/((1-t^2))) dif t)) \
    &=^(u = t^2) exp (- ln |1 + t| + 1/2 integral (1/(1-u)) dif u)) \
    &= exp (- ln |1 + t| - 1/2 ln |1 - t^2| + C)
    = C/((1 + t)(1 - t^2)^(1/2))
  $

  $
    z = C/((1 + t)(1 - t^2)^(1/2)) = y' => y & = integral z dif t \
                                             & = C integral (1/((1 + t)^(3/2) (1 - t)^(1/2))) dif t
  $

  Zauważmy, że:

  $
    dif/(dif t) sqrt(1-t)/sqrt(1+t) = (sqrt(1+t)/(2 sqrt(1-t)) - sqrt(1-t)/(2 sqrt(1+t)))/(1 + t) = (- 1)/((1 - t)^(3/2) (1 + t)^(1/2))
  $

  Zatem:

  $
    y = C sqrt(1 - t)/sqrt(1 + t) + D
  $

  $
    x = y dot phi => x = (C sqrt(1 - t)/sqrt(1 + t) + D) dot sqrt(1 + t) = C sqrt(1-t) + D sqrt(1 + t)
  $

  $
    x' = - C/(2 sqrt(1 - t)) + D/(2 sqrt(1 + t))
  $

  Skoro $x(0) = 4$ i $x'(0) = 1$, to:

  $
    cases(
      4 = C + D,
      1 = - C/2 + D/2
    ) => cases(
      D = 4 - C,
      1 = -C/2 + 2 -C/2 => C = 1 => D = 3
    )
  $

  Więc rozwiązanie to:

  $
    x(t) = sqrt(1 - t) + 3 sqrt(1 + t)
  $

  $
    x(1/2) = sqrt(1/2) + 3 sqrt(3/2) = (1 + 3 sqrt(3))/sqrt(2) approx 4.38
  $
