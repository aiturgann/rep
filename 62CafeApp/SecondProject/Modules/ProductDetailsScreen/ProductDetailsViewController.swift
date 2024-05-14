//
//  ProductDetailsViewController.swift
//  62CafeApp
//
//  Created by Aiturgan Kurmanbekova on 5/5/24.
//

import UIKit
import SnapKit

class ProductDetailsViewController: BaseViewController {
    
    private let productDetailsView: ProductDetailsView = {
        let view = ProductDetailsView()
        return view
    }()
    
    private let networkService = NetworkService()
    
    private var products: ProductModel?
    
    var selectedProducts: String?

    override func setup() {
        super.setup()
        setupSubviews()
        setupConstraints()
        getProducts(id: selectedProducts ?? "")
    }
    
    override func setupSubviews() {
        super.setupSubviews()
        view.addSubview(productDetailsView)
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        productDetailsView.snp.makeConstraints { make in
            make.directionalEdges.equalToSuperview()
        }
    }
    
    private func getProducts(id: String) {
        networkService.getProductDetails(with: id) { [weak self] result in
            guard let self = self else {return}
            switch result {
            case .success(let model):
                DispatchQueue.main.async {
                    self.productDetailsView.fill(with: model)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
