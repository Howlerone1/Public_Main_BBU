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
include lib/src/phy/common/CMakeFiles/srsran_phy_common.dir/depend.make

# Include the progress variables for this target.
include lib/src/phy/common/CMakeFiles/srsran_phy_common.dir/progress.make

# Include the compile flags for this target's objects.
include lib/src/phy/common/CMakeFiles/srsran_phy_common.dir/flags.make

lib/src/phy/common/CMakeFiles/srsran_phy_common.dir/phy_common.c.o: lib/src/phy/common/CMakeFiles/srsran_phy_common.dir/flags.make
lib/src/phy/common/CMakeFiles/srsran_phy_common.dir/phy_common.c.o: ../lib/src/phy/common/phy_common.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/msudurip1/Documents/srsRAN_modified/srsRAN/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object lib/src/phy/common/CMakeFiles/srsran_phy_common.dir/phy_common.c.o"
	cd /home/msudurip1/Documents/srsRAN_modified/srsRAN/build/lib/src/phy/common && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/srsran_phy_common.dir/phy_common.c.o   -c /home/msudurip1/Documents/srsRAN_modified/srsRAN/lib/src/phy/common/phy_common.c

lib/src/phy/common/CMakeFiles/srsran_phy_common.dir/phy_common.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/srsran_phy_common.dir/phy_common.c.i"
	cd /home/msudurip1/Documents/srsRAN_modified/srsRAN/build/lib/src/phy/common && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/msudurip1/Documents/srsRAN_modified/srsRAN/lib/src/phy/common/phy_common.c > CMakeFiles/srsran_phy_common.dir/phy_common.c.i

lib/src/phy/common/CMakeFiles/srsran_phy_common.dir/phy_common.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/srsran_phy_common.dir/phy_common.c.s"
	cd /home/msudurip1/Documents/srsRAN_modified/srsRAN/build/lib/src/phy/common && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/msudurip1/Documents/srsRAN_modified/srsRAN/lib/src/phy/common/phy_common.c -o CMakeFiles/srsran_phy_common.dir/phy_common.c.s

lib/src/phy/common/CMakeFiles/srsran_phy_common.dir/phy_common_sl.c.o: lib/src/phy/common/CMakeFiles/srsran_phy_common.dir/flags.make
lib/src/phy/common/CMakeFiles/srsran_phy_common.dir/phy_common_sl.c.o: ../lib/src/phy/common/phy_common_sl.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/msudurip1/Documents/srsRAN_modified/srsRAN/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object lib/src/phy/common/CMakeFiles/srsran_phy_common.dir/phy_common_sl.c.o"
	cd /home/msudurip1/Documents/srsRAN_modified/srsRAN/build/lib/src/phy/common && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/srsran_phy_common.dir/phy_common_sl.c.o   -c /home/msudurip1/Documents/srsRAN_modified/srsRAN/lib/src/phy/common/phy_common_sl.c

lib/src/phy/common/CMakeFiles/srsran_phy_common.dir/phy_common_sl.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/srsran_phy_common.dir/phy_common_sl.c.i"
	cd /home/msudurip1/Documents/srsRAN_modified/srsRAN/build/lib/src/phy/common && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/msudurip1/Documents/srsRAN_modified/srsRAN/lib/src/phy/common/phy_common_sl.c > CMakeFiles/srsran_phy_common.dir/phy_common_sl.c.i

lib/src/phy/common/CMakeFiles/srsran_phy_common.dir/phy_common_sl.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/srsran_phy_common.dir/phy_common_sl.c.s"
	cd /home/msudurip1/Documents/srsRAN_modified/srsRAN/build/lib/src/phy/common && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/msudurip1/Documents/srsRAN_modified/srsRAN/lib/src/phy/common/phy_common_sl.c -o CMakeFiles/srsran_phy_common.dir/phy_common_sl.c.s

lib/src/phy/common/CMakeFiles/srsran_phy_common.dir/phy_common_nr.c.o: lib/src/phy/common/CMakeFiles/srsran_phy_common.dir/flags.make
lib/src/phy/common/CMakeFiles/srsran_phy_common.dir/phy_common_nr.c.o: ../lib/src/phy/common/phy_common_nr.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/msudurip1/Documents/srsRAN_modified/srsRAN/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object lib/src/phy/common/CMakeFiles/srsran_phy_common.dir/phy_common_nr.c.o"
	cd /home/msudurip1/Documents/srsRAN_modified/srsRAN/build/lib/src/phy/common && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/srsran_phy_common.dir/phy_common_nr.c.o   -c /home/msudurip1/Documents/srsRAN_modified/srsRAN/lib/src/phy/common/phy_common_nr.c

