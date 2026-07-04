#set page(paper: "a4", margin: (x: 2cm, y: 2.5cm))
#set text(font: "New Computer Modern", size: 11pt, lang: "pl")
#set par(justify: true, leading: 0.65em)

#align(center)[
  #text(size: 16pt, weight: "bold")[Statystyka Matematyczna -- zestaw z poprzedniego roku]
]

#let argmax = $limits("argmax ")$

#v(1em)

#show enum: it => {
  set enum(numbering: "a)")
  it
}
#set enum(numbering: "1.")

+
  Udowodnij, że rozkłady normalne $N(theta, theta)$ tworzą jednoparametrową rodzinę wykładniczą. Wskaż funkcje $eta(theta)$, $B(theta)$, $h(x)$ i $T(x)$ pojawiające się we wzorze
  $
    f(x; theta) = exp[eta(theta) T(x) - B(theta)] h(x),
  $
  oraz zbiór $Theta$, do którego należy parametr $theta$.

  Rozwiązanie:

  Ponieważ wariancja musi być dodatnia, mamy $Theta = (0, oo)$. Gęstość rozkładu $N(theta, theta)$ ma postać

  $
    f(x; theta)
    &= 1 / sqrt(2 pi theta) exp(- (x - theta)^2 / (2 theta)) \
    &= 1 / sqrt(2 pi) exp(-1/2 ln theta - x^2 / (2 theta) + x - theta / 2) \
    &= exp(underbrace(-1 / (2 theta), eta(theta)) underbrace(x^2, T(x)) - underbrace((theta + ln theta) / 2, B(theta))) underbrace(1 / sqrt(2 pi) exp(x), h(x)).
  $

  Zatem jest to jednoparametrowa rodzina wykładnicza z
  $
    eta(theta) = -1/(2 theta), quad T(x) = x^2, quad
    B(theta) = (theta + ln theta) / 2, quad
    h(x) = 1 / sqrt(2 pi) exp(x), quad
    Theta = (0, oo).
  $

+
  Niech $X = (X_1, ..., X_n)$ będzie próbą losową z rozkładu $B(1, p)$, gdzie $p in (0, 1)$. Dla kwadratowej funkcji straty $L(p, d) = (d - p)^2$ wyznaczyć funkcje ryzyka $R(d_1, p)$ i $R(d_2, p)$ estymatorów
  $
    d_1(X) = (sum_(i=1)^n X_i + 1/2 sqrt(n)) / (n + sqrt(n)),
    quad
    d_2(X) = (sum_(i=1)^n X_i) / n.
  $
  Dla jakich $p$ zachodzi nierówność $R(d_1, p) < R(d_2, p)$?

  Rozwiązanie:

  Oznaczmy $S = sum_(i=1)^n X_i$. Wtedy $S ~ B(n, p)$, więc
  $
    EE S = n p, quad "Var"(S) = n p(1 - p).
  $

  Dla $d_2 = S / n$:
  $
    EE d_2 = p, quad "Var"(d_2) = p(1 - p) / n,
  $
  więc
  $
    R(d_2, p) = "Var"(d_2) + "bias"(d_2)^2 = p(1 - p) / n.
  $

  Dla $d_1$:
  $
    EE d_1 = (n p + 1/2 sqrt(n)) / (n + sqrt(n)),
  $
  zatem
  $
    "bias"(d_1)
    = EE d_1 - p
    = (sqrt(n)(1/2 - p)) / (n + sqrt(n)).
  $

  Ponadto
  $
    "Var"(d_1) = (n p(1 - p)) / (n + sqrt(n))^2.
  $

  Stąd
  $
    R(d_1, p) & = (n p(1 - p)) / (n + sqrt(n))^2
                + (n(1/2 - p)^2) / (n + sqrt(n))^2 \
              & = n / (n + sqrt(n))^2 dot (p(1-p) + (1/2 - p)^2) \
              & = n / (4 (n + sqrt(n))^2)
                = 1 / (4 (sqrt(n) + 1)^2).
  $

  Porównujemy ryzyka:
  $
    R(d_1, p) < R(d_2, p)
    <=> 1 / (4 (sqrt(n) + 1)^2) < p(1 - p) / n.
  $

  Równoważnie
  $
    (p - 1/2)^2 < (2 sqrt(n) + 1) / (4 (sqrt(n) + 1)^2).
  $

  Czyli
  $
    #box($ p in (
      1/2 - sqrt(2 sqrt(n) + 1) / (2(sqrt(n) + 1)),
      1/2 + sqrt(2 sqrt(n) + 1) / (2(sqrt(n) + 1))
    ) $, stroke: 1pt, inset: 6pt)
  $

