#import "../lib.typ": *
#show: styling

statystka matematyczna | lista 7

#set enum(numbering: "(a)")

Zadanie 1
Niech $X=(X_1,...,X_n)$, $Y=(Y_1,...,Y_n)$ będą niezależnymi próbami losowymi z rozkładów odpowiednio
$ X_i tilde cal(N)(mu_X, sigma^2) $
$ Y_i tilde cal(N)(mu_Y, sigma^2) $
gdzie $mu_X in bb(R)$, $mu_Y in bb(R)$ oraz $sigma > 0$ są nieznanymi parametrami.
+ Pokazać, że następujące statystyki
  $ T_1(X,Y) = overline(X) overline(Y), $
  $ T_2(X,Y) = 1/n sum_(i=1)^n X_i Y_i $
  są nieobciążonymi estymatorami parametru $mu_X mu_Y$.
+ Który z tych dwóch estymatorów ma mniejszy błąd średniokwadratowy.

Zadanie 2
Niech $X=(X_1,...,X_n)$ będzie próbą losową z rozkładu Poissona $cal(P)(lambda)$, gdzie $lambda > 0$. Pokazać, że nie istnieją nieobciążone estymatory parametrów
$ g_1(lambda) = 1/lambda $
oraz $ g_2(lambda) = e^lambda $

Zadanie 3
Niech $X=(X_1,...,X_n)$ będzie próbą losową z rozkładu Bernoulliego
$cal(B)(1,p)$, $p in (0,1)$.

+ Znaleźć estymator UMVU dla funkcji $g(p)=p^r$, gdzie $r$ jest liczbą naturalną
  nie większą niż $n$. Dla $r=1$ wyznaczyć funkcję ryzyka tego estymatora przy
  kwadratowej funkcji straty.

  Z tw. Lehmanna-Scheffego: znajdujemy estymator nieobciążony $W(X)$ parametru $g(p)$ i wyznaczamy
  statystykę dostateczną i zupełną $T(X)$ dla $p$. Wówczas $phi(T) = EE[W | T]$ jest UMVUE.

  Niech $W(X) = X_1 dot dots dot X_r$. Wówczas $EE[W] = EE[X_1] dot dots dot EE[X_r] = p^r$ (niezależność).

  (można wziąć np. $W = cases(1 ", gdy" sum_(i=1)^r X_i = r, 0 "w.p.p.")$ i
  wtedy $PP(sum_(i=1)^r X_i = r mid(|) sum_(i=1)^n X_i = t)$)

  $T(X) = X_1 + dots + X_n ~ cal(B)(n, p)$ jest statystyką dostateczną i zupełną.

  $
    phi(T) & = EE[W | T = t] \
           & = PP_p (X_1 = 1, dots, X_r = 1 | T = t) \
           & = (PP_p (X_1 = 1, dots, X_r = 1) dot PP_p (X_(r+1) + dots + X_n = t - r)) / (PP_p (T = t)) \
           & = (p^r dot binom(n-r, t-r) p^(t-r) (1-p)^(n-t)) / (binom(n, t) p^t (1-p)^(n-t)) \
           & = binom(n-r, t-r) / binom(n, t) \
           & = (t dot (t-1) dot dots dot (t-r+1)) / (n dot (n-1) dot dots dot (n-r+1))
  $

  (na zajeicach $Phi = cases(
    binom(n-r, sum_1^n X_i - r)/binom(n, sum_1^n x_i) "gdy"
    sum_1^n x_i = t, 0 "w.p.p."
  )$)

  dla $t >= r$ (dla $t < r$ mamy $phi(T) = 0$).

  Dla $r = 1$: $phi(T) = T / n = overline(X)$. Funkcja ryzyka przy kwadratowej funkcji straty:
  $R(p, phi) = EE_p [(overline(X) - p)^2] = "Var"_p (overline(X)) = p(1-p)/n$




