#import "../lib.typ": *

statystka matematyczna | lista 9 - Przedziały ufności.

#show heading.where(level: 2): it => {
  pagebreak()
  it
}

#outline()

#set enum(numbering: "(a)")

= Lista 9

== Zadanie 1
Niech $X$ będzie pojedynczą obserwacją z rozkładu jednostajnego
$cal(U)(theta - 1/2, theta + 1/2)$, gdzie $theta in RR$ jest nieznane.
Pokazać, że $Q(X; theta) = X - theta$ jest funkcją centralną. Wyznaczyć
warunki, jakie muszą spełniać liczby $c, d$, aby przedział $[X + c, X + d]$
był przedziałem ufności dla parametru $theta$ na poziomie ufności $1 - alpha$.

- $Q(X; theta)$ jest funkcją centralną, czyli że rozkład $Q(X; theta)$ nie zależy od $theta$.

  $
    Q(X; theta) ~ cal(U)(-1/2, 1/2) "niezależnie od wartości theta"
  $

- Warunki:

  $
    PP (X + c <= theta <= X + d) = 1 - alpha
  $

  $
    PP (-u_(alpha/2) <= Q(x; theta) <= u_(alpha/2)) & = PP (-u_(alpha/2) - X <= - theta <= u_(alpha/2) - X) \
                                                    & = PP (X - u_(alpha/2) <= theta <= X + u_(alpha/2)) \
  $
  gdzie $F(u_(alpha/2)) = 1-alpha/2$, $F(x) = 1/2 + x$ dla $x in [-1/2, 1/2]$.

  $
    F(x) = 1 - alpha/2 <=> 1/2 + x = 1 - alpha/2 <=> x = 1/2 - alpha_2 => u_(alpha/2) = 1/2 - alpha/2
  $

  Zatem:

  $
    PP (X - 1/2 + alpha/2 <= theta <= X + 1/2 - alpha/2) \
  $

  $
    cases(
      c = -1/2 + alpha/2,
      d = 1/2 - alpha/2
    )
  $

== Zadanie 2
Niech $bold(X)=(X_1,...,X_n)$ będzie próbą losową z rozkładu wykładniczego
$cal(E)(lambda)$. Uzasadnić, że
$Q(bold(X); lambda) = (2 n overline(X)) / lambda$
jest funkcją centralną. Skonstruować przedział ufności dla parametru $lambda$
na poziomie ufności $1 - alpha$. Dla $n = 10$ i $alpha = 0.04$ wyznaczyć
końce tego przedziału.

$
  (2 n overline(X))/lambda
$

Tutaj trzeba wziąć taki rozkład (z parametrem skali a nie "rate")
$
  f(x) = 1/lambda e^(-x/lambda) dot bb(1)_((0, oo)) (x) \
$

$
  phi_X (t) = EE [e^(i t X)] =^"wikipedia" (1 - (lambda i t))^(-1)
$

$
  phi_(X_1 + ... + X_n) (t) = phi_(X_1) (t) dot ... dot phi_(X_n) (t) = (1-(lambda i t))^(-n)
$

$
  phi_(Q(bold(X); lambda)) (t)
  = phi_(X_1 + ... + X_n) ((2 t)/(lambda)) = (1 - (cancel(lambda) i 2 t) / cancel(lambda))^(-n)
$

Porównując z funkcją charakterystyczną rozkładu $Gamma(k, theta)$ czyli $(1 -
theta i t)^(-k)$ mamy, że $Q(bold(X); theta) ~ Gamma(n, 2) = chi^2_(2n)$, zatem $Q(bold(X); theta)$ jest funkcją centralną, ponieważ nie zależy od $lambda$.

$
  PP (z_(alpha/2) <= (2 n overline(X))/lambda <= z_(1 - alpha/2))
$

Odczytując z tablic $chi_(20)^2$: $z_(0.98) approx 35$ i $z_(0.02) approx 9.5$

$
  PP (z_(alpha/2) <= (2 n overline(X))/lambda <= z_(1 - alpha/2)) &= PP (1/z_(1- alpha/2) <= lambda/(2 n overline(X)) <= 1/z_(alpha/2)) = PP ((2 n overline(X))/z_(1- alpha/2) <= lambda <= (2 n overline(X))/z_(alpha/2)) \
  &= PP (20/35 overline(X) <= lambda <= 20/9.5 overline(X))
$

Zatem przedział ufności $lambda in [4/7 overline(X); 40/19 overline(X)]$

== Zadanie 3
Niech $bold(X)=(X_1,...,X_n)$ będzie próbą losową z rozkładu $cal(N)(theta, theta)$,
gdzie $theta > 0$. Znaleźć funkcję centralną i skonstruować przedział ufności
dla parametru $theta$ na poziomie ufności $1 - alpha$.

Wskazówka. Określić rozkład zmiennej losowej
$
  Q(bold(X); theta) = (n (overline(X) - theta)^2) / theta.
$

$
  "Var"(overline(X)) = 1/n^2 "Var" (Sigma X) = theta/n
$

$
  sqrt(n/theta) (overline(X) - theta) ~ cal(N)(0, 1)
