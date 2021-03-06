//
//  AddItemCartUseCaseTests.swift
//  EitaCommerceCoreTests
//
//  Created by marcos.brito on 18/07/21.
//

import XCTest
@testable import EitaCommerceCore

class AddItemCartUseCaseTests: XCTestCase {

    func testAddItemUseCase_addOneItem_ShouldReceiveCartWithOneItem() {
        //Arrange
        let sut = AddItemCartUseCase<CartItem>()

        //Act
        let cart = sut.execute(CartItem.item1, toCart: Cart(items: [CartItem]()))

        //Assert
        XCTAssertEqual(cart.items.count, 1)
    }

    func testAddItemUseCase_addTwoEqualItems_ShouldReceiveCartWithOneItemWithQuantityTwo() {
        //Arrange
        let sut = AddItemCartUseCase<CartItem>()

        //Act
        var cart = sut.execute(CartItem.item1, toCart: Cart(items: [CartItem]()))
        cart = sut.execute(CartItem.item1, toCart: cart)

        //Assert
        XCTAssertEqual(cart.items.count, 1)
        XCTAssertEqual(cart.items.first?.quantity, 2)
    }

    func testAddItemUseCase_addTwoItems_ShouldReceiveCartWithTwoItems() {
        //Arrange
        let sut = AddItemCartUseCase<CartItem>()

        //Act
        var cart = sut.execute(CartItem.item1, toCart: Cart(items: [CartItem]()))
        cart = sut.execute(CartItem.item2, toCart: cart)

        //Assert
        XCTAssertEqual(cart.items.count, 2)
    }
}
