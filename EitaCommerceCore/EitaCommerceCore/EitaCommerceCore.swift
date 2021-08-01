//
//  EitaCommerceCore.swift
//  EitaCommerceCore
//
//  Created by marcos.brito on 01/08/21.
//

import Foundation

public final class EitaCommerceCore<Item: CartItemEquatable> {
    var cart = Cart(items: [Item]())
    let addItemCartUseCase = AddItemCartUseCase<Item>()
    let removeItemCartUseCase = RemoveItemCartUseCase<Item>()
    let clearCartUseCase = ClearCartUseCase<Item>()
    let calculatePriceCartUseCase = CalculatePriceCartUseCase<Item>()

    var currentCart: Cart<Item> {
        cart
    }

    public static func startWith(items: [Item]) -> EitaCommerceCore {
        let eita = EitaCommerceCore()

        items.forEach { item in
            _ = eita.add(item: item)
        }

        return eita
    }

    func add(item: Item) -> Cart<Item> {
        cart = addItemCartUseCase.execute(item, toCart: cart)
        return cart
    }

    func remove(item: Item) -> Cart<Item> {
        cart = removeItemCartUseCase.execute(item, toCart: cart)
        return cart
    }

    func clear() -> Cart<Item> {
        cart = clearCartUseCase.execute()
        return cart
    }

    func calculateTotalPrice() -> Double {
        return calculatePriceCartUseCase.execute(cart)
    }
}
