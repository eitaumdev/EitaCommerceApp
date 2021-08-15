//
//  RemoveItemCartUseCaseTests.swift
//  EitaCommerceCoreTests
//
//  Created by marcos.brito on 18/07/21.
//

import XCTest
@testable import EitaCommerceCore

class CalculatePriceCartUseCaseTests: XCTestCase {

    func testRemoveItemUseCase_calculatePrice_ShouldReceiveTwenty() {
        //Arrange
        let sut = CalculatePriceCartUseCase<CartItem>()

        //Assert
        XCTAssertEqual(sut.execute(Cart(items: [CartItem.item1, CartItem.item2])), 20)
    }

    func testRemoveItemUseCase_calculatePriceForEmptyCart_ShouldReceiveZero() {
        //Arrange
        let sut = CalculatePriceCartUseCase<CartItem>()

        //Assert
        XCTAssertEqual(sut.execute(Cart(items: [CartItem]())), 0)
    }
}
