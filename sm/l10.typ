#import "../lib.typ": *

statystyka matematyczna | lista 10 - Testy jednostajnie najmocniejsze.

#show heading.where(level: 2): it => {
  pagebreak()
  it
}

#outline()

#set enum(numbering: "(a)")

= Lista 10

== Zadanie 1
Niech $bold(X) = (X_1, ..., X_n)$ będzie próbą losową z rozkładu normalnego $cal(N)(mu, 1)$.

(a) Wyznaczyć statystykę testu najmocniejszego do testowania hipotezy $H_0 : mu = 0$ przeciwko $H_1 : mu = mu_1 > 0$.

(b) Wyznaczyć funkcję mocy dla ustalonego poziomu istotności $alpha in (0, 1/2)$.

== Zadanie 2
Niech $X$ ma rozkład $cal(U)(0, theta)$, $theta > 0$. Skonstruować test najmocniejszy na poziomie istotności $alpha$ do weryfikowania hipotezy $H_0 : theta = theta_0$ przeciwko $H_1 : theta = theta_1$, gdy $0 < theta_0 < theta_1$ są ustalonymi liczbami.

== Zadanie 3
Niech $X$ ma rozkład należący do rodziny $P = {cal(B)(10, 1/2), cal(P)(1)}$. Wykorzystać tablice rozkładu dwumianowego i rozkładu Poissona do skonstruowania testu najmocniejszego na poziomie istotności $alpha = 0.1$ do weryfikowania hipotezy

$H_0 : X = cal(B)(10, 1/2)$ przeciwko $H_1 : X = cal(P)(1)$.

== Zadanie 4
Niech $X$ ma rozkład należący do rodziny $P = {cal(U)(0, 1)} union {cal(E)(lambda), lambda > 0}$. Skonstruować test najmocniejszy na poziomie istotności $alpha = 0.1$ do weryfikowania hipotezy

$H_0 : X = cal(U)(0, 1)$ przeciwko $H_1 : X = cal(E)(lambda), lambda > 0$.

Wyznaczyć funkcję mocy tego testu.

== Zadanie 5
Niech $bold(X) = (X_1, ..., X_n)$ będzie próbą losową z rozkładu normalnego $cal(N)(0, sigma^2)$.

(a) Wyznaczyć statystykę testu najmocniejszego do testowania hipotezy $H_0 : sigma = 1$ przeciwko $H_1 : sigma = sigma_1 > 1$.

(b) Wyznaczyć funkcję mocy dla ustalonego $alpha in (0, 1)$. Dla $alpha = 0.05$ oraz $sigma_1 in {sqrt(2), 2}$ obliczyć moc w zależności od liczebności próby $n$.

== Zadanie 6
Niech $bold(X) = (X_1, ..., X_n)$ będzie próbą losową z rozkładu:

(a) gamma $cal(G)(theta, 1)$, $theta > 0$;

(b) Pareto o gęstości

$ p_theta(x) = theta / x^2 1_(theta,oo)(x), quad theta > 0.$

• Wyznaczyć statystykę testu najmocniejszego do testowania hipotezy $H_0 : theta = 1$ przeciwko $H_1 : theta = theta_1 > 1$.
• Korzystając z rozkładu granicznego statystyki testowej znaleźć asymptotyczną wartość krytyczną i obliczyć ją dla $alpha = 0.05$.
• Wyznaczyć takie $n$, dla których dokładna wartość krytyczna różni się o mniej niż $0.1$ od wartości asymptotycznej.
• Dla punktu (b) wyznaczyć funkcję mocy testu.

== Zadanie 7
Niech $bold(X) = (X_1, ..., X_n)$ będzie próbą losową z rozkładu:

(a) normalnego $cal(N)(0, theta^2)$, $theta > 0$;

(b) beta "Be"$(theta, 1)$, $theta > 0$.

Uzasadnić monotoniczność ilorazu wiarygodności względem odpowiedniej statystyki i skonstruować test jednostajnie najmocniejszy (w skrócie: JNM) do weryfikowania hipotezy $H_0 : theta <= theta_0$ przeciwko $H_1 : theta > theta_0$. Wyznaczyć wartości krytyczne testów dla poziomu istotności $alpha$.

== Zadanie 8
Niech $X$ będzie zmienną losową o rozkładzie, którego gęstość należy do rodziny $P = {f_theta : theta in Theta}$, $Theta ⊂ R$. Pokazać, że rodzina $P$ ma monotoniczny iloraz wiarygodności względem $X$, gdy:

(a) $Theta = R$, a $f_theta$ jest gęstością rozkładu Laplace’a "La"$(theta, sigma)$ z parametrem położenia $theta$ i znanym parametrem skali $sigma$;

(b) $Theta = R$, a $f_theta$ jest gęstością rozkładu wykładniczego "E"$(theta, sigma)$ o gęstości

$ f(x; theta, sigma) = 1/sigma e^(-(x-theta)/sigma) 1_(theta,oo)(x), quad sigma > 0;$

(c) $Theta = R$, a $f_theta$ jest gęstością rozkładu logistycznego "LG"$(theta, sigma)$ z parametrem położenia $theta$ i znanym parametrem skali $sigma$;

(d) $Theta = R$, a $f_theta$ jest gęstością rozkładu jednostajnego "U"$(theta, theta + 1)$;

(e) $Theta = {1, 2, ..., N}$, a

$ f_theta(x) = (binom(theta, x) binom(N - theta, r - x)) / binom(N, r),$

gdzie $max(r - theta, 0) <= x <= min(r, theta)$, a $r, N$ są znanymi liczbami naturalnymi (X ma rozkład hipergeometryczny).
