It permits to add, replace or remove the element's text. In this regard the
usage of the [content text combinator](http://spec.axrproject.org/specification.html#n1.4.6)
offers even more control over what's being replaced.

	root element
	{
		// this replaces the current content text by "string"
		text: @text { value: "string"; };
		// which is equivalent to
		text.value: "string";
		// for convenience a shorthand exists as well
		text: "string";
	}
	// which is equivalent to
	root element > *
	{
		value: "string";
	}

	root element >> :last
	{
		// this replaces the last word
		value: "string";
	}
