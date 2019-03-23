//
//  SwiftHtmlTemplate.swift
//  App
//
//  Created by marc on 2019.03.21.
//

import Foundation
import Html

public protocol SwiftHtmlTemplate {
    func render<E>(context: E) -> Html.Node where E: Encodable
}
