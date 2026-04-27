#import "../lib.typ": *
#show: styling

#let dx = $"d"x$
#let dy = $"d"y$
#let dz = $"d"z$
#let dt = $"d"t$
#let du = $"d"u$

#let margin-note(body) = {
  place(
    left,
    dx: -25%,  // Adjusted to keep the note within the page boundary
    block(
      width: 20%,  // Reduced width to fit within the margin space
      align(
        right,
        text(
          size: 0.8em,
          body
        )
      )
    )
  )
}

MIKOŁAJ KAPICA 272729 | Równania różniczkowe zwyczajne | zadanie dodatkowe 7

Problem

Znaleźć rozwiązanie równania zwyczajnego drugiego rzędu z warunkami początkowymi

$
  cases(
    (1-x) x'' + 2 (x')^2 = 0,
    x(0) = 2,
    x'(0) = -1
  ).
$

// Podać wartość $x(3)$:
// Podaj lewy kraniec dziedziny rozwiązania:

$
  (1-x) x'' + 2 (x')^2 = 0
  <=>^(forall x != 1) x'' = - (2 (x')^2)/(1-x)
$

Niech $u(x) = x'$:

$
  x'' = u' u = - (2 u^2)/(1-x) ==>^(u!=0) u'/u = 2/(x-1) mid(|) integral \
  ln|u| = 2 ln|x-1| + tilde(C) => u = (x-1)^2 dot C \

  cases(
    x' =  C (x - 1)^2,
    x'(0) = -1
  ) quad ==> quad -1 = C (2-1)^2 quad ==> quad C = -1 \

  x' = - (x-1)^2 \
  dx/dt = -(x-1)^2 \
  -dx/(x-1)^2 = dt mid(|) integral \
  1/(x-1) + C = t \
  forall_(t != C) quad 1/(t - C) = x-1 \
  x = 1/(t - C) + 1 \

  cases(
    x = 1/(t - C) + 1,
    x(0) = 2
  ) quad ==> 2 = 1/(-C) + 1 quad ==> 1 = 1/(-C) quad ==> C = -1 \

  x = 1/(t+1) + 1 \


$

Sprawdzenie:

$
  x = 1/(t+1) + 1 quad x' = -1/(t+1)^2 quad x'' = 2/(t+1)^3 \
$

$
  (1-x) x'' + 2 (x')^2 = 0 quad &<==> quad (1-(1/(t+1) + 1)) dot 2/(t+1)^3  + 2 (-1/(t+1)^2)^2 = 0 \
  &<==> quad (-2)/(t+1)^4 + 2/(t+1)^4 = 0
$

#pagebreak()

Dziedzina:

$
  cases(
    t != -1,
    0 in D_x,
    D_x "to przedział (dla unikatowości)"
  ) quad ==> t > -1 quad ==> D_x = (-1, +oo)
$


Odpowiedzi:

$
  cases(
    x(3) = 1/4 + 1 = 5/4 = 1.25,
    "Lewy kraniec to " -1
  )
$
