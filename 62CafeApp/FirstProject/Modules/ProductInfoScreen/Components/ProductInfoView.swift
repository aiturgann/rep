//
//  ProductInfoView.swift
//  62CafeApp
//
//  Created by Aiturgan Kurmanbekova on 28/4/24.
//

import UIKit
import SnapKit

protocol ProductInfoViewDelegate: AnyObject {
    func fill(with image: String, name: String, desc: String, price: String)
}

class ProductInfoView: BaseView {
    
    private let imageView: UIImageView = {
        let view = UIImageView()
        return view
    }()
    
    private let whiteView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        view.layer.cornerRadius = 20
        return view
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
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
        button.layer.cornerRadius = 36/2
        button.backgroundColor = .systemGray6
        return button
    }()
    
    private let countLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.textColor = .white
        return label
    }()
    
    private let increaseButton: UIButton = {
        let button = UIButton()
        button.setTitle("+", for: .normal)
        button.layer.cornerRadius = 36/2
        button.backgroundColor = .orange
        return button
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Приятное дополнение"
        return label
    }()
    
    private let menuListView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width - 40, height: 100)
        layout.minimumLineSpacing = 20
        layout.scrollDirection = .vertical
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.showsVerticalScrollIndicator = false
        return view
    }()
    
    weak var delegate: ProductInfoViewDelegate?
    
    private var products: [Products.ProductsModel] = []
    
    override func setup() {
        super.setup()
        setupSubviews()
        setupConstraints()
        
        menuListView.register(
            MenuListCollectionViewCell.self,
            forCellWithReuseIdentifier: MenuListCollectionViewCell.reuseId
        )
        menuListView.dataSource = self
        
        delegate?.fill(with: "\(String(describing: imageView.image))",
                       name: nameLabel.text ?? "",
                       desc: descriptionLabel.text ?? "",
                       price: priceLabel.text ?? "")
    }
    
    override func setupSubviews() {
        super.setupSubviews()
        addSubview(imageView)
        addSubview(whiteView)
        whiteView.addSubview(nameLabel)
        whiteView.addSubview(priceLabel)
        whiteView.addSubview(descriptionLabel)
        whiteView.addSubview(stackView)
        stackView.addArrangedSubview(decreaseButton)
        stackView.addArrangedSubview(countLabel)
        stackView.addArrangedSubview(increaseButton)
        whiteView.addSubview(titleLabel)
        whiteView.addSubview(menuListView)
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(300)
        }
        whiteView.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).inset(20)
            make.leading.trailing.bottom.equalToSuperview()
        }
        nameLabel.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(50)
        }
        priceLabel.snp.makeConstraints { make in
            make.top.trailing.equalToSuperview().inset(16)
            make.leading.equalTo(nameLabel.snp.trailing).inset(-16)
            make.height.equalTo(50)
        }
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).inset(-10)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        stackView.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).inset(-10)
            make.trailing.equalToSuperview().inset(16)
            make.height.equalTo(36)
            make.width.equalTo(100)
        }
        decreaseButton.snp.makeConstraints { make in
            make.height.width.equalTo(36)
        }
        increaseButton.snp.makeConstraints { make in
            make.height.width.equalTo(36)
        }
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(stackView.snp.bottom).inset(-10)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(50)
        }
        menuListView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).inset(-10)
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalToSuperview()
        }
    }
    
    func fill(with item: [Products.ProductsModel]) {
        self.products = item
        menuListView.reloadData()
    }
    
    func fill(with image: String, name: String, description: String, price: String) {
        imageView.image = UIImage(named: image)
        nameLabel.text = name
        descriptionLabel.text = description
        priceLabel.text = price
    }
}

extension ProductInfoView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: MenuListCollectionViewCell.reuseId,
            for: indexPath
        ) as! MenuListCollectionViewCell
        cell.fill(with: products[indexPath.row])
        return cell
    }
}
