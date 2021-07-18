//
//  AddItemCartUseCaseTests.swift
//  EitaCommerceCoreTests
//
//  Created by marcos.brito on 18/07/21.
//

import XCTest
import EitaCommerceCore

protocol AddItemCartUseCaseProtocol {
    associatedtype Item: CartItemEquatable
    func execute(_ item: Item, toCart cart: Cart<Item>) -> Cart<Item>
}

class AddItemCartUseCase<Item: CartItemEquatable>: AddItemCartUseCaseProtocol {

    func execute(_ item: Item, toCart cart: Cart<Item>) -> Cart<Item> {
        Cart.start(items: cart.getItems() + [item])
    }
}

class AddItemCartUseCaseTests: XCTestCase {

    let item1 = CartItem(item: Item(name: "Item 1", price: 10))
    let item2 = CartItem(item: Item(name: "Item 2", price: 10))
    let item3 = CartItem(item: Item(name: "Item 3", price: 10))

    func testAddItemUseCase_addOneItem_ShouldReceiveCartWithOneItem() {
        //Arrange
        let sut = AddItemCartUseCase<CartItem>()

        //Act
        let cart = sut.execute(item1, toCart: Cart<CartItem>.start(items: []))

        //Assert
        XCTAssertEqual(cart.getItems().count, 1)
    }
}
