#set text(lang: "pl", font: "Liberation Serif", size: 11pt)
#set page(
  paper: "a4",
  margin: (x: 2.5cm, y: 2.5cm),
  header: align(right, text(size: 8pt, fill: rgb("777777"))[Statystyka Matematyczna — Egzaminy]),
)

#align(center)[
  #v(2cm)
  #text(size: 24pt, weight: "bold", fill: rgb("1a3a5f"))[Statystyka Matematyczna]
  #v(0.5cm)
  #text(size: 14pt, style: "italic", fill: rgb("444444"))[Rozwiązania egzaminów]
  #v(2cm)
]

#outline(indent: 1.5em)
#pagebreak()
= Egzamin — 2023
== Wstęp do statystyki matematycznej — Egzamin podstawowy 28 czerwca 2023

#set enum(numbering: "1.(a)")

+ Niech $bold(X) = (X_1, dots, X_n)$ będzie próbą z rozkładu o gęstości postaci
  $ p_theta (x) = theta x^(-theta - 1) bb(1)_([1, oo))(x). $
  Wyznaczyć estymator największej wiarygodności parametru $theta$ oparty na próbie $bold(X)$.

  $
    L(theta) = product_(i=1)^n p_theta (x) = bb(1)_[1,oo) (x_((1))) dot theta^n product_(i=1)^n x_i^(-theta -1)
  $

  $
    l(theta) = bb(1)_[1,oo) (x_((1))) (n ln theta - (theta + 1) sum_(i=1)^n ln x_i)
  $

  $
    l' (theta) = bb(1)_[1,oo) (x_((1))) (n/theta - sum_(i=1)^n ln x_i)
  $

  $
    l' (theta) = 0 <=> hat(theta) = n / (sum_(i=1)^n ln x_i)
  $

  $
    l'' (theta) = bb(1)_[1,oo) (x_((1))) (- n/theta^2)
  $

  $
    l''(hat(theta)) = bb(1)_[1,oo) (x_((1))) (- (sum_(i=1)^n ln x_i)^2 /n) < 0 ==> "Zatem" hat(theta) "to maksimum."
  $

  $
    #box($arg max_(theta in RR) l(theta) = hat(theta)$, stroke: 1pt, inset: 8pt)
  $

