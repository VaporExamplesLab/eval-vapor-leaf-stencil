# Templating Language Syntax

<a id="toc"></a>
[Notes](#linkNotes) •
[Considerations](#linkConsiderations) •
[Resources](#Resources)

## Notes <a id="linkNotes">[▴](#toc)</a>

**Comments**

<table border="0.25" cellspacing="0" cellpadding="0" style="width:100%">

<tr>
<th></th>
<th>Leaf 3</th>
<th>Handlebars (Mustache "superset")</th>
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
{{!   comment.   }}
{{!-- comment. --}}
```

</td>
<!--STENCIL-->
<td>

```handlebars
{# comment. #}
```

</td>
</table>

* Leaf: Mixed syntax types. Both line-based syntax and block-based based syntax.

* Handlebars: block-based syntax.

* Stencil: block-based syntax. single pattern. 

**Variables**

## Considerations <a id="linkConsiderations">[▴](#toc)</a>

_Templating Language Considerations_

Benefits:

* Expressive: does just one thing. 
* Declarative: stateless. separation of concerns. not imperative.

Costs:

* Stack Complexity: adds another language to the stack.
* Social Cost: other team members need to learn language. templating languages are not standardized.
* Less Tooling: e.g. syntax highlighting plugin, etc.

## Resources <a id="Resources">[▴](#toc)</a>

* 
* Handlebars: [docs ⇗](http://handlebarsjs.com/), [source ⇗](https://github.com/wycats/handlebars.js), [mustache(5) ⇗](http://mustache.github.io/mustache.5.html)
* Stencil: [docs ⇗](http://stencil.fuller.li/en/latest/)
* Leaf 3.o: [docs ⇗](https://docs.vapor.codes/3.0/leaf/overview/)
