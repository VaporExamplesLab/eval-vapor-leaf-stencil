//
//  SwifthtmlTemplate404.swift
//  App
//
//  Created by marc-medley on 2019.03.21.
//

import Foundation
import Vapor
import Html

struct SwifthtmlTemplate404: SwifthtmlTemplate {
    
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
                p([em(["swift-html Template"])])
                ]) // end body
            ]) // end html
        return node
    }
    
}
