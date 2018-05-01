# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.6

# Default target executed when no arguments are given to make.
default_target: all

.PHONY : default_target

# Allow only one "make -f Makefile2" at a time, but pass parallelism.
.NOTPARALLEL:


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
CMAKE_SOURCE_DIR = /home/pi/boost_1_64_0/mysql-connector-c++-1.1.9

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/pi/boost_1_64_0/mysql-connector-c++-1.1.9

#=============================================================================
# Targets provided globally by CMake.

# Special rule for the target package
package: preinstall
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "Run CPack packaging tool..."
	/usr/bin/cpack --config ./CPackConfig.cmake
.PHONY : package

# Special rule for the target package
package/fast: package

.PHONY : package/fast

# Special rule for the target package_source
package_source:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "Run CPack packaging tool for source..."
	/usr/bin/cpack --config ./CPackSourceConfig.cmake /home/pi/boost_1_64_0/mysql-connector-c++-1.1.9/CPackSourceConfig.cmake
.PHONY : package_source

# Special rule for the target package_source
package_source/fast: package_source

.PHONY : package_source/fast

# Special rule for the target edit_cache
edit_cache:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "No interactive CMake dialog available..."
	/usr/bin/cmake -E echo No\ interactive\ CMake\ dialog\ available.
.PHONY : edit_cache

# Special rule for the target edit_cache
edit_cache/fast: edit_cache

.PHONY : edit_cache/fast

# Special rule for the target install/strip
install/strip: preinstall
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "Installing the project stripped..."
	/usr/bin/cmake -DCMAKE_INSTALL_DO_STRIP=1 -P cmake_install.cmake
.PHONY : install/strip

# Special rule for the target install/strip
install/strip/fast: install/strip

.PHONY : install/strip/fast

# Special rule for the target rebuild_cache
rebuild_cache:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "Running CMake to regenerate build system..."
	/usr/bin/cmake -H$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR)
.PHONY : rebuild_cache

# Special rule for the target rebuild_cache
rebuild_cache/fast: rebuild_cache

.PHONY : rebuild_cache/fast

# Special rule for the target list_install_components
list_install_components:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "Available install components are: \"Unspecified\""
.PHONY : list_install_components

# Special rule for the target list_install_components
list_install_components/fast: list_install_components

.PHONY : list_install_components/fast

# Special rule for the target install
install: preinstall
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "Install the project..."
	/usr/bin/cmake -P cmake_install.cmake
.PHONY : install

# Special rule for the target install
install/fast: preinstall/fast
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "Install the project..."
	/usr/bin/cmake -P cmake_install.cmake
.PHONY : install/fast

# Special rule for the target install/local
install/local: preinstall
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "Installing only the local directory..."
	/usr/bin/cmake -DCMAKE_INSTALL_LOCAL_ONLY=1 -P cmake_install.cmake
.PHONY : install/local

# Special rule for the target install/local
install/local/fast: install/local

.PHONY : install/local/fast

# The main all target
all: cmake_check_build_system
	$(CMAKE_COMMAND) -E cmake_progress_start /home/pi/boost_1_64_0/mysql-connector-c++-1.1.9/CMakeFiles /home/pi/boost_1_64_0/mysql-connector-c++-1.1.9/CMakeFiles/progress.marks
	$(MAKE) -f CMakeFiles/Makefile2 all
	$(CMAKE_COMMAND) -E cmake_progress_start /home/pi/boost_1_64_0/mysql-connector-c++-1.1.9/CMakeFiles 0
.PHONY : all

# The main clean target
clean:
	$(MAKE) -f CMakeFiles/Makefile2 clean
.PHONY : clean

# The main clean target
clean/fast: clean

.PHONY : clean/fast

# Prepare targets for installation.
preinstall: all
	$(MAKE) -f CMakeFiles/Makefile2 preinstall
.PHONY : preinstall

# Prepare targets for installation.
preinstall/fast:
	$(MAKE) -f CMakeFiles/Makefile2 preinstall
.PHONY : preinstall/fast

# clear depends
depend:
	$(CMAKE_COMMAND) -H$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR) --check-build-system CMakeFiles/Makefile.cmake 1
.PHONY : depend

#=============================================================================
# Target rules for targets named mysqlcppconn-static

# Build rule for target.
mysqlcppconn-static: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 mysqlcppconn-static
.PHONY : mysqlcppconn-static

# fast build rule for target.
mysqlcppconn-static/fast:
	$(MAKE) -f driver/CMakeFiles/mysqlcppconn-static.dir/build.make driver/CMakeFiles/mysqlcppconn-static.dir/build
.PHONY : mysqlcppconn-static/fast

#=============================================================================
# Target rules for targets named mysqlcppconn

# Build rule for target.
mysqlcppconn: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 mysqlcppconn
.PHONY : mysqlcppconn

