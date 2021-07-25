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

public final class Cart<Item: CartItemEquatable> {

    //MARK: - Private properties
    private var items: [Item]

    //MARK: - Public initializer
    public init(items: [Item]) {
        self.items = items
    }

    //MARK: - Public Methods
    public func getItems() -> [Item] {
        return items
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
            let internalFilteredItem = items.filter { $0 == item }

            if !filteredItems.contains(where: { $0 == item }) {
                item.setQuantity(internalFilteredItem.count)
                filteredItems.append(item)
            }
        }

        return Cart(items: filteredItems)
    }
}
