//
//  SwiftHtmlProvider.swift
//  App
//
//  Created by marc on 2019.03.21.
//

import Vapor

/// Adds Swift-HTML DSL services to your container.
///
///     try services.register(SwiftHtmlProvider())
///
public final class SwiftHtmlProvider: Provider {
    /// Creates a new `SwiftHtmlProvider`.
    public init() {}
    
    /// See `Provider`.
    public func register(_ services: inout Services) throws {
        
        /// See `Services`
        /// Registers a `Service` creating closure (service factory).
        /// Ensures a new instance of the `Service` is initialized for each sub-container.
        /// Provides access to the `Container` when the `Service` is initialized.
        /// Declares protocol conformance: ViewRenderer.self
        services.register([]) { // ViewRenderer.self
            container -> SwiftHtmlRenderer in
            return SwiftHtmlRenderer.init(using: container)
        }
    }
    
    /// See `Provider`.
    public func didBoot(_ container: Container) throws -> Future<Void> {
        return .done(on: container)
    }
}
