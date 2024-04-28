//
//  ProductsModel.swift
//  62CafeApp
//
//  Created by Aiturgan Kurmanbekova on 27/4/24.
//

import Foundation

struct Products: Decodable {
    
    let products: [ProductsModel]
    
    struct ProductsModel: Decodable {
        let image: String
        let name: String
        let type: String
        let price: Int
        
        enum CodingKeys: String, CodingKey {
            case image
            case name = "product_name"
            case type = "ProductType"
            case price = "Product_Price"
        }
    }
    
}
