
	// this matches when the element overflows
	element:(overflows) { }

	// which is equivalent to
	element:(overflows = yes) { }

Note: it always returns `no` if the [contained](/@container#contained)
property is set to `yes`.