+ Znaleźć estymator UMVU dla funkcji $g(p)=p(1-p)$ i zbadać jego asymptotyczne
  własności (zgodność, $sqrt(n)$ zgodność, asymptotyczną normalność).

  $T(X) = X_1 + dots + X_n$ jest statystyką dostateczną i zupełną dla $p$.

  $W(X) = "Var"_p (X_1) = p(1-p)$ dla $X_1 ~ cal(B)(1,p)$ - szukamy UMVUE dla wariancji pojedynczej obserwacji.

  Wariancja próbkowa $S^2 = 1/(n-1) sum_(i=1)^n (X_i - dash(X))^2$ jest
  nieobciążonym estymatorem wariancji, czyli $EE[S^2] = "Var"_p (X_1) = W(X)$.

  Ponieważ $"Var"_p (X_1) = p(1-p)$, to $EE[S^2] = p(1-p)$.

  Dla Bernoulliego $X_i in {0,1}$, więc $X_i^2 = X_i$. Stąd:
  $
    sum_(i=1)^n X_i^2 = sum_(i=1)^n X_i = T quad ==> quad dash(X) = T/n
  $
  więc:
  $
    sum_(i=1)^n (X_i - dash(X))^2 = sum_(i=1)^n X_i^2 - n dash(X)^2 = T - T^2/n = (T(n-T))/n.
  $

  Zatem $S^2 = 1/(n-1) dot (T(n-T))/n = T(n-T)/(n(n-1))$.

  Zatem $W(X) = EE[S^2]$ (estymator nieobciążony) zależy wyłącznie od $T(X)$ (dostatecznej i zupełnej), więc jest UMVUE.

  Zatem $hat(g)(T) = T(n-T)/(n(n-1))$ jest UMVUE dla $g(p) = p(1-p)$.

  Alternatywny sposób to $EE[T/n] = p, EE[T(1-T)]/(n(1-n)) = p^2$ i $hat(g)(T) =
  hat(p) - hat(p^2)$

  *Asymptotyczne własności:*

  Niech $dash(p) = T/n$. Wtedy $W = n/(n-1) dot dash(p)(1-dash(p))$.

  + Zgodność: $dash(p) ->^(PP) p$ (z PWL), $n/(n-1) -> 1$,
    więc $W ->^(PP) p(1-p)$ -- estymator jest zgodny.

  + *$sqrt(n)$-zgodność i asymptotyczna normalność:*

    Skorzystamy z CTG w postaci:
    $
      U_n = (dash(p) - mu) / (sigma / sqrt(n)) ->^d cal(N)(0, 1)
    $
    U nas $mu = p$ oraz $sigma = sqrt(p dot (1-p))$.
    Przekształcamy ułamek (mnożymy licznik i mianownik przez $sqrt(n)$), otrzymując:
    $
      sqrt(n) dot (dash(p) - p) / sigma ->^d cal(N)(0, 1)
    $
    Co jest równoważne stwierdzeniu, że:
    $
      sqrt(n) dot (dash(p) - p) ->^d cal(N)(0, sigma^2)
    $
    czyli $cal(N)(0, p dot (1-p))$.

    Nasz estymator $W$ jest funkcją $g(dash(p))$, gdzie $g(x) = x dot (1-x)$.
    Z metody delty wynika, że:
    $ sqrt(n) dot (g(dash(p)) - g(p)) approx g'(p) dot [sqrt(n) dot (dash(p) - p)] $

    pomyslec nad tym $approx$


    Wyrażenie w nawiasie dąży do $cal(N)(0, sigma^2)$.
    Mnożenie zmiennej normalnej przez stałą $g'(p)$ zmienia wariancję na
    $[g'(p)]^2 dot sigma^2$.
    Ponieważ $g'(x) = 1 - 2x$, wariancja graniczna to $(1 - 2p)^2 dot p dot (1-p)$.

    Ostatecznie:
    $
      sqrt(n) dot (W - p dot (1-p)) ->^d cal(N)(0, (1-2p)^2 dot p dot (1-p))
    $
    Estymator jest asymptotycznie normalny.


Problem 4
Niech $X=(X_1,...,X_n)$ będzie próbą losową z rozkładu wykładniczego
$cal(E)(lambda)$, gdzie $lambda > 0$. Pokazać, że estymator
$
  T_n (X) = n X_((1))
$
jest nieobciążonym estymatorem parametru $lambda$, jednakże ciąg estymatorów
$(T_n)$ nie jest zgodny.

$
  X ~ "Exp"(lambda) \
  f(x) = 1/lambda e^(-x/lambda)
$

Z listy 1 $X_((1)) ~ "Exp"(n/lambda), f(x) = n/x e^(-(n x)/lambda)$

$
  EE[n X_((1))] = n EE X_((1)) = n dot lambda/n = lambda ==> n X_((1))
  "jest nieobciążonym estymatorem" lambda
$

$
  forall_epsilon lim_(n->oo) (PP |T_n - lambda| >= epsilon)
  &= F_(X_((1))) (lambda - epsilon)/n + 1 - F_(X_((1))) (lambda + epsilon)/n \
  &= cases(
    1 - e^(-n/lambda ((lambda-epsilon)/n)) + 1 - 1 + e^(-n/lambda ((lambda +
      epsilon)/n)) = 1 - e^(-(lambda - epsilon)/lambda) + e^(-(lambda +
    epsilon)/lambda)
    quad & epsilon < lambda,
    e^(-n/lambda (lambda/n + epsilon/n)) = e^(-(lambda+epsilon)/lambda) quad & epsilon >= lambda,
  )
$

$PP (|T_n - lambda| >= epsilon)$ jest stała i dodatnia więc nie zbiega do $0$.

Zadanie 5
Niech $X=(X_1,...,X_n)$ będzie próbą losową z rozkładu
+ normalnego $cal(N)(a theta, theta^2)$, gdzie $a$ jest znaną stałą, $theta > 0$;
+ jednostajnego $cal(U)(theta - 1/2, theta + 1/2)$, $theta in bb(R)$;
+ jednostajnego $cal(U)(alpha, beta)$, $alpha, beta in bb(R)$, $alpha < beta$, $theta=(alpha, beta)$.
Dla każdej z tych rodzin rozkładów wyznaczyć statystykę dostateczną i zupełną dla parametru $theta$.


a, b można załatwić:

Z listy 6 wiemy że $T = (sum_1^n X_i, sum_1^n X_i^2)$ jest statystyką
dostateczną ale nie jest zupełna.

Przypuśćmy, że $S$ jest statystyką zupełną i dostateczną.

Skoro $T$ jest minimalną statystyką dostateczną, to istnieje $h$-mierzalna taka,
że

$
  T = h(S)
$

Ale $S$ jest zupełna, więc dla dowolnej $g$-mierzalej mamy

$
  forall_theta EE_theta [g(S)] = 0 => g = 0 "p.w."
$

Ale

$
  EE_theta [g(T)] = EE_theta [(g compose h) (S)]
$

więc gdyby $EE_theta [(g compose h) (S)] = 0$, to z zupełności $S$ mamy $g
compose h = 0$ p.w. czyli $g = 0$ p.w. (????????!)

tzn. dostaliśmy, że $EE_theta [g(T)] = 0 => g=0$ - sprzeczność z brakiem
zupełności $T$.





Rozwiązania:

Korzystamy z następującej obserwacji: jeśli $S$ jest statystyką dostateczną i
zupełną, a $T=h(S)$, to $T$ też jest zupełna. Zatem jeżeli minimalna statystyka
dostateczna nie jest zupełna, to nie istnieje żadna statystyka jednocześnie
dostateczna i zupełna.

+ $X_i ~ cal(N)(a theta, theta^2)$, $theta > 0$.

  Gęstość próby:
  $
    f(bold(x); theta) & = product_(i=1)^n 1/(sqrt(2 pi) theta)
                        exp(- (x_i - a theta)^2/(2 theta^2)) \
                      & = (2 pi)^(-n/2) theta^(-n)
                        exp(
                          -1/(2 theta^2) sum_(i=1)^n x_i^2
                          + a/theta sum_(i=1)^n x_i
                          - (n a^2)/2
                        ).
  $

  Z kryterium faktoryzacji statystyką dostateczną jest
  $
    T(X) = (sum_(i=1)^n X_i, sum_(i=1)^n X_i^2).
  $
  Jest ona także minimalna, bo iloraz $f(bold(x);theta)/f(bold(y);theta)$
  jest równy
  $
    f(bold(x);theta)/f(bold(y);theta)
    = exp(
      -1/(2 theta^2) [sum_(i=1)^n x_i^2 - sum_(i=1)^n y_i^2]
      + a/theta [sum_(i=1)^n x_i - sum_(i=1)^n y_i]
    ).
  $
  i nie zależy on od $theta$ wtedy i tylko wtedy, gdy
  $
    sum_(i=1)^n x_i = sum_(i=1)^n y_i
    quad "oraz" quad
    sum_(i=1)^n x_i^2 = sum_(i=1)^n y_i^2.
  $

  Nie jest ona zupełna (dla $n >= 2$). Rzeczywiście
  $
    EE_theta (sum_(i=1)^n X_i)^2 & = "Var"_theta (sum_(i=1)^n X_i)
                                   + (EE_theta sum_(i=1)^n X_i)^2 \
                                 & = n theta^2 + n^2 a^2 theta^2
                                   = n(1 + n a^2) theta^2,
  $
  oraz
  $
    EE_theta sum_(i=1)^n X_i^2
    = n (theta^2 + a^2 theta^2)
    = n(1 + a^2) theta^2.
  $
  Zatem dla
  $
    g(T) = (sum_(i=1)^n X_i)^2
    - (1 + n a^2)/(1 + a^2) sum_(i=1)^n X_i^2
  $
  mamy $EE_theta g(T) = 0$ dla każdego $theta > 0$, ale $g(T)$ nie jest równe
  $0$ prawie na pewno (np. dla $n >= 2$). Stąd $T$ nie jest zupełna. Ponieważ
  $T$ jest minimalną statystyką dostateczną w tej rodzinie wykładniczej
  zakrzywionej, nie istnieje statystyka jednocześnie dostateczna i zupełna.

+ $X_i ~ cal(U)(theta - 1/2, theta + 1/2)$, $theta in bb(R)$.

  Gęstość próby ma postać
  $
    f(bold(x); theta)
    = product_(i=1)^n bb(1)_([theta - 1/2, theta + 1/2])(x_i)
    = bb(1)_([x_((n)) - 1/2, x_((1)) + 1/2])(theta).
  $
  Zatem z kryterium faktoryzacji statystyką dostateczną jest
  $
    T(X) = (X_((1)), X_((n))).
  $
  Minimalność wynika z kryterium ilorazu gęstości: jeśli
  $
    f(bold(x);theta)/f(bold(y);theta)
    = (bb(1)_([x_((n)) - 1/2, x_((1)) + 1/2])(theta)) /
    (bb(1)_([y_((n)) - 1/2, y_((1)) + 1/2])(theta)).
  $
  Ten iloraz nie zależy od $theta$ tylko wtedy, gdy przedziały dopuszczalnych
  wartości parametru są takie same, czyli
  $x_((1)) = y_((1))$ i $x_((n)) = y_((n))$.

  Statystyka ta nie jest zupełna. Rozstęp
  $
    R = X_((n)) - X_((1))
  $
  ma rozkład niezależny od $theta$; dla próby z rozkładu jednostajnego na
  odcinku długości $1$ zachodzi
  $
    EE_theta R = (n - 1)/(n + 1).
  $
  Dlatego
  $
    g(T) = X_((n)) - X_((1)) - (n - 1)/(n + 1)
  $
  spełnia $EE_theta g(T) = 0$ dla każdego $theta$, lecz nie jest równa $0$
  prawie na pewno. Stąd nie ma tutaj statystyki dostatecznej i zupełnej.

+ $X_i ~ cal(U)(alpha, beta)$, $theta=(alpha,beta)$, $alpha < beta$.

  Gęstość próby:
  $
    f(bold(x); alpha, beta)
    = 1/(beta - alpha)^n
    product_(i=1)^n bb(1)_([alpha, beta])(x_i)
    = 1/(beta - alpha)^n
    bb(1)_((-oo, x_((1))])(alpha)
    bb(1)_([x_((n)), oo))(beta).
  $
  Z kryterium faktoryzacji statystyką dostateczną jest
  $
    T(X) = (X_((1)), X_((n))).
  $

  Pokażemy zupełność. Dla $x_((1)) < x_((n))$ gęstość wektora
  $(X_((1)), X_((n)))$ wynosi
  $
    f_T(x_((1)), x_((n)); alpha,beta)
    = (n(n-1) (x_((n))-x_((1)))^(n-2))/(beta-alpha)^n
    bb(1)_(alpha < x_((1)) < x_((n)) < beta).
  $
  Niech $EE_(alpha,beta) g(T) = 0$ dla każdego $alpha < beta$. Wtedy
  $
    integral_alpha^beta integral_(x_((1)))^beta
    g(x_((1)),x_((n))) (x_((n))-x_((1)))^(n-2) dif x_((n)) dif x_((1)) = 0
    quad "dla każdych" alpha < beta.
  $
  Odejmując od tej równości analogiczne równości dla przedziałów
  $(alpha, c)$ i $(c, beta)$, dostajemy dla każdego
  $alpha < c < beta$:
  $
    integral_alpha^c integral_c^beta
    g(x_((1)),x_((n))) (x_((n))-x_((1)))^(n-2) dif x_((n)) dif x_((1)) = 0.
  $
  A więc całka funkcji
  $g(x_((1)),x_((n))) (x_((n))-x_((1)))^(n-2)$ po dowolnym prostokącie zawartym w
  zbiorze ${x_((1)) < x_((n))}$ jest równa $0$. Stąd
  $g(x_((1)),x_((n))) (x_((n))-x_((1)))^(n-2) = 0$ prawie wszędzie, czyli
  $g(T)=0$ prawie na pewno.
  Zatem
  $
    T(X) = (X_((1)), X_((n)))
  $
  jest statystyką dostateczną i zupełną dla $theta=(alpha,beta)$.

Zadanie 6
Niech $X=(X_1,...,X_n)$ będzie próbą losową z rozkładu jednostajnego $cal(U)(alpha, beta)$, $alpha, beta in bb(R)$, $alpha < beta$.

+ Znaleźć estymatory UMVU parametrów $alpha$ i $beta$.

  Z zadania 5c) $T(X) = (X_((1)), X_((n)))$ jest statystyką zupełną i
  dostateczną dla $(alpha, beta)$.

  Chcemy $W(T)$ takie, że $EE[W(T)] = alpha$

  $
    EE[a X_((1)) + b X_((n))] = alpha \
    a EE[X_((1))] + b EE[X_((n))] = alpha \
    X ~ U(0,1), quad EE[X_((1))] = 1/(n+1) quad EE[X_((n))] = n/(n+1)
  $

  Stąd dla $X ~ U(alpha, beta)$:

  $
    EE[X_((1))] = alpha + (beta -alpha)/(n+1) \
    EE[X_((n))] = alpha + ((beta - alpha) n)/(n+1) \
  $

  $
    a (alpha + (beta - alpha)/(n+1) + b (alpha + ((beta - alpha) n)/(n + 1)) =
    alpha \
    alpha (a + b) + (beta - alpha) (a/(n+1) + (b n)/(n+1)) = alpha
    alpha \
    cases(
      a + b = 1,
      a/(n+1) + (b n)/(n+1) = 0
    )
    =>
    cases(
      a = n/(n-1),
      b = -1/(n-1)
    )
  $

  $W_alpha (T) = n/(n-1) X_((1)) - 1/(n-1)$


  Dla $beta$:

  $
    alpha (a + b - a/(n+1) - (b n)/(n+1)) = beta (a/(n-1) + (b n)/(n + 1)) =
    beta \
    cases(
      a + b - a/(n+1) - (b n)/(n+1) = 0,
      a/(n+1) + (b n)/(n + 1) = 1
    )
    =>
    cases(
      a = -1/(n-1),
      b = n/(n-1)
    )
  $

  $
    W_beta (T) = -1/(n-1) X_((1)) + n/(n-1) X_((n))
  $

  $
    W_(beta-alpha) (T) = W_beta (T) - W_alpha (T) = ....
  $







+ Znaleźć estymator UMVU funkcji $g(alpha, beta) = beta - alpha$.

Zadanie 7
Niech $X=(X_1,...,X_n)$ będzie próbą losową. Pokazać, że estymator $overline(X)$
parametru $mu$ w rodzinie $cal(N)(mu, 1)$ jest lepszy niż estymator $T(X) =
1/2 (X_((1)) + X_((n)))$, tzn. $T(X)$ jest niedopuszczalny. Następnie udowodnić,
że w rodzinie rozkładów jednostajnych na odcinku $[mu - 1/2, mu + 1/2]$ jest na
odwrót, tzn. $overline(X)$ jest niedopuszczalny.

W zadaniach przyjmuje funkcje straty jako błąd kwadratowy (funkcja ściśle wypukła):

$
  L (mu, d) = (d - mu)^2
$

a)
Dla estymatorów $mu$ w rodzinie rozkładów $cal(N)(mu, 1)$ chcemy pokazać:

