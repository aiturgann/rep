//
//  NetworkService.swift
//  62CafeApp
//
//  Created by Aiturgan Kurmanbekova on 5/5/24.
//

import Foundation
import UIKit

struct NetworkService {
    
    private let decoder = JSONDecoder()
    
    func getCategories(complition: @escaping (Result<[Categories], Error>) -> Void) {
        let request = URLRequest(url: Constants.baseURL.appendingPathComponent("categories.php"))
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                complition(.failure(error))
                return
            }
            guard let data = data else {
                complition(.failure(error!))
                return
            }
            do {
                let model = try decoder.decode(CategoriesModel.self, from: data)
                complition(.success(model.categories))
            } catch {
                complition(.failure(error))
            }
        }.resume()
    }
    
    func getProducts(with item: String, complition: @escaping (Result<[ProductModel], Error>) -> Void) {
        var urlComponents = URLComponents(url:  Constants.baseURL.appendingPathComponent("filter.php"),
                                          resolvingAgainstBaseURL: false
        )
        urlComponents?.queryItems = [ URLQueryItem(name: "c", value: item)]
        
        guard let url = urlComponents?.url else { return }
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                complition(.failure(error))
                return
            }
            guard let data = data else {
                complition(.failure(error!))
                return
            }
            do {
                let model = try decoder.decode(ProductssModel.self, from: data)
                complition(.success(model.products))
            } catch {
                complition(.failure(error))
            }
        }.resume()
    }
    
    func getProductDetails(with productId: String, 
                           complition: @escaping (Result<ProductModel, Error>) -> Void
    ) {
        var urlComponents = URLComponents(url:  Constants.baseURL.appendingPathComponent("lookup.php"), 
                                          resolvingAgainstBaseURL: false
        )
        urlComponents?.queryItems = [ URLQueryItem(name: "i", value: productId)]
        
        guard let url = urlComponents?.url else { return }
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                complition(.failure(error))
                return
            }
            guard let data = data else {
                complition(.failure(error!))
                return
            }
            do {
                let model = try decoder.decode(ProductssModel.self, from: data)
                if let productDetails = model.products.first {
                    complition(.success(productDetails))
                }
            } catch {
                complition(.failure(error))
            }
        }.resume()
    }
    
    func searchProducts(with title: String, 
                        complition: @escaping (Result<[ProductModel], Error>) -> Void
    ) {
        var urlComponents = URLComponents(url:  Constants.baseURL.appendingPathComponent("search.php"),
                                          resolvingAgainstBaseURL: false
        )
        urlComponents?.queryItems = [URLQueryItem(name: "s", value: title)]
        
        guard let url = urlComponents?.url else { return }
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                complition(.failure(error))
                return
            }
            guard let data = data else {
                complition(.failure(error!))
                return
            }
            do {
                let model = try decoder.decode(ProductssModel.self, from: data)
                complition(.success(model.products))
            } catch {
                complition(.failure(error))
            }
        }.resume()
    }
}

final class ImageURL {
    static let shared = ImageURL()
    
    private init() { }
    
    func getImage(with urlString: String,
                  completion: @escaping (Result<UIImage, Error>) -> Void
    ) {
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil,
                  let image = UIImage(data: data) else { return }
            completion(.success(image))
        }.resume()
    }
}