lib/src/phy/common/CMakeFiles/srsran_phy_common.dir/phy_common_nr.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/srsran_phy_common.dir/phy_common_nr.c.i"
	cd /home/msudurip1/Documents/srsRAN_modified/srsRAN/build/lib/src/phy/common && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/msudurip1/Documents/srsRAN_modified/srsRAN/lib/src/phy/common/phy_common_nr.c > CMakeFiles/srsran_phy_common.dir/phy_common_nr.c.i

lib/src/phy/common/CMakeFiles/srsran_phy_common.dir/phy_common_nr.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/srsran_phy_common.dir/phy_common_nr.c.s"
	cd /home/msudurip1/Documents/srsRAN_modified/srsRAN/build/lib/src/phy/common && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/msudurip1/Documents/srsRAN_modified/srsRAN/lib/src/phy/common/phy_common_nr.c -o CMakeFiles/srsran_phy_common.dir/phy_common_nr.c.s

lib/src/phy/common/CMakeFiles/srsran_phy_common.dir/sequence.c.o: lib/src/phy/common/CMakeFiles/srsran_phy_common.dir/flags.make
lib/src/phy/common/CMakeFiles/srsran_phy_common.dir/sequence.c.o: ../lib/src/phy/common/sequence.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/msudurip1/Documents/srsRAN_modified/srsRAN/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building C object lib/src/phy/common/CMakeFiles/srsran_phy_common.dir/sequence.c.o"
	cd /home/msudurip1/Documents/srsRAN_modified/srsRAN/build/lib/src/phy/common && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/srsran_phy_common.dir/sequence.c.o   -c /home/msudurip1/Documents/srsRAN_modified/srsRAN/lib/src/phy/common/sequence.c

lib/src/phy/common/CMakeFiles/srsran_phy_common.dir/sequence.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/srsran_phy_common.dir/sequence.c.i"
	cd /home/msudurip1/Documents/srsRAN_modified/srsRAN/build/lib/src/phy/common && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/msudurip1/Documents/srsRAN_modified/srsRAN/lib/src/phy/common/sequence.c > CMakeFiles/srsran_phy_common.dir/sequence.c.i

lib/src/phy/common/CMakeFiles/srsran_phy_common.dir/sequence.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/srsran_phy_common.dir/sequence.c.s"
	cd /home/msudurip1/Documents/srsRAN_modified/srsRAN/build/lib/src/phy/common && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/msudurip1/Documents/srsRAN_modified/srsRAN/lib/src/phy/common/sequence.c -o CMakeFiles/srsran_phy_common.dir/sequence.c.s

lib/src/phy/common/CMakeFiles/srsran_phy_common.dir/timestamp.c.o: lib/src/phy/common/CMakeFiles/srsran_phy_common.dir/flags.make
lib/src/phy/common/CMakeFiles/srsran_phy_common.dir/timestamp.c.o: ../lib/src/phy/common/timestamp.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/msudurip1/Documents/srsRAN_modified/srsRAN/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building C object lib/src/phy/common/CMakeFiles/srsran_phy_common.dir/timestamp.c.o"
	cd /home/msudurip1/Documents/srsRAN_modified/srsRAN/build/lib/src/phy/common && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/srsran_phy_common.dir/timestamp.c.o   -c /home/msudurip1/Documents/srsRAN_modified/srsRAN/lib/src/phy/common/timestamp.c

lib/src/phy/common/CMakeFiles/srsran_phy_common.dir/timestamp.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/srsran_phy_common.dir/timestamp.c.i"
	cd /home/msudurip1/Documents/srsRAN_modified/srsRAN/build/lib/src/phy/common && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/msudurip1/Documents/srsRAN_modified/srsRAN/lib/src/phy/common/timestamp.c > CMakeFiles/srsran_phy_common.dir/timestamp.c.i

lib/src/phy/common/CMakeFiles/srsran_phy_common.dir/timestamp.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/srsran_phy_common.dir/timestamp.c.s"
	cd /home/msudurip1/Documents/srsRAN_modified/srsRAN/build/lib/src/phy/common && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/msudurip1/Documents/srsRAN_modified/srsRAN/lib/src/phy/common/timestamp.c -o CMakeFiles/srsran_phy_common.dir/timestamp.c.s

lib/src/phy/common/CMakeFiles/srsran_phy_common.dir/zc_sequence.c.o: lib/src/phy/common/CMakeFiles/srsran_phy_common.dir/flags.make
lib/src/phy/common/CMakeFiles/srsran_phy_common.dir/zc_sequence.c.o: ../lib/src/phy/common/zc_sequence.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/msudurip1/Documents/srsRAN_modified/srsRAN/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building C object lib/src/phy/common/CMakeFiles/srsran_phy_common.dir/zc_sequence.c.o"
	cd /home/msudurip1/Documents/srsRAN_modified/srsRAN/build/lib/src/phy/common && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/srsran_phy_common.dir/zc_sequence.c.o   -c /home/msudurip1/Documents/srsRAN_modified/srsRAN/lib/src/phy/common/zc_sequence.c

