MK_DIR = @cmake -E make_directory
CH_DIR = @cmake -E chdir
CP = @cmake -E copy
CP_DIR = @cmake -E copy_directory
RM = @cmake -E remove
RM_DIR = @cmake -E remove_directory
ECHO = @cmake -E echo
LN = @cmake -E create_symlink

none: help

help:
	$(ECHO) "=== Third-Party Libraries ==="
	$(ECHO) "Select a build target:"
	$(ECHO) "  make ready                  Build everything."
	$(ECHO)
	$(ECHO) "  make cpgf                   Build CPGF."
	$(ECHO) "  make eigen                  Build Eigen."
	$(ECHO) "  make eventpp                Build eventpp."
	$(ECHO) "  make opus                   Build Opus."
	$(ECHO) "  make pugixml                Build pugixml."
	$(ECHO)
	$(ECHO) "  make clean_all              Clean everything."
	$(ECHO) "  make clean_cpgf             Clean CPGF only."
	$(ECHO) "  make clean_eigen            Clean Eigen only."
	$(ECHO) "  make clean_eventpp          Clean eventpp only."
	$(ECHO) "  make clean_opus             Clean Opus only."
	$(ECHO) "  make clean_pugixml          Clean pugixml only."
	$(ECHO)
	$(ECHO) "  make ubuntu-fix-aclocal     Fix Opus's complaints about problems with aclocal."
	$(ECHO)
	$(ECHO) "For other build options, see the 'make' command in 'cpgf/', 'eigan/', 'opus/', and 'pugixml/'."

all: ready

ready: cpgf eigen eventpp opus pugixml
	$(ECHO) "-------------"
	$(ECHO) "<<<<<<< BUILD COMPLETE >>>>>>>"
	$(ECHO) "All headers are in 'libs/include' and static libraries in 'libs/lib'."
	$(ECHO) "-------------"

clean_all: clean_cpgf clean_eigen clean_eventpp clean_opus clean_pugixml
	$(RM_DIR) libs/
	$(ECHO) "-------------"
	$(ECHO) "<<<<<<< CLEAN COMPLETE: ALL >>>>>>>"
	$(ECHO) "-------------"

clean_cpgf:
	$(MAKE) clean -C cpgf/build
	$(RM_DIR) libs/include/cpgf
	$(RM) libs/lib/libcpgf*
	$(ECHO) "-------------"
	$(ECHO) "<<<<<<< CLEAN COMPLETE: CPGF >>>>>>>"
	$(ECHO) "-------------"

clean_eigen:
	$(RM_DIR) libs/include/Eigen
	$(ECHO) "-------------"
	$(ECHO) "<<<<<<< CLEAN COMPLETE: EIGEN >>>>>>>"
	$(ECHO) "-------------"

clean_eventpp:
	$(RM_DIR) libs/include/eventpp
	$(ECHO) "-------------"
	$(ECHO) "<<<<<<< CLEAN COMPLETE: EVENTPP >>>>>>>"
	$(ECHO) "-------------"

clean_opus:
	$(MAKE) clean -C opus
	$(RM_DIR) libs/include/opus
	$(RM) libs/lib/libopus*
	$(ECHO) "-------------"
	$(ECHO) "<<<<<<< CLEAN COMPLETE: OPUS >>>>>>>"
	$(ECHO) "-------------"

clean_pugixml:
	$(RM_DIR) pugixml/build
	$(RM_DIR) libs/include/pugixml
	$(RM) libs/lib/libpugixml*
	$(ECHO) "-------------"
	$(ECHO) "<<<<<<< CLEAN COMPLETE: PUGIXML >>>>>>>"
	$(ECHO) "-------------"

cpgf:
	$(ECHO) "Building CPGF..."
	$(MAKE) linux -C cpgf/build
	$(ECHO) "Copying CPGF..."
	$(MK_DIR) libs/lib
	$(CP_DIR) cpgf/include/ libs/include/
	$(MK_DIR) libs/lib
	$(CP_DIR) cpgf/lib/ libs/lib/
	$(ECHO) "-------------"
	$(ECHO) "<<<<<<< BUILD COMPLETE: CPGF >>>>>>>"
	$(ECHO) "CPGF is in 'libs/include/cpgf' and 'libs/lib'."
	$(ECHO) "-------------"

eigen:
	$(ECHO) "Copying Eigen..."
	$(MK_DIR) libs/include
	$(CP_DIR) eigen/Eigen/ libs/include/Eigen/
	$(ECHO) "-------------"
	$(ECHO) "<<<<<<< BUILD COMPLETE: EIGEN >>>>>>>"
	$(ECHO) "Compiled with EIGEN_MPL2_ONLY flag."
	$(ECHO) "Eigen is in 'libs/include/eigen'."
	$(ECHO) "-------------"

eventpp:
	$(ECHO) "Copying eventpp..."
	$(MK_DIR) libs/include
	$(CP_DIR) eventpp/include/eventpp/ libs/include/eventpp/
	$(ECHO) "-------------"
	$(ECHO) "<<<<<<< BUILD COMPLETE: EVENTPP >>>>>>>"
	$(ECHO) "eventpp is in 'libs/include/eventpp'."
	$(ECHO) "-------------"

opus:
	$(ECHO) "Building opus..."
	$(CH_DIR) opus ./configure
	$(MAKE) -C opus
	$(ECHO) "Copying opus..."
	$(MK_DIR) libs/include/opus
	$(CP) opus/include/* libs/include/opus
	$(MK_DIR) libs/lib
	$(CP) opus/.libs/libopus* libs/lib
	$(ECHO) "-------------"
	$(ECHO) "<<<<<<< BUILD COMPLETE: OPUS >>>>>>>"
	$(ECHO) "Opus is in 'libs/include/opus' and 'libs/lib'."
	$(ECHO) "-------------"

pugixml:
	$(ECHO) "Building pugixml..."
	$(MK_DIR) pugixml/build
	$(CH_DIR) pugixml/build cmake ../
	$(MAKE) -C pugixml/build
	$(ECHO) "Copying pugixml..."
	$(MK_DIR) libs/include/pugixml
	$(CP) pugixml/src/*.hpp libs/include/pugixml
	$(MK_DIR) libs/lib
	$(CP) pugixml/build/libpugixml* libs/lib
	$(ECHO) "-------------"
	$(ECHO) "<<<<<<< BUILD COMPLETE: PUGIXML >>>>>>>"
	$(ECHO) "pugixml is in 'libs/include/pugixml' and 'libs/lib'."
	$(ECHO) "-------------"

ubuntu-fix-aclocal:
	@sh preconfig/ubuntu-fix-aclocal.sh

.PHONY: all clean_all clean_eigen clean_eventpp clean_opus clean_pugixml cpgf eigen eventpp opus pugixml ubuntu-fix-aclocal
