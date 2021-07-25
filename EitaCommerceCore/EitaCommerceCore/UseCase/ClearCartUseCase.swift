//
//  ClearCartUseCase.swift
//  EitaCommerceCore
//
//  Created by marcos.brito on 25/07/21.
//

import Foundation

protocol ClearCartUseCaseProtocol {
    associatedtype Item: CartItemEquatable
    func execute() -> Cart<Item>
}

class ClearCartUseCase<Item: CartItemEquatable>: ClearCartUseCaseProtocol {
    func execute() -> Cart<Item> {
        return Cart(items: [Item]())
    }
}