$
  R (mu, overline(X)) < R (mu, T(X))
$


Wiemy z poprzednich zadań, że statystyka $overline(X)$ jest dostateczna dla rozkładów normalnych.

Zobaczmy co Rao-Blackwellizacja da dla naszego estymatora $T(X)$:

$
  EE_mu [T(X) | overline(X) = t]
  & = EE_mu [1/2 (X_((1)) + X_((n))) | overline(X)] \
  & Z_i = X_i - overline(X) \
  & = EE_mu [1/2 ((overline(X) + Z_((1))) + (overline(X) + Z_((n)))) | overline(X)] \
  & = EE_mu [overline(X) + 1/2 (Z_((1)) + Z_((n))) | overline(X)] \
  & = underbrace(EE_mu [overline(X) | overline(X)], overline(X)) + underbrace(EE_mu [1/2 (Z_((1)) + Z_((n))) | overline(X)], "symetryczne wg 0 dla Z zatem" = 0) \
  & = overline(X)
$

Zatem na mocy tw. Rao-Blackwell'a $R(mu, overline(X)) < R(mu, T(X))$, więc $T(X)$ jest niedopuszczalny.

b)

Dla estymatorów $mu$ w rodzinie rozkładów jednostajnych na odcinku $[mu - 1/2, mu + 1/2]$ chcemy pokazać:

