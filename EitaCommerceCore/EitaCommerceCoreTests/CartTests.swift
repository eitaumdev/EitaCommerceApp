//
//  CartTests.swift
//  EitaCommerceCoreTests
//
//  Created by marcos.brito on 16/05/21.
//

import XCTest

class Cart {

    private(set) var items: [String]

    init(items: [String]) {
        self.items = items
    }

    func addProduct(_ product: String) {
        items.append(product)
    }

    func removeProduct(_ product: String) {
        guard let productToRemoveIndex = items.firstIndex(of: product) else {
            return
        }
        items.remove(at: productToRemoveIndex)
    }

    func clear() {
        items.removeAll()
    }
}

class CartTests: XCTestCase {

    let item1 = "Item 1"
    let item2 = "Item 2"
    let item3 = "Item 3"

    func testCart_AddTwoProduct_ShouldHaveTwoProducts() {
        //Arrenge
        let sut = Cart(items: [])

        //Act
        sut.addProduct(item1)
        sut.addProduct(item2)

        //Assert
        XCTAssertEqual(sut.items.count, 2)
        XCTAssertEqual(sut.items.first, item1)
        XCTAssertEqual(sut.items.last, item2)
    }

    func testCart_RemoveOneProduct_ShouldHaveOneProduct() {
        //Arrenge
        let sut = Cart(items: [item1, item2])

        //Act
        sut.removeProduct(item1)

        //Assert
        XCTAssertEqual(sut.items.count, 1)
        XCTAssertEqual(sut.items.first, item2)
    }

    func testCart_RemoveOneProduct_ShouldHaveTwoProducts() {
        //Arrenge
        let sut = Cart(items: [item1, item2, item2])

        //Act
        sut.removeProduct(item2)

        //Assert
        XCTAssertEqual(sut.items.count, 2)
        XCTAssertEqual(sut.items.first, item1)
        XCTAssertEqual(sut.items.last, item2)
    }

    func testCart_clearAllCart_CartShouldBeEmpty() {
        //Arrange
        let sut = Cart(items: [item1, item2, item3])

        //Act
        sut.clear()

        //Assert
        XCTAssertTrue(sut.items.isEmpty)
    }
}
