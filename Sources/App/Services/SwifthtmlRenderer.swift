//
//  SwifthtmlRenderer.swift
//  App
//
//  Created by marc-medley on 2019.03.21.
//

import Foundation
import Vapor
import Html

public final class SwifthtmlRenderer: Service {
    /// The event loop this renderer will use to read files
    private let container: Container
    ///
    private let htmlPartsUrl: URL
    
    init(using container: Container) throws {
        let directoryConfig = try container.make(DirectoryConfig.self)
        let htmlPartsPath = directoryConfig.workDir + "Resources/HtmlParts/"
        self.htmlPartsUrl = URL(fileURLWithPath: htmlPartsPath, isDirectory: true)
        self.container = container
    }
    
    /// See: ViewRenderer
    ///
    /// - parameters:
    ///     - path: Path to file containing raw template bytes.
    ///     - context: `Encodable` item that will be encoded to `TemplateData` and used as template context.
    ///     - userInfo: User-defined storage.
    /// - returns: `Future` containing the rendered `Html.Node`.
    
    public func render<E>(
        template: SwifthtmlTemplate,
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
