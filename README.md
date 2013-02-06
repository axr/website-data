AXR Project website data
------------------------

IMPORTANT NOTICE: This system is still in process of being built and the data in
this repository is currently not used by the production environment.

This repository contains the AXR Project website pages, blog posts, wiki pages,
HSS documentation pages and other content.

In the end of this document you will find a very specific set of instructions on
how the data in this repository is structured. These instructions must be
followed as precisely as possible.

## A few things to remember when using this repository
- All the commit messages MUST be in present tense
- The line length limit is 80 characters. This rule can be ignored on lines that
  contain long links or code blocks.
- All the files end with ONE blank line

## The file system structure

The directory structure:

	/pages
		$PATH_TO_PAGE (`blog/new-release-available-version-0.4.8` for example)
			content.md
			info.json
			... (images, etc.)
		...

	/packages
		$PACKAGE_NAME (axr-browser, axr-core, etc.)
			release-$VERSION.json
			...
		...

	/hssdoc
		@$OBJECT_NAME
			info.json
			property-$PROPERTY_NAME.json
			...
		...

	wiki/
		$PATH_TO_PAGE (`developers/building` for example)
			content.md
			info.json
			... (images, etc.)
		...

	config.json

### pages/.../info.json

	{
		type: (string) type of the page. values: page|blog-post,
		title: (string) title for the page,
		file: (string) name of the content file. default: `content.md`,

		Fields specific to `blog-post` type:
		date: (string) date in UTC in `YYYY-MM-DD` format (ISO 8601),
		author_name: (string) author's real name,
		summary_file: (string) name of the file that contains the summary about
			the post. this file can reside in a subdirectory.
	}

Notes specific to `blog-post` type:
If no summary file is specified, you can insert `<!--more-->` anywhere in the
content file and everything about that will be automatically used as the
summary.

### release-$VERSION.json

	{
		package: (string) package name,
		version: (string) release version,
		files: [
			{
				os: (string) values: osx|linux|windows|src,
				arch: (string) values: x86_64|i386|intel|none,
				type: (string) values: exe|dmg|deb|rpm|tar.gz,
				url: (string) absolute URL to the file,
				size: (int) file size in bytes,
				os_version_min: (string) minimum required version number.
					default: `null`,
				os_version_max: (string) maximum required version number.
					default: `null`
			},
			...
		]
	}

A valid version number is a string consisting of between 2 and 4 dot-separated
integers. Example: `1.0.7`.


### hssdoc/.../property-$PROPERTY_NAME.json

	{
		name: (string) name of the property,
		readonly: (boolean) default: 0,
		many_values: (boolean) whether this property supports many values.
			this field is optional. default: 0,
		description_file: name of the content file. this field is optional,
		values: [
			{
				value: (string),
				is_default: (boolean) default: 0,
				since_version: (string) version of the core in which this
				value was implemented for this property. this field may
				be absent if the value has not been implemented
			},
			...
		]
	}


### hssdoc/@$OBJECT_NAME/info.json

	{
		name: (string) name of the object. for example: `@container`,
		owner: (string) name of the object. for example: `@container`. this
			field is optional,
		description_file: (string) name of the content file. this field is optional
	}


### wiki/.../info.json

	{
		title: (string) title of the page,
		file: (string) name of the content file. default: `content.md`
	}


### config.json

This is a generic configuration file that is used by many different parts of the
site.

	{
		ga_account: (string) ID if the Google Analytics account,
		disqus_shortname: (string),
		social: {
			facebook: (string) Facebook username,
			github: (string) GitHub organization/user name,
			google_plus: (string) Google+ page ID,
			launchpad: (string) Launchpad ???,
			ohloh: (string) Ohloh profile name,
			twitter: (string) Twitter username, without the `@`,
			vimeo: (string) Vimeo username,
			youtube: (string) YouTube channel name
		}
	}

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
