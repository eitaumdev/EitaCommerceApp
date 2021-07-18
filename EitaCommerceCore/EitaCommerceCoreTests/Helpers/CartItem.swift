//
//  MockCartItem.swift
//  EitaCommerceCoreTests
//
//  Created by marcos.brito on 18/07/21.
//

import Foundation
import EitaCommerceCore

class CartItem: CartItemEquatable {
    let item: ItemProtocol
    var price: Double {
        return item.price * Double(quantity)
    }
    var quantity: Int = 1

    init(item: ItemProtocol) {
        self.item = item
    }

    func setQuantity(_ quantity: Int) {
        self.quantity = quantity
    }

    static func == (lhs: CartItem, rhs: CartItem) -> Bool {
        return lhs.item.id == rhs.item.id
    }
}