$
  R (mu, overline(X)) > R (mu, T(X))
$


Wiemy z poprzednich zadań, że statystyka $(X_((1)), X_((n)))$ jest dostateczna dla rozkładów jednostajnych.

$
  EE_mu [overline(X) | X_((1)) = a, X_((n)) = b] & = 1/n (EE_mu [X_((1)) + ... + X_((n)) | X_((1)) = a, X_((n)) = b] \
                                                 & = 1/n (a + (n-2) dot (a+b)/2 + b) \
                                                 & = 1/n (n/2 dot (a+b)) \
                                                 & = (a+b)/2
$

Zatem $EE_mu [overline(X) | X_((1)), X_((n))] = (X_((1)) + X_((n)))/2$

Zatem na mocy tw. Rao-Blackwell'a $R(mu, overline(X)) > R(mu, T(X))$, więc $overline(X)$ jest niedopuszczalny.

*ALTERNATYWNIE*

Dla średniej mamy

$
  R(mu, overline(X)) & = EE_mu [(overline(X) - mu)^2] \
                     & = "Var"_mu (overline(X)) \
                     & = "Var"_mu (1/n (X_1 + ... + X_n)) \
                     & = 1/n^2 ("Var"_mu(X_1) + ... + "Var"_mu(X_n)) \
                     & = 1/n^2 dot n \
                     & = 1/n
$

$
  R(mu, T) & = EE_mu [(T(X) - mu)^2] \
           & = EE_mu [(1/2 (X_((1)) + X_((n))) - mu)^2] \
           & = EE_mu [(1/2 ((overline(X) + Z_((1))) + (overline(X) + Z_((n)))) - mu)^2] \
           & = EE_mu [((overline(X) - mu) + 1/2 (Z_((1)) + Z_((n))))^2] \
           & = EE_mu [(overline(X) - mu)^2]
             + EE_mu [(1/2 (Z_((1)) + Z_((n))))^2]
             + 2 EE_mu [(overline(X) - mu) 1/2 (Z_((1)) + Z_((n)))] \
           & = "Var"_mu (overline(X))
             + 1/4 EE_mu [(Z_((1)) + Z_((n)))^2]
             + EE_mu [overline(X) - mu] EE_mu [Z_((1)) + Z_((n))] "| bo" overline(X), Z_((1)) + Z_((n)) "niezalżne" \
           & = 1/n
             + 1/4 EE_mu [(Z_((1)) + Z_((n)))^2] \
           & > 1/n "| bo suma min + max" cal(N)(0, 1) "prawie zawsze (dla "n>2")" != 0
$

Zatem dla $n > 2$ estymator $T(X)$ jest niedopuszczalny w rodzinie $cal(N)(mu, 1)$.

b)

