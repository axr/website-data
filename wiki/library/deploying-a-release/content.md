### Generating JSON info files

First, create a new directory (I'll call it `packages`) and put all of your
package files in there.

Now you need to run the `generate-package-jsons.rb` script that you'll find
in the 'extras' repository, which will generate the necessary JSON files:

	./generate-package-jsons.rb --input=packages --data=/path/to/data/repo

- `--input` path to the directory, where you put your package files.
- `--data` path to the website-data repository.

The last step is to verify that all the generated JSON files are correct and
then commit and push them.

**Note:** The `generate-package-jsons.rb` script currently requires Ruby>=1.9

### Uploading the package files

The package files go to:

	50.56.242.67:/var/dev/files/packages/<package-name>/<version>/

You can also (partially) see this path in the generated JSON files:

	http://files.axrproject.org/packages/<package-name>/<version>/<file-name>
