### Generating JSON info files

First, create a new directory (I'll call it `packages`) and put all of your
package files in there.

Now you need to run the `generate-package-jsons.rb` script that you'll find
in the 'common' repository, which will generate the necessary JSON files:

	./generate-package-jsons.rb --input=packages --data=/path/to/data/repo

- `--input` path to the directory, where you put your package files.
- `--data` path to the website-data repository.

The last step is to verify that all the generated JSON files are correct and
then commit and push them.

**Note:** The `generate-package-jsons.rb` script currently requires Ruby>=1.8

### Uploading the package files

The package files go on the server into:

	/var/dev/files/packages/<package-name>/<version>/

In order to send many files at one, first make sure that your files are
structured like this:

	packages
	   |--- <package-name-1>
	   |  \--- <version>
	   |     |--- <file-1>
	   |     |--- <file-2>
	   |     \--- <file-3>
	   |
	   \--- <package-name-2>
	      \--- <version>
	         |--- <file-1>
	         |--- <file-2>
	         \--- <file-3>

Then run

	rsync -vcr packages/* axrproject.org:/var/dev/files/packages/
