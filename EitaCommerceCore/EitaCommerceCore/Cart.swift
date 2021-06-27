//
//  Cart.swift
//  EitaCommerceCore
//
//  Created by marcos.brito on 04/06/21.
//

import Foundation

public protocol CartItemProtocol {
    var item: String { get }
    var price: Int { get }

    func isEqual(_ other: CartItemProtocol) -> Bool
}

public final class Cart {

    private var items: [CartItemProtocol]

    public init(items: [CartItemProtocol]) {
        self.items = items
    }

    public func getItems() -> [CartItemProtocol] {
        return items
    }

    public func addItem(_ item: CartItemProtocol) {
        items.append(item)
    }

    public func removeItem(_ item: CartItemProtocol) {
        guard let itemIndex = items.firstIndex(where: { $0.isEqual(item) }) else {
            return
        }
        items.remove(at: itemIndex)
    }

    public func clear() {
        items.removeAll()
    }

    public func getPrice() -> Int {
        return items.reduce(0) { result, item in
            result + item.price
        }
    }
}
