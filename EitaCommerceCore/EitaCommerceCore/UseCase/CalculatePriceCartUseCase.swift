//
//  CalculatePriceCartUseCase.swift
//  EitaCommerceCore
//
//  Created by marcos.brito on 25/07/21.
//

import Foundation

protocol CalculatePriceCartUseCaseProtocol {
    associatedtype Item: CartItemEquatable
    func execute(_ cart: Cart<Item>) -> Double
}

class CalculatePriceCartUseCase<Item: CartItemEquatable>: CalculatePriceCartUseCaseProtocol {
    func execute(_ cart: Cart<Item>) -> Double {
        return cart.items.reduce(0) { result, item in
            result + item.price
        }
    }
}
