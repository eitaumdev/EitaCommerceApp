//
//  ItemTests.swift
//  EitaCommerceAppTests
//
//  Created by marcos.brito on 15/08/21.
//

import XCTest

class ItemTests: XCTestCase {

    struct Item {
        enum Category: String {
            case electronics
            case jewelery
            case menClothing = "men clothing"
            case womenClothing = "women clothing"
        }

        let id: Int
        let name: String
        let price: Double
        let category: Category
        let description: String
        let imageStringURL: String

        init(
            id: Int,
            name: String,
            price: Double,
            category: Category,
            description: String,
            image: String
        ) {
            self.id = id
            self.name = name
            self.price = price
            self.category = category
            self.description = description
            self.imageStringURL = image

        }
    }

    func testItem_init_ShouldRetainProperties() {
        // Arrange
        let sut = Item(
            id: 1,
            name: "Product",
            price: 12.99,
            category: .menClothing,
            description: "Description",
            image: "http://image.com"
        )

        // Assert
        XCTAssertNotNil(sut)
        XCTAssertEqual(sut.id, 1)
        XCTAssertEqual(sut.name, "Product")
        XCTAssertEqual(sut.price, 12.99)
        XCTAssertEqual(sut.category, .menClothing)
        XCTAssertEqual(sut.description, "Description")
        XCTAssertEqual(sut.imageStringURL, "http://image.com")
    }
}
