# Template Language Syntax

<p align="center">
    <a href="http://docs.vapor.codes/3.0/">
        <img src="http://img.shields.io/badge/read_the-docs-2196f3.svg" alt="Documentation">
    </a>
    <a href="LICENSE">
        <img src="http://img.shields.io/badge/license-MIT-brightgreen.svg" alt="MIT License">
    </a>
    <a href="https://swift.org">
        <img src="http://img.shields.io/badge/swift-4.2-brightgreen.svg" alt="Swift 4.2">
    </a>
</p>

* Page: [README](../README.md), [Leaf](Leaf.md), [Stencil](Stencil.md), [swift-html](Swifthtml.md), [Swift Language (organic)](Swiftlang.md), Template Syntax  
* Section: <a id="toc"></a>
[Notes](#linkNotes) •
[Considerations](#linkConsiderations) •
[Resources](#Resources)

Handlebars is used in the side-by-side syntax comparison tables below. Handlebars is, for the most part, a [superset of Mustache ⇗](https://en.wikipedia.org/wiki/Mustache_(template_system)#Handlebars).  As a syntax superset, the syntax highlighters such as [GitHub Linguist ⇗](https://github.com/github/linguist/blob/master/vendor/README.md), [HighlighJS ⇗](https://highlightjs.org/download/), and [PrismJS ⇗](https://prismjs.com/download.html) support the `handlebars` language.

## Notes <a id="linkNotes">[▴](#toc)</a>

**Comments**

<table border="0.25" cellspacing="0" cellpadding="0" style="width:100%">

<tr>
<th></th>
<th>Leaf 3</th>
<th>Handlebars<br>(Mustache)</th>
<th>Stencil</th>
</tr>

<!-- ** COMMENTS ** -->
<tr>
<th>Comments</th>
<!--LEAF-->
<td>

```html
#// single line comment.

#/* in-line, or
  multiline comment.
*/
```

</td>
<!--HANDLEBARS-->
<td>

```handlebars
{{! comment. }}
```

</td>
<!--STENCIL-->
<td>

```handlebars
{# comment. #}
```

</td>
</table>

* Leaf: Mixed syntax types. Both line-based syntax and block-based syntax.

* Handlebars: Block-based syntax.

* Stencil: Block-based syntax. Minimal strong, symmetric boundary pattern. 

| | |
|----------------|:------------------------------|
| **Leaf 3**     | `#// line-based comment` <br> `#/* block-based comment */`
| **Handlebars** | `{{! block-based comment }}`  |
| **Stencil**    | `{#  block-based comment #}`  |


**Variables**



**Conditions**


## Considerations <a id="linkConsiderations">[▴](#toc)</a>

_Templating Language Considerations_

Benefits:

* Expressive: does just one thing. 
* Declarative: stateless. separation of concerns. not imperative.

Costs:

* Stack Complexity: adds another language to the stack.
* Social Cost: other team members need to learn language. templating languages are not standardized.
* Less Tooling: e.g. syntax highlighting plugin, etc.

## Summary <a id="linkSummary">[▴](#toc)</a>


| | Leaf 3 | Handlebars<br>(Mustache) | Stencil |
|--------------------------------------------|:-:|:-:|:-:|
| Swift Implementation (active maintenance)  | ✓ | ✓ | ✓ |
| Non-Swift Implementations                  |   | ✓ | django |
| Fully Block-Based (no line-based syntax)   |   | ✓ | ✓ |
| Boundary Delimiters use 2 or more ASCII char |   | ✓ | ✓ |
| Minimal Strong, Symmetric Boundary Pattern |   |   | ✓ |


## Resources <a id="Resources">[▴](#toc)</a>

* Django: [Built-in template tags and filters ⇗](https://docs.djangoproject.com/en/2.2/ref/templates/builtins/)
* Leaf 3: [docs ⇗](https://docs.vapor.codes/3.0/leaf/overview/)
* Handlebars: [docs ⇗](http://handlebarsjs.com/), [source ⇗](https://github.com/wycats/handlebars.js)
    * syntax highlighters: 
* Mustache: [source ⇗](http://mustache.github.io/), [mustache(5) ⇗](http://mustache.github.io/mustache.5.html), [GRMustache.swift ⇗](https://github.com/groue/GRMustache.swift) (not maintained), [Perfect-Mustache ⇗](https://github.com/PerfectlySoft/Perfect-Mustache)
* Stencil: [docs ⇗](http://stencil.fuller.li/en/latest/)
