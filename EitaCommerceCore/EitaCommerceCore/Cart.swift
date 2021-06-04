//
//  Cart.swift
//  EitaCommerceCore
//
//  Created by marcos.brito on 04/06/21.
//

import Foundation

public final class Cart {

    private var items: [String]

    public init(items: [String]) {
        self.items = items
    }

    public func getItems() -> [String] {
        return items
    }

    public func addItem(_ item: String) {
        items.append(item)
    }

    public func removeItem(_ item: String) {
        guard let itemIndex = items.firstIndex(of: item) else {
            return
        }
        items.remove(at: itemIndex)
    }

    public func clear() {
        items.removeAll()
    }
}
