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
              "categoryName": "Кофе"
          },
          {
              "categoryName": "Десерты"
          },
          {
              "categoryName": "Выпечка"
          },
          {
              "categoryName": "Напитки"
          },
          {
              "categoryName": "Торты"
          }
      ]

   }
"""

let jsonData = json.data(using: .utf8)!
