//
//  SwiftorganicTemplate.swift
//  App
//
//  Created by marc-medley on 2019.03.21.
//

import Foundation

public protocol SwiftorganicTemplate {
    func render<E>(context: E) -> String where E: Encodable
}
