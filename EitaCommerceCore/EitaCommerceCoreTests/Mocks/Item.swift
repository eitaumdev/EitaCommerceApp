//
//  MockItem.swift
//  EitaCommerceCoreTests
//
//  Created by marcos.brito on 18/07/21.
//

import Foundation
import EitaCommerceCore

struct Item: ItemProtocol {
    var id = UUID()
    var name: String
    var price: Double
}
