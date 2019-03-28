//
//  SwiftOrganicTemplateBlog.swift
//  App
//
//  Created by marc-medley on 2019.03.27.
//

import Foundation

struct SwiftOrganicTemplateBlog: SwiftOrganicTemplate {
    
    public func render<E>(context: E) -> String where E: Encodable {
        var titleValue = ""
        var bodyValue = ""
        if let dictionary = context as? [String:String] {
            titleValue = dictionary["titleKey"] ?? "Blog Page"
            bodyValue = dictionary["bodyKey"] ?? "Content not found."
        }

        return """
        <!DOCTYPE html>
        <html>
        <head>
        <title>\(titleValue)</title>
        <link rel="stylesheet" href="/styles/app.css">
        </head>
        <body>
        <p>\(bodyValue)</p>
        <p><em>Swift Language Organic Template</em></p>
        </body>
        </html>
        """
    }
    
}
