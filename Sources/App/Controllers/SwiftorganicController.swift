//
//  SwiftorganicController.swift
//  App
//
//  Created by marc-medley on 2019.03.19.
//

import Foundation
import Vapor

struct SwiftorganicController: RouteCollection {

    let htmlPartsUrl: URL
    
    init(resourcesUrl: URL) {
        self.htmlPartsUrl = resourcesUrl.appendingPathComponent("HtmlParts", isDirectory: true)
    }

    func boot(router: Router) throws {
        let swiftlangRoutes = router.grouped("swift-lang")
        
        // GET /swift-lang About page.
        swiftlangRoutes.get {
            (request: Request) -> Future<View> in
            return try request
                .make(SwiftorganicRenderer.self)
                .render(template: SwiftorganicTemplateAbout(), [String:String]())
        }
        
        // GET /swift-lang/hello
        swiftlangRoutes.get("hello", use: swiftlangHelloHandler)
        
        // GET /swift-lang/hello/name
        swiftlangRoutes.get("hello", String.parameter, use: swiftlangHelloHandler)
        
        // GET /swift-lang/latexmath
        swiftlangRoutes.get("latexmath", use: swiftlangMathHandler)
        
        // GET /swift-lang/codeblog
        swiftlangRoutes.get("codeblog", use: swiftlangCodeblogHandler)
        
        // GET /swift-lang/mdtohtml
        swiftlangRoutes.get("mdtohtml", use: swiftlangMdtohtmlHandler)
    }
    
    // GET /swift-lang/hello/name
    func swiftlangHelloHandler(_ request: Request) throws -> Future<View> {
        var context: [String: String] = [:]
        if let name = try? request.parameters.next(String.self) {
            context["nameKey"] = name
        }
        else {
            context["nameKey"] = "glad you could stop by"
        }
        
        let swiftlangTemplate = SwiftorganicTemplateHello()
        let swiftlangRender = try request.make(SwiftorganicRenderer.self)
        return swiftlangRender.render(template: swiftlangTemplate, context)
    }

    // GET /swift-html/latexmath
    func swiftlangMathHandler(_ request: Request) throws -> Future<View> {
        let body = try String(
            contentsOf: htmlPartsUrl.appendingPathComponent("math.html", isDirectory: false),
            encoding: String.Encoding.utf8)
        let context: [String: String] = ["titleKey":"Math Presentation", "bodyKey": body]
        
        let swiftlangTemplate = SwiftorganicTemplateBlog()
        let swiftlangRender = try request.make(SwiftorganicRenderer.self)
        return swiftlangRender.render(template: swiftlangTemplate, context)
    }
    
    // GET /swift-html/codeblog
    func swiftlangCodeblogHandler(_ request: Request) throws -> Future<View> {
        let body = try String(
            contentsOf: htmlPartsUrl.appendingPathComponent("codeblog.html", isDirectory: false),
            encoding: String.Encoding.utf8)
        let context: [String: String] = ["titleKey":"Code Blog", "bodyKey": body]
        
        let swiftlangTemplate = SwiftorganicTemplateBlog()
        let swiftlangRender = try request.make(SwiftorganicRenderer.self)
        return swiftlangRender.render(template: swiftlangTemplate, context)
    }
    
    // GET /swift-html/mdtohtml
    func swiftlangMdtohtmlHandler(_ request: Request) throws -> Future<View> {
        let body = try String(
            contentsOf: htmlPartsUrl.appendingPathComponent("mdtohtml.html", isDirectory: false),
            encoding: String.Encoding.utf8)
        let context: [String: String] = ["titleKey":"MD ➜ HTML Elements", "bodyKey": body]
        
        let swiftlangTemplate = SwiftorganicTemplateBlog()
        let swiftlangRender = try request.make(SwiftorganicRenderer.self)
        return swiftlangRender.render(template: swiftlangTemplate, context)
    }

}
