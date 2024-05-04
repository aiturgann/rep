//
//  JSONParser.swift
//  62CafeApp
//
//  Created by Aiturgan Kurmanbekova on 27/4/24.
//

import Foundation

struct JSONParser {
    
    private let decoder = JSONDecoder()
    
    private let encoder = JSONEncoder()
    
    func getCategories(completion: ([CategoryModel]) -> Void) {
        do {
            let model = try decoder.decode(
                Category.self,
                from: jsonData
            )
            completion(model.categories)
        } catch {
            print("Ошибка: \(error.localizedDescription)")
        }
    }
    
    func getProducts(completion: ([Products.ProductsModel]) -> Void) {
        guard let path = Bundle.main.path(
            forResource: "Products",
            ofType: "json"
        ) else {
            return
        }
        
        let url = URL(fileURLWithPath: path)
        
        do {
            let data = try Data(contentsOf: url)
            let model = try decoder.decode(
                Products.self,
                from: data
            )
            completion(model.products)
        } catch {
            print("Ошибка: \(error.localizedDescription)")
        }
    }
    
    enum CustomError: String, Error {
        case incorrectFormat = "Неправильный формат"
    }
    
    func getItems<Model: Decodable>(
        from data: Data,
        completion: (Result<Model, CustomError>) -> Void
    ) {
        do {
            let model = try JSONDecoder().decode(Model.self, from: data)
            completion(.success(model))
        } catch {
            print("Error decoding JSON: \(error)")
            completion(.failure(.incorrectFormat))
        }
    }
}
