//
//  ItemTests.swift
//  EitaCommerceAppTests
//
//  Created by marcos.brito on 15/08/21.
//

import XCTest
@testable import EitaCommerceApp

class ItemTests: XCTestCase {

    let sut = Item(
        id: 1,
        name: "Product",
        price: 12.99,
        category: .menClothing,
        description: "Description",
        imageStringURL: "http://image.com"
    )

    func testItem_init_ShouldRetainProperties() {
        // Assert
        XCTAssertNotNil(sut)
        XCTAssertEqual(sut.id, 1)
        XCTAssertEqual(sut.name, "Product")
        XCTAssertEqual(sut.price, 12.99)
        XCTAssertEqual(sut.category, .menClothing)
        XCTAssertEqual(sut.description, "Description")
        XCTAssertEqual(sut.imageStringURL, "http://image.com")
    }

    func testItem_codable_ShouldEncodeAndDecodeItem() throws {
        // Arrange
        let encoder = JSONEncoder()
        let decoder = JSONDecoder()

        // Act
        let data = try encoder.encode(sut)
        let decodedValue = try decoder.decode(Item.self, from: data)

        // Assert
        XCTAssertEqual(sut, decodedValue)
    }

    func testItem_decodeJSONString_ShouldDecodeToItem() throws {
        // Arrange
        let expectedItem = Item(
            id: 1,
            name: "Product",
            price: 12.99,
            category: .menClothing,
            description: "Description",
            imageStringURL: "http://image.com"
        )
        let decoder = JSONDecoder()
        let JSONString = """
                            {
                                \"id\": 1,
                                \"title\": \"Product\",
                                \"price\": 12.99,
                                \"category\": \"men clothing\",
                                \"description\": \"Description\",
                                \"image\": \"http://image.com\"
                            }
                         """
        let data = JSONString.data(using: .utf8)!

        // Act
        let decodedValue = try decoder.decode(Item.self, from: data)

        // Assert
        XCTAssertEqual(expectedItem, decodedValue)
    }

    func testItem_decodeWrongJSONString_ShouldFail() throws {
        // Arrange
        let decoder = JSONDecoder()
        let wrongJSONString = """
                            {
                                \"id\": 1,
                                \"title\": \"Product\",
                                \"price\": 12.99,
                                \"category\": \"clothing\",
                                \"description\": \"Description\",
                                \"image\": \"http://image.com\"
                            }
                         """
        let data = wrongJSONString.data(using: .utf8)!

        // Assert
        XCTAssertThrowsError(try decoder.decode(Item.self, from: data))
    }
}
