#import "../lib.typ": *
#show: styling

statystka matematyczna | lista 8 - Efektywność.

#set enum(numbering: "a)")

Zadanie 1
Niech $X=(X_1,...,X_n)$ będzie próbą losową z rozkładu Bernoulliego
$cal(B)(1,p)$, $p in (0,1)$. Uzasadnić, że
$
  T(X) = n/(n-1) overline(X)(1 - overline(X))
$
jest estymatorem UMVU funkcji parametrycznej $g(p)=p(1-p)$. Sprawdzić, czy
$T(X)$ jest efektywny lub asymptotycznie efektywny.

Chcemy zastosować tw. Lehmanna-Scheffego:
- $S(X)$ dostateczna i zupełna
- $T(X)$ nieobciążonym estymatorem $g(p)$
Wtedy $phi(T) := EE[T|S]$ jest UMVUE dla $g(p)$.

Statystyka $S (X) = X_1 + ... + X_n$ jest dostateczna i zupełna dla $cal(B)(1, p)$.

Nieobciążoność T(X):

$
  EE [T(X)] & = EE [n/(n-1) overline(X)(1 - overline(X))] \
            & = n/(n-1) EE [overline(X) - overline(X)^2] \
            & = n/(n-1) (EE [overline(X)] - underbrace(EE[overline(X)^2], "Var"(overline(X)) + (EE overline(X))^2)) \
            & = n/(n-1) (p - ((p(1-p))/n + p^2)) \
            & = n/(n-1) (p - p/n + p^2/n - p^2) \
            & = n/(n-1) (p (n-1)/n - p^2 (n-1)/n) \
            & = p - p^2 = p(1-p) = g(p)
$

$
  EE_p [T(X) | S(X)] & = EE_p [n/(n-1) overline(X)(1 - overline(X)) | S(X)] \
                     & = n/(n-1) (S/n) (1 - S/n) \
                     & = n/(n-1) overline(X) (1 - overline(X)) = T(X)
$

Zatem $T(X)$ jest UMVUE $g(p)$.

Efektywność:

Czyli musimy sprawdzić czy estymator $T$ nieobciążony dla $g$ i jego wariancja,
dla każdego $p in (0,1)$ jest równa dolnemu ograniczeniu w nierówności C-R.
Wyliczenie wariancji $T(X)$ jest trudne, więc sprawdzę czy zachodzi równość - wtedy $T(X)$
jest efektywne:

$
  dif/(dif p) ln (f(bold(x); p)) = k(p) (T(x) - g(p))
$

$
  dif/(dif p) ln (f(bold(x); p)) & = dif/(dif p) ln f(bold(x); p) \
                                 & = dif/(dif p) ln product_(i=1)^n p^(x_i) (1-p)^(1-x_i) \
                                 & = dif/(dif p) ln p^(n overline(x)) (1-p)^(n-n overline(x)) \
                                 & = dif/(dif p) n overline(x) ln p + (n - n overline(x)) ln (1-p) \
                                 & = (n overline(x)) / p - (n - n overline(x))/(1-p) \
                                 & = (n (overline(x) - p))/(p(1-p))
$

$
  T(bold(x)) - g(p) = n/(n-1) overline(x)(1 - overline(x)) - p(1-p)
$

$T(bold(x)) - g(p)$ ma kwadrat $overline(x)$, a lewa strona tylko "jeden". Nie znajdziemy $k(p)$, aby otrzymać równość.

Ciąg estymatorów ($T_n$) paramtetru $g(p)$ nazywamy asymptotycznie efektywnym, jeśli

$
  sqrt(n) (T_n - g(p)) ->^D cal(N)(0, v(p)) ", gdy" n -> oo
$

