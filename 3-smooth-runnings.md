# 3. Smooth Runnings

> To skip this chapter use the [following link](https://www.pico-8-edu.com/?c=AHB4YQGuAQkPsf4S91xyRJQkA2d3VdJ1WVRkweHv8AKXv8P5bxDNX54-w-EvccotfRjUj-AQPgreIQ2PWlENSNMnGOilwjWSJgMjmVjIyMrEE1Rpv5Nn1SOknXhAvHXVVnrW3EgsGWLfGfvnLPs-h9kfg_rh12X2j3q42iB7h6FcpmAhGKhuK6amsmxvL8uivWYtaeNqQ4tgp4nzsYGBPcGDYs0QI4YODCUhoGUmX9ILJASL5dxcpI_UF1oF8UzThEsDbpEbWBwa2diRCi1LebE5iYSxsfN2Cu2E3JGBo0UKxuLRmXSjaRajRCOhWFvriolyKXyFcHN0LKizUKjkONGEBSMsGE1vAQ==&g=wG6Aw-w06Cw-wsHQHQaAaAaw-wsXgaAaAaw-wsXg6Ew-wrHQHQqQqw-wy6Cw-w06A)

## Can we make the sprite not move so sharply?

Is it possible for the character to go around in a smoother fashion? Sure you can! You need the program to keep track of a new state, the velocity. So we need to add the following global state variables at the top of our program:

```lua
X,Y=60,60
DX,DY=0,0
```

The `DX` and `DY` variables keep track of the velocity (or the distance taken per frame). The player will now instead control these directly instead of the sprite's `X` and `Y` values. So lets change the `_UPDATE` function to do this:

```lua
FUNCTION _UPDATE()
 IF BTN(0) THEN
  DX-=0.6
 END
 IF BTN(1) THEN
  DX+=0.6
 END
 IF BTN(2) THEN
  DY-=0.6
 END
 IF BTN(3) THEN
  DY+=0.6
 END
 -- MAX VELOCITY 4 PIXELS PER FRAME
 DX=MID(-4,DX,4)
 DY=MID(-4,DY,4)
 -- UPDATE THE X,Y WITH DX,DY
 X+=DX
 Y+=DY
 -- CLAMP THE X,Y
 X=MID(0,X,120)
 Y=MID(0,Y,120)
END
```

Running the program and controlling the character will look a bit like this:

![My sprite is out of control!](./assets/3-first-try.gif)

It is a bit out of control, and this is because we don't slow down when we release the keys. Lets correct this by "applying some breaks" at the end of our `_UPDATE` function. Easiest is to reduce the `DX` and `DY` values for each frame with a factor:

```lua
 -- AT THE END OF _UPDATE FUNCTION
 DX*=0.8
 DY*=0.8
```

When you're not touching the keys the `DX` and `DY` values will go towards zero, giving the impression of a slow down. When running the program it'll look like this:

![My sprite slows down, phew!](./assets/3-better-velocity.gif)

## Points to review

- Creating games is an iterative process. Don't be afraid of a little math to make things smoother.
- It's common to use `X` and `Y` to track position, `DX` and `DY` to track the change per frame (aka. the velocity).

## [Next Chapter - They Call Him Bobby Tables](./4-bobby-tables.md)

## [Back to the README](./README.md)
