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
    var quantity: Int { get}

    func setQuantity(_ quantity: Int)
    func isEqual(_ other: CartItemProtocol) -> Bool
}

public final class Cart {

    //MARK: - Private properties
    private var items: [CartItemProtocol]

    //MARK: - Public initializer
    public init(items: [CartItemProtocol]) {
        self.items = items
    }

    //MARK: - Public Methods
    public func getItems() -> [CartItemProtocol] {
        return items
    }

    public func addItem(_ item: CartItemProtocol) {
        guard let item = items.first(where: { $0.isEqual(item) }) else {
            return items.append(item)
        }

        item.setQuantity(item.quantity + 1)
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
