# 4. They call him Bobby Tables

> To skip this chapter use the [following link](https://www.pico-8-edu.com/?c=AHB4YQKVAUAPcP3NL3H4G9z0FhPDTxHdc8odWZba7PYwtFFjszR_iuj6l3iF_1-iDd4huuYlZnbSe0ZGgmxporxqxy1H7dhsxxZ5PyQjsNImQyuZZvizsrHwBlU6MLWSVa_QdoaInLNQL5y11VZrfpAPkAnHjEz4cZZM_HeYmrh31MTPy2TCDzVxlkH8EDu1rMFA0Fe3FUtLWbY3l2XRXDOWtHG1p1W808T52MDAnh2DYs3bI95n4L0oEERUPek3sqiZTOfmRBayuJMVlTbwURE6NnFsIE42ubMxMKMgKhssRjQnwzq2dd5EIUecml_B_aF0sJVubowMNM1ilAgxFGNjXbFQ7oTPEG6OTgV1Fqqd4zhlhgU7L9ipDISeBl_jCGRhk2dQiVkUhhjbSG0iLXejK3VdtMKjDycTHkPrRwA=&g=wG6Aw-w06Cw-wsHQHQaAaAaw-wsXgaAaAaw-wsXg6Ew-wrHQHQqQqw-wy6Cw-w06A).

Keeping track of global variables is a bit of a hassle, and usually you want to group them together into objects. Thankfully LUA is a dynamic object oriented that handles objects with a concept called Tables.

## My first player table

The table syntax should be familiar by some coders. Tables functions almost the same as Javascript objects. They are like dictionary or "map" with keys and values.

```lua
MY_TABLE={
 A=1,
 B=2
}
PRINT(MY_TABLE.A) --outputs 1
PRINT(MY_TABLE.B) --outputs 2
```

Lets move the global variables in to a player table, like this:

```lua
PLAYER = {
 X=60,
 Y=60,
 DX=0,
 DY=0
}
```

You'll also need to replace all occurances of `X`, `Y`, `DX` and `DY` with `PLAYER.X`, `PLAYER.Y`, `PLAYER.DX` and `PLAYER.DY` respectively. Do so and try running the game again with <kbd>CTRL</kbd>+<kbd>R</kbd>. The game should functionally work the same way as before.

## My first object methods

Objects may also have functions so lets move the drawing and updating of the player with their own `DRAW` and `UPDATE` to the table.

First move `DRAW`, the easiest one as it's only a one-liner. We'll also include a `SELF` argument to the function and use that to refer to the player table instead of `PLAYER`:

```lua
PLAYER = {
 -- X,Y,DX lines haven't changed...
 DY=0,
 DRAW=FUNCTION (SELF)
  SPR(1,SELF.X,SELF.Y)
 END
}
```

You can call functions free of context the same as variables with the period `.` and you can provide the `SELF` by calling it like `PLAYER.DRAW(PLAYER)`. However there is a shortcut by calling the function with a colon `:` like this:

```lua
FUNCTION _DRAW()
 CLS()
 PLAYER:DRAW()
END
```

Don't forget to test it out with <kbd>CTRL<kbd>+<kbd>R</kbd>.

Now try moving the code from `_UPDATE` to an update function in the player table, and call it with `PLAYER:UPDATE()`. Should look like this:

```lua
PLAYER={
 -- snip-snip
 UPDATE=FUNCTION (SELF)
  --snip-snip
  SELF.DY*=0.8
 END
}

FUNCTION _UPDATE()
 PLAYER:UPDATE()
END
```

## Points to review

- Objects in LUA are called tables and syntax is curly braces and key-value pairs seperated with `=` equals sign for assignment. The pairs need to have a comma `,` to seperate them.
- Accessing and mutating values in a table with `.`, e.g. `PLAYER.X=1`
- Calling functions with the table as context (i.e. `SELF`) use the colon `:`, e.g.`PLAYER:UPDATE()`.

## [Next Chapter - ](./5-pick-me-up.md)
