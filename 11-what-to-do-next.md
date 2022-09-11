# 11. What to do next

Over these past chapters, you've managed to create a game with a player character, some pickups, chasing ghosts and a game over screen. A very good start for a game, now put your own spin to it!

Here are some ideas on how to continue:

- Make some sound effects in the sound effect editor. You can play them in the game with the [`SFX` function](https://pico-8.fandom.com/wiki/Sfx).

- You might've noticed there is a bug with the collision detection, this is because we're basing the distance calc on the upper left corner of the sprites. One fix is to offset that check with x:-4, y:-4.

- Change some variables around, see what happens. Spawn more enemies at a time? More or less particles?

- You could try getting the ghosts not to bunch up together by letting them nudge away from each other whenever they collide.

- You could let the ghosts move faster as time progresses.

- Add more pickups with more sprites. Should something else happen when you pick them up?

- Add more enemies with other draw and update behaviors. Several enemies that follows a straight path perhaps?

- Make some music in the music editor. Play in the game with the [`MUSIC` function](https://pico-8.fandom.com/wiki/Music)

- You can shake the screen by giving random values to [`CAMERA` function](https://pico-8.fandom.com/wiki/Camera).

- You may use the map editor to render several sprites at the same time. The [`MAP` function](https://pico-8.fandom.com/wiki/Map) draws the given grid.

- If you're using the map, sprites can be marked with a sprite flag. Use [`MGET`](https://pico-8.fandom.com/wiki/Mget) to get the sprite associated with the given map position and [`FGET`](https://pico-8.fandom.com/wiki/Fget) to get the flag to that sprite. You can use this to mark tiles as impassable with one flag and do collision check by checking if the flag is set on the target position.

- Linear interpolation is useful, however PICO-8 doesn't provide that. Here's some code for a function that does that. It takes two values and mixes it with the given `t` (a decimal number between 0 and 1). It may be used to move stuff between two points, fake gradients, draw HP bars etc:

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
