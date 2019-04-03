//
//  SwiftlangController.swift
//  App
//
//  Created by marc-medley on 2019.03.19.
//

import Foundation
import Vapor

struct SwiftlangController: RouteCollection {

    let htmlPartsUrl: URL
    
    init(resourcesUrl: URL) {
        self.htmlPartsUrl = resourcesUrl.appendingPathComponent("HtmlParts", isDirectory: true)
    }

    func boot(router: Router) throws {
        let swiftlangRoutes = router.grouped("swiftlang")
        
        // GET /swiftlang About page.
        swiftlangRoutes.get {
            (request: Request) -> Future<View> in
            return try request
                .make(SwiftlangRenderer.self)
                .render(template: SwiftlangTemplateAbout(), [String:String]())
        }
        
        // GET /swiftlang/hello
        swiftlangRoutes.get("hello", use: swiftlangHelloHandler)
        
        // GET /swiftlang/hello/name
        swiftlangRoutes.get("hello", String.parameter, use: swiftlangHelloHandler)
        
        // GET /swiftlang/latexmath
        swiftlangRoutes.get("latexmath", use: swiftlangMathHandler)
        
        // GET /swiftlang/codeblog
        swiftlangRoutes.get("codeblog", use: swiftlangCodeblogHandler)
        
        // GET /swiftlang/mdtohtml
        swiftlangRoutes.get("mdtohtml", use: swiftlangMdtohtmlHandler)
    }
    
    // GET /swiftlang/hello/name
    func swiftlangHelloHandler(_ request: Request) throws -> Future<View> {
        var context: [String: String] = [:]
        if let name = try? request.parameters.next(String.self) {
            context["nameKey"] = name
        }
        else {
            context["nameKey"] = "glad you could stop by"
        }
        
        let swiftlangTemplate = SwiftlangTemplateHello()
        let swiftlangRender = try request.make(SwiftlangRenderer.self)
        return swiftlangRender.render(template: swiftlangTemplate, context)
    }

    // GET /swift-html/latexmath
    func swiftlangMathHandler(_ request: Request) throws -> Future<View> {
        let body = try String(
            contentsOf: htmlPartsUrl.appendingPathComponent("latexmath.html", isDirectory: false),
            encoding: String.Encoding.utf8)
        let context: [String: String] = ["titleKey":"Math Presentation", "bodyKey": body]
        
        let swiftlangTemplate = SwiftlangTemplateBlog()
        let swiftlangRender = try request.make(SwiftlangRenderer.self)
        return swiftlangRender.render(template: swiftlangTemplate, context)
    }
    
    // GET /swift-html/codeblog
    func swiftlangCodeblogHandler(_ request: Request) throws -> Future<View> {
        let body = try String(
            contentsOf: htmlPartsUrl.appendingPathComponent("codeblog.html", isDirectory: false),
            encoding: String.Encoding.utf8)
        let context: [String: String] = ["titleKey":"Code Blog", "bodyKey": body]
        
        let swiftlangTemplate = SwiftlangTemplateBlog()
        let swiftlangRender = try request.make(SwiftlangRenderer.self)
        return swiftlangRender.render(template: swiftlangTemplate, context)
    }
    
    // GET /swift-html/mdtohtml
    func swiftlangMdtohtmlHandler(_ request: Request) throws -> Future<View> {
        let body = try String(
            contentsOf: htmlPartsUrl.appendingPathComponent("mdtohtml.html", isDirectory: false),
            encoding: String.Encoding.utf8)
        let context: [String: String] = ["titleKey":"MD ➜ HTML Elements", "bodyKey": body]
        
        let swiftlangTemplate = SwiftlangTemplateBlog()
        let swiftlangRender = try request.make(SwiftlangRenderer.self)
        return swiftlangRender.render(template: swiftlangTemplate, context)
    }

}
