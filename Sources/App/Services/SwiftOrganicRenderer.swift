//
//  SwiftOrganicRenderer.swift
//  App
//
//  Created by marc-medley on 2019.03.21.
//

import Foundation
import Vapor

public final class SwiftOrganicRenderer: ViewRenderer, Service {
    public var shouldCache: Bool = false // See: ViewRenderer
    /// The event loop this renderer will use to read files
    public let container: Container
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
    /// - returns: `Future` containing the rendered `View`.
    public func render<E>(
        _ path: String,
        _ context: E,
        userInfo: [AnyHashable : Any])
        -> Future<View> where E : Encodable {
            var template: SwiftOrganicTemplate
            switch path {
            case "hello":
                template = SwiftOrganicTemplateHello()
            default:
                template = SwiftOrganicTemplate404()
            }
            
            return render(template: template, context)
    }
    
    public func render<E>(
        template: SwiftOrganicTemplate,
        _ context: E)
        -> Future<View> where E : Encodable {
            let promiseNode: Promise<View> = container.eventLoop.newPromise(View.self)
            
            DispatchQueue.global().async {
                let string = template.render(context: context)
                let data = Data(string.utf8)
                let view: View = View(data: data)
                return promiseNode.succeed(result: view)
            }
            return promiseNode.futureResult // Future<View>
    }
    
}
