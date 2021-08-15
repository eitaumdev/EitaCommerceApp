//
//  MockCartItem.swift
//  EitaCommerceCoreTests
//
//  Created by marcos.brito on 18/07/21.
//

import Foundation
import EitaCommerceCore

class CartItem: CartItemEquatable {

    static var item1: CartItem { CartItem(item: Item(id: 1, name: "Item 1", price: 10)) }
    static var item2: CartItem { CartItem(item: Item(id: 2, name: "Item 2", price: 10)) }
    static var item3: CartItem { CartItem(item: Item(id: 3, name: "Item 3", price: 10)) }

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
