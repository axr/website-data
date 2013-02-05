## Overview of the Project

The goal of the AXR Project is to create a new standard for making, displaying
and interacting with web documents and applications, as well as building a set
of libraries required for this. Starting completely from scratch and using the
knowledge and experience of today’s technologies, it aims to make the lives of
web designers and developers easier by providing advanced tools to help them
build cool stuff with ease.

<img src="http://static.axr.vg/images/features/patches2new_ideas.png" alt="From patches to new ideas" class="alignRight" />

We propose a different, yet familiar alternative to current web standards. It
will adapt older features which proved to be good and rethink the weaknesses.
As an example, it will use plain text encoding to describe content and design,
as well as other related resources, e.g. images, audio, video, fonts, etc., to
form the web document, much in the way the current web standards work.

For content markup, it will use XML instead of HTML, and, for design, HSS
instead of CSS, whose syntax is derived from the latter, with advanced new
features such as object orientation, references, mathematical expressions, new
streamlined selectors, filters, behaviors, etc.

<img src="http://static.axr.vg/images/features/html2xml.png" alt="From HTML to XML" />
<img src="http://static.axr.vg/images/features/css2hss.png" alt="From CSS to HSS" class="alignRight" />

## Unified rendering engine

There will be a core multi-platform library designed for use by browser
developers, unifying the rendering engine that displays content, and thus
eliminating compatibility issues and leaving focus for the browser developers on
what sets them apart from their competitors, be it history or bookmark
management, appearance of the browser itself or social media integration, to
name a few. Another outstanding feature of the library will be the auto-update
capability, allowing web designers and developers to use the latest features
independent of browser client or version, thus delivering the same new content
to all users on all platforms.

<img src="http://static.axr.vg/images/features/axr4all.jpg" alt="One central library for all browsers" class="alignCenter" />

Until browser developers decide to include the AXR core library into their own
software, it will be implemented as a plug-in, using NPAPI for most browsers and
Active-X for Internet Explorer (all of this facilitated through a compatibility
layer called Firebreath). This way, we can start using AXR much sooner than
waiting for the actual implementation.

Keep in mind that AXR's final goal is to create a new web standard, thus, the
plugin phase is a temporary measure to allow the new technology to prove itself
and to be distributed at first.

## Advanced Features

<img src="http://static.axr.vg/images/features/expressions.jpg" alt="E = m c squared - Methaphor for expressions in HSS" class="alignLeft"  />

HSS, the new programming language, will provide many advanced features, while
still using an easy-to-learn syntax, reminiscent of CSS. We will try to fulfill
as many items on the CSS improvement wishlist as we can, things such as
hierarchical declaration of rules (nesting), mathematical operations and
functions, variables, superior layout tools, etc.

Conventional wisdom is that CSS is very static in its design to ensure a minimal
learning curve, therefore ideas such as variables have been rejected by many.
This is true in regards to syntax, making it easy to learn. The problems arise,
though, when trying to achieve more advanced layouts: precisely because of its
simplicity, often features are misused, or side-effects of other features are
kludged together in order to achieve the desired result, thus using compromise
or adding non-semantic content to HTML. Examples of such are the floats -not
invented to create columns, but to make text float around an image-, columns
"tricked" into having equal heights by using fixed height background images, or
the "holy grail layout", which is in fact something as simple as three columns,
the ones on each side having fixed width and a fluid on the the middle that
occupies the remaining space.

Other times, blatant lack of certain features, such as easy vertical alignment,
referencing values -other than from the immediate ancestor element- just makes
it harder to use, posing challenges that take a lot of time and bypasses to
overcome. Also, non-rectangular (of course, I'm not talking about border-radius,
which would only make a "rectangular" with rounded edges... what about other
shapes, such as a hexagon? Or a star? Or a speech bubble? ) usually require
creating images in a graphics editor and using them as element backgrounds, thus
making file sizes bigger and increasing the difficulty of it altogether.

While the addition of these features may add weight to the syntax learning
curve, it will, however, empower the designer to flawlessly write the interface
without any compromise, therefore, balancing itself as an easy-to-use
technology. Another key philosophy of AXR is to describe features in very
obvious terms, thus reducing misinterpretation and allowing better readability.
As an example of this, in CSS, to align an element to center, you'd write
`margin-left: auto`, `margin-right: auto`; in AXR, though, you'd just write
`alignX: center`. And what about `overflow: hidden` making an element auto
expand in height when its children are floated? Such will not happen in AXR.

## True semantic content

You've probably heard the word "semantic" a lot recently. First, let us reflect
on what the word really means in our context. In web parlance, something is said
to be semantic when elements in your markup reflect the meaning of the content
they represent. This has numerous practical advantages, as well as underlying
ideological values related to future web development towards an Internet that
understands your requests and published data and fulfills and uses them more
accurately and efficiently.

Practically, when you give a semantic meaning or name to a markup, you are
separating the content from the presentation, such that when the design (colors,
fonts, sizes, etc.) changes, you don't need to update that name to reflect the
new appearance, because the meaning of the content stays the same.

