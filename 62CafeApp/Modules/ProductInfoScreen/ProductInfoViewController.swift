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
    
    let products: [MenuListModel] = [
        MenuListModel(image: "cap",
                      title: "Cappuccino",
                      description: "Coffee",
                      price: "240"),
        MenuListModel(image: "raff",
                      title: "Raff",
                      description: "Coffee",
                      price: "200"),
        MenuListModel(image: "mocc",
                      title: "Mocco",
                      description: "Coffee",
                      price: "190")]
    
    override func setup() {
        super.setup()
        setupSubviews()
        setupConstraints()
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
}
