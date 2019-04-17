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
[Notes](#linkSideBySide) •
[Considerations](#linkConsiderations) •
[Resources](#Resources)

## Syntax Highlighters 


|                  | Django | Leaf | Handlebars| Mustache | Stencil | Twig |  
|------------------|:------:|:----:|:---------:|:--------:|:-------:|:----:|
| [Linguist][1]    | ✓      |      | ✓         | ‡        | †       | ✓    |
| [HighlightJS][2] | ✓      | ✓    | ✓         | ‡        | †       | ✓    |
| [PrismJS][3]     | ✓      |      | ✓         | ‡        | †       | ✓    |

[1]:https://github.com/github/linguist/blob/master/vendor/README.md
[2]:https://highlightjs.org/download/
[3]:https://prismjs.com/download.html

```
Legend:
✓ Directly supported syntax.  
† Django, Stencil, Twig syntax family.   
‡ Handlebars, Mustache syntax family.  
```

Handlebars is a ["largely compatible" superset of Mustache ⇗](https://en.wikipedia.org/wiki/Mustache_(template_system)#Handlebars). Stencil and Twig use a block-syntax based on Django.  

## Side-by-Side Syntax <span id="linkSideBySide">[▴](#toc)</span>

Some side-by-side syntax comparison tables is provided below. 

**Comment Statements**

<table border="0.25" cellspacing="0" cellpadding="0" style="width:100%">

<tr>
<th>Leaf 3</th>
<th>Handlebars<br>(Mustache)</th>
<th>Stencil<br>(Django)</th>
</tr>

<tr>
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

```django
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

<table border="0.25" cellspacing="0" cellpadding="0" style="width:100%">

<tr>
<th>Leaf 3</th>
<th>Handlebars<br>(Mustache)</th>
<th>Stencil<br>(Django)</th>
</tr>

<tr>
<!--LEAF-->
<td>

```html
#(variable)

#set("key") { 
  <p>value</p>
}

<div>
  #get("key")
</div>

```

</td>
<!--HANDLEBARS-->
<td>

```handlebars
{{variable}}
{{author.name}}
```

</td>
<!--STENCIL-->
<td>

```django
{{ variable }}
{{ peoplelist.count }}
{{ peoplelist.1 }}, {{peoplelist[1]}}
{{ author.name  }}, {{author[name]}}
```

<ul>
<li>Context lookup</li>
<li>Dictionary lookup</li>
<li>Array|string lookup (first, last, count, by index)</li>
<li>Key value coding lookup</li>
<li>Type introspection (via Mirror)</li>
</ul>

</td>
</table>


**Conditional**

<table border="0.25" cellspacing="0" cellpadding="0" style="width:100%">

<tr>
<th>Leaf 3</th>
<th>Handlebars<br>(Mustache)</th>
<th>Stencil<br>(Django)</th>
</tr>

<tr>
<!--LEAF-->
<td>

```html
#if(title) {
    The title is #(title)
} 

#if(title == "Welcome") {
    About web page.
} else if (1 == 2) {
    What?
} else {
    Something else.
}

operators: +, >, ==, ||, …

<li class="nav-item 
  #if(title == "a"){active}"
>
```

</td>
<!--HANDLEBARS-->
<td>

```handlebars
<div class="entry">
  {{#if author}}
    <h1>{{firstName}} {{lastName}}</h1>
  {{else}}
    <h1>Unknown Author</h1>
  {{/if}}
</div>

<div class="entry">
  {{#unless author}}
  <h3 class="warning">Author not provided.</h3>
  {{/unless}}
</div>
```

</td>
<!--STENCIL-->
<td>

```django
{% if variable %}
  {{ variable }} was found.
{% elif user %}
  A user is logged in.
{% else %}
  No user was found.
{% endif %}
```

operators: ==, !=, <, <=, >, and, or, not

</td>
</table>

| | | |
|----------------|:---------------------------------------------|------------------------|
| **Leaf 3**     | `#if(title == "Home"){active}`               | single ASCII delimiter |
| **Handlebars** |    | [requires helper ⇗](https://stackoverflow.com/questions/34252817/handlebarsjs-check-if-a-string-is-equal-to-a-value) |
| **Stencil**    | `{% if title == "Home" %}active{% endif %}`  | dual ASCII delimiter + endtag |


**Loop**

<table border="0.25" cellspacing="0" cellpadding="0" style="width:100%">

<tr>
<th>Leaf 3</th>
<th>Handlebars<br>(Mustache)</th>
<th>Stencil<br>(Django)</th>
</tr>

<tr>
<!--LEAF-->
<td>

```html
```

</td>
<!--HANDLEBARS-->
<td>

```handlebars
<ul class="paragraph_list">
  {{#each paragraphs}}
    <p>{{this}}</p>
  {{else}}
    <p class="empty">No content</p>
  {{/each}}
</ul>

```

</td>
<!--STENCIL-->
<td>

```django
<ul>
  {% for item in items %}
    <li>{{ item.a }} by {{ item.a }}</li>
  {% empty %}
    <li>There are no items.</li>
  {% endfor %}
</ul>

<ul>
  {% for key, value in dict %}
    <li>{{ key }}: {{ value }}</li>
  {% endfor %}
</ul>

{% for i in 1...array.count %}
{% for user in users where user.a != "z" %}

{% for user in users %}
  User number: {{ forloop.counter }} 
  {% if forloop.first %}
    This is the first user.
  {% endif %}
{% endfor %}
```

</td>
</table>

**Includes**

<table border="0.25" cellspacing="0" cellpadding="0" style="width:100%">

<tr>
<th>Leaf 3</th>
<th>Handlebars<br>(Mustache)</th>
<th>Stencil<br>(Django)</th>
</tr>

<tr>
<!--LEAF-->
<td>

```html
```

</td>
<!--HANDLEBARS-->
<td>

```handlebars
```

</td>
<!--STENCIL-->
<td>

```django
{% include "file.html" %}
{% include "file.html" subcontext %}
```

</td>
</table>

**Inheritance**

<table border="0.25" cellspacing="0" cellpadding="0" style="width:100%">

<tr>
<th>Leaf 3</th>
<th>Handlebars<br>(Mustache)</th>
<th>Stencil<br>(Django)</th>
</tr>

<tr>
<!--LEAF-->
<td>

```html
```

</td>
<!--HANDLEBARS-->
<td>

```handlebars
```

</td>
<!--STENCIL-->
<td>

_parent.html_

```django
{% block namedBlock %}
<!-- parent content here -->
{% endblock %}
```

_child.html_

```django
{% extends "parent.html" %}

{% block namedBlock %}
  <h2>replaces parent content</h2>
{% endblock %}
```

</td>
</table>

**...**

<table border="0.25" cellspacing="0" cellpadding="0" style="width:100%">

<tr>
<th>Leaf 3</th>
<th>Handlebars<br>(Mustache)</th>
<th>Stencil<br>(Django)</th>
</tr>

<tr>
<!--LEAF-->
<td>

```html
```

</td>
<!--HANDLEBARS-->
<td>

```handlebars
```

</td>
<!--STENCIL-->
<td>

```django
```

</td>
</table>

## Considerations <span id="linkConsiderations">[▴](#toc)</span>

_Templating Language Considerations_

Benefits:

* Expressive: does just one thing. 
* Declarative: stateless. separation of concerns. not imperative.

Costs:

* Stack Complexity: adds another language to the stack.
* Social Cost: other team members need to learn language. templating languages are not standardized.
* Less Tooling: e.g. syntax highlighting plugin, etc.

## Summary <span id="linkSummary">[▴](#toc)</span>


| | Leaf 3 | Handlebars<br>(Mustache) | Stencil<br>(Django) |
|--------------------------------------------|:-:|:-:|:-:|
| Swift Implementation (active maintenance)  | ✓ | ✓ | ✓ |
| Non-Swift Implementations                  |   | ✓ | ✓ |
| Fully Block-Based (no line-based syntax)   |   | ✓ | ✓ |
| Delimiter use 2 or more ASCII characters   |   | ✓ | ✓ |
| Body endtag                                |   | ✓ | ✓ |
| Minimal Strong, Symmetric Boundary Pattern |   |   | ✓ |


## Resources <span id="Resources">[▴](#toc)</span>

_Syntax Highlighters_


* [GitHub/Linguist ⇗](https://github.com/github/linguist/blob/master/vendor/README.md)
* [HighlighJS ⇗](https://highlightjs.org/download/)
* [PrismJS ⇗](https://prismjs.com/download.html)

_Templating_

* Django: [docs (built-in template tags and filters) ⇗](https://docs.djangoproject.com/en/2.2/ref/templates/builtins/), [🅆](https://en.wikipedia.org/wiki/Django_(web_framework))
* Leaf 3: [docs ⇗](https://docs.vapor.codes/3.0/leaf/overview/)
* Handlebars: [docs ⇗](http://handlebarsjs.com/), [source [JavaScript] ⇗](https://github.com/wycats/handlebars.js) 
* Jinja [home](http://jinja.pocoo.org/), [source[Python]](https://github.com/pallets/jinja) 
* Mustache: [docs ⇗](http://mustache.github.io/), [mustache(5) ⇗](http://mustache.github.io/mustache.5.html), [GRMustache.swift ⇗](https://github.com/groue/GRMustache.swift) (not maintained), [Perfect-Mustache ⇗](https://github.com/PerfectlySoft/Perfect-Mustache), [](https://github.com/janl/mustache.js/releases)
* Stencil: [docs ⇗](http://stencil.fuller.li/en/latest/), [source ⇗](https://github.com/stencilproject/Stencil/)
* Twig: [home](https://twig.symfony.com/), [wikipedia](https://en.wikipedia.org/wiki/Twig_(template_engine)), [source](https://github.com/twigphp/Twig)
