//
//  MenuListCollectionViewCell.swift
//  62CafeApp
//
//  Created by Aiturgan Kurmanbekova on 25/4/24.
//

import UIKit
import SnapKit

class MenuListCollectionViewCell: UICollectionViewCell {
    
    static let reuseId = "cell"
    
    private let imageView: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = 20
        view.clipsToBounds = true
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textColor = .orange
        return label
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.spacing = 8
        return stackView
    }()
    
    private let decreaseButton: UIButton = {
        let button = UIButton()
        button.setTitle("-", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 24/2
        button.backgroundColor = .systemGray6
        return button
    }()
    
    private let countLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        return label
    }()
    
    private let increaseButton: UIButton = {
        let button = UIButton()
        button.setTitle("+", for: .normal)
        button.layer.cornerRadius = 24/2
        button.backgroundColor = .orange
        return button
    }()
    
    var imageV: String {
        return "\(String(describing: imageView.image))"
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        setupSubviews()
        setupConstraints()
    }
    
    private func setupSubviews() {
        addSubview(imageView)
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        addSubview(priceLabel)
        addSubview(stackView)
        stackView.addArrangedSubview(decreaseButton)
        stackView.addArrangedSubview(countLabel)
        stackView.addArrangedSubview(increaseButton)
    }
    
    private func setupConstraints() {
        imageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().inset(5)
            make.height.width.equalTo(72)
        }
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(20)
            make.leading.equalTo(imageView.snp.trailing).inset(-10)
            make.trailing.equalToSuperview().inset(10)
            make.height.equalTo(20)
        }
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).inset(-5)
            make.leading.equalTo(imageView.snp.trailing).inset(-10)
            make.trailing.equalToSuperview().inset(10)
            make.height.equalTo(16)
        }
        priceLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(10)
            make.leading.equalTo(imageView.snp.trailing).inset(-10)
            make.trailing.equalToSuperview().inset(10)
            make.height.equalTo(16)
        }
        stackView.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(10)
            make.trailing.equalToSuperview().inset(5)
            make.height.equalTo(24)
            make.width.equalTo(80)
        }
        decreaseButton.snp.makeConstraints { make in
            make.height.width.equalTo(24)
        }
        increaseButton.snp.makeConstraints { make in
            make.height.width.equalTo(24)
        }
    }
    
    func fill(with item: Products.ProductsModel) {
        imageView.image = UIImage(named: item.image)
        titleLabel.text = item.name
        descriptionLabel.text = item.type
        priceLabel.text = "\(item.price) c"
    }
}
