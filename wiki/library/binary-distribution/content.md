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

This section has not been written yet.

## File naming rules

AXR binary intaller filenames should be named as follows:

	<package_name>-<version>-<platform>-<architecture>.<extension>

Note: Linux distributions that use a platform's native package management system
must drop `-<platform>` from the filename string.

The keywords highlighted in bold should be replaced as follows:

### version

The semantic version number of the release.

### platform

Refer to the identifier column of the platform table.

### architecture

Refer to the architectures column of the platform table.

### extension

Refer to the extension column of the platform table.
