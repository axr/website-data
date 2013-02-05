The way it works:

- the wrapper asks you for an xml file
- with a root element <layoutTests>
- and inside <test> elmements
- with src and expect attributes
- src is the path to the test
- and expect is the path to the expected results text file
- so the wrapper will load each of the tests
- and then instead of rendering, it will print the whole document tree
- each object printing its values so we have a textual representation to compare
  against
