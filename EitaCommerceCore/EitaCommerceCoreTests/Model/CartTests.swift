//
//  CartTests.swift
//  EitaCommerceCoreTests
//
//  Created by marcos.brito on 16/05/21.
//

import XCTest
import EitaCommerceCore

class CartTests: XCTestCase {

    let item1 = CartItem(item: Item(name: "Item 1", price: 10))
    let item2 = CartItem(item: Item(name: "Item 2", price: 10))
    let item3 = CartItem(item: Item(name: "Item 3", price: 10))

    func testCart_getPrice_ShouldBe10() {
        //Arrange
        let sut = Cart.start(items: [item1])

        //Assert
        XCTAssertEqual(sut.getPrice(), 10)
    }

    func testCart_getPrice_ShouldBe20() {
        //Arrange
        let sut = Cart.start(items: [item1, item2])

        //Assert
        XCTAssertEqual(sut.getPrice(), 20)
    }

    func testCart_CartWithSameTwoItems_CartShoudBeOneItemWithQuantityTwo() {
        //Arrange
        let sut = Cart.start(items: [item1, item1])

        //Assert
        XCTAssertEqual(sut.getItems().count, 1)
        XCTAssertEqual(sut.getItems().first?.quantity, 2)
    }
}
