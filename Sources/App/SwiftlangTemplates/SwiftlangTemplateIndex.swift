//
//  SwiftlangTemplateIndex.swift
//  App
//
//  Created by marc-medley on 2019.03.22.
//

import Foundation

struct SwiftlangTemplateIndex: SwiftlangTemplate {
    
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

    <!-- :CONTENT:BEGIN:Index: -->
    <h1><code>eval-vapor-leaf-stencil</code></h1>
    <p><strong>Evaluation Links:</strong></p>
    <p><em>About</em></p>
    <ul>
    <li><code>/leaf</code> <a href="http://localhost:8080/leaf">Leaf</a></li>
    <li><code>/stencil</code> <a href="http://localhost:8080/stencil">Stencil</a></li>
    <li><code>/swift-html</code> <a href="http://localhost:8080/swift-html">Swift-HTML Domain Specific Language (DSL)</a></li>
    <li><code>/swiftlang</code> <a href="http://localhost:8080/swiftlang">Swift Language Organic Templates</a></li>
    </ul>
    <p><em>Hello</em></p>
    <ul>
    <li><a href="http://localhost:8080/leaf/hello">/leaf/hello</a></li>
    <li><a href="http://localhost:8080/leaf/hello/Sunshine">/leaf/hello/Sunshine</a></li>
    <li><a href="http://localhost:8080/stencil/hello">/stencil/hello</a></li>
    <li><a href="http://localhost:8080/stencil/hello/Moonbean">/stencil/hello/Moonbean</a></li>
    <li><a href="http://localhost:8080/swift-html/hello">/swift-html/hello</a></li>
    <li><a href="http://localhost:8080/swift-html/hello/Stardust">/swift-html/hello/Stardust</a></li>
    <li><a href="http://localhost:8080/swiftlang/hello">/swiftlang/hello</a></li>
    <li><a href="http://localhost:8080/swiftlang/hello/Bubbles">/swiftlang/hello/Bubbles</a></li>
    </ul>
    <p><em>HTML LaTeX Math Presentation</em></p>
    <ul>
    <li><a href="http://localhost:8080/leaf/latexmath">/leaf/latexmath</a></li>
    <li><a href="http://localhost:8080/stencil/latexmath">/stencil/latexmath</a></li>
    <li><a href="http://localhost:8080/swift-html/latexmath">/swift-html/latexmath</a></li>
    <li><a href="http://localhost:8080/swiftlang/latexmath">/swiftlang/latexmath</a></li>
    </ul>
    <p><em>Code Blog Snippet</em></p>
    <ul>
    <li><a href="http://localhost:8080/leaf/codeblog">/leaf/codeblog</a></li>
    <li><a href="http://localhost:8080/stencil/codeblog">/stencil/codeblog</a></li>
    <li><a href="http://localhost:8080/swift-html/codeblog">/swift-html/codeblog</a></li>
    <li><a href="http://localhost:8080/swiftlang/codeblog">/swiftlang/codeblog</a></li>
    </ul>
    <p><em>Markdown to HTML Elements</em></p>
    <ul>
    <li><a href="http://localhost:8080/leaf/mdtohtml">/leaf/mdtohtml</a></li>
    <li><a href="http://localhost:8080/stencil/mdtohtml">/stencil/mdtohtml</a></li>
    <li><a href="http://localhost:8080/swift-html/mdtohtml">/swift-html/mdtohtml</a></li>
    <li><a href="http://localhost:8080/swiftlang/mdtohtml">/swiftlang/mdtohtml</a></li>
    </ul>
    <!--:CONTENT:END:Index: -->

    </body>
    </html>
    """
}
