//
//  ProductDetailsView.swift
//  62CafeApp
//
//  Created by Aiturgan Kurmanbekova on 5/5/24.
//


import UIKit
import SnapKit

class ProductDetailsView: BaseView {
    
    private let scrollView: UIScrollView = {
        let view = UIScrollView()
        return view
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        return view
    }()
    
    private let productImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 16
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .orange
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.numberOfLines = 0
        return label
    }()
        
    override func setup() {
        super.setup()
        setupSubviews()
        setupConstraints()
        scrollView.delegate = self
        contentView.backgroundColor = .white
    }
    
    override func setupSubviews() {
        super.setupSubviews()
        add {
            scrollView
        }
        scrollView.add { contentView }
        contentView.add {
            productImageView
            containerView
        }
        containerView.add {
            titleLabel
            priceLabel
            descriptionLabel
        }
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        scrollView.snp.makeConstraints { make in
            make.directionalEdges.width.equalToSuperview()
        }
        contentView.snp.makeConstraints { make in
            make.directionalEdges.width.equalToSuperview()
        }
        productImageView.snp.makeConstraints { make in
            make.top.directionalHorizontalEdges.equalToSuperview()
            make.height.equalTo(320)
        }
        containerView.snp.makeConstraints { make in
            make.top.equalTo(productImageView.snp.bottom).inset(20)
            make.bottom.directionalHorizontalEdges.equalToSuperview()
        }
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(10)
            make.leading.equalToSuperview().inset(16)
            make.trailing.equalToSuperview().inset(100)
        }
        priceLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(10)
            make.trailing.equalToSuperview().inset(20)
        }
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.directionalHorizontalEdges.equalToSuperview().inset(16)
            make.bottom.equalToSuperview()
        }
    }
    
    func fill(with item: ProductModel) {
        titleLabel.text = item.productName
        descriptionLabel.text = item.productDescription
        priceLabel.text = "\(String(describing: item.productId!)) c"
        ImageURL.shared.getImage(with: item.productImage!) { [weak self] result in
            if case .success(let image) = result {
                DispatchQueue.main.async {
                    self?.productImageView.image = image
                }
            }
        }
    }
}

extension ProductDetailsView: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let scaleFactor = max(1.0, 1.0 - (offsetY / productImageView.frame.height) * 0.3)
        guard scaleFactor.isFinite, scaleFactor > 0 else { return }
        productImageView.transform = CGAffineTransform(scaleX: scaleFactor,
                                                       y: scaleFactor).translatedBy(x: 0, y: -offsetY / 2)
        productImageView.frame.origin.y = offsetY
    }
}
