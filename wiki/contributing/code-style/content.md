This document details the guidelines for code style when writing code for the
AXR project. These rules must be adhered to in order to maintain a consistent
code base.

## C, C++, and Objective-C

**Please note: these are somewhat out of date and will be updated soon and
expanded upon in more detail**

- Variable and method names: in camelCase starting with a lowercase letter.
- Class names: in CamelCase starting with a capital letter.
- Namespace: all the classes in the core library should be in the AXR namespace.
  Wrappers and classes outside of the library should use another one.
- Whitespace:
  - Indent with 4 spaces.
  - Use Unix linebreaks (\n).
- Line breaks:
  - Each statement should go on its own line.
  - Curly braces go on their own lines
