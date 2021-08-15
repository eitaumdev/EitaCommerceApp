//
//  RemoveItemCartUseCaseTests.swift
//  EitaCommerceCoreTests
//
//  Created by marcos.brito on 18/07/21.
//

import XCTest
@testable import EitaCommerceCore

class CalculatePriceCartUseCaseTests: XCTestCase {

    let item1 = CartItem(item: Item(id: 1, name: "Item 1", price: 10))
    let item2 = CartItem(item: Item(id: 2, name: "Item 2", price: 10))
    let item3 = CartItem(item: Item(id: 3, name: "Item 3", price: 10))

    func testRemoveItemUseCase_calculatePrice_ShouldReceiveTwenty() {
        //Arrange
        let sut = CalculatePriceCartUseCase<CartItem>()

        //Assert
        XCTAssertEqual(sut.execute(Cart(items: [item1, item2])), 20)
    }

    func testRemoveItemUseCase_calculatePriceForEmptyCart_ShouldReceiveZero() {
        //Arrange
        let sut = CalculatePriceCartUseCase<CartItem>()

        //Assert
        XCTAssertEqual(sut.execute(Cart(items: [CartItem]())), 0)
    }
}