+ Sprawdzić, czy rodzina rozkładów $cal(P) = {P_theta : theta in RR}$, gdzie $P_theta$ ma gęstość (względem miary Lebesgue'a) postaci
  $ f(x; theta) = 1 / (sqrt(2pi) x) exp(- (ln x - theta)^2 / 2) bb(1)_((0, oo))(x) quad (1) $
  gdzie $theta > 0$, ma monotoniczny iloraz wiarygodności.

  $
    f(x; theta) = underbrace((bb(1)_((0, oo))(x)) / (sqrt(2pi) x) exp(- (ln x)^2 / 2), h(x)) exp(underbrace(theta, eta (theta)) underbrace(ln x, T (x)) - underbrace(theta^2 / 2, B(theta)))
  $

  Zatem skoro $eta(theta) = theta$ jest funkcją niemalejącą to rodzina ${f_theta (x) : theta in RR^+}$ ma MLR względem $T(x) = ln x$.

+ Niech $bold(X) = (X_1, dots, X_n)$ będzie próbą z rozkładu normalnego $cal(N)(0, theta.alt^2)$. Wiedząc, że
  $ (sum_(i=1)^n X_i^2) / theta.alt^2 $
  ma rozkład $chi^2$ z $n$ stopniami swobody, wyznaczyć przedział ufności dla parametru $theta.alt$, na poziomie ufności $1 - alpha$.

  $
    1 - alpha >= P (x_(alpha/2) <= (sum_(i=1)^n X_i^2)/theta^2 <= x_(1-alpha/2))
    &<=> P (x_(alpha/2)/(sum_(i=1)^n X_i^2) <= 1/theta^2 <= x_(1-alpha/2)/(sum_(i=1)^n X_i^2)) \
    &<=> P ((sum_(i=1)^n X_i^2)/x_(1-alpha/2) <= theta^2 <= (sum_(i=1)^n X_i^2)/x_(alpha/2)) \
    &<=> P (sqrt((sum_(i=1)^n X_i^2)/x_(1-alpha/2)) <= theta <= sqrt((sum_(i=1)^n X_i^2)/x_(alpha/2)))
  $

  Zatem nasz przedział ufności to:

  $
    [L(X), U(X)] = [
      sqrt((sum_(i=1)^n X_i^2)/x_(1-alpha/2)),
      sqrt((sum_(i=1)^n X_i^2)/x_(alpha/2))
    ]
  $

+ Niech $bold(X) = (X_1, dots, X_(10))$ będzie próbą z rozkładu normalnego $cal(N)(1, 4)$. Obliczyć:
  + $bb(E)[F_(10)(1.2; bold(X))]$,
  + $text("Var")[F_(10)(1.2; bold(X))]$, \
  gdzie $F_(10)(t; bold(X))$ oznacza dystrybuantę empiryczną z próby $bold(X)$.

  Z wykładu wiemy:

  $
    n F_10 (t; bold(X)) =^D cal(B)(n, F_(cal(N)(1, 4))(t))
  $

  Z tego możemy wyprowadzić zarówno wartość oczekiwaną i wariancję:

  + $bb(E)[F_(10)(1.2; bold(X))] = F_(cal(N)(1,4)) (1.2) = PP (X <= 1.2) = PP (Z <= 0.1) = Phi(0.1)$,

  + $text("Var")[F_(10)(1.2; bold(X))] = (F(1.2)(1 - F(1.2)))/10 = (Phi(1.2) (1 - Phi(1.2)))/10$,

+ Niech $bold(X) = (X_1, dots, X_n)$ będzie próbą z rozkładu $cal(B)(1, theta.alt)$, $theta.alt in (0, 1)$. Wyznaczyć estymator NMW (nieobciążony o minimalnej wariancji) parametru $theta.alt(1 - theta.alt)$.

  Szukamy dowolnego estymatora nieobciążonego parametru $W$ i dostatecznej oraz zupełnej statystyki $T$, aby użyć tw. Lehmanna-Sheffe'go:

  Zauważmy, że $"Var"(bold(X)) = (theta(1 - theta))/n = g(theta)$.Zatem możemy przyjąć estymator \ $W := S(X) = 1/(n-1) sum_(i=1)^n X_i$, bo wtedy $EE [W] = g(theta)$.

  Teraz szukamy statystyki dostatecznej i zupełnej $T$:

  + dostateczność:

    Skoro $X_i ~ cal(B)(1, theta)$ to gęstość łączna:

    $
      f(x) & = product_(i=1)^n theta^x (1 - theta)^(1-x) \
           & = theta^(sum_(i=1)^n x_i) (1 - theta)^(sum_(i=1)^n (1-x_i)) \
           & = theta^(sum_(i=1)^n x_i) (1 - theta)^(n - sum_(i=1)^n x_i) \
           & = underbrace((1 - theta)^(n), h(x)) dot underbrace((theta/(1-theta))^(sum_(i=1)^n x_i), g_theta (T(x))) \
    $

    Na mocy twierdzenia "kryterium faktoryzacji", ponieważ udało nam się przedstawić funkcję gęstości za pomocą funkcji $h(x)$ i $g_theta (T(x))$ mamy że $T(x) = sum_(i=1)^oo x_i$ jest statystyką dostateczną.

  + zupełność:

    + sposób 1:

      #box(
        [
          Statystykę $T$ nazywamy zupełną jeśli dla każdej funkcji mierzalnej $g$ warunek $E_theta [g(T)] = 0$ dla każdego $theta in Theta$ implikuje, że $P_theta [g(T) = 0] = 1$ dla każdego $theta in Theta$.
        ],
        inset: 8pt,
        stroke: 1pt,
      )

      $
        EE_theta [g(T)] & = sum_(k=0)^n g(k) dot binom(n, k) theta^k (1 - theta)^(n-k) \
                        & = (1 - theta)^n sum_(k=0)^n g(k) dot binom(n, k) (theta/(1-theta))^k = 0 \
      $

      Są to wielomiany co najwyżej n-tego stopnia, zatem mają co najwyżej n pierwiastków (zasadnicze twierdzenie algebry). A z drugiej strony dla każdej $theta$ musi to zachodzić, zatem ma $oo$ pierwiastków. Aby równanie było zatem spełnione to współczynniki muszą się zerować. $binom(n, k) g(k) = 0$ i $binom(n, k) > 0$ implikuje że $g(k) = 0$. Czyli $P_theta [g(T) = 0] = 1$ dla każdego $theta in Theta$.

    + sposób 2:
      #box(
        [
          Jeśli wektor $X$ ma rozkład z $k$-parametrowej rodziny wykładniczej _pełnego rzędu_, to $T(X) = (T_1 (X), ..., T_k (X))$ jest statystyką zupełną.
        ],
        inset: 8pt,
        stroke: 1pt,
      )

      Przekształćmy łączna gęstość z poprzedniego podpunktu do postaci gęstości rodziny wykładniczej:

      $
        f(x) & = (1 - theta)^(n) dot (theta/(1-theta))^(sum_(i=1)^n x_i) \
        & = dot exp(n ln (1-theta) + sum_(i=1)^n x_i ln (theta/(1-theta))) \
        & = underbrace(1, h(x)) dot exp(underbrace(ln (theta/(1-theta)), eta(theta)) underbrace(sum_(i=1)^n x_i, T(x)) + underbrace(n ln (1-theta), B(theta)))
      $

      Teraz sprawdzamy czy to rodzina wykładnicza _pełnego_ rzędu:

      #box(
        [
          Rodzinę wykładniczą $(1)$ nazywamy rodziną pełnego rzędu, jeśli spełnione są następujące warunki:
          1. Statystyki $T_1 (X), ..., T_s (X)$ są afinicznie niezależne z prawdopodobieństwem 1, tzn. nie istnieją liczby $c_0, c_1, ..., c_s$ takie, że $c_0^2 + c_1^2 + dots.c + c_s^2 > 0$ i $P(c_1 T_1 (X) + ... + c_s T_s (X) = c_0) = 1$
          2. Funkcje $eta_1(theta), ..., eta_s(theta)$ są afinicznie niezależne, to znaczy nie istnieją liczby $b_0, ..., b_s$ takie, że $b_0^2 + dots.c + b_s^2 > 0$ i $b_1 eta_1 (theta) + dots.c + b_s eta_s (theta) = b_0$ dla każdego $theta in Theta$.
          3. Naturalna przestrzeń parametrów $Eta$ zawiera zbiór otwarty w $RR^s$.
        ],
        inset: 8pt,
        stroke: 1pt,
      )

      1. Załóżmy, że istnieją liczby $c_0, c_1$, takie że $c_0^2 + c_1^2 > 0$ i $P(c_1 T_1 (X) = c_0) = 1$.
      - $c_0 = 0, c_1 != 0$. Wtedy $P(c_1 T_1 (X) = 0) = (1-theta)^n < 1$
      - $c_0 != 0, c_1 = 0$. Wtedy $P(0 = c_0) = 0$.
      - $c_0 != 0, c_1 != 0$. Wtedy $P(c_1 T_1 (X) = c_0) = P(T_1 (X) = c_0/c_1) = cases(
          theta^(c_0/c_1) (1-theta)^(n - c_0/c_1) < 1 "dla" c_0/c_1 in ZZ,
          0 "wpp."
        )$
      - $c_0 = 0, c_1 = 0$. Ale wtedy $not (c_0^2 + c_1^2 > 0)$
      Zatem nie istnieją takie liczby

    2. Załóżmy, że istnieją liczby $b_0, b_1$, takie że $b_0^2 + b_1^2 > 0$ i $b_1 ln (theta/(1-theta)) = b_0$ dla każdego $theta in (0, 1)$. Wtedy $eta_1(theta) = ln(theta/(1-theta))$ byłaby stała na $(0,1)$. Ale $eta_1(1/3) = ln(1/2) != 0 = eta_1(1/2)$, sprzeczność. Zatem takich $b_0, b_1$ nie ma.

    3. Naturalna przestrzeń parametrów to zbiór $eta$, dla których $sum_x h(x) exp(eta T(x)) < oo$. Tu $T in {0, 1, dots, n}$, $h = 1$, więc $sum_(k=0)^n exp(eta k) < oo$ dla każdego $eta in RR$. Zatem $Eta = RR$, które zawiera zbiór otwarty ($RR$ sam jest otwarty).

    Wszystkie trzy warunki są spełnione, więc rodzina jest pełnego rzędu, a $T$ jest statystyką zupełną.

  Zatem teraz aby znaleźć UMVUE używamy twierdzenia Lehmanna-Sheffe'go, który mówi, że estymator $EE[W | T]$ jest jedynym UMVUE:

  $
    EE[W | T]
    = EE [1/(n-1) sum_(i=1)^n X_i | sum_(i=1)^n X_i = t]
    = 1/(n-1) sum_(i=1)^n X_i
  $

  Zatem okazuje się że estymator UMVU jest właśnie tym, który pierwotnie wzięliśmy jako jakiś nieobciążony.

