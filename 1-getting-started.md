# 1. Getting started with PICO 8

Imagine a hackable video game machine from the 90's, and instead of writing assembly code you have access to a LUA interpreter. Package it as a virtual machine with a bunch of editors (for code, sprite, map, sound effects and music data) and you've got PICO 8.

## Step 1. Go to the education edition website

Most of the workshop we assume you'll be working in the education edition. The address for it is:

- [https://www.pico-8-edu.com/](https://www.pico-8-edu.com/)

When you go in there you'll end up with this:

![Start up](./assets/1-start-edu.png)

When you run PICO8 it initially dumps you out to a terminal. Here you can do the following:

To get started lets write a program that just

```lua
cls()
print("Hello world")
```

## Points to review

- Drag and drop a cartridge png to run the contents of that png
- `dir`, `cd` to view the current working folder and change it
- `load <file>` to load a pico 8 file, `.p8` extension is optional
- `folder` to open the cartidge folder in your system's file explorer
- Press escape key (<kbd>Esc</kbd>) to toggle between the editor and the terminal
- (Not in Education version) `splore` to explore the BBS
