The isA property permits to apply properties from one or several object to an
element. Keep in mind that the order of the objects matters: the rightmost
object is the last in the cascade (relevant if they share the same properties).

	// language=hss
	element
	{
		// assuming these two container objects are defined,
		// this would apply their properties to element
		isA: object1, object2;

		// this would mutate the element into an image element
		isA: @image;

		// assuming a font object named fontSet is defined,
		// this would apply its properties to @font
		font: @font { isA: fontSet };
	}
