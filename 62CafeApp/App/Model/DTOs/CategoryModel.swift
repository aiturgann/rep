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
    let categoryName: String
}
