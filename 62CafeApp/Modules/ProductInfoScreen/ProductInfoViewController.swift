//
//  ProductInfoViewController.swift
//  62CafeApp
//
//  Created by Aiturgan Kurmanbekova on 28/4/24.
//

import UIKit

class ProductInfoViewController: BaseViewController {
    
    private let productionInfoView: ProductInfoView = {
        let view = ProductInfoView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let parser = JSONParser()
    
    var selectedImage = ""
    
    var selectedName = ""
    
    var selectedDescription = ""
    
    var selectedPrice = ""
    
    override func setup() {
        super.setup()
        setupSubviews()
        setupConstraints()
        
        getProducts()
        fill()
    }
    
    override func setupSubviews() {
        super.setupSubviews()
        view.addSubview(productionInfoView)
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        NSLayoutConstraint.activate(
            [
                productionInfoView.topAnchor.constraint(equalTo: view.topAnchor),
                productionInfoView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                productionInfoView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                productionInfoView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ]
        )
    }
    
    private func fill() {
        productionInfoView.fill(
            with: selectedImage,
            name: selectedName,
            description: selectedDescription,
            price: selectedPrice
        )
    }
    
    private func getProducts() {
        guard let path = Bundle.main.path(forResource: "Products", ofType: "json"),
              case let url = URL(fileURLWithPath: path),
              let data = try? Data(contentsOf: url) else {
            return
        }
        
        parser.getItems(from: data) { (result: Result<Products, JSONParser.CustomError>) in
            switch result {
            case .success(let products):
                let additionalItems = products.products.filter {
                    $0.id == .additional
                }
                productionInfoView.fill(with: additionalItems)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
