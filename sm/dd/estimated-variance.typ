Dlaczego we wzorze na wariancje probkową mamy dzielenie przez n-1, a nie n.

= Wzór:

$
  S^2 (X) = (sum_(i = 1)^n (X_i - overline(X)))/(n-1)
$

= TLDR 

chodzi o ilość stopni swobody. Jeśli estymujemy wartość oczekiwaną za
pomocą średniej, zapisujemy już jeden z nich -- suma różnic między wartościami,
a średnią próbkową jest na pewno mniejsza niż suma różnic między wartościami, a
faktyczną wartością oczekiwaną rozkładu. Dlatego musimy podzielić przez "trochę
mniej".

= Dowód


$
EE [sum_(i=1)^n (X_i - overline(X))^2 ] 
&= EE [sum_(i=1)^n ((X_i - mu) - (overline(X) - mu))^2 ]  \
&= EE [
  sum_(i=1)^n (X_i - mu)^2 
  - 2 (X_i - mu) (overline(X) - mu) 
  + (overline(X) - mu)^2 
] \
&= EE [
  sum_(i=1)^n (X_i - mu)^2 
  - 2 n (overline(X) - mu)^2
  + n (overline(X) - mu)^2 
] \
&= sum_(i=1)^n EE [ (X_i - mu)^2 ] - n underbrace(EE [(overline(X) - mu)^2],
"wariancja średniej próby") \
&= n sigma^2 - n 1/n sigma^2
= (n - 1) sigma^2
$

Zatem 

$
EE [sum_(i=1)^n (X_i - overline(X))^2 ] = (n-1) sigma^2
$

Więc aby policzyć estymator próby musimy podzielić przez $n-1$, nie $n$.



