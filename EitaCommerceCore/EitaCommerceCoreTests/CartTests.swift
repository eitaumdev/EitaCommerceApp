//
//  CartTests.swift
//  EitaCommerceCoreTests
//
//  Created by marcos.brito on 16/05/21.
//

import XCTest
import EitaCommerceCore

class CartTests: XCTestCase {

    let item1 = CartItem(item: "Item 1")
    let item2 = CartItem(item: "Item 2")
    let item3 = CartItem(item: "Item 3")

    func testCart_AddTwoItem_ShouldHaveTwoItems() {
        //Arrenge
        let sut = Cart(items: [])

        //Act
        sut.addItem(item1)
        sut.addItem(item2)

        //Assert
        XCTAssertEqual(sut.getItems().count, 2)
        XCTAssertTrue(sut.getItems().first!.isEqual(item1))
        XCTAssertTrue(sut.getItems().last!.isEqual(item2))
    }

    func testCart_RemoveOneItem_ShouldHaveOneItem() {
        //Arrenge
        let sut = Cart(items: [item1, item2])

        //Act
        sut.removeItem(item1)

        //Assert
        XCTAssertEqual(sut.getItems().count, 1)
        XCTAssertTrue(sut.getItems().first!.isEqual(item2))
    }

    func testCart_RemoveOneItem_ShouldHaveTwoItems() {
        //Arrenge
        let sut = Cart(items: [item1, item2, item2])

        //Act
        sut.removeItem(item2)

        //Assert
        XCTAssertEqual(sut.getItems().count, 2)
        XCTAssertTrue(sut.getItems().first!.isEqual(item1))
        XCTAssertTrue(sut.getItems().last!.isEqual(item2))
    }

    func testCart_clearAllCart_CartShouldBeEmpty() {
        //Arrange
        let sut = Cart(items: [item1, item2, item3])

        //Act
        sut.clear()

        //Assert
        XCTAssertTrue(sut.getItems().isEmpty)
    }

    // Mark: - Helper

    struct CartItem: CartItemProtocol {
        let item: String

        func isEqual(_ other: CartItemProtocol) -> Bool {
            return item == other.item
        }
    }
}
