# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
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
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/youssef/Desktop/backend/backend/Front/linux

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/youssef/Desktop/backend/backend/Front/linux

# Include any dependencies generated for this target.
include CMakeFiles/bricoloni_v2.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/bricoloni_v2.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/bricoloni_v2.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/bricoloni_v2.dir/flags.make

CMakeFiles/bricoloni_v2.dir/main.cc.o: CMakeFiles/bricoloni_v2.dir/flags.make
CMakeFiles/bricoloni_v2.dir/main.cc.o: main.cc
CMakeFiles/bricoloni_v2.dir/main.cc.o: CMakeFiles/bricoloni_v2.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/youssef/Desktop/backend/backend/Front/linux/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/bricoloni_v2.dir/main.cc.o"
	/usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/bricoloni_v2.dir/main.cc.o -MF CMakeFiles/bricoloni_v2.dir/main.cc.o.d -o CMakeFiles/bricoloni_v2.dir/main.cc.o -c /home/youssef/Desktop/backend/backend/Front/linux/main.cc

CMakeFiles/bricoloni_v2.dir/main.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/bricoloni_v2.dir/main.cc.i"
	/usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/youssef/Desktop/backend/backend/Front/linux/main.cc > CMakeFiles/bricoloni_v2.dir/main.cc.i

CMakeFiles/bricoloni_v2.dir/main.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/bricoloni_v2.dir/main.cc.s"
	/usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/youssef/Desktop/backend/backend/Front/linux/main.cc -o CMakeFiles/bricoloni_v2.dir/main.cc.s

CMakeFiles/bricoloni_v2.dir/my_application.cc.o: CMakeFiles/bricoloni_v2.dir/flags.make
CMakeFiles/bricoloni_v2.dir/my_application.cc.o: my_application.cc
CMakeFiles/bricoloni_v2.dir/my_application.cc.o: CMakeFiles/bricoloni_v2.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/youssef/Desktop/backend/backend/Front/linux/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/bricoloni_v2.dir/my_application.cc.o"
	/usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/bricoloni_v2.dir/my_application.cc.o -MF CMakeFiles/bricoloni_v2.dir/my_application.cc.o.d -o CMakeFiles/bricoloni_v2.dir/my_application.cc.o -c /home/youssef/Desktop/backend/backend/Front/linux/my_application.cc

CMakeFiles/bricoloni_v2.dir/my_application.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/bricoloni_v2.dir/my_application.cc.i"
	/usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/youssef/Desktop/backend/backend/Front/linux/my_application.cc > CMakeFiles/bricoloni_v2.dir/my_application.cc.i

CMakeFiles/bricoloni_v2.dir/my_application.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/bricoloni_v2.dir/my_application.cc.s"
	/usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/youssef/Desktop/backend/backend/Front/linux/my_application.cc -o CMakeFiles/bricoloni_v2.dir/my_application.cc.s

CMakeFiles/bricoloni_v2.dir/flutter/generated_plugin_registrant.cc.o: CMakeFiles/bricoloni_v2.dir/flags.make
CMakeFiles/bricoloni_v2.dir/flutter/generated_plugin_registrant.cc.o: flutter/generated_plugin_registrant.cc
CMakeFiles/bricoloni_v2.dir/flutter/generated_plugin_registrant.cc.o: CMakeFiles/bricoloni_v2.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/youssef/Desktop/backend/backend/Front/linux/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/bricoloni_v2.dir/flutter/generated_plugin_registrant.cc.o"
	/usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/bricoloni_v2.dir/flutter/generated_plugin_registrant.cc.o -MF CMakeFiles/bricoloni_v2.dir/flutter/generated_plugin_registrant.cc.o.d -o CMakeFiles/bricoloni_v2.dir/flutter/generated_plugin_registrant.cc.o -c /home/youssef/Desktop/backend/backend/Front/linux/flutter/generated_plugin_registrant.cc

CMakeFiles/bricoloni_v2.dir/flutter/generated_plugin_registrant.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/bricoloni_v2.dir/flutter/generated_plugin_registrant.cc.i"
	/usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/youssef/Desktop/backend/backend/Front/linux/flutter/generated_plugin_registrant.cc > CMakeFiles/bricoloni_v2.dir/flutter/generated_plugin_registrant.cc.i

