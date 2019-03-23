//
//  LeafController.swift
//  App
//
//  Created by marc on 2019.03.18.
//

import Foundation
import Vapor

struct LeafController: RouteCollection {
    func boot(router: Router) throws {
        let leafRoutes = router.grouped("leaf")
        
        // GET /leaf  … same as example for now.
        leafRoutes.get(use: leafExampleHandler)
        
        // GET /leaf/hello
        leafRoutes.get("hello", use: leafHelloHandler)

        // GET /leaf/hello/name
        leafRoutes.get("hello", String.parameter, use: leafHelloHandler)

        // GET /leaf/example
        leafRoutes.get("example", use: leafExampleHandler)
    }
    
    // /leaf/hello/name Says hello to Leaf path
    func leafHelloHandler(_ request: Request) throws -> Future<View> {
        var context: [String: String] = [:]
        if let name = try? request.parameters.next(String.self) {
            context["name"] = name
        }
        else {
            context["name"] = "glad you could be here"
        }
        return try request.make(ViewRenderer.self).render("hello", context)
    }

    // MARK: - Example

    // /leaf/example
    func leafExampleHandler(_ request: Request) throws -> Future<View> {
        return try request.make(ViewRenderer.self).render("welcome")
    }

    
}
