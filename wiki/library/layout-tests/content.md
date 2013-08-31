## Building and using the layout tests runner

You can build the layout tests runner (axrlayouttests) by running the following
in the core repository's root:

	qbs -p axrlayouttests

After building axrlayouttests is done, you can run the tests:

	qbs run -p axrlayouttests -- tests/layout-tests/tests.json