+
  Niech $X = (X_1, ..., X_n)$ będzie próbą z rozkładu $N(mu, sigma^2)$, z nieznanymi parametrami $(mu, sigma) in RR times RR_+$. Znajdź estymator UMVU dla
  $
    g(mu) = mu^2 + mu + 2024.
  $

  Rozwiązanie:

  Rodzina normalna z nieznanymi $mu$ i $sigma^2$ jest dwuwymiarową rodziną wykładniczą:
  $
    f(bold(x); mu, sigma^2) & = (2 pi sigma^2)^(-n/2)
                              exp(-1 / (2 sigma^2) sum_(i=1)^n (x_i - mu)^2) \
                            & = h(bold(x)) exp(
                                mu / sigma^2 sum_(i=1)^n x_i
                                - 1 / (2 sigma^2) sum_(i=1)^n x_i^2
                                - n mu^2 / (2 sigma^2)
                                - n / 2 ln(2 pi sigma^2)
                              ).
  $

  Z twierdzenia o rodzinach wykładniczych pełnego rzędu statystyka
  $
    T(X) = (sum_(i=1)^n X_i, sum_(i=1)^n X_i^2)
  $
  jest dostateczna i zupełna dla $(mu, sigma^2)$.

  Szukamy estymatora nieobciążonego funkcji $g(mu)$. Mamy
  $
    EE overline(X) = mu,
    quad
    EE overline(X)^2 = mu^2 + sigma^2 / n.
  $

  Ponieważ
  $
    S^2 = 1 / (n - 1) sum_(i=1)^n (X_i - overline(X))^2
  $
  spełnia $EE S^2 = sigma^2$, to
  $
    W(X) = overline(X)^2 - S^2 / n + overline(X) + 2024
  $
  jest estymatorem nieobciążonym $g(mu)$.

  Co więcej, $W(X)$ jest funkcją statystyki $T(X)$, ponieważ $overline(X)$ i $S^2$ można wyrazić przez $sum X_i$ oraz $sum X_i^2$. Na mocy twierdzenia Lehmanna-Scheffe'go:

  $
    #box($ hat(g)_"UMVU"(X)
    = overline(X)^2 - 1 / (n(n - 1)) sum_(i=1)^n (X_i - overline(X))^2
    + overline(X) + 2024 $, stroke: 1pt, inset: 6pt)
  $

+
  Niech $X = (X_1, ..., X_n)$ będzie próbą losową z rozkładu wykładniczego o gęstości
  $
    f(x; theta) = e^(-(x - theta)) bb(1)_((theta, oo))(x)
  $
  z nieznanym parametrem $theta$. Znajdź funkcję centralną dla $theta$, opartą na statystyce dostatecznej dla tego parametru. Następnie skonstruuj przedział ufności dla $theta$ na poziomie ufności $1 - alpha$.

  Rozwiązanie:

  Gęstość łączna:
  $
    f(bold(x); theta) & = product_(i=1)^n e^(-(x_i - theta)) bb(1)_((theta, oo))(x_i) \
                      & = exp(-sum_(i=1)^n x_i + n theta) bb(1)_{theta < x_((1))}.
  $

  Z kryterium faktoryzacji statystyka
  $
    T(X) = X_((1))
  $
  jest dostateczna dla $theta$.

  Ponadto $X_i = theta + Y_i$, gdzie $Y_i ~ "Exp"(1)$. Stąd
  $
    X_((1)) - theta = min(Y_1, ..., Y_n) ~ "Exp"(n).
  $

  Funkcją centralną może być więc
  $
    Q(X; theta) = n (X_((1)) - theta) ~ "Exp"(1),
  $
  a jej rozkład nie zależy od $theta$.

  Niech $q_p$ oznacza $p$-ty kwantyl rozkładu $"Exp"(1)$, czyli
  $
    q_p = - ln(1 - p).
  $

  Wtedy
  $
    PP(q_(alpha/2) <= n(X_((1)) - theta) <= q_(1 - alpha/2)) = 1 - alpha.
  $

  Po przekształceniu dostajemy przedział ufności:
  $
    #box($ [
      X_((1)) - q_(1 - alpha/2) / n,
      X_((1)) - q_(alpha/2) / n
    ] $, stroke: 1pt, inset: 6pt)
  $

