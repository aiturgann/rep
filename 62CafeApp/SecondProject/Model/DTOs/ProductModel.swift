//
//  ProductModel.swift
//  62CafeApp
//
//  Created by Aiturgan Kurmanbekova on 5/5/24.
//

import Foundation

struct ProductssModel: Codable {
    let products: [ProductModel]
}

struct ProductModel: Codable {
    let productName: String
    let productImage: String
    let productId: String
    let productDescription: String
    
    enum CodingKeys: String, CodingKey {
        case productName = "strMeal"
        case productImage = "strMealThumb"
        case productId = "idMeal"
        case productDescription = "strInstructions"
    }
}
