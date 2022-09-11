# 2. Your first game loop

> To skip this chapter use the [following link](https://www.pico-8-edu.com/?c=AHB4YQDgAIkCAI8lr8cGhsUGRkHBrM5tjC7tzQ3ki0wu7A4lBSAdDG4_-g18FLzAG6yfcYJWwAHp5S9wulS4XiFNTn_FTCzkAc6fOL9K_3vyrHqAtBMPeIh7rrtpo9QL8e6K93GR9x15_yV0w4_rvA-dcJThK4zMbGyoErTpbX0hVxA7MnCsVgE=&g=wG6Aw-w06Cw-wsHQHQaAaAaw-wsXgaAaAaw-wsXg6Ew-wrHQHQqQqw-wy6Cw-w06A)

Writing a program that only draws once is quite boring. However PICO-8 lets you write a game loop. In order to do so easily, PICO-8 will call "special" functions in your program that will repeatedly run:

- `_DRAW()` is called once per frame which is 15, 30 or 60 times per second. All the `SPR`, `RECT` and other drawing commands may be used here.
- `_UPDATE()`, `_UPDATE60()` is called 30 and 60 times per second respectively (provided there is sufficient CPU to do so)

## Lets draw again and again!

Lets start with the draw function and move the code from before into that:

```lua
FUNCTION _DRAW()
 CLS()
 SPR(1,60,60)
END
```

Run it with `CTRL+R`. Notice that the program now runs without stopping, this is because there is a `_DRAW` function that PICO-8 is repeatedly calling.

To stop the program hit <kbd>ESC</kbd> key.

## Take control!

To make the game more interactive we need to access the keyboard controls (and game pad controls if you have one game pad connected). In order to do so we need to store the position of the sprite. To keep it simple we can store an X and Y value globally, like this:

```lua
X,Y=60,60

FUNCTION _DRAW()
 CLS()
 SPR(1,X,Y)
END
```

Now we need to check for every update frame what the player is doing by polling the button press with `BTN`. The function returns true if the button requested is held down by the player. The indexes for BTN are as follows:

- 0 - Left
- 1 - Right
- 2 - Up
- 3 - Down

In summary you can write the update function like this:

```lua
FUNCTION _UPDATE()
 IF BTN(0) THEN
  X-=2 -- LEFT
 END
 IF BTN(1) THEN
  X+=2 -- RIGHT
 END
 IF BTN(2) THEN
  Y-=2 -- UP
  -- DO NOTE THAT SCREEN Y IS FROM UP TO DOWN
 END
 IF BTN(3) THEN
  Y+=2 -- DOWN
 END
END
```

When you're running the program (<kbd>CTRL</kbd>+<kbd>R</kbd> again) you can now control the sprite with the arrow keys!

![A MOVING SPRITE](./assets/2-animation-moving-sprite.gif)

The sprite however will go outside the screen's bounds. PICO-8's screen is 128x128 pixels. In order to force the sprite to stay within bounds you can use the `MID` function. It takes three numbers as arguments and picks the "middle" value. At the end of the `_UPDATE` function add the following:

```lua
 -- AT THE END OF _UPDATE FUNCTIOn
 X=MID(0,X,128-8)
 Y=MID(0,Y,128-8)
 -- THIS CLAMPS X AND Y BETWEEN 0 AND 120
```

As a single tiled sprite is 8x8 pixels, we need to take into account to clamp the x and y to keep the sprite inside the screen, hence the `128-8` calculation. We're currently assuming that the sprite's pivot point is at the top left.

## Points to review

- There are special functions that PICO-8 calls if they exist in the loaded program: `_INIT`, `_DRAW`, `_UPDATE`, `_UPDATE60`
- Use `_DRAW` for updating the graphics, regardless of game state
- Use `_UPDATE` or `_UPDATE60` functions for the game loop
- Run currently loaded cartridge with `CTRL+R`
- You can clamp values with `MIN`, `MAX`, and `MID` functions.

## [Next Chapter - Smooth Runnings](./3-smooth-runnings.md)

## [Back to the README](./README.md)
