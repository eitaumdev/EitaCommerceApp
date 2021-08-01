//
//  EitaCommerceCoreTests.swift
//  EitaCommerceCoreTests
//
//  Created by marcos.brito on 08/05/21.
//

import XCTest
import EitaCommerceCore

class EitaCommerceCoreTests: XCTestCase {

    let item = CartItem(item: Item(name: "Item 1", price: 10))

    func testEitaCommerceCore_start_ShouldReturnAValidEitaCommerceCore() {
        //Arrange
        let sut = EitaCommerceCore.startWith(items: [CartItem]())

        //Assert
        XCTAssertNotNil(sut)
    }

    func testEitaCommerceCore_startWithItems_ShouldReturnEitaCommerceCoreWithCartPopulatedWithItems() {
        //Arrange
        let sut = EitaCommerceCore.startWith(items: [item])

        //Assert
        XCTAssertEqual(sut.currentCart.items.count, 1)
        XCTAssertEqual(sut.currentCart.items, [item])
    }

    func testEitaCommerceCore_addItem_ShouldReturnCartWithItem() {
        //Arrange
        let sut = EitaCommerceCore.startWith(items: [CartItem]())

        //Act
        let cart = sut.add(item: item)

        //Assert
        XCTAssertEqual(cart.items.count, 1)
        XCTAssertEqual(cart.items, [item])
        XCTAssertEqual(sut.currentCart.items.count, 1)
        XCTAssertEqual(sut.currentCart.items, [item])
    }

    func testEitaCommerceCore_removeItem_ShouldReturnCartWithoutItems() {
        //Arrange
        let sut = EitaCommerceCore.startWith(items: [item])

        //Act
        let cart = sut.remove(item: item)

        //Assert
        XCTAssertEqual(cart.items.count, 0)
        XCTAssertEqual(cart.items, [])
        XCTAssertEqual(sut.currentCart.items.count, 0)
        XCTAssertEqual(sut.currentCart.items, [])
    }

    func testEitaCommerceCore_clear_ShouldReturnCartWithoutItems() {
        //Arrange
        let sut = EitaCommerceCore.startWith(items: [item])

        //Act
        let cart = sut.clear()

        //Assert
        XCTAssertEqual(cart.items.count, 0)
        XCTAssertEqual(cart.items, [])
        XCTAssertEqual(sut.currentCart.items.count, 0)
        XCTAssertEqual(sut.currentCart.items, [])
    }

    func testEitaCommerceCore_calculateTotalPrice_ShouldReturnCartTotalPrice() {
        //Arrange
        let sut = EitaCommerceCore.startWith(items: [item])

        //Act
        let price = sut.calculateTotalPrice()

        //Assert
        XCTAssertEqual(price, 10)
    }
}
