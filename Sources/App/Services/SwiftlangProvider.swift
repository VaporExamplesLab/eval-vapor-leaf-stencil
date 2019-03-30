//
//  SwiftlangProvider.swift
//  App
//
//  Created by marc-medley on 2019.03.21.
//

import Vapor

/// Provide Swift Language Organic Template services to a Container.
///
///     try services.register(SwiftlangProvider())
///
public final class SwiftlangProvider: Provider {
    /// Creates a new `SwiftlangProvider`.
    public init() {}
    
    /// See `Provider`.
    public func register(_ services: inout Services) throws {
        
        /// See `Services`
        /// Registers a `Service` creating closure (service factory).
        /// Ensures a new instance of the `Service` is initialized for each sub-container.
        /// Provides access to the `Container` when the `Service` is initialized.
        /// Declares protocol conformance: ViewRenderer.self
        services.register([ViewRenderer.self]) {
            container -> SwiftlangRenderer in
            return try SwiftlangRenderer.init(using: container)
        }
    }
    
    /// See `Provider`.
    public func didBoot(_ container: Container) throws -> Future<Void> {
        return .done(on: container)
    }
}
