//
//  EitaCommerceCoreTests.swift
//  EitaCommerceCoreTests
//
//  Created by marcos.brito on 08/05/21.
//

import XCTest
@testable import EitaCommerceCore

public final class EitaCommerceCore<Item: CartItemEquatable> {
    var cart = Cart(items: [Item]())
    let addItemCartUseCase = AddItemCartUseCase<Item>()
    let removeItemCartUseCase = RemoveItemCartUseCase<Item>()
    let clearCartUseCase = ClearCartUseCase<Item>()

    var currentCart: Cart<Item> {
        cart
    }

    public static func startWith(items: [Item]) -> EitaCommerceCore {
        let eita = EitaCommerceCore()

        items.forEach { item in
            _ = eita.add(item: item)
        }

        return eita
    }

    func add(item: Item) -> Cart<Item> {
        cart = addItemCartUseCase.execute(item, toCart: cart)
        return cart
    }

    func remove(item: Item) -> Cart<Item> {
        cart = removeItemCartUseCase.execute(item, toCart: cart)
        return cart
    }

    func clear() -> Cart<Item> {
        cart = clearCartUseCase.execute()
        return cart
    }
}

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
}
