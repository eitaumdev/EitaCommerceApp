//
//  EitaCommerceCore.swift
//  EitaCommerceCore
//
//  Created by marcos.brito on 01/08/21.
//

import Foundation

public final class EitaCommerceCore<Item: CartItemEquatable> {
    private var cart = Cart(items: [Item]())
    private let addItemCartUseCase = AddItemCartUseCase<Item>()
    private let removeItemCartUseCase = RemoveItemCartUseCase<Item>()
    private let clearCartUseCase = ClearCartUseCase<Item>()
    private let calculatePriceCartUseCase = CalculatePriceCartUseCase<Item>()

    public var currentCart: Cart<Item> {
        cart
    }

    public static func startWith(items: [Item]) -> EitaCommerceCore {
        let eita = EitaCommerceCore()

        items.forEach { item in
            _ = eita.add(item: item)
        }

        return eita
    }

    public func add(item: Item) -> Cart<Item> {
        cart = addItemCartUseCase.execute(item, toCart: cart)
        return cart
    }

    public func remove(item: Item) -> Cart<Item> {
        cart = removeItemCartUseCase.execute(item, toCart: cart)
        return cart
    }

    public func clear() -> Cart<Item> {
        cart = clearCartUseCase.execute()
        return cart
    }

    public func calculateTotalPrice() -> Double {
        return calculatePriceCartUseCase.execute(cart)
    }
}
