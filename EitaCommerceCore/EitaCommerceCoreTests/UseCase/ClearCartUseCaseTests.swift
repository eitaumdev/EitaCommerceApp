//
//  ClearCartUseCaseTests.swift
//  EitaCommerceCoreTests
//
//  Created by marcos.brito on 18/07/21.
//

import XCTest
@testable import EitaCommerceCore

class ClearCartUseCaseTests: XCTestCase {

    let item1 = CartItem(item: Item(name: "Item 1", price: 10))
    let item2 = CartItem(item: Item(name: "Item 2", price: 10))
    let item3 = CartItem(item: Item(name: "Item 3", price: 10))

    func testAddItemUseCase_clearCart_ShouldReceiveAEmptyCart() {
        //Arrange
        let sut = ClearCartUseCase<CartItem>()

        //Assert
        XCTAssertTrue(sut.execute().items.isEmpty)
    }
}
