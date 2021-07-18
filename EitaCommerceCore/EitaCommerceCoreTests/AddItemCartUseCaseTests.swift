//
//  AddItemCartUseCaseTests.swift
//  EitaCommerceCoreTests
//
//  Created by marcos.brito on 18/07/21.
//

import XCTest
import EitaCommerceCore

protocol AddItemCartUseCaseProtocol {
    associatedtype Item: CartItemEquatable
    func execute(_ item: Item, toCart cart: Cart<Item>) -> Cart<Item>
}

class AddItemCartUseCase<Item: CartItemEquatable>: AddItemCartUseCaseProtocol {

    func execute(_ item: Item, toCart cart: Cart<Item>) -> Cart<Item> {
        var items: [Item] = cart.getItems()

        guard let item = items.first(where: { $0 == item }) else {
            items.append(item)
            return Cart(items: items)
        }

        item.setQuantity(item.quantity + 1)

        return Cart(items: items)
    }
}

class AddItemCartUseCaseTests: XCTestCase {

    let item1 = CartItem(item: Item(name: "Item 1", price: 10))
    let item2 = CartItem(item: Item(name: "Item 2", price: 10))
    let item3 = CartItem(item: Item(name: "Item 3", price: 10))

    func testAddItemUseCase_addOneItem_ShouldReceiveCartWithOneItem() {
        //Arrange
        let sut = AddItemCartUseCase<CartItem>()

        //Act
        let cart = sut.execute(item1, toCart: Cart(items: [CartItem]()))

        //Assert
        XCTAssertEqual(cart.getItems().count, 1)
    }

    func testAddItemUseCase_addTwoEqualItems_ShouldReceiveCartWithOneItemWithQuantityTwo() {
        //Arrange
        let sut = AddItemCartUseCase<CartItem>()

        //Act
        var cart = sut.execute(item1, toCart: Cart(items: [CartItem]()))
        cart = sut.execute(item1, toCart: cart)

        //Assert
        XCTAssertEqual(cart.getItems().count, 1)
        XCTAssertEqual(cart.getItems().first?.quantity, 2)
    }

    func testAddItemUseCase_addTwoItems_ShouldReceiveCartWithTwoItems() {
        //Arrange
        let sut = AddItemCartUseCase<CartItem>()

        //Act
        var cart = sut.execute(item1, toCart: Cart(items: [CartItem]()))
        cart = sut.execute(item2, toCart: cart)

        //Assert
        XCTAssertEqual(cart.getItems().count, 2)
    }
}
