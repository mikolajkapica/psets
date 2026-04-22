Niech $X = (X_1, ..., X_n)$ będzie próbą losową z populacji o rozkładzie z gęstością

$
  f_theta (x) = 1/theta exp { - x/theta } bb(1)_((0, oo)) (x)
$

Używając kryterium faktoryzacji znajdź statystykę dostateczną dla $theta$, tego samego wymiaru co $theta$.

Rozwiązanie:

Gęstość:

$
  p_theta (bold(x)) &= product_(i=1)^n 1/theta exp { - (x_i)/theta } bb(1)_((0, oo)) (x_i) \
  &= underbrace(bb(1)_((0, oo)) (min_i x_i), h(x)) dot underbrace(exp(- 1/theta sum_(i=1)^n x_i + n ln(1/theta)), g(T(bold(x))))
$

Zatem

$ T(X) = sum_(i=1)^n x_i $