Dla rozkładu jednostajnego $U[mu - 1/2, mu + 1/2]$

$
  R(mu, overline(X)) & = EE_mu [(overline(X) - mu)^2] \
                     & = "Var"_mu(overline(X)) \
                     & = "Var"_mu(1/n (X_1 + ... + X_n)) \
                     & = 1/n^2 ("Var"_mu(X_1) + ... + "Var"_mu(X_n)) \
                     & = 1/n^2 dot n dot 1/12 \
                     & = 1/(12 n).
$

$
  R(mu, T) & = EE_mu [(T(X) - mu)^2] \
           & = EE_mu [(1/2 (X_((1)) + X_((n))) - mu)^2] "|" Y_i ~ U[0, 1] \
           & = EE_mu [(1/2 (mu - 1/2 + Y_((1)) + mu - 1/2 + Y_((n))) - mu)^2] \
           & = EE_mu [(mu - 1/2 (Y_((1)) + Y_((n)) - 1) - mu)^2] \
           & = EE [(1/2 (Y_((1)) + Y_((n)) - 1))^2] \
           & = 1/4 EE [(Y_((1)) + Y_((n)) - 1)^2] \
           & = 1/4 EE [(Y_((1)) + Y_((n)) - 1)^2] \
           & = 1/4 EE [
               Y_((1))^2
               + Y_((n))^2
               + 2 Y_((1)) Y_((n))
               - 2 Y_((1))
               - 2 Y_((n))
               + 1
             ] \
           & = 1/4 (
               EE[Y_((1))^2]
               + EE[Y_((n))^2]
               + 2 EE[Y_((1)) Y_((n))]
               - 2 EE[Y_((1))]
               - 2 EE[Y_((n))]
               + 1
             ) \
           & = 1/4 (
               2/((n+1)(n+2))
               + n/(n+2)
               + 2/(n+2)
               - 2/(n+1)
               - 2n/(n+1)
               + 1
             ) \
           & = 1/4 (
               2/((n+1)(n+2))
               + (n+2)/(n+2)
               - 2(n+1)/(n+1)
               + 1
             ) \
           & = 1/4 (
               2/((n+1)(n+2))
               + 1
               - 2
               + 1
             ) \
           & = 1/4 dot 2/((n+1)(n+2)) \
           & = 1/(2(n+1)(n+2)).
