# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/msudurip1/Documents/srsRAN_modified/srsRAN

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/msudurip1/Documents/srsRAN_modified/srsRAN/build

# Include any dependencies generated for this target.
include srsenb/test/rrc/CMakeFiles/rrc_paging_test.dir/depend.make

# Include the progress variables for this target.
include srsenb/test/rrc/CMakeFiles/rrc_paging_test.dir/progress.make

# Include the compile flags for this target's objects.
include srsenb/test/rrc/CMakeFiles/rrc_paging_test.dir/flags.make

srsenb/test/rrc/CMakeFiles/rrc_paging_test.dir/rrc_paging_test.cc.o: srsenb/test/rrc/CMakeFiles/rrc_paging_test.dir/flags.make
srsenb/test/rrc/CMakeFiles/rrc_paging_test.dir/rrc_paging_test.cc.o: ../srsenb/test/rrc/rrc_paging_test.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/msudurip1/Documents/srsRAN_modified/srsRAN/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object srsenb/test/rrc/CMakeFiles/rrc_paging_test.dir/rrc_paging_test.cc.o"
	cd /home/msudurip1/Documents/srsRAN_modified/srsRAN/build/srsenb/test/rrc && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/rrc_paging_test.dir/rrc_paging_test.cc.o -c /home/msudurip1/Documents/srsRAN_modified/srsRAN/srsenb/test/rrc/rrc_paging_test.cc

srsenb/test/rrc/CMakeFiles/rrc_paging_test.dir/rrc_paging_test.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/rrc_paging_test.dir/rrc_paging_test.cc.i"
	cd /home/msudurip1/Documents/srsRAN_modified/srsRAN/build/srsenb/test/rrc && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/msudurip1/Documents/srsRAN_modified/srsRAN/srsenb/test/rrc/rrc_paging_test.cc > CMakeFiles/rrc_paging_test.dir/rrc_paging_test.cc.i

srsenb/test/rrc/CMakeFiles/rrc_paging_test.dir/rrc_paging_test.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/rrc_paging_test.dir/rrc_paging_test.cc.s"
	cd /home/msudurip1/Documents/srsRAN_modified/srsRAN/build/srsenb/test/rrc && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/msudurip1/Documents/srsRAN_modified/srsRAN/srsenb/test/rrc/rrc_paging_test.cc -o CMakeFiles/rrc_paging_test.dir/rrc_paging_test.cc.s

# Object files for target rrc_paging_test
rrc_paging_test_OBJECTS = \
"CMakeFiles/rrc_paging_test.dir/rrc_paging_test.cc.o"

# External object files for target rrc_paging_test
rrc_paging_test_EXTERNAL_OBJECTS =

srsenb/test/rrc/rrc_paging_test: srsenb/test/rrc/CMakeFiles/rrc_paging_test.dir/rrc_paging_test.cc.o
srsenb/test/rrc/rrc_paging_test: srsenb/test/rrc/CMakeFiles/rrc_paging_test.dir/build.make
srsenb/test/rrc/rrc_paging_test: lib/src/asn1/libsrsran_asn1.a
srsenb/test/rrc/rrc_paging_test: srsenb/test/rrc/libtest_helpers.a
srsenb/test/rrc/rrc_paging_test: srsenb/src/stack/rrc/libsrsenb_rrc.a
srsenb/test/rrc/rrc_paging_test: srsenb/src/common/libsrsenb_common.a
srsenb/test/rrc/rrc_paging_test: lib/src/asn1/librrc_asn1.a
srsenb/test/rrc/rrc_paging_test: lib/src/asn1/librrc_nr_asn1.a
srsenb/test/rrc/rrc_paging_test: lib/src/asn1/libs1ap_asn1.a
srsenb/test/rrc/rrc_paging_test: lib/src/asn1/libasn1_utils.a
srsenb/test/rrc/rrc_paging_test: srsenb/src/libenb_cfg_parser.a
srsenb/test/rrc/rrc_paging_test: lib/src/common/libsrsran_common.a
srsenb/test/rrc/rrc_paging_test: lib/src/support/libsupport.a
srsenb/test/rrc/rrc_paging_test: lib/src/srslog/libsrslog.a
srsenb/test/rrc/rrc_paging_test: /usr/lib/x86_64-linux-gnu/libmbedcrypto.so
srsenb/test/rrc/rrc_paging_test: /usr/lib/x86_64-linux-gnu/libsctp.so
srsenb/test/rrc/rrc_paging_test: srsgnb/src/stack/rrc/libsrsgnb_rrc_config_utils.a
srsenb/test/rrc/rrc_paging_test: lib/src/phy/libsrsran_phy.a
srsenb/test/rrc/rrc_paging_test: /usr/lib/x86_64-linux-gnu/libfftw3f.so
srsenb/test/rrc/rrc_paging_test: /usr/lib/x86_64-linux-gnu/libconfig++.so
srsenb/test/rrc/rrc_paging_test: srsenb/test/rrc/CMakeFiles/rrc_paging_test.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/msudurip1/Documents/srsRAN_modified/srsRAN/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable rrc_paging_test"
	cd /home/msudurip1/Documents/srsRAN_modified/srsRAN/build/srsenb/test/rrc && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/rrc_paging_test.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
srsenb/test/rrc/CMakeFiles/rrc_paging_test.dir/build: srsenb/test/rrc/rrc_paging_test

.PHONY : srsenb/test/rrc/CMakeFiles/rrc_paging_test.dir/build

srsenb/test/rrc/CMakeFiles/rrc_paging_test.dir/clean:
	cd /home/msudurip1/Documents/srsRAN_modified/srsRAN/build/srsenb/test/rrc && $(CMAKE_COMMAND) -P CMakeFiles/rrc_paging_test.dir/cmake_clean.cmake
.PHONY : srsenb/test/rrc/CMakeFiles/rrc_paging_test.dir/clean

srsenb/test/rrc/CMakeFiles/rrc_paging_test.dir/depend:
	cd /home/msudurip1/Documents/srsRAN_modified/srsRAN/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/msudurip1/Documents/srsRAN_modified/srsRAN /home/msudurip1/Documents/srsRAN_modified/srsRAN/srsenb/test/rrc /home/msudurip1/Documents/srsRAN_modified/srsRAN/build /home/msudurip1/Documents/srsRAN_modified/srsRAN/build/srsenb/test/rrc /home/msudurip1/Documents/srsRAN_modified/srsRAN/build/srsenb/test/rrc/CMakeFiles/rrc_paging_test.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : srsenb/test/rrc/CMakeFiles/rrc_paging_test.dir/depend

