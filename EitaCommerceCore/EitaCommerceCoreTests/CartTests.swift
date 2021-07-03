//
//  CartTests.swift
//  EitaCommerceCoreTests
//
//  Created by marcos.brito on 16/05/21.
//

import XCTest
import EitaCommerceCore

class CartTests: XCTestCase {

    let item1 = CartItem(item: Item(id: UUID(uuidString: "Item 1") ?? UUID(), name: "Item 1", price: 10), price: 10)
    let item2 = CartItem(item: Item(id: UUID(uuidString: "Item 2") ?? UUID(), name: "Item 1", price: 10), price: 10)
    let item3 = CartItem(item: Item(id: UUID(uuidString: "Item 3") ?? UUID(), name: "Item 1", price: 10), price: 10)

    func testCart_AddTwoItem_ShouldHaveTwoItems() {
        //Arrenge
        let sut = Cart.start(items: [])

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
        let sut = Cart.start(items: [item1, item2])

        //Act
        sut.removeItem(item1)

        //Assert
        XCTAssertEqual(sut.getItems().count, 1)
        XCTAssertTrue(sut.getItems().first!.isEqual(item2))
    }

    func testCart_RemoveOneItem_ShouldHaveTwoItems() {
        //Arrenge
        let sut = Cart.start(items: [item1, item2, item2])

        //Act
        sut.removeItem(item2)

        //Assert
        XCTAssertEqual(sut.getItems().count, 2)
        XCTAssertTrue(sut.getItems().first!.isEqual(item1))
        XCTAssertTrue(sut.getItems().last!.isEqual(item2))
    }

    func testCart_clearAllCart_CartShouldBeEmpty() {
        //Arrange
        let sut = Cart.start(items: [item1, item2, item3])

        //Act
        sut.clear()

        //Assert
        XCTAssertTrue(sut.getItems().isEmpty)
    }

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

    func testCart_AddTwoTimesTheSameItem_CartShoudBeOneItemWithQuantityTwo() {
        //Arrange
        let sut = Cart.start(items: [])

        //Act
        sut.addItem(item1)
        sut.addItem(item1)

        //Assert
        XCTAssertEqual(sut.getItems().count, 1)
        XCTAssertEqual(sut.getItems().first?.quantity, 2)
    }

    func testCart_CartWithSameTwoItems_CartShoudBeOneItemWithQuantityTwo() {
        //Arrange
        let sut = Cart.start(items: [item1, item1])

        //Assert
        XCTAssertEqual(sut.getItems().count, 1)
        XCTAssertEqual(sut.getItems().first?.quantity, 2)
    }



    // Mark: - Helper
    struct Item: ItemProtocol {
        var id: UUID
        var name: String
        var price: Int
    }

    class CartItem: CartItemProtocol {
        let item: ItemProtocol
        let price: Int
        var quantity: Int = 1

        init(item: ItemProtocol, price: Int) {
            self.item = item
            self.price = price
        }

        func setQuantity(_ quantity: Int) {
            self.quantity = quantity
        }

        func isEqual(_ other: CartItemProtocol) -> Bool {
            return item.id == other.item.id
        }
    }
}