+ Niech $bold(X) = (X_1, dots, X_n)$ będzie próbą z rozkładu Poissona $cal(P)(theta.alt)$, $theta.alt > 0$.
  + Wyznaczyć postać testu JNM (jednostajnie najmocniejszego), na poziomie istotności $alpha$, do weryfikacji hipotezy $H_0 : theta.alt <= theta.alt_0$ przy hipotezie alternatywnej $H_1 : theta.alt > theta.alt_0$. (Nie trzeba wyznaczać występujących w teście stałych, tylko należy podać warunki, z których te stałe można byłoby wyznaczyć, korzystając z tablic statystycznych, czy pakietu statystycznego.)
  + Jaka będzie postać testu IW (ilorazu wiarygodności) do weryfikacji hipotez z punktu (a) w tym modelu?

  Rozwiązanie:

  + $f_lambda (x) = (lambda^x e^(- lambda))/x!$
    $
      f_lambda (bold(x)) & = product_(i=1)^n (lambda^x e^(- lambda))/x! \
                         & = product_(i=1)^n 1/x! e^(ln lambda x - lambda) \
                         & = product_(i=1)^n 1/x! e^(ln lambda x - lambda) \
                         & = 1/(product_(i=1)^n x_i!) e^(ln lambda sum_(i=1)^n x - n lambda)
    $

    Zatem skoro $eta(theta)$ jest niemalejąca to rodzina rozkładów Poissona ma MLR względem $T(X) = sum_(i=1)^n X_i$

    // $theta_2 > theta_1 => (f_(theta_2) (x)) / (f_(theta_1) (x)) = ((theta_2)/(theta_1))^x e^(theta_1 - theta_2)$. Ponieważ $theta_2/theta_1 > 1$ to iloraz gęstości jest niemalejącą funkcją $T(x) = x$. Inaczej możemy rozpisać $f_lambda (x) = 1/x! exp ((ln lambda) x - lambda)$. Ponieważ $ln lambda$ jest niemalejąca funkcją $lambda$. Z tych powodów rodzina rozkładów Poissona ma MLR względem $T(X)$.

    Zatem z twierdzenia Karlina-Rubina dla każdego $alpha in (0,1)$ istnieje test $phi$ UMP rozmiaru $alpha$ mający postać:

    $
      phi (bold(x)) = cases(
        1", gdy" T(bold(x)) > c,
        gamma", gdy" T(bold(x)) = c,
        0", gdy" T(bold(x)) < c
      )
    $

    Wystarczy teraz wyznaczyć $c > 0$ i $gamma in (0, 1)$ z $beta_phi (theta) = alpha$:

    $
      beta_phi (theta_0)
      = EE_(theta_0) [phi(X)] & = P_(theta_0) (T(bold(x)) > c) + gamma P_(theta_0) (T(bold(x)) = c) \
                              & = 1 - P_(theta_0) (T(bold(x)) <= c) + gamma P_(theta_0) (T(bold(x)) = c) \
                              & = 1 - e^(- n theta_0) [sum_(k=0)^floor(c) (n theta_0)^k / k! - gamma (n theta_0)^c / c!]
    $

    Ten warunek pozwala nam na sprawdzenie jakie musi być $c$ i $gamma$

  + Policzmy ile wynosi funkcja wiarygodności:

    $
      l(theta)
      = product_(i=1)^n (theta^(x_i) e^(-theta))/(x_i !)
      = (e^(-n theta) dot theta^(sum_(i=1)^n x_i)) / (product_(i=1)^n (x_i !))
    $

    $
      L(theta) = - n theta + sum_(i=1)^n x_i ln theta - sum_(i=1)^n ln (x_i !)
    $

    $
      L'(theta) = -n + 1/theta sum x_i = 0 <=> theta = overline(x)
    $

    Test ilorazu wiarygodności (LR) odrzuca $H_0$ wtedy i tylko wtedy, gdy $lambda(x) < c, space c in (0,1)$, gdzie:

    $
      lambda(bold(x)) = (sup_(theta in Theta_0) l(theta))/(sup_(theta in Theta) l(theta))
      = cases(
        1"," & "gdy" overline(x) <= theta_0,
        l(theta_0) / l(overline(x))"," & "gdy" overline(x) > theta_0
      )
      = cases(
        1"," & "gdy" overline(x) <= theta_0,
        e^(-n (theta_0 - overline(x))) (theta_0/overline(x))^(sum_(i=1)^n x_i)"," & "gdy" overline(x) > theta_0
      )
    $

    Ponieważ $c in (0,1)$ to odrzucamy $H_0$ tylko jak $overline(x) > theta_0$ i oczywiście $lambda(bold(x)) < c$. Jak duże $sum_(i=1)^n x_i$ to duże $overline(x)$, wtedy dane wskazują na $theta > theta_0$ więc LR ma postać:

    $
      phi(bold(x)) = cases(
        1"," "gdy" sum_(i=1)^n x_i > k,
        gamma"," "gdy" sum_(i=1)^n x_i = k,
        0"," "gdy" sum_(i=1)^n x_i < k,
      )
    $

    Czyli taka sama postać jak w (a).


