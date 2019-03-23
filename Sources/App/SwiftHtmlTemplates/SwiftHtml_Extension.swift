//
//  SwiftHtml_Extension.swift
//  App
//
//  Created by marc on 2019.03.21.
//

import Vapor
import Html

extension Html.Node: ResponseEncodable {
    public func encode(for req: Request) throws -> Future<Response> {
        let res = Response(
            http: .init(
                headers: ["content-type": "text/html; charset=utf-8"],
                body: Html.render(self)
            ),
            using: req.sharedContainer
        )
        return req.sharedContainer.eventLoop.newSucceededFuture(result: res)
    }
}
