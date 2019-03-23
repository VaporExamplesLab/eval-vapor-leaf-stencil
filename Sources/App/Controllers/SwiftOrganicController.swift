//
//  SwiftOrganicController.swift
//  App
//
//  Created by marc on 2019.03.19.
//

import Foundation
import Vapor

struct SwiftOrganicController: RouteCollection {
    func boot(router: Router) throws {
        let swiftLangRoutes = router.grouped("swift-lang")
        
        // GET /swift-lang About welcome page.
        swiftLangRoutes.get {
            (request: Request) -> Future<View> in
            return try request
                .make(SwiftOrganicRenderer.self)
                .render(template: SwiftOrganicTemplateAbout(), [String:String]())
        }
        
        // GET /swift-lang/hello
        swiftLangRoutes.get("hello", use: swiftLangHelloHandler)
        
        // GET /swift-lang/hello/name
        swiftLangRoutes.get("hello", String.parameter, use: swiftLangHelloHandler)
        
        swiftLangRoutes.get("example") {
            // (request: Request) -> ResponseEncodable in
            (request: Request) -> String in
            return """
            Basic. Minimal. String. Example.
            
            Swift Organic Language.
            """
        }
    }
    
    // GET /swift-lang/hello/name
    func swiftLangHelloHandler(_ request: Request) throws -> Future<View> {
        var context: [String: String] = [:]
        if let name = try? request.parameters.next(String.self) {
            context["name"] = name
        }
        else {
            context["name"] = "glad you could stop by"
        }
        
        let swiftLangTemplate = SwiftOrganicTemplateHello()
        let swiftLangRender = try request.make(SwiftOrganicRenderer.self)
        return swiftLangRender.render(template: swiftLangTemplate, context)
    }

    

}
