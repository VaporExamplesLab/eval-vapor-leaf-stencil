//
//  SwiftlangTemplate.swift
//  App
//
//  Created by marc-medley on 2019.03.21.
//

import Foundation

public protocol SwiftlangTemplate {
    func render<E>(context: E) -> String where E: Encodable
}
