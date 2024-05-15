//
//  PaginationModel.swift
//  62CafeApp
//
//  Created by Aiturgan Kurmanbekova on 16/5/24.
//

import Foundation

struct PaginationModel: Codable {
    let products: [Product]
}

struct Product: Codable {
    let title: String
}