$

$
  Q(bold(X); theta) ~ chi^2_1
$

To jest funkcja centralna bo nie zależy od $theta$.

Normalizujemy nasz rozkład:

$
  (sqrt(n) (overline(X) - theta))/sqrt(theta) ~ cal(N)(0, 1)
$


$
  1 - alpha & = PP (-z_(1 - alpha/2) <= (sqrt(n) (overline(X) - theta))/sqrt(theta) <= z_(1 - alpha/2)) \
            & = PP ((n (overline(X) - theta)^2) / theta <= z^2_(1 - alpha/2)) \
            & = PP ((n (overline(X) - theta)^2) / theta <= chi^2_(1, 1 - alpha)) \
$

Niech $c = chi^2_(1, 1 - alpha)$

$
  (n (overline(X) - theta)^2) / theta = c \
  theta^2 - 2 overline(X) theta + overline(X)^2 - c theta/n = 0 \
  Delta = (2 overline(X))^2 - 4 (overline(X)^2 - c theta/n) \
  theta_(1,2) = (- 2 overline(X) plus.minus sqrt((2 overline(X))^2 - 4 (overline(X)^2 - c theta/n)))/2
$

Zatem przedział ufności to $[(- 2 overline(X) minus sqrt((2 overline(X))^2 - 4 (overline(X)^2 - c theta/n)))/2; (- 2 overline(X) minus sqrt((2 overline(X))^2 - 4 (overline(X)^2 - c theta/n)))/2]$

== Zadanie 4
Niech $bold(X)=(X_1,...,X_n)$ będzie próbą losową z rozkładu jednostajnego
$cal(U)(theta - 1/2, theta + 1/2)$, gdzie $theta in RR$ jest nieznane.
Skonstruować przedział ufności dla parametru $theta$ na poziomie ufności
$1 - alpha$.

Weźmy funkcję centralną $Q(X; theta) = max_i |X_i - theta|$

Wtedy:
$
  PP (Q(X; theta) <= t) & = PP (|X_1 - theta| <= t and ... and |X_n - theta| <= t) \
                        & = PP (|X_1 - theta| <= t) dot ... dot PP (|X_n - theta| <= t) \
                        & = (2t)^n
$

$
  1 - alpha = (2t)^n => t = 1/2 root(n, 1-alpha)
$

Mamy:

$
  forall_i quad -t <= X_i - theta <= t quad ==> quad -t + X_i <= theta <= t + X_i
$

Zatem przedział ufności $theta$ to: $[X_((1)) - 1/2 root(n, 1 - alpha); X_((n)) + 1/2 root(n, 1 - alpha)]$

== Zadanie 5
Niech $bold(X)=(X_1,...,X_m)$ oraz $bold(Y)=(Y_1,...,Y_n)$ będą niezależnymi próbami
losowymi z rozkładów $cal(N)(mu_1, sigma_1^2)$ oraz
$cal(N)(mu_2, sigma_2^2)$. Założyć, że $sigma_1^2 = sigma_2^2 = sigma$
oraz oznaczyć $theta = (mu_1, mu_2, sigma)$ i $g(theta) = mu_2 - mu_1$.
Uzasadnić, że
$
  (overline(Y) - overline(X) - g(theta)) /
  (sqrt(((m - 1) S_X^2 + (n - 1) S_Y^2)/(m + n - 2)) sqrt(1/m + 1/n))
$
jest funkcją centralną dla $g(theta)$. Skonstruować przedział ufności dla
parametru $g(theta)$ na poziomie ufności $1 - alpha$.

Ale też rozkłąd t-studenta definicja:

$
T = U/sqrt(Z) sqrt(v)
$

gdzie $U, Z$ niezależne zmienne losowe i $U ~ cal(N)(0, 1)$, $Z ~ chi^2_nu$.

Dzielimy górę i dół przez $sigma^2$:

Patrząc na górną część:

$
"Var"(overline(Y) - overline(X)) = 1/n sigma_1^2 + 1/m sigma_2^2 = (1/n + 1/m)
sigma^2
$

$
  (overline(Y) - overline(X) space overbrace(- mu_2 + mu_1, - g(theta))) /
  (sigma sqrt(1/m + 1/n)) ~ cal(N)(0, 1)
$


To jest różnica dwóch rozkładów średnich próbkowych o rozkładzie noramlnym co
daje rozkład normalny. Dodatkowo odjęcie $g(theta)$ i podzielenie przez
wariancję różnicy daje rozkład standardowy normalny.

Dolna część:

$
sqrt((m - 1) S_X^2/sigma^2 + (n - 1) S_Y^2/sigma^2)
$

$sum_(i=1)^n (X_i - overline(X)) ~ sigma^2 chi_(n-1)^2$ 
i 
$sum_(i=1)^m (Y_i - overline(Y)) ~ sigma^2 chi_(m-1)^2$.

Zatem dół to suma $chi_(n-1)^2$ i $chi_(m-1)^2$ czyli $chi_(n+m-2)^2$.

