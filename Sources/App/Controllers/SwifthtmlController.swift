//
//  SwifthtmlController.swift
//  App
//
//  Created by marc-medley on 2019.03.19.
//

import Foundation
import Vapor
import Html

struct SwifthtmlController: RouteCollection {

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
                .make(SwifthtmlRenderer.self)
                .render(template: SwifthtmlTemplateAbout(), [String:String]())
        }
        
        // GET /swift-html/hello
        swiftHtmlRoutes.get("hello", use: swifthtmlHelloHandler)
        
        // GET /swift-html/hello/name
        swiftHtmlRoutes.get("hello", String.parameter, use: swifthtmlHelloHandler)
        
        // GET /swift-html/latexmath
        swiftHtmlRoutes.get("latexmath", use: swifthtmlMathHandler)
        
        // GET /swift-html/codeblog
        swiftHtmlRoutes.get("codeblog", use: swifthtmlCodeblogHandler)
        
        // GET /swift-html/mdtohtml
        swiftHtmlRoutes.get("mdtohtml", use: swifthtmlMdtohtmlHandler)
    }
    
    // func handler(_ request: Request) -> ResponseEncodable { }
    
    // GET /swift-html/hello/name
    func swifthtmlHelloHandler(_ request: Request) throws -> Future<Html.Node> {
        var context: [String: String] = [:]
        if let name = try? request.parameters.next(String.self) {
            context["nameKey"] = name
        }
        else {
            context["nameKey"] = "glad you could stop by"
        }
        
        let swiftHtmlTemplate = SwifthtmlTemplateHello()
        let swiftHtmlRender = try request.make(SwifthtmlRenderer.self)
        return swiftHtmlRender.render(template: swiftHtmlTemplate, context)
    }
    
    // GET /swift-html/latexmath
    func swifthtmlMathHandler(_ request: Request) throws -> Future<Html.Node> {
        let body = try String(
            contentsOf: htmlPartsUrl.appendingPathComponent("latexmath.html", isDirectory: false),
            encoding: String.Encoding.utf8)
        let context: [String: String] = ["titleKey":"Math Presentation", "bodyKey": body]
        
        let swiftHtmlTemplate = SwifthtmlTemplateBlog()
        let swifthtmlRender = try request.make(SwifthtmlRenderer.self)
        return swifthtmlRender.render(template: swiftHtmlTemplate, context)
    }
    
    // GET /swift-html/codeblog
    func swifthtmlCodeblogHandler(_ request: Request) throws -> Future<Html.Node> {
        let body = try String(
            contentsOf: htmlPartsUrl.appendingPathComponent("codeblog.html", isDirectory: false),
            encoding: String.Encoding.utf8)
        let context: [String: String] = ["titleKey":"Code Blog", "bodyKey": body]
        
        let swiftHtmlTemplate = SwifthtmlTemplateBlog()
        let swifthtmlRender = try request.make(SwifthtmlRenderer.self)
        return swifthtmlRender.render(template: swiftHtmlTemplate, context)
    }
    
    // GET /swift-html/mdtohtml
    func swifthtmlMdtohtmlHandler(_ request: Request) throws -> Future<Html.Node> {
        let body = try String(
            contentsOf: htmlPartsUrl.appendingPathComponent("mdtohtml.html", isDirectory: false),
            encoding: String.Encoding.utf8)
        let context: [String: String] = ["titleKey":"MD ➜ HTML Elements", "bodyKey": body]
        
        let swiftHtmlTemplate = SwifthtmlTemplateBlog()
        let swifthtmlRender = try request.make(SwifthtmlRenderer.self)
        return swifthtmlRender.render(template: swiftHtmlTemplate, context)
    }

}
