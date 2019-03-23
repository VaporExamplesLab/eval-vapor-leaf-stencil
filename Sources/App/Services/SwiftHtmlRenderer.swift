//
//  SwiftHtmlRenderer.swift
//  App
//
//  Created by marc on 2019.03.21.
//

import Foundation
import Vapor
import Html

public final class SwiftHtmlRenderer: Service { // ViewRenderer,
    public var shouldCache: Bool = false // See: ViewRenderer
    /// The event loop this renderer will use to read files
    public let container: Container
    
    init(using container: Container) {
        self.container = container
    }
    
    /// See: ViewRenderer
    ///
    /// - parameters:
    ///     - path: Path to file containing raw template bytes.
    ///     - context: `Encodable` item that will be encoded to `TemplateData` and used as template context.
    ///     - userInfo: User-defined storage.
    /// - returns: `Future` containing the rendered `Html.Node`.
//    public func render<E>(
//        _ path: String,
//        _ context: E,
//        userInfo: [AnyHashable : Any])
//        -> Future<Html.Node> where E : Encodable {
//            
//            var template: SwiftHtmlTemplate
//            switch path {
//            case "hello":
//                template = SwiftHtmlTemplateHello()
//            default:
//                template = SwiftHtmlTemplate404()
//            }
//            let r = self.render(template: template, context as? [String : Any])
//            return r
//    }
    
    public func render<E>(
        template: SwiftHtmlTemplate,
        _ context: E)
        -> Future<Html.Node> where E : Encodable {
            let promiseNode: Promise<Html.Node> = container.eventLoop.newPromise(Html.Node.self)
            
            DispatchQueue.global().async {
                let node = template.render(context: context)
                // node.encode(status: HTTPStatus, headers: HTTPHeaders, for: Request) -> Future<Response>
                return promiseNode.succeed(result: node)
            }
            let futureNode = promiseNode.futureResult
            return futureNode // Future<Html.Node>
    }
    
}
