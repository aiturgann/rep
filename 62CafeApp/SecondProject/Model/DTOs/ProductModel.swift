//
//  ProductModel.swift
//  62CafeApp
//
//  Created by Aiturgan Kurmanbekova on 5/5/24.
//

import Foundation

struct ProductssModel: Decodable {
    
    let products: [ProductModel]
    
    enum CodingKeys: String, CodingKey {
        case products = "meals"
    }
}
struct ProductModel: Decodable {
    let productId: String?
    let productName: String?
    let productImage: String?
    let productDescription: String?
    
    enum CodingKeys: String, CodingKey {
        case productId = "idMeal"
        case productName = "strMeal"
        case productImage = "strMealThumb"
        case productDescription = "strInstructions"
    }
}
