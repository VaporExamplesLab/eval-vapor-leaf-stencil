//
//  SwifthtmlTemplateBlog.swift
//  App
//
//  Created by marc-medley on 2019.03.27.
//

import Foundation
import Vapor
import Html

struct SwifthtmlTemplateBlog: SwifthtmlTemplate {
    
    public func render<E>(context: E) -> Html.Node where E: Encodable  {
        var titleValue = ""
        var bodyValue = ""
        if let dictionary = context as? [String:String] {
            titleValue = dictionary["titleKey"] ?? "Blog Page"
            bodyValue = dictionary["bodyKey"] ?? "Content not found."
        }
        
        let node =
            html([
                head([
                    //script([("src", "https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.5/latest.js?config=TeX-AMS_SVG")]),
                    //script(<#T##attribs: [Attribute<Tag.Script>]##[Attribute<Tag.Script>]#>),
                    title("\(titleValue)")
                    ]),
                
                body([
                    Node.raw("\(bodyValue)"),
                    br,
                    p([em(["Swift-HTML Template"])])
                    ]) // end body
                ]) // end html
        return node
    }
    
}
