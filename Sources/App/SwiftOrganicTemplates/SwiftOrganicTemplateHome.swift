//
//  SwiftOrganicTemplateHome.swift
//  App
//
//  Created by marc on 2019.03.22.
//

import Foundation

struct SwiftOrganicTemplateHome: SwiftOrganicTemplate {
    
    public func render<E>(context: E) -> String where E: Encodable {
        return homePage
    }
    
    let homePage = """
    <!DOCTYPE html>
    <html>
    <head>
    <title>eval-vapor-leaf-stencil</title>
    <link rel="stylesheet" href="/styles/app.css">
    </head>
    <body>

    <h1 id="toc_0"><code>eval-vapor-leaf-stencil</code></h1>

    <p><strong>Evaluation Links:</strong></p>

    <ul>
    <li>Welcome

    <ul>
    <li><code>/leaf</code> <a href="http://localhost:8080/leaf">Leaf</a></li>
    <li><code>/stencil</code> <a href="http://localhost:8080/stencil">Stencil</a></li>
    <li><code>/swift-html</code> <a href="http://localhost:8080/swift-html">Swift-HTML Domain Specific Language (DSL)</a></li>
    <li><code>/swift-lang</code> <a href="http://localhost:8080/swift-lang">Swift Language Organic Templates</a></li>
    </ul></li>
    <li>Hello

    <ul>
    <li><a href="http://localhost:8080/leaf/hello">/leaf/hello</a> </li>
    <li><a href="http://localhost:8080/leaf/hello/Sunshine">/leaf/hello/Sunshine</a> </li>
    <li><a href="http://localhost:8080/stencil/hello">/stencil/hello</a> </li>
    <li><a href="http://localhost:8080/stencil/hello/Moonbean">/stencil/hello/Moonbean</a> </li>
    <li><a href="http://localhost:8080/swift-html/hello">/swift-html/hello</a> </li>
    <li><a href="http://localhost:8080/swift-html/hello/Stardust">/swift-html/hello/Stardust</a> </li>
    <li><a href="http://localhost:8080/swift-lang/hello">/swift-lang/hello</a> </li>
    <li><a href="http://localhost:8080/swift-lang/hello/Bubbles">/swift-lang/hello/Bubbles</a> </li>
    </ul></li>
    <li>HTML LaTeX Math Presentation

    <ul>
    <li><a href="http://localhost:8080/leaf/latexmath">/leaf/latexmath</a> </li>
    <li><a href="http://localhost:8080/stencil/latexmath">/stencil/latexmath</a> </li>
    <li><a href="http://localhost:8080/swift-html/latexmath">/swift-html/latexmath</a> </li>
    <li><a href="http://localhost:8080/swift-lang/latexmath">/swift-lang/latexmath</a> </li>
    </ul></li>
    <li>Code Blog Snippet

    <ul>
    <li><a href="http://localhost:8080/leaf/codeblog">/leaf/codeblog</a> </li>
    <li><a href="http://localhost:8080/stencil/codeblog">/stencil/codeblog</a> </li>
    <li><a href="http://localhost:8080/swift-html/codeblog">/swift-html/codeblog</a> </li>
    <li><a href="http://localhost:8080/swift-lang/codeblog">/swift-lang/codeblog</a> </li>
    </ul></li>
    <li>Markdown to HTML Elements

    <ul>
    <li><a href="http://localhost:8080/leaf/mdtohtml">/leaf/mdtohtml</a> </li>
    <li><a href="http://localhost:8080/stencil/mdtohtml">/stencil/mdtohtml</a> </li>
    <li><a href="http://localhost:8080/swift-html/mdtohtml">/swift-html/mdtohtml</a> </li>
    <li><a href="http://localhost:8080/swift-lang/mdtohtml">/swift-lang/mdtohtml</a> </li>
    </ul></li>
    <li>Varied Examples

    <ul>
    <li><a href="http://localhost:8080/leaf/example">/leaf/example</a> </li>
    <li><a href="http://localhost:8080/stencil/example">/stencil/example</a> </li>
    <li><a href="http://localhost:8080/swift-html/example">/swift-html/example</a> </li>
    <li><a href="http://localhost:8080/swift-lang/example">/swift-lang/example</a> </li>
    </ul></li>
    </ul>

    </body>
    </html>
    """
}
