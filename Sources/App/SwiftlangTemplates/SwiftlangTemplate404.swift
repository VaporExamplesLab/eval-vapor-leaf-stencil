//
//  SwiftlangTemplate404.swift
//  App
//
//  Created by marc-medley on 2019.03.21.
//

import Foundation

struct SwiftlangTemplate404: SwiftlangTemplate {
    
    public func render<E>(context: E) -> String where E: Encodable {
        var templatename = ""
        if let dictionary = context as? [String:String] {
            templatename = dictionary["templatename"] ?? ""
        }

        return """
        <!DOCTYPE html>
        <html>
        <head>
          <title>404 Not Found</title>
          <link rel="stylesheet" href="/styles/app.css">
        </head>
        <body>
          <h1>404 Template \"\(templatename)\" Not Found</h1>
          <em>Swift Language (organic) Template</em>
        </body>
        </html>
        """
    }
    
}
