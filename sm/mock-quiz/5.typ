Wyznacz informację Fishera $I (theta)$ zawartą w zmiennej $X$ o funkcji
prawdopodobieństwa

$ p_theta (x) = theta^x (1-theta)^(1-x), quad x in {0, 1}, $

wiedząc, że $EE_theta (X) = theta$ oraz $"Var"_theta (X) = theta (1 - theta)$,
gdzie $theta in (0,1)$.


$
  I(theta) & = EE_theta [ (dif/(dif theta) ln p(x))^2 ] \
  & = EE_theta [ ((dif/(dif theta) p(x))/(p(x)))^2]
  = integral_RR ((dif/(dif theta) p(x))/(p(x)))^2 p(x) mu(dif x) \
  & = integral_RR (dif/(dif theta) p(x))^2 / (p(x)) mu(dif x)
  = integral_({0,1}) (x theta^(x-1) (1-theta)^(1-x) - theta^x (1-x) (1-theta)^(-x))^2 / (theta^x (1-theta)^(1-x)) mu(dif x) \
  &= 1/(1-theta) + 1/(theta)
  = (theta + 1 - theta)/(theta(1-theta))
  = 1/(theta(1-theta))
$

Alternatywnie (zalecane):

$
  dif/(dif theta) ln p(x) & = dif/(dif theta) (x ln theta + (1-x) ln (1-theta)) = x/theta - (1-x)/(1-theta) = (x - cancel(x theta) - theta + cancel(x theta))/(theta (1-theta)) = (x - theta)/(theta (1-theta))
$

Mamy pojedyńczą zmienną losową więc tutaj $I(theta) = I_1(theta)$. Zatem:

$
  I(theta)
  = I_1 (theta)
  = EE_theta [((X - theta)/(theta (1-theta)))^2]
  = 1/(theta (1 - theta))^2 EE_theta [(X - theta)^2]
  = 1/(theta (1 - theta))^2 EE_theta [(X - EE_theta X)^2] \
  = 1/(theta (1 - theta))^2 "Var"_theta X
  = 1/(theta (1-theta))
$
