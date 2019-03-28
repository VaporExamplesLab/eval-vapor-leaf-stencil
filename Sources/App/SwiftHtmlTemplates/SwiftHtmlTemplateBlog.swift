//
//  SwiftHtmlTemplateBlog.swift
//  App
//
//  Created by marc-medley on 2019.03.27.
//

import Foundation
import Vapor
import Html

struct SwiftHtmlTemplateBlog: SwiftHtmlTemplate {
    
    public func render<E>(context: E) -> Html.Node where E: Encodable  {
        var titleValue = ""
        var bodyValue = ""
        if let dictionary = context as? [String:String] {
            titleValue = dictionary["titleKey"] ?? "Blog Page"
            bodyValue = dictionary["bodyKey"] ?? "Content not found."
        }

        let node = html([
            head([
                title("\(titleValue)")
                ]),
            
            body([
                h1([Node.text("Blog Page")]),
                Node.raw("\(bodyValue)"),
                p([em(["Swift-HTML Template"])])
                ]) // end body
            ]) // end html
        return node
    }
    
}
