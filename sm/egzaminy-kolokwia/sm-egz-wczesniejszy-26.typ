#set page(paper: "a4", margin: (x: 2cm, y: 2.5cm))
#set text(font: "New Computer Modern", size: 11pt, lang: "pl")
#set par(justify: true, leading: 0.65em)

#align(center)[
  #text(size: 16pt, weight: "bold")[Statystyka Matematyczna --
    wcześniejszy termin]
]

#let argmax = $limits("argmax ")$

#v(1em)

#show enum: it => {
  set enum(numbering: "a)")
  it
}
#set enum(numbering: "1.")

+
  + Opisać metodę momentów wyznaczania estymatorów nieznanego parametru.
  + Niech $X = (X_1, ..., X_n)$ będzie próbą z rozkładu normalnego $N(1, theta^2)$, $theta > 0$. Korzystając z metody momentów, wyznaczyć estymator parametru $theta$.

  Rozwiązanie:
  + Przyrównejmy kolejne momenty empiryczne do momentów teoretycznych. Dla k-parametrowego estymatora $theta = (theta_1, ..., theta_k)$:
    $
      cases(
        hat(m)_1 = m_1,
        ...,
        hat(m)_k = m_k,
      )
    $

    gdzie $m_i = EE X^i$ i $hat(m)_i = 1/n sum_(k=1)^n X_k^i$.

  + $
      cases(
        1 = 1/n sum_(i=1)^n X_i,
        1^2 + theta^2 = 1/n sum_(i=1)^n X_i^2,
      ) =>
      hat(theta)^2 = 1/n (sum_(i=1)^n X_i^2) - 1
    $

+
  + Podać definicję estymatora NW (największej wiarygodności).
  + Niech $X = (X_1, ..., X_n)$ będzie próbą z rozkładu o gęstości $f(x; theta) = 1 / (2theta) exp(-(|x|)/ theta)$, $x in RR$. Wyznaczyć estymator największej wiarygodności parametru $theta$.

  Rozwiązanie:

  + Niech $X_1, ..., X_n "iid" f(x; theta)$. Estymator największej wiarygodności $hat(theta)$ to:

    $
      hat(theta) = argmax_(theta in Theta) l(theta)
    $

    gdzie $l(theta) = product_(i=1)^n f(x_i; theta)$.

  + $l(theta)
    = ln(product_(i=1)^n 1/(2 theta) exp(- abs(x)/theta))
    = ln(1/(2 theta)^n exp(- sum abs(x)/theta))
    = - n ln (2 theta) - 1/theta sum abs(x)$

    $
      l'(theta) = -n/theta + 1/theta^2 sum abs(x) = 0 <=> 1/n sum abs(x) = hat(theta)
    $

    Zatem estymator MLE dla tego rozkładu to średnia arytmetyczna z wartości absolutnych próby.


+
  + Podać definicję przedziału ufności dla parametru $theta$ na poziomie ufności $1 - alpha$.
  + Niech $X = (X_1, ..., X_n)$ będzie próbą z rozkładu normalnego $N(theta, 1)$. Wyznaczyć przedział ufności dla parametru $theta$ na poziomie ufności $1 - alpha$.

  Rozwiązanie:

  + Przedział ufności dla parametru $theta$ na poziomie ufności $1-alpha$ to przedział $[L(X); U(X)]$, taki że:

    $
      PP (L(X) < theta < U(X)) > 1 - alpha
    $

    gdzie $L(X)$ i $U(X)$ to zmienne losowe.

  + Możemy przyjąć funkcję centralną $Q(x; theta) = 1/sqrt(n) (sum_(i=1)^n x_i) - sqrt(n) theta$. Wtedy $Q ~ cal(N)(0, 1)$.

    $
      PP (z_(alpha/2) <= Q <= z_(1-alpha/2))
      &= PP (z_(alpha/2) - 1/sqrt(n) sum_(i=1)^n X_i <= - sqrt(n) theta <= z_(1-alpha/2) - 1/sqrt(n) sum_(i=1)^n X_i) \
      &= PP (- z_(1 - alpha/2) / sqrt(n) + 1/n sum_(i=1)^n X_i <= theta <= - z_(alpha/2) / sqrt(n) + 1/n sum_(i=1)^n X_i)
    $

    Zatem szukany przedział ufności to

    $
      [
        - z_(1 - alpha/2) / sqrt(n) + 1/n sum_(i=1)^n X_i;
        - z_(alpha/2) / sqrt(n) + 1/n sum_(i=1)^n X_i
      ]
    $

    gdzie $z_(1 - alpha/2)$ i $z_(alpha/2)$ to kolejno $1-alpha/2$-ty i $alpha/2$-ty kwantyl rozkładu standardowego normalnego $cal(N)(0,1)$.




