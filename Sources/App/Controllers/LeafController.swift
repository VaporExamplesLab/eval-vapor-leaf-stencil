//
//  LeafController.swift
//  App
//
//  Created by marc-medley on 2019.03.18.
//

import Foundation
import Vapor

struct LeafController: RouteCollection {
    
    let htmlPartsUrl: URL
    
    init(resourcesUrl: URL) {
        self.htmlPartsUrl = resourcesUrl.appendingPathComponent("HtmlParts", isDirectory: true)
    }
    
    func boot(router: Router) throws {
        
        let leafRoutes = router.grouped("leaf")
        
        // GET /leaf  … About.
        leafRoutes.get(use: leafAboutHandler)
        
        // GET /leaf/hello
        leafRoutes.get("hello", use: leafHelloHandler)

        // GET /leaf/hello/name
        leafRoutes.get("hello", String.parameter, use: leafHelloHandler)

        // GET /leaf/latexmath
        leafRoutes.get("latexmath", use: leafMathHandler)

        // GET /leaf/latexmath_inline
        leafRoutes.get("latexmath_inline") {
            req -> Future<View> in
            return try req.view().render("latexmath_inline")
        }

        // GET /leaf/latexmath_single
        leafRoutes.get("latexmath_single") {
            req -> Future<View> in
            return try req.view().render("latexmath_single")
        }
        
        // GET /leaf/codeblog
        leafRoutes.get("codeblog", use: leafCodeblogHandler)

        // GET /leaf/codeblog_inline
        leafRoutes.get("codeblog_inline") {
            req -> Future<View> in
            return try req.view().render("codeblog_inline")
        }
        
        // GET /leaf/codeblog_single
        leafRoutes.get("codeblog_single") {
            req -> Future<View> in
            return try req.view().render("codeblog_single")
        }

        // GET /leaf/mdtohtml
        leafRoutes.get("mdtohtml", use: leafMdtohtmlHandler)

        // GET /leaf/codeblog_inline
        leafRoutes.get("mdtohtml_inline") {
            req -> Future<View> in
            return try req.view().render("mdtohtml_inline")
        }
        
        // GET /leaf/mdtohtml_single
        leafRoutes.get("mdtohtml_single") {
            req -> Future<View> in
            return try req.view().render("mdtohtml_single")
        }
    }
    
    // /leaf
    func leafAboutHandler(_ request: Request) throws -> Future<View> {
        return try request.make(ViewRenderer.self).render("about")
    }
    
    // /leaf/hello/name Says hello to Leaf path
    func leafHelloHandler(_ request: Request) throws -> Future<View> {
        var context: [String: String] = [:]
        if let name = try? request.parameters.next(String.self) {
            context["nameKey"] = name
        }
        else {
            context["nameKey"] = "glad you could be here"
        }
        return try request.make(ViewRenderer.self).render("hello", context)
    }

    // GET /leaf/latexmath
    func leafMathHandler(_ request: Request) throws -> Future<View> {
        let body = try String(
            contentsOf: htmlPartsUrl.appendingPathComponent("latexmath.html", isDirectory: false),
            encoding: String.Encoding.utf8)
        let context: [String: String] = ["titleKey":"Math Presentation", "bodyKey": body]
        return try request.make(ViewRenderer.self).render("latexmath_base", context) // :WAS: base_blog
    }
    
    // GET /leaf/codeblog
    func leafCodeblogHandler(_ request: Request) throws -> Future<View> {
        let body = try String(
            contentsOf: htmlPartsUrl.appendingPathComponent("codeblog.html", isDirectory: false),
            encoding: String.Encoding.utf8)
        let context: [String: String] = ["titleKey":"Code Blog", "bodyKey": body]
        return try request.make(ViewRenderer.self).render("base_blog", context)
    }
    
    // GET /leaf/mdtohtml
    func leafMdtohtmlHandler(_ request: Request) throws -> Future<View> {
        let body = try String(
            contentsOf: htmlPartsUrl.appendingPathComponent("mdtohtml.html", isDirectory: false),
            encoding: String.Encoding.utf8)
        let context: [String: String] = ["titleKey":"MD ➜ HTML Elements", "bodyKey": body]
        return try request.make(ViewRenderer.self).render("base_blog", context)
    }
}
