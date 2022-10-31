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
include lib/src/phy/resampling/CMakeFiles/srsran_resampling.dir/depend.make

# Include the progress variables for this target.
include lib/src/phy/resampling/CMakeFiles/srsran_resampling.dir/progress.make

# Include the compile flags for this target's objects.
include lib/src/phy/resampling/CMakeFiles/srsran_resampling.dir/flags.make

lib/src/phy/resampling/CMakeFiles/srsran_resampling.dir/decim.c.o: lib/src/phy/resampling/CMakeFiles/srsran_resampling.dir/flags.make
lib/src/phy/resampling/CMakeFiles/srsran_resampling.dir/decim.c.o: ../lib/src/phy/resampling/decim.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/msudurip1/Documents/srsRAN_modified/srsRAN/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object lib/src/phy/resampling/CMakeFiles/srsran_resampling.dir/decim.c.o"
	cd /home/msudurip1/Documents/srsRAN_modified/srsRAN/build/lib/src/phy/resampling && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/srsran_resampling.dir/decim.c.o   -c /home/msudurip1/Documents/srsRAN_modified/srsRAN/lib/src/phy/resampling/decim.c

lib/src/phy/resampling/CMakeFiles/srsran_resampling.dir/decim.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/srsran_resampling.dir/decim.c.i"
	cd /home/msudurip1/Documents/srsRAN_modified/srsRAN/build/lib/src/phy/resampling && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/msudurip1/Documents/srsRAN_modified/srsRAN/lib/src/phy/resampling/decim.c > CMakeFiles/srsran_resampling.dir/decim.c.i

lib/src/phy/resampling/CMakeFiles/srsran_resampling.dir/decim.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/srsran_resampling.dir/decim.c.s"
	cd /home/msudurip1/Documents/srsRAN_modified/srsRAN/build/lib/src/phy/resampling && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/msudurip1/Documents/srsRAN_modified/srsRAN/lib/src/phy/resampling/decim.c -o CMakeFiles/srsran_resampling.dir/decim.c.s

lib/src/phy/resampling/CMakeFiles/srsran_resampling.dir/interp.c.o: lib/src/phy/resampling/CMakeFiles/srsran_resampling.dir/flags.make
lib/src/phy/resampling/CMakeFiles/srsran_resampling.dir/interp.c.o: ../lib/src/phy/resampling/interp.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/msudurip1/Documents/srsRAN_modified/srsRAN/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object lib/src/phy/resampling/CMakeFiles/srsran_resampling.dir/interp.c.o"
	cd /home/msudurip1/Documents/srsRAN_modified/srsRAN/build/lib/src/phy/resampling && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/srsran_resampling.dir/interp.c.o   -c /home/msudurip1/Documents/srsRAN_modified/srsRAN/lib/src/phy/resampling/interp.c

lib/src/phy/resampling/CMakeFiles/srsran_resampling.dir/interp.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/srsran_resampling.dir/interp.c.i"
	cd /home/msudurip1/Documents/srsRAN_modified/srsRAN/build/lib/src/phy/resampling && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/msudurip1/Documents/srsRAN_modified/srsRAN/lib/src/phy/resampling/interp.c > CMakeFiles/srsran_resampling.dir/interp.c.i

lib/src/phy/resampling/CMakeFiles/srsran_resampling.dir/interp.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/srsran_resampling.dir/interp.c.s"
	cd /home/msudurip1/Documents/srsRAN_modified/srsRAN/build/lib/src/phy/resampling && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/msudurip1/Documents/srsRAN_modified/srsRAN/lib/src/phy/resampling/interp.c -o CMakeFiles/srsran_resampling.dir/interp.c.s

lib/src/phy/resampling/CMakeFiles/srsran_resampling.dir/resample_arb.c.o: lib/src/phy/resampling/CMakeFiles/srsran_resampling.dir/flags.make
lib/src/phy/resampling/CMakeFiles/srsran_resampling.dir/resample_arb.c.o: ../lib/src/phy/resampling/resample_arb.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/msudurip1/Documents/srsRAN_modified/srsRAN/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object lib/src/phy/resampling/CMakeFiles/srsran_resampling.dir/resample_arb.c.o"
	cd /home/msudurip1/Documents/srsRAN_modified/srsRAN/build/lib/src/phy/resampling && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/srsran_resampling.dir/resample_arb.c.o   -c /home/msudurip1/Documents/srsRAN_modified/srsRAN/lib/src/phy/resampling/resample_arb.c