+ Niech $bold(X) = (X_1, dots, X_n)$ będzie próbą z rozkładu normalnego $cal(N)(0, theta.alt^2)$.
  + Wyznaczyć postać testu JNMN (jednostajnie najmocniejszego w klasie testów nieobciążonych), na poziomie istotności $alpha$, do weryfikacji hipotezy $H_0 : theta.alt = theta.alt_0$ przy hipotezie alternatywnej $H_1 : theta.alt != theta.alt_0$. (Nie trzeba wyznaczać występujących w teście stałych, tylko należy podać warunki, z których te stałe można byłoby wyznaczyć, korzystając z tablic statystycznych, czy pakietu statystycznego.)
  + Naszkicować wykres funkcji mocy testu z punktu (a).

  Rozwiązanie:

  + Najpierw wyznaczmy $T(X)$:

    $
      f(bold(x)) = product_(i=1)^n 1/(sqrt(2 pi) theta) exp(-(x_i^2)/(2 theta^2)) = 1/(sqrt(2 pi) theta)^n exp(-1/(2 theta^2) underbrace((sum_(i=1)^n x_i^2), T(x)))
    $

    $
      phi^*(x) = cases(1\, "gdy" T(x) < c_1 "lub" T(x) > c_2, gamma_i \, "gdy" T(x)=c_1\, i=1\,2, 0\, "gdy" c_1 < T(x) < c_2)
    $

    Teraz wyznaczamy z $beta_(phi^*) (theta_0) = alpha$ (rozmiar) i $E_(theta_0) [T(X) phi^* (X)] = alpha E_(theta_0) [T(X)]$ (nieobciążoność):

  + Funkcja mocy to: $ beta_(phi^*)(theta) & = EE [phi^star (bold(X))] \
    & = PP_theta (T(X) < c_1 or T(X) > c_2) quad "(rozkład ciągły)" \
    & = 1 - PP_theta (c_1 < T(X) < c_2) \
    & = 1 - PP_theta (c_1 < sum_(i=1)^n X_i^2 < c_2) \
    & = 1 - PP (c_1 < theta^2 chi^2_n < c_2) "(bo" X_i ~ N(0, theta^2), 1/theta X_i ~ N(0, 1), 1/theta^2 X_i^2 ~ chi^2_1, 1/theta^2 sum_(i=1)^n X_i^2 ~ chi^2_n) \
    & = 1 - PP (c_1 / theta^2 < chi^2_n < c_2 / theta^2) $

    Granice:

    - $theta -> 0$: $c_1/theta^2 -> oo$, $c_2/theta^2 -> oo$, przedział $(c_1/theta^2, c_2/theta^2)$ ucieka w prawo od $chi^2_n$, więc $PP (c_1/theta^2 < chi^2_n < c_2/theta^2) -> 0$, zatem $beta_(phi^*)(theta) -> 1$.

    - $theta -> oo$: $c_1/theta^2 -> 0$, $c_2/theta^2 -> 0$, przedział $(c_1/theta^2, c_2/theta^2)$ ucieka w lewo od $chi^2_n$, więc $PP (c_1/theta^2 < chi^2_n < c_2/theta^2) -> 0$, zatem $beta_(phi^*)(theta) -> 1$.

    - $theta = theta_0$: $beta_(phi^*)(theta_0) = alpha$ (z definicji rozmiaru testu).

    Funkcja mocy ma kształt litery U z minimum w punkcie $(theta_0, alpha)$, rośnie do $1$ w obie strony. Dlatego test jest nieobciążony — $beta_(phi^*)(theta) >= alpha$ dla każdego $theta$.

    #figure(image("6b.png"), caption: "Wykres funkcji mocy")