+
  Niech $X = (X_1, ..., X_n)$ będzie próbą z rozkładu o gęstości
  $
    f(x; theta) = theta / x^2 bb(1)_((theta, oo))(x), quad theta > 0.
  $

  + Znajdź estymator MLE parametru $theta$.
  + Uzasadnij, dlaczego nie można wykorzystać metody momentów do wyznaczenia estymatora parametru $theta$.

  Rozwiązanie:

  + Funkcja wiarygodności:
    $
      L(theta) & = product_(i=1)^n theta / x_i^2 bb(1)_((theta, oo))(x_i) \
               & = theta^n product_(i=1)^n x_i^(-2) bb(1)_{0 < theta < x_((1))}.
    $

    Dla ustalonej próby czynnik $product x_i^(-2)$ nie zależy od $theta$, a $theta^n$ jest funkcją rosnącą na $(0, oo)$. Warunek z indykatora daje $theta < x_((1))$. Zatem maksimum jest osiągane w punkcie brzegowym:

    $
      #box($hat(theta)_"MLE" = X_((1))$, stroke: 1pt, inset: 6pt)
    $

  + Metoda momentów wymaga przyrównania momentów teoretycznych do momentów empirycznych. Tutaj pierwszy moment nie istnieje:
    $
      EE_theta X
      = integral_theta^oo x theta / x^2 dif x
      = theta integral_theta^oo 1 / x dif x
      = oo.
    $

    W konsekwencji dodatnie całkowite momenty również nie są skończone, więc klasycznej metody momentów nie da się tu użyć do wyznaczenia estymatora $theta$.

+
  Niech $X = (X_1, ..., X_n)$ będzie próbą z rozkładu normalnego $N(0, sigma^2)$ z nieznaną wariancją $sigma^2 > 0$. Dla ustalonych $alpha in (0, 1)$ i $sigma_0 > 0$ skonstruuj test UMP rozmiaru $alpha$ dla hipotezy $H_0: sigma <= sigma_0$ przeciwko $H_1: sigma > sigma_0$. Wykorzystując dystrybuantę odpowiedniego rozkładu wyznacz funkcję mocy tego testu.

  Rozwiązanie:

  Gęstość łączna:
  $
    f(bold(x); sigma)
    = (2 pi sigma^2)^(-n/2) exp(-1 / (2 sigma^2) sum_(i=1)^n x_i^2).
  $

  Dla $sigma_2 > sigma_1$ iloraz wiarygodności wynosi
  $
    f(bold(x); sigma_2) / f(bold(x); sigma_1)
    = (sigma_1 / sigma_2)^n
    exp(1/2 (1 / sigma_1^2 - 1 / sigma_2^2) sum_(i=1)^n x_i^2),
  $
  więc jest rosnącą funkcją statystyki
  $
    T(X) = sum_(i=1)^n X_i^2.
  $

  Z twierdzenia Karlina-Rubina test UMP odrzuca $H_0$ dla dużych wartości $T(X)$. Ponieważ
  $
    T(X) / sigma^2 ~ chi^2_n,
  $
  stałą krytyczną dobieramy z warunku
  $
    alpha = PP_(sigma_0)(T(X) > c).
  $

  Zatem
  $
    c = sigma_0^2 chi^2_(n, 1 - alpha),
  $
  gdzie $chi^2_(n, 1 - alpha)$ oznacza kwantyl rzędu $1 - alpha$ rozkładu $chi^2_n$.

  Test ma postać
  $
    phi(X) = cases(
      1"," sum_(i=1)^n X_i^2 > sigma_0^2 chi^2_(n, 1 - alpha),
      0"," sum_(i=1)^n X_i^2 <= sigma_0^2 chi^2_(n, 1 - alpha).
    )
  $

  Jeśli $F_(chi^2_n)$ oznacza dystrybuantę rozkładu $chi^2_n$, to funkcja mocy wynosi
  $
    beta_phi(sigma) & = pp_sigma (t(x) > sigma_0^2 chi^2_(n, 1 - alpha)) \
                    & = PP_sigma(T(X) / sigma^2 > sigma_0^2 / sigma^2 chi^2_(n, 1 - alpha)) \
                    & = 1 - F_(chi^2_n)(sigma_0^2 / sigma^2 chi^2_(n, 1 - alpha)).
  $
