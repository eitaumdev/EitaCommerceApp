//
//  Cart.swift
//  EitaCommerceCore
//
//  Created by marcos.brito on 04/06/21.
//

import Foundation

public protocol ItemProtocol {
    var id: UUID { get }
    var name: String { get }
    var price: Double { get }
}

public protocol CartItemProtocol {
    var item: ItemProtocol { get }
    var price: Double { get }
    var quantity: Int { get }

    func setQuantity(_ quantity: Int)
}

public typealias CartItemEquatable = CartItemProtocol & Equatable

public struct Cart<Item: CartItemEquatable> {
    public let items: [Item]
}
