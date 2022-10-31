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
include lib/examples/CMakeFiles/cell_search_nbiot.dir/depend.make

# Include the progress variables for this target.
include lib/examples/CMakeFiles/cell_search_nbiot.dir/progress.make

# Include the compile flags for this target's objects.
include lib/examples/CMakeFiles/cell_search_nbiot.dir/flags.make

lib/examples/CMakeFiles/cell_search_nbiot.dir/cell_search_nbiot.c.o: lib/examples/CMakeFiles/cell_search_nbiot.dir/flags.make
lib/examples/CMakeFiles/cell_search_nbiot.dir/cell_search_nbiot.c.o: ../lib/examples/cell_search_nbiot.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/msudurip1/Documents/srsRAN_modified/srsRAN/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object lib/examples/CMakeFiles/cell_search_nbiot.dir/cell_search_nbiot.c.o"
	cd /home/msudurip1/Documents/srsRAN_modified/srsRAN/build/lib/examples && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/cell_search_nbiot.dir/cell_search_nbiot.c.o   -c /home/msudurip1/Documents/srsRAN_modified/srsRAN/lib/examples/cell_search_nbiot.c

lib/examples/CMakeFiles/cell_search_nbiot.dir/cell_search_nbiot.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/cell_search_nbiot.dir/cell_search_nbiot.c.i"
	cd /home/msudurip1/Documents/srsRAN_modified/srsRAN/build/lib/examples && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/msudurip1/Documents/srsRAN_modified/srsRAN/lib/examples/cell_search_nbiot.c > CMakeFiles/cell_search_nbiot.dir/cell_search_nbiot.c.i

lib/examples/CMakeFiles/cell_search_nbiot.dir/cell_search_nbiot.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/cell_search_nbiot.dir/cell_search_nbiot.c.s"
	cd /home/msudurip1/Documents/srsRAN_modified/srsRAN/build/lib/examples && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/msudurip1/Documents/srsRAN_modified/srsRAN/lib/examples/cell_search_nbiot.c -o CMakeFiles/cell_search_nbiot.dir/cell_search_nbiot.c.s

# Object files for target cell_search_nbiot
cell_search_nbiot_OBJECTS = \
"CMakeFiles/cell_search_nbiot.dir/cell_search_nbiot.c.o"

# External object files for target cell_search_nbiot
cell_search_nbiot_EXTERNAL_OBJECTS =

lib/examples/cell_search_nbiot: lib/examples/CMakeFiles/cell_search_nbiot.dir/cell_search_nbiot.c.o
lib/examples/cell_search_nbiot: lib/examples/CMakeFiles/cell_search_nbiot.dir/build.make
lib/examples/cell_search_nbiot: lib/src/phy/rf/libsrsran_rf.so.22.04.1
lib/examples/cell_search_nbiot: lib/src/phy/libsrsran_phy.a
lib/examples/cell_search_nbiot: lib/src/phy/rf/libsrsran_rf_utils.a
lib/examples/cell_search_nbiot: lib/src/phy/libsrsran_phy.a
lib/examples/cell_search_nbiot: /usr/lib/x86_64-linux-gnu/libfftw3f.so
lib/examples/cell_search_nbiot: lib/examples/CMakeFiles/cell_search_nbiot.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/msudurip1/Documents/srsRAN_modified/srsRAN/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable cell_search_nbiot"
	cd /home/msudurip1/Documents/srsRAN_modified/srsRAN/build/lib/examples && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/cell_search_nbiot.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
lib/examples/CMakeFiles/cell_search_nbiot.dir/build: lib/examples/cell_search_nbiot

.PHONY : lib/examples/CMakeFiles/cell_search_nbiot.dir/build

lib/examples/CMakeFiles/cell_search_nbiot.dir/clean:
	cd /home/msudurip1/Documents/srsRAN_modified/srsRAN/build/lib/examples && $(CMAKE_COMMAND) -P CMakeFiles/cell_search_nbiot.dir/cmake_clean.cmake
.PHONY : lib/examples/CMakeFiles/cell_search_nbiot.dir/clean

lib/examples/CMakeFiles/cell_search_nbiot.dir/depend:
	cd /home/msudurip1/Documents/srsRAN_modified/srsRAN/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/msudurip1/Documents/srsRAN_modified/srsRAN /home/msudurip1/Documents/srsRAN_modified/srsRAN/lib/examples /home/msudurip1/Documents/srsRAN_modified/srsRAN/build /home/msudurip1/Documents/srsRAN_modified/srsRAN/build/lib/examples /home/msudurip1/Documents/srsRAN_modified/srsRAN/build/lib/examples/CMakeFiles/cell_search_nbiot.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : lib/examples/CMakeFiles/cell_search_nbiot.dir/depend