# fast build rule for target.
mysqlcppconn/fast:
	$(MAKE) -f driver/CMakeFiles/mysqlcppconn.dir/build.make driver/CMakeFiles/mysqlcppconn.dir/build
.PHONY : mysqlcppconn/fast

#=============================================================================
# Target rules for targets named dynamic_load

# Build rule for target.
dynamic_load: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 dynamic_load
.PHONY : dynamic_load

# fast build rule for target.
dynamic_load/fast:
	$(MAKE) -f examples/CMakeFiles/dynamic_load.dir/build.make examples/CMakeFiles/dynamic_load.dir/build
.PHONY : dynamic_load/fast

#=============================================================================
# Target rules for targets named connect

# Build rule for target.
connect: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 connect
.PHONY : connect

# fast build rule for target.
connect/fast:
	$(MAKE) -f examples/CMakeFiles/connect.dir/build.make examples/CMakeFiles/connect.dir/build
.PHONY : connect/fast

#=============================================================================
# Target rules for targets named debug_output

# Build rule for target.
debug_output: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 debug_output
.PHONY : debug_output

# fast build rule for target.
debug_output/fast:
	$(MAKE) -f examples/CMakeFiles/debug_output.dir/build.make examples/CMakeFiles/debug_output.dir/build
.PHONY : debug_output/fast

#=============================================================================
# Target rules for targets named connection_meta_schemaobj

# Build rule for target.
connection_meta_schemaobj: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 connection_meta_schemaobj
.PHONY : connection_meta_schemaobj

# fast build rule for target.
connection_meta_schemaobj/fast:
	$(MAKE) -f examples/CMakeFiles/connection_meta_schemaobj.dir/build.make examples/CMakeFiles/connection_meta_schemaobj.dir/build
.PHONY : connection_meta_schemaobj/fast

#=============================================================================
# Target rules for targets named prepared_statement

# Build rule for target.
prepared_statement: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 prepared_statement
.PHONY : prepared_statement

# fast build rule for target.
prepared_statement/fast:
	$(MAKE) -f examples/CMakeFiles/prepared_statement.dir/build.make examples/CMakeFiles/prepared_statement.dir/build
.PHONY : prepared_statement/fast

#=============================================================================
# Target rules for targets named resultset_types

# Build rule for target.
resultset_types: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 resultset_types
.PHONY : resultset_types

# fast build rule for target.
resultset_types/fast:
	$(MAKE) -f examples/CMakeFiles/resultset_types.dir/build.make examples/CMakeFiles/resultset_types.dir/build
.PHONY : resultset_types/fast

#=============================================================================
# Target rules for targets named resultset

# Build rule for target.
resultset: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 resultset
.PHONY : resultset

# fast build rule for target.
resultset/fast:
	$(MAKE) -f examples/CMakeFiles/resultset.dir/build.make examples/CMakeFiles/resultset.dir/build
.PHONY : resultset/fast

#=============================================================================
# Target rules for targets named resultset_meta

# Build rule for target.
resultset_meta: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 resultset_meta
.PHONY : resultset_meta

# fast build rule for target.
resultset_meta/fast:
	$(MAKE) -f examples/CMakeFiles/resultset_meta.dir/build.make examples/CMakeFiles/resultset_meta.dir/build
.PHONY : resultset_meta/fast

#=============================================================================
# Target rules for targets named exceptions

# Build rule for target.
exceptions: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 exceptions
.PHONY : exceptions

# fast build rule for target.
exceptions/fast:
	$(MAKE) -f examples/CMakeFiles/exceptions.dir/build.make examples/CMakeFiles/exceptions.dir/build
.PHONY : exceptions/fast

#=============================================================================
# Target rules for targets named resultset_binary

# Build rule for target.
resultset_binary: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 resultset_binary
.PHONY : resultset_binary

# fast build rule for target.
resultset_binary/fast:
	$(MAKE) -f examples/CMakeFiles/resultset_binary.dir/build.make examples/CMakeFiles/resultset_binary.dir/build
.PHONY : resultset_binary/fast

#=============================================================================
# Target rules for targets named statement

# Build rule for target.
statement: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 statement
.PHONY : statement

# fast build rule for target.
statement/fast:
	$(MAKE) -f examples/CMakeFiles/statement.dir/build.make examples/CMakeFiles/statement.dir/build
.PHONY : statement/fast

#=============================================================================
# Target rules for targets named driver_test

# Build rule for target.
driver_test: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 driver_test
.PHONY : driver_test

# fast build rule for target.
driver_test/fast:
	$(MAKE) -f test/CMakeFiles/driver_test.dir/build.make test/CMakeFiles/driver_test.dir/build
.PHONY : driver_test/fast

#=============================================================================
# Target rules for targets named static_test

# Build rule for target.
static_test: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 static_test
.PHONY : static_test

