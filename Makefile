none:
	@echo "=== Third-Party Libraries ==="
	@echo "Select a build target:"
	@echo "  make all"
	@echo "  make cpgf"
	@echo "  make eigen"
	@echo "  make pugixml"
	@echo "  make sfml"
	@echo
	@echo "  make clean_all"
	@echo "  make clean_cpgf"
	@echo "  make clean_eigen"
	@echo "  make clean_pugixml"
	@echo "  make clean_sfml"
	@echo
	@echo "  make ubuntu-depends-sfml"
	@echo
	@echo "Optional Architecture"
	@echo "  ARCH=32	Make x86 build (-m32)"
	@echo "  ARCH=64	Make x64 build (-m64)"
	@echo
	@echo "Use Configuration File"
	@echo "  CONFIG=foo      Uses the configuration file 'foo.config'"
	@echo "                  in the root of this repository."
	@echo "  When unspecified, default.config will be used."
	@echo
	@echo "For other build options, see the 'make' command in 'cpgf/', 'eigan/', 'pugixml/', and 'sfml/'."

clean_all: clean_cpgf clean_eigen
	@rm -rf libs/

clean_cpgf:
	$(MAKE) clean -C cpgf/build
	@rm -rf libs/include/cpgf
	@rm -f libs/lib/libcpgf*
	@echo "-------------"
	@echo "<<<<<<< CLEAN COMPLETE: CPGF >>>>>>>"
	@echo "-------------"

clean_eigen:
	@rm -rf libs/include/Eigen
	@echo "-------------"
	@echo "<<<<<<< CLEAN COMPLETE: EIGEN >>>>>>>"
	@echo "-------------"

clean_sfml:
	$(MAKE) clean -C sfml
	@rm -rf libs/include/SFML
	@rm -f libs/lib/libsfml*

cpgf:
	@echo "Building CPGF..."
	$(MAKE) linux -C cpgf/build
	@echo "Copying CPGF..."
	@mkdir -p libs/lib
	@cp -r cpgf/include libs/
	@cp cpgf/lib libs/
	@echo "-------------"
	@echo "<<<<<<< BUILD COMPLETE: CPGF >>>>>>>"
	@echo "CPGF is in 'libs/include/cpgf' and 'libs/lib'."
	@echo "-------------"

eigen:
	@echo "Building and Copying Eigen..."
	@mkdir -p libs/include/Eigen
	@cd libs/include/Eigen && cmake ../../../eigen -DEIGEN_MPL2_ONLY=true
	@echo "-------------"
	@echo "<<<<<<< BUILD COMPLETE: EIGEN >>>>>>>"
	@echo "Compiled with EIGEN_MPL2_ONLY flag."
	@echo "Eigen is in 'libs/include/eigen'."
	@echo "WARNING: You do NOT need to run 'make install'. Just link directly to the above directory."
	@echo "-------------"

sfml:
	@echo "Building SFML..."
	@cmake sfml -DBUILD_SHARED_LIBS:BOOL=FALSE
	$(MAKE) -C sfml
	@echo "Copying SFML..."
	@cp -r sfml/include libs/
	@cp -r sfml/lib libs/
	@echo "-------------"
	@echo "<<<<<<< BUILD COMPLETE: SFML >>>>>>>"
	@echo "SFML is in 'libs/include/sfml' and 'libs/lib'."
	@echo "-------------"


ubuntu-depends-sfml:
	@sh preconfig/ubuntu-depends-sfml.sh

.PHONY: all clean_all clean_eigan clean_sfml cpgf eigen sfml ubuntu-depends-sfml
