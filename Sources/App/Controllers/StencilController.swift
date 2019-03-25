//
//  StencilController.swift
//  App
//
//  Created by marc on 2019.03.18.
//

import Foundation
import Vapor
import Stencil
import PathKit

struct StencilController: RouteCollection {
    
    func boot(router: Router) throws {
        let stencilRoutes = router.grouped("stencil")

        // GET /stencil … same as example for now.
        stencilRoutes.get(use: stencilExampleHandler)
        
        // GET /stencil/hello
        stencilRoutes.get("hello", use: stencilHelloHandler)

        // GET /stencil/hello/name
        stencilRoutes.get("hello", String.parameter, use: stencilHelloHandler)
        
        // GET /stencil/example
        stencilRoutes.get("example", use: stencilExampleHandler)
    }
    
    // func handler(_ request: Request) -> ResponseEncodable { }
    
    // GET /stencil/hello/name
    func stencilHelloHandler(_ request: Request) throws -> Future<View> {
        var context: [String: String] = [:]
        if let name = try? request.parameters.next(String.self) {
            context["name"] = name
        }
        else {
            context["name"] = "glad you could stop by"
        }
        
        let stencilRender = try request.make(StencilRenderer.self)
        return stencilRender.render("hello.html", context)
    }
    
    // MARK: - Example
    
    // GET /stencil/example
    func stencilExampleHandler(_ request: Request) throws -> Future<View> {
        let directoryConfig = try request.make(DirectoryConfig.self)
        let stencilPathStr = directoryConfig.workDir + "Resources/Stencil/"
        let stencilPath = Path(stencilPathStr)
        let loader: Loader = FileSystemLoader(paths: [stencilPath])
        let stencilEnvironment = Stencil.Environment(loader: loader)
        
        struct Book {
            let title: String
            let author: String
        }
        
        let context = [
            "books": [
                Book(title: "How Not to Die", author: "Dr. Michael Greger"),
                Book(title: "The Physics of Wall Street", author: "James Owen Weatherall"),
                Book(title: "The Power of Habit", author: "Charles Duhigg"),
            ]
        ]

        return try _dispatchStencilFutureView(
            request: request,
            filename: "book_list.html",
            context: context,
            environment: stencilEnvironment)  // Future<View>
    }
    
    private func _dispatchStencilFutureView(request: Request, filename: String, context: [String: Any]? = nil, environment: Stencil.Environment) throws -> Future<View> {
        let promiseString: Promise<View> = request.eventLoop.newPromise(View.self)
        
        DispatchQueue.global().async { // () -> Void
            do {
                let rendered: String = try environment.renderTemplate(name: filename, context: context)
                let renderedData = Data(rendered.utf8)
                let view: View = View(data:renderedData)
                return promiseString.succeed(result: view)
            }
            catch let err {
                promiseString.fail(error: err)
            }
        }
        return promiseString.futureResult // Future<String>
    }
    
}
