In this article we are going to take a look at the content and the presentation
layer when creating a document with AXR. As you may recall, XML and HSS files
are linked together to create the final product, and the most important aspect
to remember is that the content should be completely separated from
presentation.

<!--more-->

## The content

Why structure the information according to the needs of a particular design? It
would be so much better to just focus on what the content means, instead.
Nowadays when writing or generating your markup, you not only need to consider
the structure of your elements (multiple nested elements are often used to
achieve certain effects), but even the order in which you put each one of them,
to be able to position and style them correctly with CSS. Articles preaching
best practices for web design have focused for years on how to best optimize CSS
tricks and techniques to use the minimum amount of elements in the HTML part.
Additionally, since with HTML you are restricted to a predefined set of
elements, which most are derived from concepts of the early publishing industry,
and some additional new ones, like HTML5's `<article>`. What HTML element means
book, or hotel reservation, or recipe, or song?

Consider a list of books, for example. Each of those books may have a title,
author and publisher information, a cover image, an ISBN number, a price...
maybe even a rating from other users in a social network. All of this could be
expressed as terms of a namespace, lets say "vg.axr.book" (the proposed syntax
for namespaces and how they will be curated will be discussed in another
article). If the content is completely agnostic of any presentation you could
just write a list of `<book>` elements, with their corresponding inner elements
defining all the information that go with that book. For example, this would be
the file http://examplebookstore.com/books.xml:

	<!-- language=xml -->
	<?xml version="1.0" encoding="UTF-8"?>
	<books xmlns="urn:vg.axr.book">
		<book>
			<title>Winnie-the-Pooh</title>
			<author name="Alan Alexander" surname="Milne" />
			<publisher>Dutton Juvenile</publisher>
			<cover src="http://en.wikipedia.org/wiki/File:WinnieThePooh.JPG" />
			<isbn>0525467564</isbn>
			<rating outOf="5">4.29</rating>
		</book>
		<book>
			<!-- etc -->
		</book>
	</books>

This can easily be generated from a database or any other data source, and since
you don't care for structure, order or presentation, it can be easily reused on
any part of the site, for a native application on iOS or Android, or anywhere
else where information stored as XML can be useful. Also, since we are linking
to a namespace (note the xmlns attribute in the books element), the meaning of
that information can be known, and thus used by search engines to its full
extent. Imagine searching on google only for hotel reservations or flights, and
it could intelligently compare all offers it has indexed and show you the best
ones.

So how does the rendering engine know how to display this?, you may ask. The
answer is HSS, which is a very powerful design language, which allows you to
define the visual presentation of your site. By default, the rendering engine
will load a file called "style.hss" in the same folder as the XML file. If it
should load it from anywhere else, you tell it with the following XML
instruction (higlighted in bold):

	<!-- language=xml -->
	<?xml version="1.0" encoding="UTF-8"?>
	<?xml-stylesheet type="application/hss" src="path/to/file.hss"?>
	<books xmlns="urn:vg.axr.book">
		<!-- etc -->
	</books>

From within this file, the whole structure of the page can be defined, other XML
pages (such as the navigation, sidebar, footer, etc) and resources such as
images, videos or sounds can be loaded into it and the behavior can be defined,
combining everything into a complete user experience.

To link from one document to the next, you could use XLinks, but the we
recommend to not think the HTML way. Instead, to have your content indexed by
search engines, link to a XML Sitemap, where you define (or generate with your
CMS) all the pages that you want to have indexed. Nowadays, the usual way is to
put it the reference in the robots.txt file, but we suggest an XML instruction
to link to it. In the next example, you can see how this could done:

	<!-- language=xml -->
	<?xml version="1.0" encoding="UTF-8"?>
	<?xml-sitemap type="text/xml" src="path/to/sitemap.xml"?>
	<books xmlns="urn:vg.axr.book">
		<!-- etc -->
	</books>

How the human user navigates from one document to the other will be defined in
the HSS file, and doesn't necessarily reflect the same path a web crawler would
take to get all the information on your site. If you think about it, since the
advent of search engines you actually have always had two kinds of audiences,
one human and one machine, and the way they consume content is radically
different. Nowadays, machines try to follow the same path that humans do,
following links on a page, but this has proven to be very conflictive when
trying to create complex UIs, since often simple &lt;a&gt; tags are not enough,
and then JavaScript is used. By providing a sitemap for web crawlers and a great
interactive interface to users, you can have the best of both worlds, where
search index can fully absorb all the semantic content in your XML files, and
the humans have an awesome user experience.

