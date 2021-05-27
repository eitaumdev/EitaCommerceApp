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

    func testCart_AddTwoProduct_ShouldHaveTwoProducts() {
        //Arrenge
        let sut = Cart(items: [])

        //Act
        sut.addProduct("Product 1")
        sut.addProduct("Product 2")

        //Assert
        XCTAssertEqual(sut.items.count, 2)
        XCTAssertEqual(sut.items.first, "Product 1")
        XCTAssertEqual(sut.items.last, "Product 2")
    }

    func testCart_RemoveOneProduct_ShouldHaveOneProduct() {
        //Arrenge
        let sut = Cart(items: [])

        //Act
        sut.addProduct("Product 1")
        sut.addProduct("Product 2")
        sut.removeProduct("Product 1")

        //Assert
        XCTAssertEqual(sut.items.count, 1)
        XCTAssertEqual(sut.items.first, "Product 2")
    }

    func testCart_RemoveOneProduct_ShouldHaveTwoProducts() {
        //Arrenge
        let sut = Cart(items: [])

        //Act
        sut.addProduct("Product 1")
        sut.addProduct("Product 2")
        sut.addProduct("Product 2")
        sut.removeProduct("Product 2")

        //Assert
        XCTAssertEqual(sut.items.count, 2)
        XCTAssertEqual(sut.items.first, "Product 1")
        XCTAssertEqual(sut.items.last, "Product 2")
    }

    func testCart_clearAllCart_CartShouldBeEmpty() {
        //Arrange
        let sut = Cart(items: [])

        //Act
        sut.addProduct("Product 1")
        sut.addProduct("Product 2")
        sut.addProduct("Product 2")
        sut.clear()

        //Assert
        XCTAssertTrue(sut.items.isEmpty)
    }
}
