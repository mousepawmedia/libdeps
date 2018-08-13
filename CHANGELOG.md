# CHANGELOG

## 1.1.0 [2018-08-13]

* CPGF 1.6.0 (2017-03-24): From GitHub, w/ modifications:

  * Remove unnecessary `const` from reference params in
    `include/cpgf/accessor/gsetter.h:66,76,81`.

  * Remove infinite recursion in `include/cpgf/gcallback.h:57`.

  * Explicitly check for Clang compiler in `include/cpgf/gcompiler.h:33-34`, to
    mitigate "unknown pragma" warnings.

  * Add check for Clang compiler to `include/cpgf/gdeprecated.h:8`, to prevent
    new error because of aforementioned mitigation.

  * Disable all external library bindings and unittest in
    `build/build.config.txt`.

## 1.0.0 [2017-01-21]

All library versions are the most recent stable release as of this update.

* CPGF 1.5.6 (2013-07-26): From GitHub.

* Eigen 3.3.1 (2016-12-06): From source tarball.

* Opus 1.1.3 (2016-07-15): From source tarball.

* pugixml 1.8 (2016-11-24): From source tarball.
