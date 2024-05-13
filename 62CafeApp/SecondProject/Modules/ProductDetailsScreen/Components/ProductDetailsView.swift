//
//  ProductDetailsView.swift
//  62CafeApp
//
//  Created by Aiturgan Kurmanbekova on 5/5/24.
//

import UIKit
import SnapKit

protocol ProductDetailsViewDelegate: AnyObject {
    func fill(products: [ProductModel])
}

class ProductDetailsView: BaseView {
    
    private let imageView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .magenta
        return view
    }()
    
    private let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.backgroundColor = .gray
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        view.layer.cornerRadius = 20
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()

    override func setup() {
        super.setup()
        setupSubviews()
        setupConstraints()
    }
    
    override func setupSubviews() {
        super.setupSubviews()
        addSubview(imageView)
        addSubview(scrollView)
        scrollView.addSubview(titleLabel)
        scrollView.addSubview(priceLabel)
        scrollView.addSubview(descriptionLabel)
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(300)
        }
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).inset(20)
            make.leading.trailing.bottom.width.equalToSuperview()
        }
        titleLabel.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(50)
        }
        priceLabel.snp.makeConstraints { make in
            make.top.trailing.equalToSuperview().inset(16)
            make.height.equalTo(50)
        }
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).inset(-10)
            make.leading.trailing.width.equalToSuperview().inset(16)
            make.bottom.equalToSuperview()
        }
    }
    
    func fill(with item: ProductModel) {
        titleLabel.text = item.productName
        descriptionLabel.text = item.productDescription
        ImageURL.shared.getImage(with: item.productImage) { [weak self] result in
            if case .success(let image) = result {
                DispatchQueue.main.async {
                    self?.imageView.image = image
                }
            }
        }
    }
}
