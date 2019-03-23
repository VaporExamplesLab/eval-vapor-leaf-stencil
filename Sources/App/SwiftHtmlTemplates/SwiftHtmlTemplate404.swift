//
//  SwiftHtmlTemplate404.swift
//  App
//
//  Created by marc on 2019.03.21.
//

import Foundation
import Vapor
import Html

struct SwiftHtmlTemplate404: SwiftHtmlTemplate {
    
    public func render<E>(context: E) -> Html.Node where E: Encodable  {
        var templatename = ""
        if let dictionary = context as? [String:String] {
            templatename = dictionary["templatename"] ?? ""
        }

        let node = html([
            head([
                title("404 Not Found")
                ]),
            
            body([
                h1([Node.text("404 Not Found [\(templatename)]")]),
                p([em(["Swift-HTML Template"])])
                ]) // end body
            ]) // end html
        return node
    }
    
}
