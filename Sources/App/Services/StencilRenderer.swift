//
//  StencilRenderer.swift
//  App
//
//  Created by marc on 2019.03.18.
//

import Foundation
import Vapor
import Stencil
import PathKit

public final class StencilRenderer: ViewRenderer, Service {
    public var shouldCache: Bool = false // See: ViewRenderer
    /// The event loop this renderer will use to read files
    private let container: Container
    /// Environment: template loader
    private let stencilEnvironment: Stencil.Environment

    init(using container: Container) throws {
        let directoryConfig = try container.make(DirectoryConfig.self)
        let stencilPathStr = directoryConfig.workDir + "Resources/Stencil/"
        let stencilPath = Path(stencilPathStr)
        let loader: Loader = FileSystemLoader(paths: [stencilPath])
        self.stencilEnvironment = Stencil.Environment(loader: loader)
        self.container = container
    }
    
    /// See: ViewRenderer
    ///
    /// - parameters:
    ///     - path: Path to file containing raw template bytes.
    ///     - context: `Encodable` item that will be encoded to `TemplateData` and used as template context.
    ///     - userInfo: User-defined storage.
    /// - returns: `Future` containing the rendered `View`.
    public func render<E>(
        _ path: String,
        _ context: E,
        userInfo: [AnyHashable : Any])
        -> Future<View> where E : Encodable {
            
            // stencilEnvironment.renderTemplate(name: String, context: [String : Any]?) -> String
            let promiseView: Promise<View> = container.eventLoop.newPromise(View.self)
            
            DispatchQueue.global().async {
                // () -> Void in
                do {
                    let rendered: String = try self.stencilEnvironment.renderTemplate(
                        name: path, // file path
                        context: context as? [String : Any]
                    )
                    let renderedData = Data(rendered.utf8)
                    let view: View = View(data:renderedData)
                    return promiseView.succeed(result: view)
                }
                catch let err {
                    promiseView.fail(error: err)
                }
            }
            return promiseView.futureResult // Future<View>
    }
    
    // string containing template
    public func render<E>(
        string: String,
        _ context: E,
        userInfo: [AnyHashable : Any])
        -> Future<View> where E : Encodable {
            
            // stencilEnvironment.renderTemplate(name: String, context: [String : Any]?) -> String
            let promiseView: Promise<View> = container.eventLoop.newPromise(View.self)
            
            DispatchQueue.global().async {
                // () -> Void in
                do {
                    let rendered: String = try self.stencilEnvironment.renderTemplate(
                        string: string, // string containing template
                        context: context as? [String : Any]
                    )
                    let renderedData = Data(rendered.utf8)
                    let view: View = View(data:renderedData)
                    return promiseView.succeed(result: view)
                }
                catch let err {
                    promiseView.fail(error: err)
                }
            }
            return promiseView.futureResult // Future<View>
    }
    
}
