AXR Project website data
------------------------

This repository contains the AXR Project website pages, blog posts, wiki pages,
HSS documentation pages and other content.

In the end of this document you will find a very specific set of instructions on
how the data in this repository is structured. These instructions must be
followed as precisely as possible.

## A few things to remember when using this repository
- All the commit messages MUST be in present tense
- The line length limit is 80 characters. This rule can be ignored on lines that
  contain long links[1] or code blocks. The line length limit does not apply to
  JSON files.
- All the files end with ONE blank line

[1] Long links and images can ignore the line length limit only if they are the
very last thing on the line.

## Pre-commit hook
If you want to be sure that you're a good person and never commit broken data,
it is recommended that you enable our pre-commit hook. The pre-commit hook is a
simple script that will run every time before you commit and make sure that
there are no problems with any of the changes you made.

To enable the pre-commit hook, you have to either symlink or copy the pre-commit
script from /util/pre-commit.sh to /.git/hooks/pre-commit:

	ln -s util/pre-commit.sh .git/hooks/pre-commit"

## Displaying pages

If a page is requested by URL `/about/features`, then the system will
look for the page in `$REPO_ROOT/pages/about/features`. If the
`info.json` file is not found in that directory, the server will respond
with HTTP status 404.

If there is a problem with understanding the `info.json` or the server
cannot find the content file, the server will respond with HTTP status
404.

## Notes

In the JSON files, all the fields are required unless a default value
is specified for that field, or it is specifically stated that the field
is optional.
