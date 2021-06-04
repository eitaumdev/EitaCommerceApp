//
//  CartTests.swift
//  EitaCommerceCoreTests
//
//  Created by marcos.brito on 16/05/21.
//

import XCTest
import EitaCommerceCore

class CartTests: XCTestCase {

    let item1 = "Item 1"
    let item2 = "Item 2"
    let item3 = "Item 3"

    func testCart_AddTwoItem_ShouldHaveTwoItems() {
        //Arrenge
        let sut = Cart(items: [])

        //Act
        sut.addItem(item1)
        sut.addItem(item2)

        //Assert
        XCTAssertEqual(sut.getItems().count, 2)
        XCTAssertEqual(sut.getItems().first, item1)
        XCTAssertEqual(sut.getItems().last, item2)
    }

    func testCart_RemoveOneItem_ShouldHaveOneItem() {
        //Arrenge
        let sut = Cart(items: [item1, item2])

        //Act
        sut.removeItem(item1)

        //Assert
        XCTAssertEqual(sut.getItems().count, 1)
        XCTAssertEqual(sut.getItems().first, item2)
    }

    func testCart_RemoveOneItem_ShouldHaveTwoItems() {
        //Arrenge
        let sut = Cart(items: [item1, item2, item2])

        //Act
        sut.removeItem(item2)

        //Assert
        XCTAssertEqual(sut.getItems().count, 2)
        XCTAssertEqual(sut.getItems().first, item1)
        XCTAssertEqual(sut.getItems().last, item2)
    }

    func testCart_clearAllCart_CartShouldBeEmpty() {
        //Arrange
        let sut = Cart(items: [item1, item2, item3])

        //Act
        sut.clear()

        //Assert
        XCTAssertTrue(sut.getItems().isEmpty)
    }
}
