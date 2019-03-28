//
//  StencilProvider.swift
//  App
//
//  Created by marc on 2019.03.18.
//

import Vapor
import Stencil
import PathKit


/// Provide Stencil services to a Container.
///
///     try services.register(StencilProvider())
///
///
///
public final class StencilProvider: Provider {
    /// Creates a new `StencilProvider`.
    public init() {}

    static let stencilPathStr = DirectoryConfig.detect().workDir + "Resources/Stencil/"
    static let stencilPath = Path(stencilPathStr)
    static let loader: Loader = FileSystemLoader(paths: [stencilPath])
    
    /// See `Provider`.
    public func register(_ services: inout Services) throws {

        /// See `Services`
        /// Registers a `Service` creating closure (service factory).
        /// Ensures a new instance of the `Service` is initialized for each sub-container.
        /// Provides access to the `Container` when the `Service` is initialized.
        /// Declares protocol conformance: ViewRenderer.self
        services.register([ViewRenderer.self]) {
            container -> StencilRenderer in
            return try StencilRenderer.init(using: container)
        }
    }
    
    /// See `Provider`.
    public func didBoot(_ container: Container) throws -> Future<Void> {
        return .done(on: container)
    }
}