+
  + Sformułować kryterium faktoryzacji.
  + Korzystając z kryterium faktoryzacji, wyznaczyć nietrywialną statystykę dostateczną dla parametru $sigma > 0$, gdy $X = (X_1, ..., X_n)$ jest próbą z rozkładu o gęstości $f(x; sigma) = x / sigma^2 e^(-x^2 / (2sigma^2)) I_((0, oo))(x)$.

  Rozwiązanie:

  + Przypuśćmy, że rodzina rozkładów $cal(P) = {P_theta : theta in Theta}$ jest dominowana prze pewną $sigma$-skończoną miarę $mu$. Warunkiem koniecznym i wystarczającym do tego, by $T(x)$ była statystyką dostateczną dla $cal(P)$ jest istnienie *nieujemnych* funkcji $g_theta$ i $h$, takich że gęstości rozkładu wektora $X$ względem $mu$ mają postać:
    $
      f(x;theta) = h(x) dot g_theta (T(x)) dash.en mu "p.n."
    $

  + $
      f(bold(x);sigma) & = product_(i=1)^n x_i exp (- 1/(2 sigma^2) dot x_i^2 - 2 ln sigma) dot bb(1)_(0, oo) (x_i) \
      & = product_(i=1)^n x_i dot exp(- 1/(2 sigma^2) sum_(i=1)^n x_i^2 - 2n ln sigma) dot bb(1)_(0, oo) (x_((1)))
    $

    Zatem nietrywialna statystyka dostateczna: $T(X) = sum_(i=1)^n X_i^2$



+
  + Podać definicję $p$-wartości.
  + Wyznaczyć test jednostajnie najmocniejszy rozmiaru $alpha$ do weryfikacji hipotezy
    $H_0: theta <= theta_0, quad H_1: theta > theta_0,$
    na podstawie próby $X = (X_1, ..., X_n)$ z rozkładu normalnego $N(theta, 1)$. Załóżmy, że wartość statystyki $overline(X)$ obliczona na podstawie próby rozmiaru 9 wynosi $0.5$. Wyznaczyć $p$-wartość, gdy $theta_0 = 0$.

  Rozwiązanie:

  + Weryfikujemy $H_0 : theta in Theta_0$ i $H_1 : theta in Theta_1$. Niech $B_alpha$ - zbiór krytyczny testu rozmiaru $alpha$. Wówczas dla realizacji $bold(x)$ p-value to $tilde(alpha)(bold(x)) = inf {alpha : bold(x) in B_alpha}$.

  + Sprawdzamy założenia twierdzenia Karlina-Rubina.
  $
    f(x;theta) & = 1/sqrt(2pi) exp(-(x-theta)^2 / 2) \
               & = 1/sqrt(2pi) exp(-x^2 / 2) exp(theta x - theta^2 / 2) \
  $

  Zatem statystyka $S(X) = X$. Zatem $T(X) = sum_(i=1)^n x_i$. $eta(theta) = theta$ - funkcja niemalejąca $theta in Theta$. Zatem podana rodzina rozkładów ma MLR względem $T(X)$. Zatem test to:

  $
    phi(X) = cases(
      1"," T(X) > c,
      gamma"," T(X) = c,
      0"," T(X) < c,
    )
  $

  Rozkład $T(X) = sum X_i ~ N(n theta, n)$. Zatem

  $
    P_theta (T(X) > c) & = 1 - P_theta (T(X) < c) \
                       & = 1 - P_theta (sum X_i < c) \
                       & = 1 - P_theta (1/sqrt(n) sum (X_i - theta) < 1/sqrt(n) (c - n theta)) \
                       & = 1 - Phi (c/sqrt(n) - sqrt(n) theta) \
  $

  Zatem $alpha = sup_(theta <= theta_0) 1 - Phi(c/sqrt(n) - sqrt(n) theta) = 1 - Phi(c/sqrt(n) - sqrt(n) theta_0) ==> c = sqrt(n) dot Phi^(-1) (1 - alpha) + n theta_0$

  P-value:
  $
    T(X) = c & <=> sum_(i=1)^n X_i = 3 dot Phi^(-1) (1 - alpha) \
             & <=> n overline(X) = 3 dot Phi^(-1) (1 - alpha) \
             & <=> Phi((n overline(X)) / 3) = (1 - alpha) \
             & <=> alpha = 1 - Phi((n overline(X)) / 3) \
             & <=> alpha = 1 - Phi(1.5)
  $

  Zatem $tilde(p) = tilde(alpha)(bold(x)) = 1 - Phi(1.5)$

  P-value inaczej:

  $
    tilde(p) & = sup_(theta in Theta_0) PP_theta (T(X) >= T(x)) \
    & = sup_(theta in Theta_0) PP_theta (sum X_i >= n overline(x))\
    & = sup_(theta in Theta_0) PP_theta (1/sqrt(n) dot (- n theta + sum X_i) >= 1/sqrt(n) (n overline(x) - n theta))\
    & = sup_(theta in Theta_0) 1 - Phi(sqrt(n) (overline(x) - theta)) \
    & = 1 - Phi(sqrt(n) (overline(x) - theta_0)) = 1 - Phi(1.5)
  $