Additionally, if software (e.g. a search engine's indexing bot) is able to
understand the data and its context, then this data becomes exponentially
useful, since it can be consumed, manipulated and propagated in a lot more ways
(e.g. providing better search results in a search engine).

In the current web standards there is this notion that you should choose the
"right" tag to represent your content from those HTML has to offer. The problem
here is that you have a limited number of choices; you'll end up using DIVs with
classes and IDs assigned. Think of the following: what is the right element for
a book, a flight or a hotel room? What semantics (meaning in-context) do tags
like UL, P, HEADER, A or TD have? Those are mostly outdated concepts related to
text documents, or system behavioral determinants. Unfortunately, they do not
define the meaning of their content.

As written earlier, content in AXR is expressed via XML, which has no predefined
tags. To make the meaning known in the absence of predefined names, we are going
to make use of an XML concept called "default namespaces": you define an
element's namespace, and all its descendants will be in that same namespace,
thus avoiding the repetitive use of prefixes and naming conflicts with elements
outside that namespace.

Since the use of URLs as namespaces can be quite cumbersome, we propose the use
of Uniform Resource Names, or URNs, using Java's reverse domain notation. The
following example uses a fictitious “document” namespace published by axr.vg:

<code data-language="xml">
&lt;document xmlns="urn:vg.axr.document"&gt;
	&lt;!-- more content here --&gt;
&lt;/document&gt;
</code>

Namespaces could have a tree-like structure. For example, the "document"
namespace could have a sub-namespace called "metadata". You would access it like
this:

<code data-language="xml">
&lt;document xmlns=”urn:vg.axr.document.metadata”&gt;
	&lt;!-- more content here --&gt;
&lt;/document&gt;
</code>

Since writing a namespace doesn't also make it known to everyone else, we will
host a repository of namespaces curated by the community at the AXR Project's
web site, thus offering a central place where you can search for a namespace
that fits your content. If it doesn't exist, you can create your own and publish
it, so that others too can express their content using the same structures.

As an example, imagine you have a bookstore and you want to show a shelf of
books. Each book could be in the namespace “book” published by, say,
worldbooks.com. You’d express it like this:

<code data-language="xml">
&lt;catalog xmlns=”urn:com.worldbooks.book”&gt;
	&lt;book&gt;
		&lt;author&gt;John Appleseed&lt;!/author&gt;
		&lt;isbn&gt;1234567890&lt;!/isbn&gt;
		&lt;title1&gt;00 healthy recipes&lt;!/title&gt;
		&lt;!-- etc --&gt;
	&lt;!book&gt;
	&lt;book&gt;
		&lt;!-- etc --&gt;
	&lt;/book&gt;
/lt;/catalog&gt;
</code>

## Modularization (code reuse)

A design goal of HSS is to facilitate and encourage code reuse. Through the
implementation of named objects, you won't need to write the same values
repeatedly all over your stylesheets. Instead, you create reusable pieces of
code that you can apply with the "isA" property.

The author would only need to declare or import required objects, then,
following the document tree, applying them where needed. This way, stylesheets
will be much more organized, thus reducing maintenance.

For example:

<code data-language="hss">
//define an object of type "linearGradient" with the name "boxBg"
@linearGradient boxBg
{
   startColor: #F;
   endColor: #0;
   endY: 100%;
}

//define a "container" object named "box", which uses the previously
//defined object
@container box
{
   width: 150;
   height: 100;
   background: boxBg;
}

//select the element in your content try and apply the object definition
//to the selection
selector chain
{
   isA: box;
}
</code>

## Structural independence

One of the most important goals of the project is to achieve complete separation
of the content from design in a web document, allowing the content to be reused
in any other application without being tied to the way it will be displayed on
the web. The biggest problem in this regard for current web standards is that
the structure of a HTML document is not at all independent from the visual
layout in which it will be presented to the human user.

Say, for example, you have a login form in the header of the document, but want
to show it in the footer at the bottom of the page. You’ll probably end up
modifying the HTML document, since floats and absolute positioning can only help
you so much. Or you need to group some elements together to make them flow in a
certain way. You’ll probably wrap them in a non-semantic element div (or any
other element), just to achieve your particular layout.

Many times there is just no way to alter the HTML source, like when it is
generated by a CMS, or it is the responsibility of another member in your
developer team. In those cases, CSS offers a very frustrating experience,
reducing productivity and hindering development of layouts with great potential.

HSS provides many tools to allow you to completely manipulate the content tree
of elements, reordering them, placing them in a different part of the document
or creating new non-semantic ones as needed. The structure of your content
doesn’t necessarily reflect the structure of a visual layout. Why should you
create non-semantic elements in your markup just to achieve a visual result?

<code data-language="hss">
//some of the things you can do:
myXMLRoot
{
	//create a new "myWrapper" wrapper element
	#wrap myWrapper
	{
		//apply the "myInsetBox" object, which is assumed to have been defined elsewhere
		isA: myInsetBox;
		//change the order of the elements, so that the resulting order is the last
		//element first, then the first one, then the third one, and then any remaining one
		#move :last, :first, :nth(3);
		//all the elements that were in the parent scope will now be here
		*
		{
			//apply the object "myButton", which is assumed to have been defined elsewhere
			isA: myButton;
		}
	}
}
</code>
