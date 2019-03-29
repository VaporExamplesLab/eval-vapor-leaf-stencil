//
//  SwiftorganicTemplateBlog.swift
//  App
//
//  Created by marc-medley on 2019.03.27.
//

import Foundation

struct SwiftorganicTemplateBlog: SwiftorganicTemplate {
    
    public func render<E>(context: E) -> String where E: Encodable {
        var titleValue = ""
        var bodyValue = ""
        if let dictionary = context as? [String:String] {
            titleValue = dictionary["titleKey"] ?? "Blog Page"
            bodyValue = dictionary["bodyKey"] ?? "Content not found."
        }
        
        return """
        <!DOCTYPE html>
        <html lang="en" class="h-100">
        <head>
        <!-- Bootstrap required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- Other metadata -->
        <meta name="description" content="">
        <meta name="author" content="VaporExamplesLab">
        
        <!-- Bootstrap CSS -->
        <!-- Bootswatch Theme -->
        <!-- Cerulean: calm blue sky -->
        <link rel="stylesheet"
        href="https://stackpath.bootstrapcdn.com/bootswatch/4.3.1/cerulean/bootstrap.min.css"
        integrity="sha384-C++cugH8+Uf86JbNOnQoBweHHAe/wVKN/mb0lTybu/NZ9sEYbd+BbbYtNpWYAsNP"
        crossorigin="anonymous">
        
        <!-- Highlight.js -->
        <!-- reference: https://highlightjs.org/download/ -->
        <link rel="stylesheet"
        href="//cdnjs.cloudflare.com/ajax/libs/highlight.js/9.15.6/styles/default.min.css">
        
        <!-- Custom styles overriding CSS -->
        <link rel="stylesheet" href="/styles/app.css">
        
        <!-- MathJax -->
        <!-- https://www.mathjax.org/#gettingstarted -->
        <!-- config=TeX-MML-AM_CHTML (standard) | config=TeX-AMS_SVG (SVG)-->
        <!-- script src='https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.5/MathJax.js?config=TeX-AMS_SVG' async></script -->
        <script src='https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.5/latest.js?config=TeX-AMS_SVG' async>
        </script>
        
        <title>\(titleValue)</title>
        </head>
        
        <body class="d-flex flex-column h-100">
        
        <main role="main" class="flex-shrink-0">
        <div class="container mt-0">
        
        <!-- base_header: BEGIN PAGE CONTENT HERE -->
        \(bodyValue)
        <!-- base_footer: END PAGE CONTENT HERE -->
        
        <br>
        <p><em>Swift Language Organic Template</em></p>
        </div>
        </main>

        <!-- Bootstrap -->
        <!-- JavaScript to support various Bootstrap features -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        
        <!-- Highlight.js -->
        <script src="//cdnjs.cloudflare.com/ajax/libs/highlight.js/9.15.6/highlight.min.js"></script>
        <script>hljs.initHighlightingOnLoad();</script>
        
        </body>
        </html>
        """
    }
    
    
    
}