+
  + Sformułować twierdzenie o postaci testów jednostajnie najmocniejszych nieobciążonych (JNMN) do weryfikacji hipotezy
    $H_0: theta = theta_0, quad H_1: theta != theta_0,$
    na podstawie próby $X = (X_1, ..., X_n)$ z rozkładu należącego do jednoparametrowej rodziny wykładniczej z nieznanym rzeczywistym parametrem $theta$.
  + Korzystając z twierdzenia z punktu (a), wyznaczyć postać testu JNMN do weryfikacji hipotezy
    $H_0: theta = 1, quad H_1: theta != 1,$
    na podstawie próby $X = (X_1, ..., X_n)$ z rozkładu wykładniczego o gęstości $f(x; theta) = 1/theta e^(-x/theta) I_((0, oo))(x)$, $theta > 0$.

  Rozwiązanie:

  + Dla jednoparametrowych rodzin wykładniczych istnieją mocniejsze testy nieobciązone rozmiaru $alpha$ UMPU, czyli testy jednostajnie najmocniejsze wśród testów nieobciążonych:

    - $H_0 : theta_1 <= theta <= theta_2$ vs $H_1: theta < theta_1$ lub $theta > theta_2$. Wtedy:

      $
        phi^* (X) = cases(
          1", gdy" T(x) < c_1 "lub" T(x) > c_2,
          gamma_i", gdy" T(x) = c_i"," i = 1","2,
          0", gdy" c_1 < T(x) < c_2,
        )
      $

    - $H_0: theta = theta_0$ vs $theta != theta_0$. Wtedy:

      $
        phi^* (X) = cases(
          1", gdy" T(x) < c_1 "lub" T(x) > c_2,
          gamma_i", gdy" T(x) = c_i"," i = 1","2,
          0", gdy" c_1 < T(x) < c_2,
        )
      $

  + $f(x;theta) = bb(1)_((0, oo)) exp (-1/theta x - ln theta)$

    Dla $eta(theta) = -1/theta$ - niemalejąca. Rozkład ma MLR względem $T(X) = sum_(i=1)^n X_i ~ Gamma(n, 1)$.

    $
      phi^* (X) = cases(
        1", gdy" T(x) < c_1 "lub" T(x) > c_2,
        gamma_i", gdy" T(x) = c_i"," i = 1","2,
        0", gdy" c_1 < T(x) < c_2,
      )
    $

    Wyliczamy $gamma_1, gamma_2, c_1, c_2$ z poniższych warunków:

    $beta_phi^* (theta_0) = alpha$ i $EE[T(X) phi^* (X)] = alpha EE[T(X)]$.

    Gammy mogą być dowolne $gamma_i in [0,1]$ bo mamy rozkład absolutnie ciągły. Ustalmy $gamma_1, gamma_2 = 1$.

+ Podać definicję testu opartego na ilorazie wiarygodności.

Nie będzie.

+ Sformułować twierdzenie Gliwienki-Cantelliego.

$
  sup_(t in RR) abs(hat(F)_n (t) - F(t)) -->^"p.n." 0
$

gdzie $hat(F)_n (t)$ to dystrybuanta empiryczna
