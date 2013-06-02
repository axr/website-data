## System Requirements

The list of system requirements for all platforms is:

- CMake
- Qt
- Boost (Download Windows binaries)
- Any C++ compiler (see below)

Recommended dependencies include:

- Git (for contributors to AXR itself)
- Python 2.6+/3.x (for utility scripts)
- Doxygen (for building documentation)

Optional dependencies include:

- SDL (for building examples)

### Windows

Visual Studio 9 (2008) or later, or MinGW. Express editions of Visual Studio
have not been tested.

**Windows development is largely untested at this point, proceed with
caution...**

### OS X

Xcode 4 with command line tools installed. It may also be necessary to run
`xcodebuild -license` after installing Xcode in order to build from the command
line (including building of dependencies through a package management system
such as MacPorts).

### Linux

For the vast majority of distributions there are no dependencies other than
those required for all platforms. Virtually all dependencies can be installed by
a script included in the AXR repository which uses the system's native package
manager.

## Dependencies

There are two scripts provided in the root directory of the
repository - `pre-configure.bat` and `pre-configure.sh`. The former is for
Windows (currently unimplemented) and the latter for Unix systems.

Running the script should install all necessary dependencies for building AXR.
The script works by checking for the presence of a particular package manager
and then installs the dependencies using it. Not all package managers are
currently supported.

## Configuring

`cd` into the repository's root directory and run the following commands:

Initialize Git submodules:


	git submodule update --init --recursive

Create a build directory - you can set `binary_dir` to something other than
what is provided here but it cannot be the same as `source_dir`:

	source_dir=$PWD
	binary_dir=$source_dir/../axr-build
	mkdir -p "$binary_dir"
	cd "$binary_dir"

Now it's time to actually run CMake. Since CMake is merely a generator for other
build systems, you can use it to create Visual Studio projects, Xcode projects,
Unix makefiles and many others. If you want to build using the system's default
generator (which is Unix makefiles on Unix systems, and NMake makefiles on
Windows), then run CMake as follows:

	cmake "$source_dir"

If you'd instead like to use an IDE (for example Visual Studio or Xcode), you
can try one of the following commands (see the [CMake documentation](http://www.cmake.org/cmake/help/v2.8.9/cmake.html#section_Generators)
for a full list of available generators):

	cmake -G "Visual Studio 10" "$source_dir"
	cmake -G "Xcode" "$source_dir"

Note that if you intend to build with the NMake generator on Windows, you should
be using the specialized command prompt for the version and target architecture
you wish to build, NOT the normal Windows command prompt. The latter will not
work correctly.

## Building

Now that CMake has been run, the project has been configured and is ready to
build.

If you used the Unix or NMake makefiles generators, all you need to do now is
navigate to `$binary_dir` and run make or nmake respectively, and the project
will be built.

If you used a project file generator such as Visual Studio or Xcode, an
`AXR.sln` or `AXR.xcodeproj` file/bundle will have been created in
`$binary_dir` - simply open them and use the IDE-specific method to build the
project as usual.
