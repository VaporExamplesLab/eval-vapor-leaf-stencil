//
//  DataModel.swift
//  App
//
//  Created by marc-medley on 2019.03.18.
//

import Foundation
import Vapor

final public class DataModel: Codable {
    var integer: Int
    
    init(integer: Int) {
        self.integer = integer
    }
}

// Content convertable to/from HTTP message.
extension DataModel: Content {}
