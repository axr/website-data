# An overview of the project

Where we're @
-

On the specification front the [HSS documentation](http://hss.axrproject.org/)
is coming along nicely thanks to the effort of Ragnis and yours truly. The core
team has resolved 25% of version 0.4.9's issues. In this regard we are currently
severely understaffed: we only have two active programmers. Consequently we are
looking for C++ programmers—senior would be a plus but a junior would feel at
home nonetheless—willing to help us out delivering the next milestone.

On a related note we currently have two vacant positions:

1. a JS guru (wrote a library or a book)
2. a layout test specialist

If you have been following us on Twitter you should already know that we were
registered to the *best new web technology* category of the
[.net awards](http://www.thenetawards.com/).
Miro is going to attend the ceremony and I might tag along depending on my mood.
We have some fierce competition, notably Dart (Google) and TypeScript
(Microsoft).

A quick look @ some unknown features
-
I am going to elaborate on some obscure intricacies of the HSS language which
weren't documented (until now).
### Anchors
**Disclaimer**: it won't work until [#233](https://github.com/axr/core/issues/233)
is fixed. And `@request` might be renamed at a later time.

The example down below illustrates how basic page linking is achieved in HSS.
You have to keep in mind that the notion of anchors doesn't exist nor do we
provide default styling for elements, hence you will have to do it yourself.
<pre><code>
anchor
{
    on: @click { action: @request { src: "file.xml" } };
    //which is equivalent to
    on: @click { @request { "file.xml" } };
    //default styling for text
    text.decoration: underline;
    font.color: #00E;
}
</code></pre>
### Shorthands
Certain objects have ordered shorthands for their properties. By directly using
their long form first you effectively remove them from the stack. Let's take an
example: [@stroke](http://hss.axrproject.org/@stroke). It's used on the border
property and its stack is ordered as follows: color, size, segments, position,
style and offset.
<pre><code>
element
{
    border: @stroke {
        #F;
        //by using the long form here you can't use its shorthand anymore
        segments: left;
        2;
        //which means the property next in line in the stack is position
        outside;
    };
}
</code></pre>
Related issue: [#132](https://github.com/axr/core/issues/132)
### Keyboard navigation
You can switch the focusability of an element by using the `focusable` property
and the `previous` and `next` properties to navigate back and forth between
focusable elements. If `sel()` is used to target multiple elements or
an unfocusable element the focus won't change. In the following example we
assume `element` is currently focused.
<pre><code>
element
{
    //prerequisite
    focusable: yes;
    //tabbing would focus the next element focusable
    next: auto;
    //tabbing would focus the element which lead to this one
    next: return;
    //tabbing backwards would focus the targetted element
    previous: sel(&lt;selector&gt;);
}
</code></pre>

**Note**: this is [scheduled](http://wiki.axrproject.org/roadmap) for 0.5.0.

Postamble
-
Hopefully I didn't bore you to death. If you want other blog posts like
this one feel free to request a subject in the comments.