# fast build rule for target.
static_test/fast:
	$(MAKE) -f test/CMakeFiles/static_test.dir/build.make test/CMakeFiles/static_test.dir/build
.PHONY : static_test/fast

#=============================================================================
# Target rules for targets named test_framework

# Build rule for target.
test_framework: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 test_framework
.PHONY : test_framework

# fast build rule for target.
test_framework/fast:
	$(MAKE) -f test/framework/CMakeFiles/test_framework.dir/build.make test/framework/CMakeFiles/test_framework.dir/build
.PHONY : test_framework/fast

#=============================================================================
# Target rules for targets named CJUnitTestsPort

# Build rule for target.
CJUnitTestsPort: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 CJUnitTestsPort
.PHONY : CJUnitTestsPort

# fast build rule for target.
CJUnitTestsPort/fast:
	$(MAKE) -f test/CJUnitTestsPort/CMakeFiles/CJUnitTestsPort.dir/build.make test/CJUnitTestsPort/CMakeFiles/CJUnitTestsPort.dir/build
.PHONY : CJUnitTestsPort/fast

#=============================================================================
# Target rules for targets named example

# Build rule for target.
example: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 example
.PHONY : example

# fast build rule for target.
example/fast:
	$(MAKE) -f test/unit/example/CMakeFiles/example.dir/build.make test/unit/example/CMakeFiles/example.dir/build
.PHONY : example/fast

#=============================================================================
# Target rules for targets named test_variant

# Build rule for target.
test_variant: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 test_variant
.PHONY : test_variant

# fast build rule for target.
test_variant/fast:
	$(MAKE) -f test/unit/classes/CMakeFiles/test_variant.dir/build.make test/unit/classes/CMakeFiles/test_variant.dir/build
.PHONY : test_variant/fast

#=============================================================================
# Target rules for targets named test_connection

# Build rule for target.
test_connection: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 test_connection
.PHONY : test_connection

# fast build rule for target.
test_connection/fast:
	$(MAKE) -f test/unit/classes/CMakeFiles/test_connection.dir/build.make test/unit/classes/CMakeFiles/test_connection.dir/build
.PHONY : test_connection/fast

#=============================================================================
# Target rules for targets named test_resultset

# Build rule for target.
test_resultset: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 test_resultset
.PHONY : test_resultset

# fast build rule for target.
test_resultset/fast:
	$(MAKE) -f test/unit/classes/CMakeFiles/test_resultset.dir/build.make test/unit/classes/CMakeFiles/test_resultset.dir/build
.PHONY : test_resultset/fast

#=============================================================================
# Target rules for targets named test_databasemetadata

# Build rule for target.
test_databasemetadata: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 test_databasemetadata
.PHONY : test_databasemetadata

# fast build rule for target.
test_databasemetadata/fast:
	$(MAKE) -f test/unit/classes/CMakeFiles/test_databasemetadata.dir/build.make test/unit/classes/CMakeFiles/test_databasemetadata.dir/build
.PHONY : test_databasemetadata/fast

#=============================================================================
# Target rules for targets named test_resultsetmetadata

# Build rule for target.
test_resultsetmetadata: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 test_resultsetmetadata
.PHONY : test_resultsetmetadata

# fast build rule for target.
test_resultsetmetadata/fast:
	$(MAKE) -f test/unit/classes/CMakeFiles/test_resultsetmetadata.dir/build.make test/unit/classes/CMakeFiles/test_resultsetmetadata.dir/build
.PHONY : test_resultsetmetadata/fast

#=============================================================================
# Target rules for targets named test_preparedstatement

# Build rule for target.
test_preparedstatement: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 test_preparedstatement
.PHONY : test_preparedstatement

# fast build rule for target.
test_preparedstatement/fast:
	$(MAKE) -f test/unit/classes/CMakeFiles/test_preparedstatement.dir/build.make test/unit/classes/CMakeFiles/test_preparedstatement.dir/build
.PHONY : test_preparedstatement/fast

#=============================================================================
# Target rules for targets named test_savepoint

# Build rule for target.
test_savepoint: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 test_savepoint
.PHONY : test_savepoint

# fast build rule for target.
test_savepoint/fast:
	$(MAKE) -f test/unit/classes/CMakeFiles/test_savepoint.dir/build.make test/unit/classes/CMakeFiles/test_savepoint.dir/build
.PHONY : test_savepoint/fast

#=============================================================================
# Target rules for targets named test_art_resultset

# Build rule for target.
test_art_resultset: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 test_art_resultset
.PHONY : test_art_resultset

# fast build rule for target.
test_art_resultset/fast:
	$(MAKE) -f test/unit/classes/CMakeFiles/test_art_resultset.dir/build.make test/unit/classes/CMakeFiles/test_art_resultset.dir/build
