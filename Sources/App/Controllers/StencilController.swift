//
//  StencilController.swift
//  App
//
//  Created by marc-medley on 2019.03.18.
//

import Foundation
import Vapor
import Stencil
import PathKit

struct StencilController: RouteCollection {
    
    let htmlPartsUrl: URL
    
    init(resourcesUrl: URL) {
        self.htmlPartsUrl = resourcesUrl.appendingPathComponent("HtmlParts", isDirectory: true)
    }

    func boot(router: Router) throws {
        let stencilRoutes = router.grouped("stencil")

        // GET /stencil … About page.
        stencilRoutes.get(use: stencilAboutHandler)
        
        // GET /stencil/hello
        stencilRoutes.get("hello", use: stencilHelloHandler)

        // GET /stencil/hello/name
        stencilRoutes.get("hello", String.parameter, use: stencilHelloHandler)
        
        // GET /stencil/latexmath
        stencilRoutes.get("latexmath", use: stencilMathHandler)

        // GET /stencil/codeblog
        stencilRoutes.get("codeblog", use: stencilCodeblogHandler)

        // GET /stencil/mdtohtml
        stencilRoutes.get("mdtohtml", use: stencilMdtohtmlHandler)
    }
    
    // func handler(_ request: Request) -> ResponseEncodable { }

    // GET /stencil
    func stencilAboutHandler(_ request: Request) throws -> Future<View> {
        struct Book: Codable {
            let title: String
            let author: String
        }
        
        let context: [String: Codable] = [
            "booksKey": [
                Book(title: "How Not to Die", author: "Dr. Michael Greger"),
                Book(title: "The Physics of Wall Street", author: "James Owen Weatherall"),
                Book(title: "The Power of Habit", author: "Charles Duhigg"),
            ]
        ]
        
        let stencilRender = try request.make(StencilRenderer.self)
        return stencilRender.render("about.html", context)
    }

    // GET /stencil/hello/name
    func stencilHelloHandler(_ request: Request) throws -> Future<View> {
        var context: [String: String] = [:]
        if let name = try? request.parameters.next(String.self) {
            context["nameKey"] = name
        }
        else {
            context["nameKey"] = "glad you could stop by"
        }
        
        let stencilRender = try request.make(StencilRenderer.self)
        return stencilRender.render("hello.html", context)
    }
    
    // GET /stencil/latexmath
    func stencilMathHandler(_ request: Request) throws -> Future<View> {
        let body = try String(
            contentsOf: htmlPartsUrl.appendingPathComponent("latexmath.html", isDirectory: false),
            encoding: String.Encoding.utf8)
        let context: [String: String] = ["titleKey":"Math Presentation", "bodyKey": body]
        
        let stencilRender = try request.make(StencilRenderer.self)
        return stencilRender.render("base_blog.html", context)
    }
    
    // GET /stencil/codeblog
    func stencilCodeblogHandler(_ request: Request) throws -> Future<View> {
        let body = try String(
            contentsOf: htmlPartsUrl.appendingPathComponent("codeblog.html", isDirectory: false),
            encoding: String.Encoding.utf8)
        let context: [String: String] = ["titleKey":"Code Blog", "bodyKey": body]
        
        let stencilRender = try request.make(StencilRenderer.self)
        return stencilRender.render("base_blog.html", context)
    }
    
    // GET /stencil/mdtohtml
    func stencilMdtohtmlHandler(_ request: Request) throws -> Future<View> {
        let body = try String(
            contentsOf: htmlPartsUrl.appendingPathComponent("mdtohtml.html", isDirectory: false),
            encoding: String.Encoding.utf8)
        let context: [String: String] = ["titleKey":"MD ➜ HTML Elements", "bodyKey": body]
        
        let stencilRender = try request.make(StencilRenderer.self)
        return stencilRender.render("base_blog.html", context)
    }
    
}