$

Zatem dla $n > 2$

$
  R(mu, T) < R(mu, overline(X)).
$

Czyli w rodzinie rozkładów jednostajnych $U[mu - 1/2, mu + 1/2]$
estymator $overline(X)$ jest niedopuszczalny.

Zadanie 8
Niech $X=(X_1,...,X_n)$ będzie próbą losową z rozkładu $cal(N)(mu, sigma^2)$. Dobrać stałą $c$, tak aby statystyka
$ W^2 = c sum_(i=1)^(n-1) (X_(i+1) - X_i)^2 $
była nieobciążonym estymatorem parametru $sigma^2$. Porównać wariancję $W^2$ z wariancją $S^2$. Który z estymatorów pozwala ocenić $sigma^2$ z większą dokładnością?

Zadanie 9
Niech $X=(X_1,...,X_n)$ będzie próbą losową z rozkładu jednostajnego $cal(U)(0, mu)$, gdzie $theta > 0$. Wykazać, że w klasie wszystkich estymatorów estymator
$ T(X) = (n+1)/n X_((n)) $
jest niedopuszczalny dla $L(theta, d) = (d - theta)^2$, chociaż jest estymatorem UMVU.
Wskazówka: Rozważyć estymator $T_1(X) = (n+2)/(n+1) X_((n))$.
