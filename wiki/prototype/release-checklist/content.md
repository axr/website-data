- <del>regression tests</del>
- verify that all resolved core and browser issues are closed
- Roadmap: strike what's been implemented
- update the specification and documentation accordingly
- create a tag in Git
- create and upload packages
- publish a blog post
- post on the mailing list (link to the blog post)
- tweet about it (link to the website)
- IRC: someone's ready to answer newcomers' questions

## Building the packages

### Core:

	cmake -DAXR_BUILD_DOCS=ON -DBUILD_UNIVERSAL_BINS=ON -DCMAKE_BUILD_TYPE=Release /path/to/source && make distribution

### Browser:

	cmake -DBUILD_UNIVERSAL_BINS=ON -DCMAKE_BUILD_TYPE=Release /path/to/source && make distribution
