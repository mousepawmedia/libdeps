# Building Third-Party Libraries

## Building Basics

CMake is used to build (almost) everything present in this repository. For your convenience,
we've included a Makefile to automate all common build scenarios on Linux.
Type `$ make` in the root of this repository for more information.

At this time, the Makefiles are only designed for Linux. If you are building
on another system, you can interact with CMake directly.

Because we've included the contents of the original source distributions for
each library, you can still build each for any scenario the library officially
supports. More information about each library and its build system can be
found in that library's respective README files, which are included in its folder.

## Quick Build

We've tailored the master build system to compile all the libraries for a Linux
development environment. The build systems in our other repositories are designed
to look for this repository by default for all dependencies.

From this root directly, simply run `$ make all` to build all of the libraries.
Alternatively, you can run `$ make <library>` to build an individual library.

If you're using the master build system, it will automatically copy all headers
and compiled library files into the `libs` directory. After compiling, you can point
your compiler and linker directly to `libs/include` and `libs/lib`.

## SFML Dependencies

On Linux, SFML has a number of dependencies. These are listed in the main README.md. For your
convenience, on many Debian-based systems, you can just run `$ make ubuntu-depends-sfml` to install
the dependencies via apt. (These are based on the Ubuntu 16.04 package names.)
