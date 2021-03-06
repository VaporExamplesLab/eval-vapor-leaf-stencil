//
//  SwifthtmlTemplate.swift
//  App
//
//  Created by marc-medley on 2019.03.21.
//

import Foundation
import Html

public protocol SwifthtmlTemplate {
    func render<E>(context: E) -> Html.Node where E: Encodable
}
