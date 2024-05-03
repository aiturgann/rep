//
//  ProductsJson.swift
//  62CafeApp
//
//  Created by Aiturgan Kurmanbekova on 27/4/24.
//

import Foundation

let json = """
   {
      "categories": [
          {
              "categoryName": "Кофе",
              "id": "coffee"
          },
          {
              "categoryName": "Десерты",
              "id": "dessert"
          },
          {
              "categoryName": "Выпечка",
              "id": "bake"
          },
          {
              "categoryName": "Лимонады",
              "id": "lemonade"
          },
          {
              "categoryName": "Торты",
              "id": "cake"
          },
          {
              "categoryName": "Мороженое",
              "id": "icecream"
          }
      ]

   }
"""

let jsonData = json.data(using: .utf8)!
