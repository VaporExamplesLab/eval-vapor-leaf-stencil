//
//  SwiftorganicTemplateHello.swift
//  App
//
//  Created by marc-medley on 2019.03.20.
//

import Foundation

struct SwiftorganicTemplateHello: SwiftorganicTemplate {
    
    public func render<E>(context: E) -> String where E: Encodable {
        var name = ""
        if let dictionary = context as? [String:String] {
            name = dictionary["nameKey"] ?? "it's good to see you"
        }
        
        return """
        <!DOCTYPE html>
        <html>
        <head>
          <title>\(name)</title>
          <link rel="stylesheet" href="/styles/app.css">
        </head>
        <body>
          <h1>Hello, \(name)!</h1>
          <em>Swift Language Organic Template</em>
        </body>
        </html>
        """
    }
    
}
