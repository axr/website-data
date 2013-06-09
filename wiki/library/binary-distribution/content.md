## Platform table

<table>
	<thead>
		<tr>
			<th>Operating system or platform</th>
			<th>Identifier</th>
			<th>Extension</th>
			<th>Versions</th>
			<th>Architectures</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td colspan="5" style="text-align: center"><em>Desktop</em></td>
		</tr>
		<tr>
			<td>Microsoft Windows</td>
			<td>windows</td>
			<td>msi</td>
			<td>5.0+</td>
			<td>i386, x86_64, arm<sup>1</sup></td>
		</tr>
		<tr>
			<td>Apple OS X</td>
			<td>osx</td>
			<td>dmg</td>
			<td>10.5+</td>
			<td>i386, x86_64 <sup>2</sup></td>
		</tr>
		<tr>
			<td>Linux</td>
			<td>linux</td>
			<td>tar.gz, multiple<sup>3</sup></td>
			<td>2.6+</td>
			<td>i386, x86_64</td>
		</tr>
		<tr>
			<td colspan="5" style="text-align: center"><em>Mobile</em></td>
		</tr>
		<tr>
			<td>Apple iOS</td>
			<td>ios</td>
			<td>ipa</td>
			<td>3.0+</td>
			<td rowspan="4">arm</td>
		</tr>
		<tr>
			<td>Google Android</td>
			<td>android</td>
			<td>apk</td>
			<td>2.1+</td>
		</tr>
		<tr>
			<td>RIM BlackBerry</td>
			<td>blackberry</td>
			<td>?</td>
			<td>10+ <sup>4</sup></td>
		</tr>
		<tr>
			<td>Windows Phone</td>
			<td>windowsphone</td>
			<td>?</td>
			<td>8+ <sup>5</sup></td>
		</tr>
	</tbody>
</table>

<sup>1</sup> Windows 8 and above only.

<sup>2</sup> All OS X distributions should be universal binaries containing
both i386 and x86_64 architectures.

<sup>3</sup> tar.gz is for generic binaries, other extensions are used
depending on the package management system in use (such as deb or rpm).

<sup>4</sup> Unfortunately starting at 10 is the only technically feasible
solution - BlackBerry 7 and below (versions 8 and 9 were skipped - 7 is
directly followed by 10) only allow applications to be written in Java.

<sup>5</sup> Unfortunately Windows Phone 7 is still C# only - there's no way
we'll be able to port unless Microsoft provides us with special access to the
native SDK. However there is one possibility: C++ -> LLVM -> C#. Versions 6
and below do allow C++ development but their market share is irrelevant at
his point.


## Package names

A table explaining different package names under different platforms.

<table>
	<thead>
		<tr>
			<th>OS</th>
			<th>Browser</th>
			<th>Library</th>
			<th>Headers</th>
			<th>Documentation</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>Microsoft Windows (msi / exe)</td>
			<td>axr-browser</td>
			<td>axr-runtime</td>
			<td>-</td>
			<td>-</td>
		</tr>
		<tr>
			<td>OSX (dmg)</td>
			<td>axr-browser</td>
			<td colspan="3">axr-runtime</td>
		</tr>
		<tr>
			<td>Debian (deb)</td>
			<td>axr-browser</td>
			<td>libaxr</td>
			<td>libaxr-dev</td>
			<td>libaxr-doc</td>
		</tr>
		<tr>
			<td>(rpm)</td>
			<td>axr-browser</td>
			<td>axr</td>
			<td>libaxr-devel</td>
			<td>libaxr-doc</td>
		</tr>
		<tr>
			<td>Linux (tar.gz)</td>
			<td>axr-browser</td>
			<td colspan="3">libaxr</td>
		</tr>
		<tr>
			<td>Source (tar.gz / zip)</td>
			<td>axr-browser</td>
			<td colspan="2">libaxr</td>
			<td>-</td>
		</tr>
	</tbody>
</table>


## File names

### deb

	<package>_<version>_<architecture>.deb

Allowed `<architecture>` values: `i386`, `amd64`, `all`.

### rpm

	<package>-<version>-<n>-<architecture>.rpm

Allowed `<architecture>` values: `i686`, `x86_64`, `noarch`.

### tar.gz / zip

	<package>-<version>-<platform>(-<architecture>).tar.gz
	<package>-<version>-<platform>(-<architecture>).zip

Allowed `<architecture>` values: `i386`, `x86_64`.

Platform `src` means that this is a source package. For source packages you
must not specify an architecture.

### dmg

	<package>-<version>-<platform>-<architecture>.dmg

Allowed `<architecture>` values: `i386`, `x86_64`, `intel`

Allowed `<platform>` values: `osx`, `ios`.


### exe / msi

	<package>-<version>-windows-<architecture>.msi
	<package>-<version>-windows-<architecture>.exe

Allowed `<architecture>` values: `x86`, `x64`.
