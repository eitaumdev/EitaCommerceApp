//
//  RemoveItemCartUseCaseTests.swift
//  EitaCommerceCoreTests
//
//  Created by marcos.brito on 18/07/21.
//

import XCTest
@testable import EitaCommerceCore

class RemoveItemCartUseCaseTests: XCTestCase {

    func testRemoveItemUseCase_removeOneItem_ShouldReceiveCartWithOneItem() {
        //Arrange
        let sut = RemoveItemCartUseCase<CartItem>()

        //Act
        let cart = sut.execute(CartItem.item1, toCart: Cart(items: [CartItem.item1, CartItem.item2]))

        //Assert
        XCTAssertEqual(cart.items.count, 1)
        XCTAssertEqual(cart.items.first, CartItem.item2)
        XCTAssertEqual(cart.items.last, CartItem.item2)
    }

    func testRemoveItemUseCase_removeOneItemWithQuantityTwo_ShouldReceiveCartWithTwoItems() {
        //Arrange
        let sut = RemoveItemCartUseCase<CartItem>()
        let item = CartItem(item: Item(id: 4, name: "Item", price: 10))
        item.setQuantity(2)

        //Act
        let cart = sut.execute(item, toCart: Cart(items: [item, CartItem.item2]))

        //Assert
        XCTAssertEqual(cart.items.count, 2)
        XCTAssertEqual(cart.items.first, item)
        XCTAssertEqual(cart.items.last, CartItem.item2)
    }

    func testRemoveItemUseCase_removeOneItemThatIsNotOnTheCart_ShouldReceiveCartWithTheSameItems() {
        //Arrange
        let sut = RemoveItemCartUseCase<CartItem>()

        //Act
        let cart = sut.execute(CartItem.item3, toCart: Cart(items: [CartItem.item1, CartItem.item2]))

        //Assert
        XCTAssertEqual(cart.items.count, 2)
        XCTAssertEqual(cart.items.first, CartItem.item1)
        XCTAssertEqual(cart.items.last, CartItem.item2)
    }
}
