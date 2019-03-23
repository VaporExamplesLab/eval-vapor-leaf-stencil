//
//  SwiftOrganicTemplateAbout.swift
//  App
//
//  Created by marc on 2019.03.22.
//

import Foundation

struct SwiftOrganicTemplateAbout: SwiftOrganicTemplate {
    
    public func render<E>(context: E) -> String where E: Encodable {
        
        return """
        <!DOCTYPE html>
        <html>
        <head>
        <title>About</title>
        <link rel="stylesheet" href="/styles/app.css">
        </head>
        <body>
        <h1>Welcome.</h1>
        <em>Swift Language Organic Template</em>
        </body>
        </html>
        """
    }
    
}
