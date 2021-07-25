//
//  RemoveItemCartUseCaseTests.swift
//  EitaCommerceCoreTests
//
//  Created by marcos.brito on 18/07/21.
//

import XCTest
@testable import EitaCommerceCore

class RemoveItemCartUseCaseTests: XCTestCase {

    let item1 = CartItem(item: Item(name: "Item 1", price: 10))
    let item2 = CartItem(item: Item(name: "Item 2", price: 10))
    let item3 = CartItem(item: Item(name: "Item 3", price: 10))

    func testRemoveItemUseCase_removeOneItem_ShouldReceiveCartWithOneItem() {
        //Arrange
        let sut = RemoveItemCartUseCase<CartItem>()

        //Act
        let cart = sut.execute(item1, toCart: Cart(items: [item1, item2]))

        //Assert
        XCTAssertEqual(cart.getItems().count, 1)
        XCTAssertEqual(cart.getItems().first, item2)
        XCTAssertEqual(cart.getItems().last, item2)
    }

    func testRemoveItemUseCase_removeOneItemWithQuantityTwo_ShouldReceiveCartWithTwoItems() {
        //Arrange
        let sut = RemoveItemCartUseCase<CartItem>()
        let item = CartItem(item: Item(name: "Item", price: 10))
        item.setQuantity(2)

        //Act
        let cart = sut.execute(item, toCart: Cart(items: [item, item2]))

        //Assert
        XCTAssertEqual(cart.getItems().count, 2)
        XCTAssertEqual(cart.getItems().first, item)
        XCTAssertEqual(cart.getItems().last, item2)
    }
}
