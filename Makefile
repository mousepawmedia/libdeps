none: help

help:
	@echo "=== Third-Party Libraries ==="
	@echo "Select a build target:"
	@echo "  make ready                  Build everything."
	@echo
	@echo "  make cpgf                   Build CPGF."
	@echo "  make eigen                  Build Eigen."
	@echo "  make opus                   Build Opus."
	@echo "  make pugixml                Build pugixml."
	@echo
	@echo "  make clean_all              Clean everything."
	@echo "  make clean_cpgf             Clean CPGF only."
	@echo "  make clean_eigen            Clean Eigen only."
	@echo "  make clean_opus             Clean Opus only."
	@echo "  make clean_pugixml          Clean pugixml only."
	@echo
	@echo "  make ubuntu-fix-aclocal     Fix Opus's complaints about problems with aclocal."
	@echo
	@echo "For other build options, see the 'make' command in 'cpgf/', 'eigan/', 'pugixml/', and 'sfml/'."

all: ready

ready: cpgf eigen opus pugixml
	@echo "-------------"
	@echo "<<<<<<< BUILD COMPLETE >>>>>>>"
	@echo "All headers are in 'libs/include' and static libraries in 'libs/lib'."
	@echo "-------------"

clean_all: clean_cpgf clean_eigen clean_opus clean_pugixml
	@rm -rf libs/
	@echo "-------------"
	@echo "<<<<<<< CLEAN COMPLETE: ALL >>>>>>>"
	@echo "-------------"

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

clean_opus:
	$(MAKE) clean -C opus
	@rm -rf libs/include/opus
	@rm -f libs/lib/libopus*
	@echo "-------------"
	@echo "<<<<<<< CLEAN COMPLETE: OPUS >>>>>>>"
	@echo "-------------"

clean_pugixml:
	@rm -rf pugixml/build
	@rm -rf libs/include/pugixml
	@rm -f libs/lib/libpugixml*
	@echo "-------------"
	@echo "<<<<<<< CLEAN COMPLETE: PUGIXML >>>>>>>"
	@echo "-------------"

cpgf:
	@echo "Building CPGF..."
	$(MAKE) linux -C cpgf/build
	@echo "Copying CPGF..."
	@mkdir -p libs/lib
	@cp -r cpgf/include libs/
	@mkdir -p libs/lib
	@cp -r cpgf/lib libs/
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

opus:
	@echo "Building opus..."
	@cd opus && ./configure
	$(MAKE) -C opus
	@echo "Copying opus..."
	@mkdir -p libs/include/opus
	@cp opus/include/* libs/include/opus
	@mkdir -p libs/lib
	@cp opus/.libs/libopus* libs/lib
	@echo "-------------"
	@echo "<<<<<<< BUILD COMPLETE: OPUS >>>>>>>"
	@echo "Opus is in 'libs/include/opus' and 'libs/lib'."
	@echo "-------------"

pugixml:
	@echo "Building pugixml..."
	@mkdir -p pugixml/build
	@cd pugixml/build && cmake ../
	$(MAKE) -C pugixml/build
	@echo "Copying pugixml..."
	@mkdir -p libs/include/pugixml
	@cp pugixml/src/*.hpp libs/include/pugixml
	@mkdir -p libs/lib
	@cp pugixml/build/libpugixml* libs/lib
	@echo "-------------"
	@echo "<<<<<<< BUILD COMPLETE: PUGIXML >>>>>>>"
	@echo "pugixml is in 'libs/include/pugixml' and 'libs/lib'."
	@echo "-------------"

ubuntu-fix-aclocal:
	@sh preconfig/ubuntu-fix-aclocal.sh

.PHONY: all clean_all clean_eigan clean_opus clean_pugixml cpgf eigen opus pugixml ubuntu-fix-aclocal
