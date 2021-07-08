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
    func isEqual(_ other: CartItemProtocol) -> Bool
}

public final class Cart<Item: CartItemProtocol> {

    //MARK: - Private properties
    private var items: [Item]

    //MARK: - Private initializer
    private init(items: [Item]) {
        self.items = items
    }

    //MARK: - Public Methods
    public func getItems() -> [Item] {
        return items
    }

    public func addItem(_ item: Item) {
        guard let item = items.first(where: { $0.isEqual(item) }) else {
            return items.append(item)
        }

        item.setQuantity(item.quantity + 1)
    }

    public func removeItem(_ item: Item) {
        guard let itemIndex = items.firstIndex(where: { $0.isEqual(item) }) else {
            return
        }
        let item = items[itemIndex]
        if item.quantity > 1 {
            item.setQuantity(item.quantity - 1)
        } else {
            items.remove(at: itemIndex)
        }
    }

    public func clear() {
        items.removeAll()
    }

    public func getPrice() -> Double {
        return items.reduce(0) { result, item in
            result + item.price
        }
    }

    //MARK: - Public static methods
    public static func start(items: [Item]) -> Cart {
        var filteredItems = [Item]()

        items.forEach { item in
            let internalFilteredItem = items.filter { internalItem in
                item.isEqual(internalItem)
            }

            if !filteredItems.contains(where: { $0.isEqual(item) }) {
                item.setQuantity(internalFilteredItem.count)
                filteredItems.append(item)
            }
        }

        return Cart(items: filteredItems)
    }
}
