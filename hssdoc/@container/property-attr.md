It permits to add, reset or remove attributes.

    // language=hss
    element
    {
        // adds (or resets) the custom attribute
        attr: @ { custom: "string"; };
        // which is equivalent to
        attr.custom: "string";
        // removes that attribute
        attr.custom: no;
        // removes all attributes
        attr: no;
    }
