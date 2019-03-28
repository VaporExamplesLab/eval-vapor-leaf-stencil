//
//  SwiftHtmlController.swift
//  App
//
//  Created by marc on 2019.03.19.
//

import Foundation
import Vapor
import Html

struct SwiftHtmlController: RouteCollection {

    let htmlPartsUrl: URL
    
    init(resourcesUrl: URL) {
        self.htmlPartsUrl = resourcesUrl.appendingPathComponent("HtmlParts", isDirectory: true)
    }
    
    func boot(router: Router) throws {
        let swiftHtmlRoutes = router.grouped("swift-html")
        
        // GET /swift-html About page.
        swiftHtmlRoutes.get {
            (request: Request) -> Future<Html.Node> in
            return try request
                .make(SwiftHtmlRenderer.self)
                .render(template: SwiftHtmlTemplateAbout(), [String:String]())
        }
        
        // GET /swift-html/hello
        swiftHtmlRoutes.get("hello", use: swiftHtmlHelloHandler)
        
        // GET /swift-html/hello/name
        swiftHtmlRoutes.get("hello", String.parameter, use: swiftHtmlHelloHandler)
        
        // GET /swift-html/example
        swiftHtmlRoutes.get("example") {
            // `(request: Request) -> ResponseEncodable`
            (request: Request) -> Html.Node in
            let node: Node = html([
                body([
                    h1(["Type-safe Vapor HTML"]),
                    p([
                        """
                        Swift-HTML Domain Specific Language allows you to write
                        type-safe, transformable, composable HTML views in a Vapor app!

                        Swift-HTML DSL
                        """
                        ]) // end p
                    ]) // end body
                ]) // end html
            return node
        }
    }
    
    // func handler(_ request: Request) -> ResponseEncodable { }
    
    // GET /swift-html/hello/name
    func swiftHtmlHelloHandler(_ request: Request) throws -> Future<Html.Node> {
        var context: [String: String] = [:]
        if let name = try? request.parameters.next(String.self) {
            context["name"] = name
        }
        else {
            context["name"] = "glad you could stop by"
        }
        
        let swiftHtmlTemplate = SwiftHtmlTemplateHello()
        let swiftHtmlRender = try request.make(SwiftHtmlRenderer.self)
        return swiftHtmlRender.render(template: swiftHtmlTemplate, context)
    }
    
}