lib/src/phy/resampling/CMakeFiles/srsran_resampling.dir/resample_arb.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/srsran_resampling.dir/resample_arb.c.i"
	cd /home/msudurip1/Documents/srsRAN_modified/srsRAN/build/lib/src/phy/resampling && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/msudurip1/Documents/srsRAN_modified/srsRAN/lib/src/phy/resampling/resample_arb.c > CMakeFiles/srsran_resampling.dir/resample_arb.c.i

lib/src/phy/resampling/CMakeFiles/srsran_resampling.dir/resample_arb.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/srsran_resampling.dir/resample_arb.c.s"
	cd /home/msudurip1/Documents/srsRAN_modified/srsRAN/build/lib/src/phy/resampling && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/msudurip1/Documents/srsRAN_modified/srsRAN/lib/src/phy/resampling/resample_arb.c -o CMakeFiles/srsran_resampling.dir/resample_arb.c.s

lib/src/phy/resampling/CMakeFiles/srsran_resampling.dir/resampler.c.o: lib/src/phy/resampling/CMakeFiles/srsran_resampling.dir/flags.make
lib/src/phy/resampling/CMakeFiles/srsran_resampling.dir/resampler.c.o: ../lib/src/phy/resampling/resampler.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/msudurip1/Documents/srsRAN_modified/srsRAN/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building C object lib/src/phy/resampling/CMakeFiles/srsran_resampling.dir/resampler.c.o"
	cd /home/msudurip1/Documents/srsRAN_modified/srsRAN/build/lib/src/phy/resampling && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/srsran_resampling.dir/resampler.c.o   -c /home/msudurip1/Documents/srsRAN_modified/srsRAN/lib/src/phy/resampling/resampler.c

lib/src/phy/resampling/CMakeFiles/srsran_resampling.dir/resampler.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/srsran_resampling.dir/resampler.c.i"
	cd /home/msudurip1/Documents/srsRAN_modified/srsRAN/build/lib/src/phy/resampling && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/msudurip1/Documents/srsRAN_modified/srsRAN/lib/src/phy/resampling/resampler.c > CMakeFiles/srsran_resampling.dir/resampler.c.i

lib/src/phy/resampling/CMakeFiles/srsran_resampling.dir/resampler.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/srsran_resampling.dir/resampler.c.s"
	cd /home/msudurip1/Documents/srsRAN_modified/srsRAN/build/lib/src/phy/resampling && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/msudurip1/Documents/srsRAN_modified/srsRAN/lib/src/phy/resampling/resampler.c -o CMakeFiles/srsran_resampling.dir/resampler.c.s

srsran_resampling: lib/src/phy/resampling/CMakeFiles/srsran_resampling.dir/decim.c.o
srsran_resampling: lib/src/phy/resampling/CMakeFiles/srsran_resampling.dir/interp.c.o
srsran_resampling: lib/src/phy/resampling/CMakeFiles/srsran_resampling.dir/resample_arb.c.o
srsran_resampling: lib/src/phy/resampling/CMakeFiles/srsran_resampling.dir/resampler.c.o
srsran_resampling: lib/src/phy/resampling/CMakeFiles/srsran_resampling.dir/build.make

.PHONY : srsran_resampling

# Rule to build all files generated by this target.
lib/src/phy/resampling/CMakeFiles/srsran_resampling.dir/build: srsran_resampling

.PHONY : lib/src/phy/resampling/CMakeFiles/srsran_resampling.dir/build

lib/src/phy/resampling/CMakeFiles/srsran_resampling.dir/clean:
	cd /home/msudurip1/Documents/srsRAN_modified/srsRAN/build/lib/src/phy/resampling && $(CMAKE_COMMAND) -P CMakeFiles/srsran_resampling.dir/cmake_clean.cmake
.PHONY : lib/src/phy/resampling/CMakeFiles/srsran_resampling.dir/clean

lib/src/phy/resampling/CMakeFiles/srsran_resampling.dir/depend:
	cd /home/msudurip1/Documents/srsRAN_modified/srsRAN/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/msudurip1/Documents/srsRAN_modified/srsRAN /home/msudurip1/Documents/srsRAN_modified/srsRAN/lib/src/phy/resampling /home/msudurip1/Documents/srsRAN_modified/srsRAN/build /home/msudurip1/Documents/srsRAN_modified/srsRAN/build/lib/src/phy/resampling /home/msudurip1/Documents/srsRAN_modified/srsRAN/build/lib/src/phy/resampling/CMakeFiles/srsran_resampling.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : lib/src/phy/resampling/CMakeFiles/srsran_resampling.dir/depend

