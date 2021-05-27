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

    func addItem(_ item: String) {
        items.append(item)
    }

    func removeItem(_ item: String) {
        guard let itemIndex = items.firstIndex(of: item) else {
            return
        }
        items.remove(at: itemIndex)
    }

    func clear() {
        items.removeAll()
    }
}

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
        XCTAssertEqual(sut.items.count, 2)
        XCTAssertEqual(sut.items.first, item1)
        XCTAssertEqual(sut.items.last, item2)
    }

    func testCart_RemoveOneItem_ShouldHaveOneItem() {
        //Arrenge
        let sut = Cart(items: [item1, item2])

        //Act
        sut.removeItem(item1)

        //Assert
        XCTAssertEqual(sut.items.count, 1)
        XCTAssertEqual(sut.items.first, item2)
    }

    func testCart_RemoveOneItem_ShouldHaveTwoItems() {
        //Arrenge
        let sut = Cart(items: [item1, item2, item2])

        //Act
        sut.removeItem(item2)

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
