//
//  ClearCartUseCaseTests.swift
//  EitaCommerceCoreTests
//
//  Created by marcos.brito on 18/07/21.
//

import XCTest
@testable import EitaCommerceCore

class ClearCartUseCaseTests: XCTestCase {

    func testAddItemUseCase_clearCart_ShouldReceiveAEmptyCart() {
        //Arrange
        let sut = ClearCartUseCase<CartItem>()

        //Assert
        XCTAssertTrue(sut.execute().items.isEmpty)
    }
}
