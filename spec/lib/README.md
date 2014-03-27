Art generator:
  Ask for a seed number.

  seed ruby's random number generator with that seed, so that the calls to rand will return repateable output. Do this using ruby's srand method, eg:
  srand(1234)
  # => 166909833619981683467983736715385191519
  rand(10)
  # => 3
  rand(10)
  # => 6

  Output a 10x10 image. Edges must be shown with -, /, \ and |, and the insides a random mix of O o : , .
  Also show the seed used to generate it.

  Example output (well, if you copy into sublime - it's a bit mangled in email):
    Generated using seed 557923
    /----------\
    |.oO:O.o.,.|
    |.o ..OO.oO|
    | .,..,Oo.o|
    |.:.O,,:. .|
    |.o...oo o:|
    |..., ...:.|
    | O..o.OO.O|
    |. ::,.o..o|
    |o..Oo., ,.|
    |o:. ..O:, |
    \----------/