lib/src/phy/common/CMakeFiles/srsran_phy_common.dir/zc_sequence.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/srsran_phy_common.dir/zc_sequence.c.i"
	cd /home/msudurip1/Documents/srsRAN_modified/srsRAN/build/lib/src/phy/common && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/msudurip1/Documents/srsRAN_modified/srsRAN/lib/src/phy/common/zc_sequence.c > CMakeFiles/srsran_phy_common.dir/zc_sequence.c.i

lib/src/phy/common/CMakeFiles/srsran_phy_common.dir/zc_sequence.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/srsran_phy_common.dir/zc_sequence.c.s"
	cd /home/msudurip1/Documents/srsRAN_modified/srsRAN/build/lib/src/phy/common && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/msudurip1/Documents/srsRAN_modified/srsRAN/lib/src/phy/common/zc_sequence.c -o CMakeFiles/srsran_phy_common.dir/zc_sequence.c.s

lib/src/phy/common/CMakeFiles/srsran_phy_common.dir/sliv.c.o: lib/src/phy/common/CMakeFiles/srsran_phy_common.dir/flags.make
lib/src/phy/common/CMakeFiles/srsran_phy_common.dir/sliv.c.o: ../lib/src/phy/common/sliv.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/msudurip1/Documents/srsRAN_modified/srsRAN/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building C object lib/src/phy/common/CMakeFiles/srsran_phy_common.dir/sliv.c.o"
	cd /home/msudurip1/Documents/srsRAN_modified/srsRAN/build/lib/src/phy/common && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/srsran_phy_common.dir/sliv.c.o   -c /home/msudurip1/Documents/srsRAN_modified/srsRAN/lib/src/phy/common/sliv.c

lib/src/phy/common/CMakeFiles/srsran_phy_common.dir/sliv.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/srsran_phy_common.dir/sliv.c.i"
	cd /home/msudurip1/Documents/srsRAN_modified/srsRAN/build/lib/src/phy/common && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/msudurip1/Documents/srsRAN_modified/srsRAN/lib/src/phy/common/sliv.c > CMakeFiles/srsran_phy_common.dir/sliv.c.i

lib/src/phy/common/CMakeFiles/srsran_phy_common.dir/sliv.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/srsran_phy_common.dir/sliv.c.s"
	cd /home/msudurip1/Documents/srsRAN_modified/srsRAN/build/lib/src/phy/common && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/msudurip1/Documents/srsRAN_modified/srsRAN/lib/src/phy/common/sliv.c -o CMakeFiles/srsran_phy_common.dir/sliv.c.s

srsran_phy_common: lib/src/phy/common/CMakeFiles/srsran_phy_common.dir/phy_common.c.o
srsran_phy_common: lib/src/phy/common/CMakeFiles/srsran_phy_common.dir/phy_common_sl.c.o
srsran_phy_common: lib/src/phy/common/CMakeFiles/srsran_phy_common.dir/phy_common_nr.c.o
srsran_phy_common: lib/src/phy/common/CMakeFiles/srsran_phy_common.dir/sequence.c.o
srsran_phy_common: lib/src/phy/common/CMakeFiles/srsran_phy_common.dir/timestamp.c.o
srsran_phy_common: lib/src/phy/common/CMakeFiles/srsran_phy_common.dir/zc_sequence.c.o
srsran_phy_common: lib/src/phy/common/CMakeFiles/srsran_phy_common.dir/sliv.c.o
srsran_phy_common: lib/src/phy/common/CMakeFiles/srsran_phy_common.dir/build.make

.PHONY : srsran_phy_common

# Rule to build all files generated by this target.
lib/src/phy/common/CMakeFiles/srsran_phy_common.dir/build: srsran_phy_common

.PHONY : lib/src/phy/common/CMakeFiles/srsran_phy_common.dir/build

lib/src/phy/common/CMakeFiles/srsran_phy_common.dir/clean:
	cd /home/msudurip1/Documents/srsRAN_modified/srsRAN/build/lib/src/phy/common && $(CMAKE_COMMAND) -P CMakeFiles/srsran_phy_common.dir/cmake_clean.cmake
.PHONY : lib/src/phy/common/CMakeFiles/srsran_phy_common.dir/clean

lib/src/phy/common/CMakeFiles/srsran_phy_common.dir/depend:
	cd /home/msudurip1/Documents/srsRAN_modified/srsRAN/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/msudurip1/Documents/srsRAN_modified/srsRAN /home/msudurip1/Documents/srsRAN_modified/srsRAN/lib/src/phy/common /home/msudurip1/Documents/srsRAN_modified/srsRAN/build /home/msudurip1/Documents/srsRAN_modified/srsRAN/build/lib/src/phy/common /home/msudurip1/Documents/srsRAN_modified/srsRAN/build/lib/src/phy/common/CMakeFiles/srsran_phy_common.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : lib/src/phy/common/CMakeFiles/srsran_phy_common.dir/depend