## Hierarchical Style Sheets

If you are a CSS coder, chances are you've found yourself in a situation where
you wanted to achieve a certain layout, only to find yourself scratching your
head for how you are going to do it: how to wrap, float, push or otherwise mess
around with your elements so that they do what you want... trying for hours and
ending up feeling very accomplished just because you managed to figure to do
something that any uninformed client or friend would scoff at as "the easiest
thing in the world, just put this over here and this should always be as tall as
this or that yadda yadda".

Why is it so difficult? After all, we all have praised the simplicity of its
syntax and the gentle learning curve. And it is true, you can learn CSS in a
couple of hours. Where it gets really difficult is when you try to do any layout
that is a bit more complex than a basic text document sprinkled with some
images. The very simplicity of the syntax makes working on a bigger project a
chore: you end up repeating selector after selector, just to select elements one
level deeper, or you assign the same color over and over. You cannot do any
operations like 100% - 50px or make any reference to a property of another
element. You cannot change the order or structure of elements. You cannot use
any other shape than a rectangle (and using a lot of elements with corner-radius
is just a hack). You cannot load partial views into the page. There is no easy
way to make equal height columns or align some elements vertically.

Enter HSS. It is like CSS on steroids, and includes most of the things designers
have been clamoring for on many CSS-wishlists. Its syntax is based on CSS,
retaining the simplicity and cleanness of the code, but taking it to a whole
level in the kind of things you can do. I won't go fully into detail about
everything that HSS can do, since there is now a whole world of possibilities in
front of us, and we must figure out best practices and usage patters as we go
along, but here are some of them:

### Hierarchical:
Instead of writing longer and longer selector chains, the rules (the selectors +
the block with the properties) can be nested inside each other. If the content
in the XML file is a tree of elements, why not apply styles using a tree as
well? It is both clearer and has better performance, since not all elements have
to be matched against each selector.

	// language=hss
	// we target the outermost element
	books
	{
		background: #E;
		// more styles here

		// this targets only elements with name book which are inside books
		book
		{
			isA: myBookTemplate; // assuming myBookTemplate has been defined somewhere else
		}
	}

### Object Oriented:
In CSS, multiple values for some aspect of your design are expressed with
multiple properties, such as border-size, border-color, border-style, etc. In
HSS, complex data are defined using object notation. To put it simple, the at
stymbol @ represents an object. Immediately afterwards comes the object type
(it can also be derived from context if you omit it), and optionally a name.
Then, you define a block of properties like you would in a normal rule.

	// language=hss
	books book
	{
		border: @lineBorder {
			size: 1;
			color: #0;
		};

		font: @font myFont {
			face: "Helvetica";
			size: 18;
			color: #F00;
		};
	}

### Modular:
Objects can be given a name when defined, and then reused later. This works for
objects you'd use to set fonts, borders, margins, or even use containers as
templates for your elements.

	// language=hss
	// define a font object called 'myFont'
	@font myFont
	{
		face: "Helvetica";
		size: 18;
		color: #F00;
	}

	// define a container called 'bookTemplate' that uses that font
	@container bookTemplate
	{
		width: 85;
		height: 120;
		font: myFont;
	}

	// apply it here
	books book
	{
		isA: bookTemplate
	}

