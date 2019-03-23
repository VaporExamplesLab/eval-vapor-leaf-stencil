//
//  SwiftOrganicTemplate.swift
//  App
//
//  Created by marc on 2019.03.21.
//

import Foundation

public protocol SwiftOrganicTemplate {
    func render<E>(context: E) -> String where E: Encodable
}