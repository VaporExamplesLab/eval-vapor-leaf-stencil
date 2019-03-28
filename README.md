# eval-vapor-leaf-stencil

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

* Page: README, [Leaf](READ_PAGES/Leaf.md), [Stencil](READ_PAGES/Stencil.md), [Swift-HTML](READ_PAGES/SwiftHtml.md), [Swift Organic](READ_PAGES/SwiftOrganic.md) 
* Section: <a id="toc"></a>
[Approach](#linkApproach) •
[Cases](#linkCases) •
[Getting Started](#linkGettingStarted) •
[Observations](#linkObservations) •
[Preliminary Setup](#linkPreliminarySetup) •
[Resources](#linkResources)

_The `eval-vapor-leaf-stencil` Vapor project provides some select HTML templating examples with Leaf, Stencil, Swift-HTML DSL (Domain Specific Language), and Swift Programming Language (organic)._

## Approach <a id="linkApproach"></a>

All approaches are setup to use the SwiftNIO `EventLoopFuture<ResponseEncodable>` (_typealias_ `Future<ResponseEncodable>`).  Three approaches (leaf, stencil, swift-lang) render a `View` for the `ResponseEncodable`. The swift-html renders a `Html.Node` for the `ResponseEncodable`.

**Leaf** `/leaf/…`

**Stencil** `/stencil/…`

**Swift-HTML DSL** `/swift-html/…`

This approach extends `Html.Node` to be `ResponseEncodable`. Thus, the theses templates are rendered into an `Html.Node` instead of as a `View`.

**Swift Organic** `/swift-lang/…`

"Swift Organic" uses the Swift Programming Language `swift-lang` without any additional templating packages.  This approach assembles a Swift String which is rendered to a Vapor `ResponseEncodable` `View`. 

## Cases <a id="linkCases"></a>

For each use case, replace `/<approach>` with one of `/leaf`, `/stencil`, `/swift-html`, or `/swift-lang` in the URL `localhost:8080/<approach>/<usecase>` URL.  For example, the Leaf approach URL for the "Hello" use case would be `localhost:8080/hello/Sunshine`.

**About** `/<approach>`

The `/<approach>` routes provide some information About specific to each `<approach>`.

**Hello** `/<approach>/hello/<somename>`

**Markdown Blog Entries**

Example Blog Entries in [Resources/HtmlParts/](Resources/HtmlParts/) were converted from Markdown to HTML with Pandoc.

``` bash
##############
### PANDOC ###
##############
## http://pandoc.org/MANUAL.html#pandocs-markdown

OPTIONS="markdown_strict"
OPTIONS="$OPTIONS+pipe_tables"
OPTIONS="$OPTIONS+space_in_atx_header"
OPTIONS="$OPTIONS+blank_before_blockquote"
OPTIONS="$OPTIONS+backtick_code_blocks"
OPTIONS="$OPTIONS+tex_math_dollars"

pandoc \
  --from=$OPTIONS \
  --to=html5 \
  --mathjax \
  --output=math.html \
  math.md
```

_HTML LaTeX Math_  `/<approach>/math`

_Programming Blog Snippet_  `/<approach>/codeblog`

_Markdown To HTML Elements_  `/<approach>/mdtohtml`

* See how markdown elements render via the templates.
* Determine if/when the HTML generated from Markdown needs modification to work with the template syntax.



## Getting Started <a id="linkGettingStarted"></a>

## Observations <a id="linkObservations"></a>

## Preliminary Setup <a id="linkPreliminarySetup"></a>

``` swift
vapor new eval-vapor-leaf-stencil --web
cd eval-vapor-leaf-stencil

mkdir README_files 
touch README_files/.git_keep # create file so folder is not empty for `git`

vapor update -y
```

## Resources <a id="linkResources"></a>

* [GitHub/NocturnalSolutions: StencilBugTest ⇗](https://github.com/NocturnalSolutions/StencilBugTest) … illustrates a simple way to invoke Stencil.
* [GitHub/stencilproject: Stencil ⇗](https://github.com/stencilproject/Stencil)

* [GitHub/pointfreeco: swift-html ⇗](https://github.com/pointfreeco/swift-html)
* [GitHub/pointfreeco: swift-html-vapor ⇗](https://github.com/pointfreeco/swift-html-vapor)

*Discussion*



