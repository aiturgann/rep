//
//  CategoryModel.swift
//  62CafeApp
//
//  Created by Aiturgan Kurmanbekova on 5/5/24.
//

import Foundation

struct CategoriesModel: Codable {
    let categories: [Categories]
}

struct Categories: Codable {
    let categoryName: String
    
    enum CodingKeys: String, CodingKey {
        case categoryName = "strCategory"
    }
}
