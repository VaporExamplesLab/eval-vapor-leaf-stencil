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

    <li>About
    <ul>
    <li><a href="http://localhost:8080/leaf"><code>/leaf</code></a> <em>Leaf</em></li>
    <li><a href="http://localhost:8080/stencil"><code>/stencil</code></a> <em>Stencil</em></li>
    <li><a href="http://localhost:8080/swift-html"><code>/swift-html</code></a> <em>Swift-HTML Domain Specific Language (DSL)</em></li>
    <li><a href="http://localhost:8080/swift-lang"><code>/swift-lang</code></a> <em>Swift Language Organic Templates</em></li>
    </ul></li>
    <br>

    <li>Hello
    <ul>
    <li><a href="http://localhost:8080/leaf/hello"><code>/leaf/hello</code></a> </li>
    <li><a href="http://localhost:8080/leaf/hello/Sunshine"><code>/leaf/hello/Sunshine</code></a> </li>
    <li><a href="http://localhost:8080/stencil/hello"><code>/stencil/hello</code></a> </li>
    <li><a href="http://localhost:8080/stencil/hello/Moonbean"><code>/stencil/hello/Moonbean</code></a> </li>
    <li><a href="http://localhost:8080/swift-html/hello"><code>/swift-html/hello</code></a> </li>
    <li><a href="http://localhost:8080/swift-html/hello/Stardust"><code>/swift-html/hello/Stardust</code></a> </li>
    <li><a href="http://localhost:8080/swift-lang/hello"><code>/swift-lang/hello</code></a> </li>
    <li><a href="http://localhost:8080/swift-lang/hello/Bubbles"><code>/swift-lang/hello/Bubbles</code></a> </li>
    </ul></li>

    <br>
    <li>HTML LaTeX Math Presentation
    <ul>
    <li><a href="http://localhost:8080/leaf/latexmath"><code>/leaf/latexmath</code></a> </li>
    <li><a href="http://localhost:8080/stencil/latexmath"><code>/stencil/latexmath</code></a> </li>
    <li><a href="http://localhost:8080/swift-html/latexmath"><code>/swift-html/latexmath</code></a> </li>
    <li><a href="http://localhost:8080/swift-lang/latexmath"><code>/swift-lang/latexmath</code></a> </li>
    </ul></li>

    <br>
    <li>Code Blog Snippet
    <ul>
    <li><a href="http://localhost:8080/leaf/codeblog"><code>/leaf/codeblog</code></a> </li>
    <li><a href="http://localhost:8080/stencil/codeblog"><code>/stencil/codeblog</code></a> </li>
    <li><a href="http://localhost:8080/swift-html/codeblog"><code>/swift-html/codeblog</code></a> </li>
    <li><a href="http://localhost:8080/swift-lang/codeblog"><code>/swift-lang/codeblog</code></a> </li>
    </ul></li>

    <br>
    <li>Markdown to HTML Elements
    <ul>
    <li><a href="http://localhost:8080/leaf/mdtohtml"><code>/leaf/mdtohtml</code></a> </li>
    <li><a href="http://localhost:8080/stencil/mdtohtml"><code>/stencil/mdtohtml</code></a> </li>
    <li><a href="http://localhost:8080/swift-html/mdtohtml"><code>/swift-html/mdtohtml</code></a> </li>
    <li><a href="http://localhost:8080/swift-lang/mdtohtml"><code>/swift-lang/mdtohtml</code></a> </li>
    </ul>
    </li>

    </ul>

    </body>
    </html>
    """
}