#pagebreak()
== Rozkłady (Tablice pomocnicze)

#table(
  columns: (1fr, 3.5fr),
  align: (center + horizon, left + horizon),
  stroke: 0.5pt,
  [*Nazwa rozkładu*], [*Własności*],

  [Bernoulliego \ $cal(B)(1, p)$],
  [$P(X=1) = p, quad P(X=0) = 1-p$ \ $bb(E)[X] = p$ \ $text("Var")[X] = p(1-p)$ \ $psi(t) = (1-p) + p exp(t)$ \ parametr $0 < p < 1$],

  [Jednostajny \ $cal(U)(a, b)$],
  [$f(x; a, b) = 1/(b-a) bb(1)_([a, b])(x)$ \ $psi(t) = (exp(b t) - exp(a t)) / ((b-a)t)$ \ $bb(E)[X] = (a+b)/2$ \ $text("Var")[X] = (b-a)^2/12$ \ parametry: $a, b in RR, quad a < b$],

  [Logarytmiczno- \ normalny \ $cal(L)cal(N)(mu, sigma^2)$],
  [$f(x; mu, sigma^2) = 1/(sqrt(2pi) sigma x) exp(- (ln x - mu)^2 / (2 sigma^2)) bb(1)_((0, oo))(x)$ \ $psi(t)$ nie istnieje \ $bb(E)[X] = exp(mu + sigma^2/2)$ \ $text("Var")[X] = exp(2mu + sigma^2) (exp(sigma^2) - 1)$ \ parametry: $mu in RR, quad sigma > 0$],

  [Pareto \ $text("Pa")(x_0, alpha)$],
  [$f(x; x_0, alpha) = alpha/x_0 (x_0/x)^(alpha+1) bb(1)_([x_0, oo))(x)$ \ $psi(t)$ nie istnieje postać jawna \ $bb(E)[X] = (alpha x_0)/(alpha - 1), quad alpha > 1$ \ $text("Var")[X] = (alpha x_0^2) / ((alpha - 1)^2 (alpha - 2)), quad alpha > 2$ \ parametry: $x_0 > 0, quad alpha > 0$],

  [Normalny \ $cal(N)(mu, sigma^2)$],
  [$f(x) = 1/(sqrt(2pi) sigma) exp(- (x - mu)^2 / (2 sigma^2)), quad x in RR$ \ $psi(t) = exp(mu t + 1/2 sigma^2 t^2)$ \ $bb(E)[X] = mu$ \ $text("Var")[X] = sigma^2$ \ parametry: $mu in RR, quad sigma > 0$],

  [Wykładniczy \ $cal(E)(lambda)$ \ $cal(G)(1, lambda)$ \ $cal(W)e(1, lambda)$],
  [$f(x; lambda) = lambda exp(-lambda x) bb(1)_([0, oo))(x)$ \ $psi(t) = lambda / (lambda - t), quad t < lambda$ \ $bb(E)[X] = 1/lambda$ \ $text("Var")[X] = 1/lambda^2$ \ parametr: $lambda > 0$],
)

