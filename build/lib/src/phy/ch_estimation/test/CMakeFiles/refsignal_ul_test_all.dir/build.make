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
include lib/src/phy/ch_estimation/test/CMakeFiles/refsignal_ul_test_all.dir/depend.make

# Include the progress variables for this target.
include lib/src/phy/ch_estimation/test/CMakeFiles/refsignal_ul_test_all.dir/progress.make

# Include the compile flags for this target's objects.
include lib/src/phy/ch_estimation/test/CMakeFiles/refsignal_ul_test_all.dir/flags.make

lib/src/phy/ch_estimation/test/CMakeFiles/refsignal_ul_test_all.dir/refsignal_ul_test.c.o: lib/src/phy/ch_estimation/test/CMakeFiles/refsignal_ul_test_all.dir/flags.make
lib/src/phy/ch_estimation/test/CMakeFiles/refsignal_ul_test_all.dir/refsignal_ul_test.c.o: ../lib/src/phy/ch_estimation/test/refsignal_ul_test.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/msudurip1/Documents/srsRAN_modified/srsRAN/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object lib/src/phy/ch_estimation/test/CMakeFiles/refsignal_ul_test_all.dir/refsignal_ul_test.c.o"
	cd /home/msudurip1/Documents/srsRAN_modified/srsRAN/build/lib/src/phy/ch_estimation/test && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/refsignal_ul_test_all.dir/refsignal_ul_test.c.o   -c /home/msudurip1/Documents/srsRAN_modified/srsRAN/lib/src/phy/ch_estimation/test/refsignal_ul_test.c

lib/src/phy/ch_estimation/test/CMakeFiles/refsignal_ul_test_all.dir/refsignal_ul_test.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/refsignal_ul_test_all.dir/refsignal_ul_test.c.i"
	cd /home/msudurip1/Documents/srsRAN_modified/srsRAN/build/lib/src/phy/ch_estimation/test && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/msudurip1/Documents/srsRAN_modified/srsRAN/lib/src/phy/ch_estimation/test/refsignal_ul_test.c > CMakeFiles/refsignal_ul_test_all.dir/refsignal_ul_test.c.i

lib/src/phy/ch_estimation/test/CMakeFiles/refsignal_ul_test_all.dir/refsignal_ul_test.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/refsignal_ul_test_all.dir/refsignal_ul_test.c.s"
	cd /home/msudurip1/Documents/srsRAN_modified/srsRAN/build/lib/src/phy/ch_estimation/test && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/msudurip1/Documents/srsRAN_modified/srsRAN/lib/src/phy/ch_estimation/test/refsignal_ul_test.c -o CMakeFiles/refsignal_ul_test_all.dir/refsignal_ul_test.c.s

# Object files for target refsignal_ul_test_all
refsignal_ul_test_all_OBJECTS = \
"CMakeFiles/refsignal_ul_test_all.dir/refsignal_ul_test.c.o"

# External object files for target refsignal_ul_test_all
refsignal_ul_test_all_EXTERNAL_OBJECTS =

lib/src/phy/ch_estimation/test/refsignal_ul_test_all: lib/src/phy/ch_estimation/test/CMakeFiles/refsignal_ul_test_all.dir/refsignal_ul_test.c.o
lib/src/phy/ch_estimation/test/refsignal_ul_test_all: lib/src/phy/ch_estimation/test/CMakeFiles/refsignal_ul_test_all.dir/build.make
lib/src/phy/ch_estimation/test/refsignal_ul_test_all: lib/src/phy/libsrsran_phy.a
lib/src/phy/ch_estimation/test/refsignal_ul_test_all: lib/src/common/libsrsran_common.a
lib/src/phy/ch_estimation/test/refsignal_ul_test_all: lib/src/phy/libsrsran_phy.a
lib/src/phy/ch_estimation/test/refsignal_ul_test_all: /usr/lib/x86_64-linux-gnu/libfftw3f.so
lib/src/phy/ch_estimation/test/refsignal_ul_test_all: lib/src/support/libsupport.a
lib/src/phy/ch_estimation/test/refsignal_ul_test_all: lib/src/srslog/libsrslog.a
lib/src/phy/ch_estimation/test/refsignal_ul_test_all: /usr/lib/x86_64-linux-gnu/libmbedcrypto.so
lib/src/phy/ch_estimation/test/refsignal_ul_test_all: /usr/lib/x86_64-linux-gnu/libsctp.so
lib/src/phy/ch_estimation/test/refsignal_ul_test_all: lib/src/phy/ch_estimation/test/CMakeFiles/refsignal_ul_test_all.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/msudurip1/Documents/srsRAN_modified/srsRAN/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable refsignal_ul_test_all"
	cd /home/msudurip1/Documents/srsRAN_modified/srsRAN/build/lib/src/phy/ch_estimation/test && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/refsignal_ul_test_all.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
lib/src/phy/ch_estimation/test/CMakeFiles/refsignal_ul_test_all.dir/build: lib/src/phy/ch_estimation/test/refsignal_ul_test_all

.PHONY : lib/src/phy/ch_estimation/test/CMakeFiles/refsignal_ul_test_all.dir/build

lib/src/phy/ch_estimation/test/CMakeFiles/refsignal_ul_test_all.dir/clean:
	cd /home/msudurip1/Documents/srsRAN_modified/srsRAN/build/lib/src/phy/ch_estimation/test && $(CMAKE_COMMAND) -P CMakeFiles/refsignal_ul_test_all.dir/cmake_clean.cmake
.PHONY : lib/src/phy/ch_estimation/test/CMakeFiles/refsignal_ul_test_all.dir/clean

lib/src/phy/ch_estimation/test/CMakeFiles/refsignal_ul_test_all.dir/depend:
	cd /home/msudurip1/Documents/srsRAN_modified/srsRAN/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/msudurip1/Documents/srsRAN_modified/srsRAN /home/msudurip1/Documents/srsRAN_modified/srsRAN/lib/src/phy/ch_estimation/test /home/msudurip1/Documents/srsRAN_modified/srsRAN/build /home/msudurip1/Documents/srsRAN_modified/srsRAN/build/lib/src/phy/ch_estimation/test /home/msudurip1/Documents/srsRAN_modified/srsRAN/build/lib/src/phy/ch_estimation/test/CMakeFiles/refsignal_ul_test_all.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : lib/src/phy/ch_estimation/test/CMakeFiles/refsignal_ul_test_all.dir/depend

