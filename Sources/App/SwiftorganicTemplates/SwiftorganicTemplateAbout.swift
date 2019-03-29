//
//  SwiftorganicTemplateAbout.swift
//  App
//
//  Created by marc-medley on 2019.03.22.
//

import Foundation

struct SwiftorganicTemplateAbout: SwiftorganicTemplate {
    
    public func render<E>(context: E) -> String where E: Encodable {
        
        return """
        <!DOCTYPE html>
        <html>
        <head>
        <title>About</title>
        <link rel="stylesheet" href="/styles/app.css">
        </head>
        <body>
        <p><strong>Basic. Minimal. String. Example.</strong></p>
        <p>Templates written directly with Swift <strong>String</strong>. No dependency on any external Swift Package.</p>
        <br>
        <p><em>Swift Language Organic Template</em></p>
        </body>
        </html>
        """
    }
    
}
