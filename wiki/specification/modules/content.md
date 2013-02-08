## Text

### Basic

- tracking
- tab
- `alignX: left | right | center | justify | <number>;`
- indent
- wordSpacing

### Advanced

#### 0.5

- alignX: start | end;
- alignY
- lineWrap
- overflow
- whitespace
- wrap: (auto) | breakWord;

#### 0.6

- hangingPunctuation
- wrap: hyphenate;

## Text styling

### Basic

- @font
  - fauxBold
  - fauxItalic
  - color
  - faces
  - size
- @text
  - decoration
  - transform

### Advanced

#### 0.5

- weight
- style
- src

#### 0.6

- kerning
- sizeAdjust
- stretch

## #support

- version 0.4
- filters, flags, splitters 0.4
- negation 0.4
- objects 0.5
- combinators 0.5
- modifiers 0.5
- properties 0.6
- values 0.6

## Asian languages

- text-justify
- layout-grid
- line-break
- punctuation-trim
- ruby-align
- ruby-overhang
- ruby-position
- ruby-span
- text-autospace
- font-emphasize / text-emphasis
- text-kashida-space
- word-break
- writing-mode / layout-flow
- ime-mode

## @font

- style: (no) | oblique | italic;
- weight: keyword | weight class;
  - keywords: hairline, thin, ultraLight, extraLight, light, book, (normal),
    medium, semiBold, bold, extraBold, heavy, black, extraBlack, ultraBlack
  - weight class: 100 (thin), 200 (extralight), 300 (light), 400 (normal),
    500 (medium), 600 (semibold), 700 (bold), 800 (heavy), 900 (black)
- stretch: (no) | keyword;
  - keywords: ultraCondensed, extraCondensed, condensed, semiCondensed,
    semiExpanded, expanded, extraExpanded, ultraExpanded
- kerning: (yes) | no;
- faces
- size
- color
- fauxBold
- fauxItalic
- sizeAdjust