### Expressions, Functions and References:
Instead of simply writing a value, in HSS you can use other tools to express
what values the properties finally will have. Anywhere a number is accepted you
can write an expression, which is a mathematical operation, even operating with
percentages and functions. This can be very useful for creating layouts, for
example. Functions return a value depending on its arguments, and can be always
used to set the value, no matter the type (numeric, string, keyword, object,
etc).

	// language=hss
	// in the XML, the topmost element would be called document
	document
	{
		// make all elements inside the document be aligned to 50 points below the vertical center
		contentAlignY: 50% + 50;

		sidebar
		{
			// make the sidebar 250 points wide
			width: 250;
			// this would make the sidebar at least 400 points tall, or the height of the content element, if bigger
			height: min(400, ref(height of content));
		}

		content
		{
			// this makes the width of this element to be all the remaining width, but at most 900 points
			width: max(900, 100% - ref(width of sidebar);
			// this will cause the content to be always 200 points less tall than its parent
			height: 100% - 200;
		}
	}

### Filters:
Inspired in part by jQuery, what in CSS are pseudo-elements and pseudo-classes,
in HSS they are called Filters, and allow you to filter down a selection. As is
the case in CSS, you can omit the universal selector (*) in front of it when you
are selecting all elements, which makes it easier to read. The following are
some examples of what you could do with filters, but for simplicity, without
applying any properties, and leaving the block empty.

	// language=hss
	books
	{
		// selects the first element
		*:first {}

		// selects all even ones (ommitting the * is ok)
		:even {}

		// selects the first child element (amongst all books)
		book :first {}
	}

In contrast to how it works in CSS, all descendant elements are selected
together and then filtered down. So, in the example above, where we did this:

	// language=hss
	// selects the first child element (amongst all books)
	book :first {}

what actually happens is that all book elements are selected, then all the
elements inside them, and then the first one is chosen. If instead you want the
first one of each element (which very well may be the case) you can split that
selection with the :each filter, like this:

	// language=hss
	// selects the first element inside each book
	book:each :first {}

There are many more filters than just the ones presented here. Take look at the
spec to see all the different possibilities.

### Structure and Layout:
A great site needs a great layout. But in CSS, if your layout goes further than
a simple document, or (even worse) when your content is generated with a CMS and
there's no way for you to tell how many elements there will be somewhere or how
long a piece of text will be, layout can be a pain. Also, because the structure
must live in your HTML, usually additional elements such as wrappers or groups
are kept to a minimum. In HSS, you can create new non-semantic elements from
withing the presentation layer, reorder them and shuffle them around, so that
they fit your visual design. On top of that, you can use powerful alignment
tools, making advanced layouts a breeze.

	// language=hss
	books
	{
		// distributes content element horizontally
		contentAlignX: distribute;

		book
		{
			// inner margin, like padding in CSS, using the shorthand
			// notation and deriving the object type from context
			innerMargin: @{ 15 };

			// create a new container that will show an image of the book, with the cover image and the title
			#new bookIcon
			{
				// apply the template (defined elsewhere)
				isA: bookIconTemplate;

				// now put the cover inside this element, and separate it from the flow
				#move cover
				{
					flow: no;
				}

				// move the title as well, put it at 80% vertically and style it a bit
				#move title
				{
					alignY: 80%;
					font: myFont;
					margin: @{ 10 };
					background: @rgba { alpha: 40% };
				}
			}

			// more styles here
		}
	}

Layout with HSS warrants its own full-length post, so I'll leave it at this. How
and when to use each feature obviously always depends on the particular aspects
of your layout. Other features, such as element reordering, accessing layout
lines or selecting lines, words, and glyphs from the content text also add to
the possibilities.

### Vector graphics:
While in graphic design applications vector graphics are the norm, in the web
they have been confined to SVG files which can be used as background images or
included in the supposedly semantic HTML code (although most versions of IE
don't like the Mime Type (application/xhtml+xml) that is required for that to
work). In HSS you have shape objects or even custom paths can be created with
curves, arcs and lines, that can be applied to any container. Thanks to the
modular syntax, you can define a shape once and then apply it wherever it is
needed.

	// language=hss
	// define a shape of a house
	@path houseIcon
	{
		startX: 50%;
		semgents:
			@line{ 100% 40% },
			@line{ 80% 40% },
			@line{ 80% 100% },
			@line{ 20% 100% },
			@line{ 20% 40% },
			@line{ 0 40% }
	}
	// apply it
	myElement { shape: houseIcon }

	// predefined shapes:
	// rounded rectangle
	myElement2 { shape: @roundedRect { corners: 15 } }
	// this is equivalent
	myElement2 { shape: @{15} }
	// circle
	myElement3 { shape: @circle } }
	// polygon (in this example a triangle)
	myElement4 { shape: @polygon{ sides: 3; startAngle: 90 } }

Behaviors:
As explained earlier in this article, in HSS you define the behavior from within
the presentation layer. Many basic behaviors will be covered by HSS objects
directly, such as changing a value on another object or loading a file, but if
the natively provided behaviors aren't enough, JavaScript can be used, too.

	// language=hss
	// loading another page when clicked
	myLinkElem
	{
		behavior: @click {
			action: @load {
				src: attr(href); // we get the attribute href from the XML element
			};
	}

	// this will make the elementB shrink or grow if you drag on elementA
	elementA
	{
		behavior: @drag e {
			action: @changeValue {
				target: sel(elementB);
				property: "height";
				value: 50 + e.deltaX;
			}
		}
	}

	// invoke JavaScript
	document
	{
		behavior:
			@load { @javascript {' alert("Hello World!") '} }, // alerts Hello World
			@load { @jsFunction { "initialize" } }; // assuming the js function initialize() has been declared somewhere else
	}
