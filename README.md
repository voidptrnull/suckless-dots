# suckless-dots
My personal Suckless + ly setup

## Configuration & Usage
Refer to the documentation of the particular document.

## Pre-requisites for building all the components

- A `C99` compatible C compiler (All modern compilers support it)
- `zig` for building ly. You can build the original C code, but it is not recommended.
- Dependencies for the components.
- Make (or GMake) as build system.

### DWM
The present configuration zrequires the following:
- Terminal - `Sakura`
- Browser - `firefox-bin` (Gentoo Firefox Binary)
- Launcher - `dmenu`

>Note: `st` is in the repo but I did not end up using it.

The others don't need much else.

## Automatic Building & Installation

>Note: Requires `sudo` or `doas` or anything else. It is not meant to be run as root.
In `config.mk`, change the line `EXEC=<exec>`. Default is `EXEC=sudo`.

In the root of the repository, run `make` or `make all` or `make component`.
```sh
make -B
make -B all
make -B dwm # or others. Just builds and installs it if everything goes well.
```