.PHONY : test_art_resultset/fast

#=============================================================================
# Target rules for targets named test_parametermetadata

# Build rule for target.
test_parametermetadata: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 test_parametermetadata
.PHONY : test_parametermetadata

# fast build rule for target.
test_parametermetadata/fast:
	$(MAKE) -f test/unit/classes/CMakeFiles/test_parametermetadata.dir/build.make test/unit/classes/CMakeFiles/test_parametermetadata.dir/build
.PHONY : test_parametermetadata/fast

#=============================================================================
# Target rules for targets named test_statement

# Build rule for target.
test_statement: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 test_statement
.PHONY : test_statement

# fast build rule for target.
test_statement/fast:
	$(MAKE) -f test/unit/classes/CMakeFiles/test_statement.dir/build.make test/unit/classes/CMakeFiles/test_statement.dir/build
.PHONY : test_statement/fast

#=============================================================================
# Target rules for targets named test_uri

# Build rule for target.
test_uri: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 test_uri
.PHONY : test_uri

# fast build rule for target.
test_uri/fast:
	$(MAKE) -f test/unit/classes/CMakeFiles/test_uri.dir/build.make test/unit/classes/CMakeFiles/test_uri.dir/build
.PHONY : test_uri/fast

#=============================================================================
# Target rules for targets named perf_statement

# Build rule for target.
perf_statement: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 perf_statement
.PHONY : perf_statement

# fast build rule for target.
perf_statement/fast:
	$(MAKE) -f test/unit/performance/CMakeFiles/perf_statement.dir/build.make test/unit/performance/CMakeFiles/perf_statement.dir/build
.PHONY : perf_statement/fast

#=============================================================================
# Target rules for targets named unsorted_bugs

# Build rule for target.
unsorted_bugs: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 unsorted_bugs
.PHONY : unsorted_bugs

# fast build rule for target.
unsorted_bugs/fast:
	$(MAKE) -f test/unit/bugs/CMakeFiles/unsorted_bugs.dir/build.make test/unit/bugs/CMakeFiles/unsorted_bugs.dir/build
.PHONY : unsorted_bugs/fast

#=============================================================================
# Target rules for targets named bug456

# Build rule for target.
bug456: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 bug456
.PHONY : bug456

# fast build rule for target.
bug456/fast:
	$(MAKE) -f test/unit/template_bug_group/CMakeFiles/bug456.dir/build.make test/unit/template_bug_group/CMakeFiles/bug456.dir/build
.PHONY : bug456/fast

#=============================================================================
# Target rules for targets named bug123

# Build rule for target.
bug123: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 bug123
.PHONY : bug123

# fast build rule for target.
bug123/fast:
	$(MAKE) -f test/unit/template_bug_group/CMakeFiles/bug123.dir/build.make test/unit/template_bug_group/CMakeFiles/bug123.dir/build
.PHONY : bug123/fast

# Help Target
help:
	@echo "The following are some of the valid targets for this Makefile:"
	@echo "... all (the default if no target is provided)"
	@echo "... clean"
	@echo "... depend"
	@echo "... package"
	@echo "... package_source"
	@echo "... edit_cache"
	@echo "... install/strip"
	@echo "... rebuild_cache"
	@echo "... list_install_components"
	@echo "... install"
	@echo "... install/local"
	@echo "... mysqlcppconn-static"
	@echo "... mysqlcppconn"
	@echo "... dynamic_load"
	@echo "... connect"
	@echo "... debug_output"
	@echo "... connection_meta_schemaobj"
	@echo "... prepared_statement"
	@echo "... resultset_types"
	@echo "... resultset"
	@echo "... resultset_meta"
	@echo "... exceptions"
	@echo "... resultset_binary"
	@echo "... statement"
	@echo "... driver_test"
	@echo "... static_test"
	@echo "... test_framework"
	@echo "... CJUnitTestsPort"
	@echo "... example"
	@echo "... test_variant"
	@echo "... test_connection"
	@echo "... test_resultset"
	@echo "... test_databasemetadata"
	@echo "... test_resultsetmetadata"
	@echo "... test_preparedstatement"
	@echo "... test_savepoint"
	@echo "... test_art_resultset"
	@echo "... test_parametermetadata"
	@echo "... test_statement"
	@echo "... test_uri"
	@echo "... perf_statement"
	@echo "... unsorted_bugs"
	@echo "... bug456"
	@echo "... bug123"
.PHONY : help



#=============================================================================
# Special targets to cleanup operation of make.

# Special rule to run CMake to check the build system integrity.
# No rule that depends on this can have commands that come from listfiles
# because they might be regenerated.
cmake_check_build_system:
	$(CMAKE_COMMAND) -H$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR) --check-build-system CMakeFiles/Makefile.cmake 0
.PHONY : cmake_check_build_system
