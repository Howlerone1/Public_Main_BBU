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
include lib/src/phy/agc/CMakeFiles/srsran_agc.dir/depend.make

# Include the progress variables for this target.
include lib/src/phy/agc/CMakeFiles/srsran_agc.dir/progress.make

# Include the compile flags for this target's objects.
include lib/src/phy/agc/CMakeFiles/srsran_agc.dir/flags.make

lib/src/phy/agc/CMakeFiles/srsran_agc.dir/agc.c.o: lib/src/phy/agc/CMakeFiles/srsran_agc.dir/flags.make
lib/src/phy/agc/CMakeFiles/srsran_agc.dir/agc.c.o: ../lib/src/phy/agc/agc.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/msudurip1/Documents/srsRAN_modified/srsRAN/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object lib/src/phy/agc/CMakeFiles/srsran_agc.dir/agc.c.o"
	cd /home/msudurip1/Documents/srsRAN_modified/srsRAN/build/lib/src/phy/agc && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/srsran_agc.dir/agc.c.o   -c /home/msudurip1/Documents/srsRAN_modified/srsRAN/lib/src/phy/agc/agc.c

lib/src/phy/agc/CMakeFiles/srsran_agc.dir/agc.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/srsran_agc.dir/agc.c.i"
	cd /home/msudurip1/Documents/srsRAN_modified/srsRAN/build/lib/src/phy/agc && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/msudurip1/Documents/srsRAN_modified/srsRAN/lib/src/phy/agc/agc.c > CMakeFiles/srsran_agc.dir/agc.c.i

lib/src/phy/agc/CMakeFiles/srsran_agc.dir/agc.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/srsran_agc.dir/agc.c.s"
	cd /home/msudurip1/Documents/srsRAN_modified/srsRAN/build/lib/src/phy/agc && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/msudurip1/Documents/srsRAN_modified/srsRAN/lib/src/phy/agc/agc.c -o CMakeFiles/srsran_agc.dir/agc.c.s

srsran_agc: lib/src/phy/agc/CMakeFiles/srsran_agc.dir/agc.c.o
srsran_agc: lib/src/phy/agc/CMakeFiles/srsran_agc.dir/build.make

.PHONY : srsran_agc

# Rule to build all files generated by this target.
lib/src/phy/agc/CMakeFiles/srsran_agc.dir/build: srsran_agc

.PHONY : lib/src/phy/agc/CMakeFiles/srsran_agc.dir/build

lib/src/phy/agc/CMakeFiles/srsran_agc.dir/clean:
	cd /home/msudurip1/Documents/srsRAN_modified/srsRAN/build/lib/src/phy/agc && $(CMAKE_COMMAND) -P CMakeFiles/srsran_agc.dir/cmake_clean.cmake
.PHONY : lib/src/phy/agc/CMakeFiles/srsran_agc.dir/clean

lib/src/phy/agc/CMakeFiles/srsran_agc.dir/depend:
	cd /home/msudurip1/Documents/srsRAN_modified/srsRAN/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/msudurip1/Documents/srsRAN_modified/srsRAN /home/msudurip1/Documents/srsRAN_modified/srsRAN/lib/src/phy/agc /home/msudurip1/Documents/srsRAN_modified/srsRAN/build /home/msudurip1/Documents/srsRAN_modified/srsRAN/build/lib/src/phy/agc /home/msudurip1/Documents/srsRAN_modified/srsRAN/build/lib/src/phy/agc/CMakeFiles/srsran_agc.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : lib/src/phy/agc/CMakeFiles/srsran_agc.dir/depend