CMakeFiles/bricoloni_v2.dir/flutter/generated_plugin_registrant.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/bricoloni_v2.dir/flutter/generated_plugin_registrant.cc.s"
	/usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/youssef/Desktop/backend/backend/Front/linux/flutter/generated_plugin_registrant.cc -o CMakeFiles/bricoloni_v2.dir/flutter/generated_plugin_registrant.cc.s

# Object files for target bricoloni_v2
bricoloni_v2_OBJECTS = \
"CMakeFiles/bricoloni_v2.dir/main.cc.o" \
"CMakeFiles/bricoloni_v2.dir/my_application.cc.o" \
"CMakeFiles/bricoloni_v2.dir/flutter/generated_plugin_registrant.cc.o"

# External object files for target bricoloni_v2
bricoloni_v2_EXTERNAL_OBJECTS =

intermediates_do_not_run/bricoloni_v2: CMakeFiles/bricoloni_v2.dir/main.cc.o
intermediates_do_not_run/bricoloni_v2: CMakeFiles/bricoloni_v2.dir/my_application.cc.o
intermediates_do_not_run/bricoloni_v2: CMakeFiles/bricoloni_v2.dir/flutter/generated_plugin_registrant.cc.o
intermediates_do_not_run/bricoloni_v2: CMakeFiles/bricoloni_v2.dir/build.make
intermediates_do_not_run/bricoloni_v2: plugins/file_selector_linux/libfile_selector_linux_plugin.so
intermediates_do_not_run/bricoloni_v2: flutter/ephemeral/libflutter_linux_gtk.so
intermediates_do_not_run/bricoloni_v2: /usr/lib/x86_64-linux-gnu/libgtk-3.so
intermediates_do_not_run/bricoloni_v2: /usr/lib/x86_64-linux-gnu/libgdk-3.so
intermediates_do_not_run/bricoloni_v2: /usr/lib/x86_64-linux-gnu/libpangocairo-1.0.so
intermediates_do_not_run/bricoloni_v2: /usr/lib/x86_64-linux-gnu/libpango-1.0.so
intermediates_do_not_run/bricoloni_v2: /usr/lib/x86_64-linux-gnu/libharfbuzz.so
intermediates_do_not_run/bricoloni_v2: /usr/lib/x86_64-linux-gnu/libatk-1.0.so
intermediates_do_not_run/bricoloni_v2: /usr/lib/x86_64-linux-gnu/libcairo-gobject.so
intermediates_do_not_run/bricoloni_v2: /usr/lib/x86_64-linux-gnu/libcairo.so
intermediates_do_not_run/bricoloni_v2: /usr/lib/x86_64-linux-gnu/libgdk_pixbuf-2.0.so
intermediates_do_not_run/bricoloni_v2: /usr/lib/x86_64-linux-gnu/libgio-2.0.so
intermediates_do_not_run/bricoloni_v2: /usr/lib/x86_64-linux-gnu/libgobject-2.0.so
intermediates_do_not_run/bricoloni_v2: /usr/lib/x86_64-linux-gnu/libglib-2.0.so
intermediates_do_not_run/bricoloni_v2: CMakeFiles/bricoloni_v2.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/youssef/Desktop/backend/backend/Front/linux/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Linking CXX executable intermediates_do_not_run/bricoloni_v2"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/bricoloni_v2.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/bricoloni_v2.dir/build: intermediates_do_not_run/bricoloni_v2
.PHONY : CMakeFiles/bricoloni_v2.dir/build

CMakeFiles/bricoloni_v2.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/bricoloni_v2.dir/cmake_clean.cmake
.PHONY : CMakeFiles/bricoloni_v2.dir/clean

CMakeFiles/bricoloni_v2.dir/depend:
	cd /home/youssef/Desktop/backend/backend/Front/linux && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/youssef/Desktop/backend/backend/Front/linux /home/youssef/Desktop/backend/backend/Front/linux /home/youssef/Desktop/backend/backend/Front/linux /home/youssef/Desktop/backend/backend/Front/linux /home/youssef/Desktop/backend/backend/Front/linux/CMakeFiles/bricoloni_v2.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/bricoloni_v2.dir/depend

