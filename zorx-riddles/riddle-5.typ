$
  a, b, c in CC
$

$
  cases(
    a & + b & + c & = 2,
    a^2 & + b^2 & + c^2 & = 1,
    a^3 & + b^3 & + c^3 & = 2,
    a^4 & + b^4 & + c^4 & = ?/6,
  )
$

KURWA

Let's notice:

$
  (x + y + z)^2 = x^2 + y^2 + z^2 + 2 x y + 2 x z + 2 y z
$

$
  (x + y + z)^3 = x^3 + y^3 + z^3 + 3 x^2 y + 3 x^2 z + 3 x y^2 + 3 y^2 z + 3 x z^2 + 3 y z^2 + 6 x y z
$

$
  (x + y + z)^4 = ...
$

Thus when we substitute with a, b, c and use above equations:

$
  3 = 2 a b + 2 a c + 2 b c
$

$
  6 = 3 a^2 b + 3 a^2 c + 3 a b^2 + 3 b^2 c + 3 a c^2 + 3 b c^2 + 6 a b c
$


We can also get from first eq:

$
  a = 2 - b - c
$

$
  a^2 = (4 + b^2 + c^2 - 4b - 4c + 2 b c)
$

And substitue in the first two ones:

$
  3 & = 2 (2 - b - c) b \
    & + 2 (2 - b - c) c \
    & + 2 b c
      = 4b - 2 b^2 + 4c - 2 c^2 - 2 b c
$

$
  6 & = 3 (4 + b^2 + c^2 - 4b - 4c + 2 b c) b \
    & + 3 (4 + b^2 + c^2 - 4b - 4c + 2 b c) c \
    & + 3 (2 - b - c) b^2 \
    & + 3 b^2 c \
    & + 3 (2 - b - c) c^2 \
    & + 3 b c^2 \
    & + 6 (2 - b - c) b c \
    & = 12 b + 3 b^3 + 3 b c^2 - 12 b^2 - 12 b c + 6 b^2 c \
    & + 12 c + 3 b^2 c + 3 c^3 - 12 b c - 12 c^2 + 6 b c^2 \
    & + 6 b^2 - 3 b^3 - 3 b^2 c \
    & + 3 b^2 c \
    & + 6 c^2 - 3 b c^2 - 3 c^3 \
    & + 3 b c^2 \
    & + 12 b c - 6 b^2 c - 6 b c^2 \
    & = 12 b - 6 b^2 + 12 c - 6 c^2 - 12 b c + 3 b^2 c + 3 b c^2
$

Multiplying the first by -3 we can then substitue the second:

$
  1 = 2 b c - b^2 c - b c^2
$



