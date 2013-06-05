## Sources

- Twitter
  - https://twitter.com/#!/search/realtime/%40AXRProject
- Hackernews
  - http://news.ycombinator.com/item?id=3893248
  - http://news.ycombinator.com/item?id=2648681
- Reddit
  - http://redd.it/hykxl
  - http://redd.it/hzb97
  - http://redd.it/h7gi0
- Articles
  - http://webdev360.com/axr-aims-to-overthrow-the-html-css-monopoly-42223.html
- Mailing list
  - https://groups.google.com/d/topic/axr-main/PelL6EDDtmk/discussion
  - https://groups.google.com/d/topic/axr-main/1AFWx_Vcv44/discussion

We need to compile these in actual ideas. Please, do not leave anything out! It
is nice to add some personal comments so you give them some actual substance.

## Some ideas

- XML spec
- DOM spec
- Wikipedia page update
- Touch devices
- RDF

### Create a Photo Gallery with XML and HSS

- **Brief explanation:** The prototype is already capable of many things. A cool
  image gallery would serve very well as a demo project, and is quite simple as
  a concept.
- **Expected results:** A collection of XML and HSS files, that show a photo
  gallery in the prototype application.
- **Knowledge prerequisite:** XML, HSS

### A UI framework written in HSS

- **Brief explanation:** Authors of web sites and app will want to use
  ready-made interface components when creating documents in AXR. We need to
  create a framework that with a simple "isA: UIObjectName" provides appearance
  with theming support, behavior, and otherwise integration with the rest of the
  system.
- **Expected results:** A collection of HSS documents that provide ready-made
  interface components that are easily customizable.
- **Knowledge prerequisite:** HSS

### Add support for JavaScript to the rendering engine

- **Brief explanation:** Using Google's V8 (or another JS engine, that's still
  up for discussion), add scripting support to the rendering engine. This will
  mean adapt the architecture of the current engine to allow scripting, taking
  care of reflow and events, amongst other things.
- **Expected results:** That we are able to execute basic JavaScript scripts
  from within a HSS document, or linked from it.
- **Knowledge prerequisite:** JavaScript, C++, JS engines

### Design a new DOM API

- **Brief explanation:** Once we integrated a JS engine, we need to provide a
  way to traverse and manipulate our object tree from within JavaScript. Design
  a new DOM-like API, but focused on making it easy for developers, and deeply
  integrated with HSS. For example, the properties of the HSS objects should be
  directly accessible by JS. If a @container has a "height" property, the JS
  object that represents it should also provide a "height" property. Another
  example is to provide a selection mechanism with HSS selector chains, like for
  example `document.sel("hss selector chain")`.
- **Expected results:** An API that allows the author to traverse and manipulate
  the content tree with ease.
- **Knowlege prerequisite:** JavaScript, DOM, knowledge about APIs

### Apply the latest techniques in hardware acceleration to rendering

- **Brief explanation:** Using modern technologies such as OpenVG or OpenCL
  (maybe even OpenGL), investigate and apply them to the rendering part of the
  Core library
- **Expected results:** Better performance for calculation-intensive tasks
- **Knowlege prerequisite:** C/C++, HW acceleration, (OpenVG/OpenCL/OpenGL)?
