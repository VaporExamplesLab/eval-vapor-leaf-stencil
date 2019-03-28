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
        <h1>About</h1>
        <em>Swift Language Organic Template</em>
        <br>
        <p>Templates written directly with Swift String without any dependency on an external package.</p>
        </body>
        </html>
        """
    }
    
}
