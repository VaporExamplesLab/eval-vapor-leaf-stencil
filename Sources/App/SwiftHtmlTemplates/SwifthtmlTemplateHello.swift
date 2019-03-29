//
//  SwifthtmlTemplateHello.swift
//  App
//
//  Created by marc-medley on 2019.03.20.
//

import Foundation
import Vapor
import Html

struct SwifthtmlTemplateHello: SwifthtmlTemplate {
    
    public func render<E>(context: E) -> Html.Node where E: Encodable  {
        var name = ""
        if let dictionary = context as? [String:String] {
            name = dictionary["nameKey"] ?? "it's good to see you"
        }

        let node = html([
            head([
                title("Hello, \(name)")
                ]),
            
            body([
                h1([Node.text("Hello, \(name)!")]),
                p([em(["Swift-HTML Template"])])
                ]) // end body
            ]) // end html
        return node
    }
    
}