gdzie $v(p) = [g'(p)]^2/I_1(p)$.

$
  g'(p) = 1(1-p) + p(-1) = 1 - p - p = 1 - 2 p
$

$
  I_1 (p) & = EE_p [(dif/(dif p) ln f(x; p))^2] \
          & = EE_p [(dif/(dif p) ln p^x (1-p)^(1-x))^2] \
          & = EE_p [(dif/(dif p) x ln p + (1-x) ln (1-p))^2] \
          & = EE_p [(x/p - (1-x)/(1-p))^2] \
          & = EE_p [((x - cancel(x p) - p + cancel(p x))/(p(1-p)))^2] \
          & = EE_p [((x - p)/(p(1-p)))^2] \
          & = 1/(p(1-p))^2 "Var" X \
          & = (p (1-p))/(p(1-p))^2 "| wariancja jednego elemntu" n = 1 \
          & = 1/(p(1-p)) \
$

$
  v(p) = (1 - 2p)^2/(1/p(1-p)) = (p (1-p) (1-2p)^2)
$

$
  (overline(X) - p) ->^D cal(N)(0, n p (1-p))
$

Metoda delta: ($a_n = sqrt(n)$)

Skoro:

$
  sqrt(n) (overline(X) - p) ->^D cal(N)(0, p (1-p))
$

i weźmy $h(x) = x(1-x)$ różniczkowalna na $(0,1)$ ($h'(x) = 1 - 2x$).

Wtedy:

$
  sqrt(n) (h(overline(X)) - h(p)) ->^D h'(p) cal(N)(0, p (1-p)) & = cal(N)(0, h'(p)^2 p (1-p)) \
                                                                & = cal(N)(0, (1 - 2x)^2 p (1-p)) \
                                                                & = cal(N)(0, v(p))
$

Upraszczając lewą stronę:

$
  sqrt(n) (overline(X)(1 - overline(X)) - p(1-p)) = sqrt(n) ((n-1)/n T - g(p))
$

Czynnik $(n-1)/n$ nie zmienia granicy, zatem:

$
  sqrt(n) (T - g(p)) = cal(N)(0, v(p))
$

Zatem $T$ jest asymptotycznie efektywny.

// $
//   g'(p) = 1(1-p) + p(-1) = 1 - p - p = 1 - 2 p
// $

// Informacja Fisher'a:

// $
//   I (p) & = EE_p [(dif/(dif p) ln f(bold(x); p))^2] \
//         & = EE_p [(dif/(dif p) ln product_(i=1)^n p^(x_i) (1-p)^(1-x_i))^2] \
//         & = EE_p [(dif/(dif p) ln p^(n overline(x)) (1-p)^(n-n overline(x)))^2] \
//         & = EE_p [(dif/(dif p) n overline(x) ln p - (n - n overline(x)) ln (1-p))^2] \
//         & = EE_p [((n overline(x)) / p - (n - n overline(x))/(1-p))^2] \
//         & = EE_p [((n (overline(x) - p))/(p(1-p)))^2] \
//         & = (n/(p(1-p)))^2 EE_p [(overline(x) - p)^2] \
//         & = (n/(p(1-p)))^2 "Var"_p (overline(x)) \
//         & = (n/(p(1-p)))^2 (p (1-p))/n = n/(p(1-p))
// $

// Dolne ograniczenie w nierówności C-R:

// $
//   [g'(p)]^2/I(p)
//   = (1 - 2p)^2 dot n/(p(1-p))
//   = (p(1-p)(1-2p)^2)/n
// $

// Wariancja $T(X)$:

// Zatem $T$ nie jest efektywny.

// $
//   "Var" T(X)
//   = (n/(n-1))^2 "Var" (overline(X)(1 - overline(X)))
//   = (n/(n-1))^2 "Var" (overline(X) - overline(X)^2)
//   = (n/(n-1))^2 (EE [(overline(X) - overline(X)^2)^2] - (EE [overline(X) - overline(X)^2])^2)
//   = (n/(n-1))^2 (EE [overline(X)^2 - 2 overline(X)^3 + overline(X)^4] - (EE [overline(X) - overline(X)^2])^2)
//   ...
// $



Zadanie 2
Niech $X=(X_1,...,X_n)$ będzie próbą losową z rozkładu Poissona
$cal(P)(lambda)$, gdzie $lambda in (0, oo)$. Pokazać, że estymator największej
wiarygodności parametru $lambda$, oparty na próbie $X$, jest asymptotycznie
normalny. Czy ten estymator jest asymptotycznie efektywny?

$
  L(lambda) = product_(i=1)^n (e^-lambda lambda^(x_i))/x_i! = ln (1/(product_(i=1)^n x_i!)) + ln (e^(-n lambda)) + sum_(i=1)^n x_i ln (lambda)
$

$
  partial/(partial lambda) L(lambda) = -n + sum_(i=1)^n x_i dot 1/lambda = 0 <=> hat(lambda_n) = overline(X_n)
$

Ciąg $overline(X_n)$ jest asymptotycznie normalnym, jeśli istnieją ciągi $(mu_n)$ i $(sigma_n)$ liczb rzeczywistych tż:

$
  E[overline(X)] = lambda \
  "Var"[overline(X)] = lambda / n
$

Z CTG:

$
  (overline(X_n) - lambda) / (sqrt(lambda/n)) -->^D cal(N)(0, 1)
$

gdzie $mu = lambda, space sigma^2 = lambda$.

Statystyka $(overline(X_n))$ jest asymptotycznie efektywna jeśli

$
  sqrt(n) (overline(X_n) - lambda) -->^D cal(N)(0, v(lambda)), quad "gdy" n --> oo
$

Z CTG:

$
  (overline(X_n) - lambda) / (sqrt(lambda/n)) -->^D cal(N)(0, 1), quad "gdy" n --> oo
$

Zatem

$
  sqrt(n) (overline(X_n) - lambda) -->^D cal(N)(0, lambda), quad "gdy" n --> oo
$



Policzmy $v(lambda)$:

$
  I_1 (lambda) & = EE [(dif/(dif lambda) ln (e^-lambda lambda^x)/x!)^2] \
               & = EE [(dif/(dif lambda) -lambda + x ln lambda - ln x!)^2] \
               & = EE [(-1 + x/lambda)^2] \
               & = EE [1 - 2 x/lambda + x^2/lambda^2] \
               & = 1 - 2 EE[x]/lambda + overbrace(EE[x^2], (EE X)^2 + "Var" X)/lambda^2 \
               & = 1 - 2 + (lambda^2 + lambda)/lambda^2 \
               & = 1 - 2 + 1 + 1/lambda = 1/lambda
$

$
  g'(lambda) = dif/(dif lambda) lambda = 1
$

$
  v(lambda) = (g'(lambda))^2/(I_1 (lambda)) = lambda
$

Zadanie 3
Niech $X=(X_1,...,X_n)$ będzie próbą losową z rozkładu normalnego
$cal(N)(0, sigma^2)$. Pokazać, że estymator
$
  T(X) = 1/n sum_(i=1)^n X_i^2
$
jest nieobciążonym i efektywnym estymatorem $sigma^2$.

$E [T(X)] = ... = sigma^2$, zatem est. nieobciążony

$
X_i / sigma ~ cal(N)(0,1)
$

$
1 / sigma^2 sum_(i=1)^n X_i^2 ~ chi_n^2
$

$
T(X) = 1/n sigma^2 Y, Y ~ chi_n^2 \

"Var"(T(X)) = sigma^4 / n^2 "Var"(Y) = sigma^4 / n^2 2n = 2 sigma^4 / n \

f(x_1, sigma^2) = 1/sqrt(2 pi sigma^2) e^(- ((x-0)^2 / (2 sigma^2))) \

I(theta^2) = n/(2 sigma^4) \

1/I(theta^3) = (2 theta^4) / n = "Var"(T(X))
$




Zadanie 4
Niech $X=(X_1,...,X_n)$ będzie próbą losową z rozkładu jednostajnego
$cal(U)(0, theta)$ i niech $f(x)$ oznacza gęstość rozkładu statystyki
$X_((n))$. Pokazać, że
+ $ integral_theta^oo x f(x) dif x = theta integral_theta^oo f(x) dif x, $
+ estymator UMVU parametru $theta$ nie jest efektywny w sensie Rao-Cramera.

Zadanie 5
Niech $X=(X_1,...,X_n)$ będzie próbą losową z rozkładu normalnego
$cal(N)(mu, sigma^2)$, gdzie $mu$ jest znane. Udowodnić, że estymator
$
  T(X) = sqrt(pi/2) 1/n sum_(i=1)^n |X_i - mu|
$
parametru $sigma$ jest nieobciążony i ma efektywność $1/(pi - 2)$.

Zadanie 6
Niech $X=(X_1,...,X_n)$ będzie próbą losową z rozkładu normalnego
$cal(N)(mu, sigma^2)$ z nieznaną wartością oczekiwaną $mu in bb(R)$ i znaną
wariancją $sigma^2 > 0$. Dla ustalonego $t != 0$ znaleźć estymator UMVU dla
parametru $e^(t mu)$ i pokazać, że ten estymator nie jest efektywny w sensie
Rao-Cramera, ale jest asymptotycznie efektywny.

Będziemy chcieli użyć tw. Lehmanna-Sheffe'a, więc poszukajmy nieobciążonego estymatora $e^(t mu)$.

Naturalnym wyborem wydaje się $e^(t overline(X))$

$
  EE [e^(t overline(X))]
  & = integral_RR e^(t x) 1/(sqrt(2 pi) sqrt(sigma^2 / n)) exp(-(x - mu)^2 / (2 (sigma^2 / n))) dif x \
  & = integral_RR 1/(sqrt(2 pi) sqrt(sigma^2 / n)) exp(t x - (x - mu)^2 / (2 (sigma^2 / n))) dif x \
  & = integral_RR 1/(sqrt(2 pi) sqrt(sigma^2 / n)) exp(- (x - mu - t sigma^2 / n)^2 / (2 (sigma^2 / n))) dif x dot e^(mu t + (t^2 sigma^2) / (2 n)) \
  & = 1 dot e^(mu t + (t^2 sigma^2) / (2 n))
$

Zatem aby dostać nieobciążony estymator

$
  EE [e^(t overline(X) - (t^2 sigma^2)/(2 n))] = e^(mu t)
$

Statystyką dostateczną i zupełną dla $mu$ jest $overline(X)$.

$
  phi(overline(X)) = EE [e^(t overline(X) - (t^2 sigma^2)/(2 n)) | overline(X)] = underbrace(e^(t overline(X) - (t^2 sigma^2)/(2 n)), "UMVUE")
$

$
  "Var" [e^(t overline(X) - (t^2 sigma^2)/(2 n))]
  & = EE [e^(2 t overline(X) - (t^2 sigma^2)/n)] - (EE [e^(t overline(X) - t^2 sigma^2 /(2 n))])^2 \
  & = e^(- t^2 sigma^2 /n) dot EE [e^((2t) overline(X))] - e^(2 mu t) \
  & = e^(- t^2 sigma^2 /n) dot e^(2 mu t + 2 t^2 sigma^2 /n) - e^(2 mu t) \
  & = e^(2 mu t) (e^(t^2 sigma^2 /n) - 1)
$

$
  g(mu) = e^(t mu) quad => quad g' (mu) = t e^(t mu)
$

$
  I_1 (mu) & = EE [(dif/(dif mu) (-1/2 ln (2 pi sigma^2) - (x-mu)^2/(2 sigma^2)))^2] \
           & = EE [((X - mu) / sigma^2)^2] \
           & = 1 / sigma^4 EE [(X - mu)^2] \
           & = 1 / sigma^4 dot sigma^2 \
           & = 1 / sigma^2
$

$
  I(mu) = n dot I_1 (mu) = n / sigma^2
$

Zatem dolne ograniczenie Cramera-Rao wynosi:

$
  (g'(mu)^2 )/ I(mu) = (t^2 e^(2 t mu) sigma^2) / n
$

Estymator UMVUE nie jest tutaj efektywny:

$
  "Var" [e^(t overline(X) - t^2 sigma^2 / (2 n))]
  = e^(2 mu t) (e^(t^2 sigma^2 / n) - 1)
  underbrace(>, e^(x - 1) > x "dla" x > 0) e^(2 mu t) dot t^2 sigma^2 / n
  > (g'(mu))^2 / I(mu)
$

Asymptotyczna efektywność:

$
  (g'(mu))^2/(I_1 (mu)) = t^2 e^(2 t mu) sigma^2
$

$
  sqrt(n) (overline(X) - mu) -->^D cal(N)(0, sigma^2)
$

Metoda delta. Niech $h(x) = e^(t x)$, wtedy $h'(x) = t e^(t x)$:

$
  sqrt(n) (e^(t overline(X)) - e^(t mu)) -->^D cal(N)(0, t^2 e^(2 t mu) sigma^2)
$

Dodajmy składnik $e^((-t^2 sigma^2)/(2 n)) --> 1$, aby otrzymać nasz estymator:

$
  sqrt(n) (e^(t overline(X)) e^((-t^2 sigma^2)/(2 n)) - e^(t mu))
  &= underbrace(e^((-t^2 sigma^2)/(2 n)), --> 1) sqrt(n) (e^(t overline(X)) - e^(t mu)) + underbrace(e^(t mu) sqrt(n) (e^((-t^2 sigma^2)/(2 n)) - 1), --> 0)
$

$
  sqrt(n) (e^(t overline(X) - (t^2 sigma^2)/(2 n)) - e^(t mu)) -->^D cal(N)(0, t^2 e^(2 t mu) sigma^2)
$

Zatem estymator jest asymptotycznie efektywny.


Zadanie 7
Niech $X=(X_1,...,X_n)$ będzie próbą losową z rozkładu gamma $cal(G)(alpha, beta)$.
+ Wyznaczyć estymatory parametrów $alpha$, $beta$ za pomocą metody momentów.
+ Zakładając, że $alpha$ jest znane i równe $alpha_0$, wyznaczyć estymator
  parametru $beta$ za pomocą metody momentów i obliczyć jego efektywność.