Nasza funkcja jest gęstością rozkładu t-studenta o $n + m - 2$ stopniach
swobody.

Zatem jest funkcją
centralną dla $g(theta)$.

A teraz skonstruujmy przedział ufności dla parametru $g(theta)$ na poziomie
ufności $1 - alpha$::

$
  1 - alpha 
  = PP (-t_(1 - alpha/2) < Q(X; theta) < t_(1 - alpha/2)) \
  = PP (-t_(1 - alpha/2) < 
  (overline(Y) - overline(X) - g(theta)) /
  (sqrt(((m - 1) S_X^2 + (n - 1) S_Y^2)/(m + n - 2)) sqrt(1/m + 1/n))
 < t_(1 - alpha/2)) \
  = PP( \

 - (t_(1 - alpha/2) (sqrt(((m - 1) S_X^2 + (n - 1) S_Y^2)/(m + n - 2)) sqrt(1/m + 1/n)) - overline(Y) + overline(X)) \
  < g(theta) \
 < - (-t_(1 - alpha/2) (sqrt(((m - 1) S_X^2 + (n - 1) S_Y^2)/(m + n - 2))
   sqrt(1/m + 1/n) - overline(Y) + overline(X)))
 \
 )
$

Zatem przedział ufności dla $g(theta)$ to:

$
[
 - (t_(1 - alpha/2) (sqrt(((m - 1) S_X^2 + (n - 1) S_Y^2)/(m + n - 2)) sqrt(1/m + 1/n)) - overline(Y) + overline(X)),
 \
 - (-t_(1 - alpha/2) (sqrt(((m - 1) S_X^2 + (n - 1) S_Y^2)/(m + n - 2))
   sqrt(1/m + 1/n) - overline(Y) + overline(X)))
]
$










== Zadanie 6
Niech $bold(X)=(X_1,...,X_m)$ oraz $bold(Y)=(Y_1,...,Y_n)$ będą niezależnymi próbami
losowymi z rozkładów $cal(N)(mu_1, sigma_1^2)$ oraz
$cal(N)(mu_2, sigma_2^2)$. Oznaczyć
$theta = (mu_1, mu_2, sigma_1, sigma_2)$ oraz
$g(theta) = sigma_1^2 / sigma_2^2$. Skonstruować przedział ufności dla
parametru $g(theta)$ na poziomie ufności $1 - alpha$.

Weźmy dwa rozkłady $chi^2$:

$
((1/(m-1) S_X^2)/sigma_1^2)/((1/(n-1) S_Y^2)/sigma_2^2) = sigma_2^2/sigma_1^2 (n
- 1)/(m-1) S_X^2/S_Y^2 = (n-1)/(m-1) S_X^2/S_Y^2 1/g(theta) ~ F(m-1, n-1)
  "Rozkład F Snedecora"
$

Standardowy zabieg potem...






































































































== Zadanie 7
Niech $bold(X)=(X_1,...,X_n)$ będzie próbą losową z rozkładu $cal(N)(mu, sigma^2)$,
gdzie $sigma > 0$ jest znane. Podać postać przedziału ufności dla parametru
$mu$ na poziomie ufności $1 - alpha$.

== Zadanie 8
Niech $bold(X)=(X_1,...,X_n)$ będzie próbą losową z rozkładu Poissona
$cal(P)(lambda)$. Wykorzystując centralne twierdzenie graniczne, twierdzenie
Słuckiego oraz metodę delta, udowodnić, że:

+ $
    (sqrt(n) (overline(X) - lambda)) / sqrt(overline(X)) -->^D cal(N)(0, 1);
  $
+ $
    2 sqrt(n) (sqrt(overline(X)) - sqrt(lambda)) -->^D cal(N)(0, 1).
  $

Wykorzystać powyższe własności do wyznaczenia asymptotycznych funkcji
centralnych oraz do konstrukcji asymptotycznych przedziałów ufności dla
parametru $lambda$ na poziomie ufności $1 - alpha$. Zauważyć, że oba
przedziały mają tę samą długość i są jedynie przesunięte względem siebie.

== Zadanie 9
Niech $Y_n$ będzie zmienną losową o rozkładzie chi-kwadrat z $n$ stopniami
swobody. Wykorzystując centralne twierdzenie graniczne, twierdzenie Słuckiego
oraz metodę delta, udowodnić, że:

+ $(Y_n - n) / sqrt(2 n) -->^D cal(N)(0, 1);$

+ $sqrt(2 Y_n) - sqrt(2 n - 1) -->^D cal(N)(0, 1);$

+ $sqrt((9 n) / 2) (root(3, Y_n / n) - 1) -->^D cal(N)(0, 1).$

Niech $bold(X)=(X_1,...,X_n)$ będzie próbą losową z rozkładu
$cal(N)(mu, sigma^2)$, gdzie $mu$ i $sigma$ są nieznane. Wykorzystać powyższe
fakty do wyznaczenia asymptotycznych funkcji centralnych oraz do konstrukcji
asymptotycznych przedziałów ufności dla funkcji parametrycznej
$g(theta) = sigma^2$ na poziomie ufności $1 - alpha$.
