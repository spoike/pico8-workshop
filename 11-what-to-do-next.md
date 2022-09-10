# 11. What to do next

Over these past chapters, you've managed to create a game with a player character, some pickups, chasing ghosts and a game over screen. A very good start for a game, now put your own spin to it!

Here are some ideas on how to continue:

- Make some sound effects in the sound effect editor. You can play them in the game with the [`SFX` function](https://pico-8.fandom.com/wiki/Sfx).

- You could try getting the ghosts not to bunch up together by letting them nudge away from each other when they collide.

- You could let the ghosts move faster as time progresses.

- Add more pickups with more sprites

- Add more enemies with other draw and update behaviors. Several enemies that follows a straight path perhaps?

- Change some variables around, see what happens. Spawn more enemies at a time? More or less particles?

- Make some music in the music editor. Play in the game with the [`MUSIC` function](https://pico-8.fandom.com/wiki/Music)

- You can shake the screen by giving random values to [`CAMERA` function](https://pico-8.fandom.com/wiki/Camera).

- Linear interpolation is useful, however PICO-8 doesn't provide that. Here's some code for a function that does that. It takes two values and mixes it with the given `t` (a decimal number between 0 and 1). It may be used to move stuff between two points, fake gradients, etc:

```lua
-- TAKES 2 VALUES AND RETURNS A MIX OF THEM
FUNCTION LERP(A,B,T)
 RETURN (1-T)*A+T*B
END

-- TAKES 2 POINTS AND RETURNS A MIX OF THEIR X AND Y COORDINATES
FUNCTION LERP2D(P1,P2,T)
 RETURN LERP(P1.X,P2.X,T),
  LERP(P1.Y,P2.Y,T)
END
```

- Got things you need to shuffle in an array? Try the Fisher-Yates algorithm:

```lua
FUNCTION SHUFFLE(TBL)
 -- FISHER-YATES
 FOR I=#T,1,-1 DO
  LOCAL J=FLR(RND(I)) + 1
  T[I],T[J]=T[J],T[I]
 END
 RETURN T
END
```

- Keep in mind that [`RND` function](https://pico-8.fandom.com/wiki/Rnd) also takes a list table as input. The output will be a random entry from the list.

- Good luck and have fun!
