# MousePaw Games: Third-Party Libraries

Many of our libraries rely on common third-party library dependencies. To minimize the effort
necessary to download, build, and maintain these dependencies, we maintain this repository.

This repository contains the latest officially-adopted version of each library. We have built
on top of the existing build systems for ease of setup.

See BUILDING.md for more information on how to get started.

## Authors

MousePaw Games is responsible for the master build system, the preconfig scripts, and some
modifications to library build systems.

Otherwise, all credit for the libraries goes to their respective developers. See their respective
READMEs, websites, and documentation for more information.

MousePaw Games' part of this repository was authored by...

- Jason C. McDonald

## Libraries

Each library folder contains its source code as distributed by the respective original developer.
See those folders for READMEs, licenses, and additional information.

 - [CPGF][4] (License: Apache 2.0)
 - [Eigen][5] (License: MPL2; compiled without LGPL sectors.)
 - [LLVM][7] (License: University of Illinois/NCSA Open Source License)
 - [Opus][6] (License: BSD-3, some royalty-free patents)
 - [pugixml][8] (License: MIT)

See CHANGELOG.md for exact library versions.

## Dependencies

The included libraries have no special dependencies, except for CMake and the C++ standard library.
Just build and go!

Opus may require `autoconf` and `libtool` for some configuration. Run `make ubuntu-fix-aclocal`
to resolve any build issues it may have.

## Contributions

We do NOT accept pull requests through GitHub.
If you would like to contribute code, please read our
[Contribution Guide][2].

All contributions are licensed to us under the
[MousePaw Games Terms of Development][3].

## License

All changes made to library build systems is licensed under the library's own license. The rest
of our original work in this repository is licensed under the BSD-3 License. (See LICENSE.md)

The project is owned and maintained by [MousePaw Games][1].

[1]: http://www.mousepawgames.com/
[2]: http://www.mousepawgames.com/opensource#contribute
[3]: http://www.mousepawgames.com/termsofdevelopment
[4]: http://www.cpgf.org/
[5]: http://eigen.tuxfamily.org/
[6]: https://opus-codec.org/
[7]: http://llvm.org/
[8]: http://pugixml.org/
