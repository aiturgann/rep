//
//  SectionCollectionViewModel.swift
//  62CafeApp
//
//  Created by Aiturgan Kurmanbekova on 24/4/24.
//

import Foundation

struct Category: Decodable {
    let categories: [CategoryModel]
}

struct CategoryModel: Decodable, Hashable {
    let id: CategoryId
    
    
    enum CategoryId: String, Decodable {
        case coffee, dessert, bake, lemonade, cake, icecream, additional
        
        var title: String {
            switch self {
            case .coffee:
                return "Кофе"
            case .bake:
                return "Выпечка"
            case .cake:
                return "Торты"
            case .dessert:
                return "Десерты"
            case .icecream:
                return "Мороженое"
            case .lemonade:
                return "Лимонады"
            default:
                return ""
            }
        }
    }
}
