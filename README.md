# Bowling
From http://www.decharlas.uji.es/es/programacion-funcional-introduccion-haskell - A. Marzal

Kata Bowling, by A. Marzal.

Por qué deberías aprender programación funcional ya mismo (con una breve introducción a Haskell) - A. Marzal
(07/05/2015)

http://www.decharlas.uji.es/es/programacion-funcional-introduccion-haskell

https://youtu.be/YU2i3L-euB0  - El Vídeo de YouTube.

https://dl.dropboxusercontent.com/u/18532990/Haskell.pdf - El PDF con los apuntes de A. Marzal.

## Problem Description
* 1 Match = 10 frames.
* Each frame, 2 draws.
	* Open frame:  < 10 pins
	* Spare:  10 pins
	* Strike:  10 pins in 1 draw
* Score of each frame:
	* Open:  # thrown pins
	* Spare:  10 + bonus (next) pins
	* Strike:  10 + bonus (two next) pins

```
 Frame   Pins   Kind   Bonus  Frame                    Score           Total
 1       1, 4   Open          (Open   1  4)      1 +  4 =  5    0 +  5 =   5
 2       4, 5   Open          (Open   4  5)      4 +  5 =  9    5 +  9 =  14
 3       6, 4   Spare      5  (Spare  6  5)  6 + 4 +  5 = 15   14 + 15 =  29
 4       5, 5   Spare     10  (Spare  5 10)  5 + 5 + 10 = 20   29 + 20 =  49
 5         10   Strike  0, 1  (Strike 0  1) 10 + 0 +  1 = 11   49 + 11 =  60
 6       0, 1   Open          (Open   0  1)      0 +  1 =  1   60 +  1 =  61
 7       7, 3   Spare      6  (Spare  7  6)  7 + 3 +  6 = 16   61 + 16 =  77
 8       6, 4   Spare     10  (Spare  6 10)  6 + 4 + 10 = 20   77 + 20 =  97
 9         10   Strike  2, 8  (Strike 2  8) 10 + 2 +  8 = 20   97 + 20 = 117
 10      2, 8   Spare      6  (Spare  2  6)  2 + 8 +  6 = 16  117 + 16 = 133
```

## Clone and run tests


    git clone https://github.com/naldoco/Bowling
    cd Bowling
    cabal update
    cabal sandbox init
    cabal install tasty tasty-hunit
    cabal configure --enable-tests
    cabal build && dist/build/test/test
