//
//  CategoryModel.swift
//  62CafeApp
//
//  Created by Aiturgan Kurmanbekova on 5/5/24.
//

import Foundation

struct CategoriesModel: Decodable {
    let categories: [Categories]
}

struct Categories: Decodable {
    let categoryName: String
    
    enum CodingKeys: String, CodingKey {
        case categoryName = "strCategory"
    }
}
