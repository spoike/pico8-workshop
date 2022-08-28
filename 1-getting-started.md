# 1. Getting started with PICO 8

Imagine a hackable video game machine from the 90's, and instead of writing assembly code you have access to a LUA interpreter. Package it as a virtual machine with a bunch of editors (for code, sprite, map, sound effects and music data) and you've got PICO 8.

Most of the workshop we assume you'll be working in the education edition.

> **Go to [https://www.pico-8-edu.com/](https://www.pico-8-edu.com/)**

The website will show a simple UI with a play button:

![Start up](./assets/1-start-edu.png)

> **Click on the play button**

When you run PICO8 it initially dumps you out to a faux text terminal.

![Prompt](./assets/1-the-prompt.png)

> **Type `HELP` and hit enter**

Do note that PICO-8 only types in upper-case letters. If you try to type with Shift-key held in, you'll get a bunch of characters instead.

![Prompt for HELP](./assets/1-prompt-help.png)

The "help" will list some commands and things you can do. You can also anytime type in `help` together with an API to get info about that keyword.

> **Hit ESC key**

![Empty code editor](./assets/1-hello-code-editor.png)

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
