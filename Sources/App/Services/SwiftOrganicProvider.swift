//
//  SwiftOrganicProvider.swift
//  App
//
//  Created by marc on 2019.03.21.
//

import Vapor

/// Adds Swift Organic Template services to your container.
///
///     try services.register(SwiftOrganicProvider())
///
public final class SwiftOrganicProvider: Provider {
    /// Creates a new `SwiftOrganicProvider`.
    public init() {}
    
    /// See `Provider`.
    public func register(_ services: inout Services) throws {
        
        /// See `Services`
        /// Registers a `Service` creating closure (service factory).
        /// Ensures a new instance of the `Service` is initialized for each sub-container.
        /// Provides access to the `Container` when the `Service` is initialized.
        /// Declares protocol conformance: ViewRenderer.self
        services.register([ViewRenderer.self]) {
            container -> SwiftOrganicRenderer in
            return SwiftOrganicRenderer.init(using: container)
        }
    }
    
    /// See `Provider`.
    public func didBoot(_ container: Container) throws -> Future<Void> {
        return .done(on: container)
    }
}
