//
//  ProductInfoView.swift
//  62CafeApp
//
//  Created by Aiturgan Kurmanbekova on 28/4/24.
//

import UIKit

class ProductInfoView: BaseView {
    
    private let imageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let whiteView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "ertef"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.text = "550"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "rtefsdc vetdrsc dgvfcrdcs drfcrtrfd gvtre frtewds rfedwx rgvtred ftrdeftre tresdfgtr"
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let decreaseButton: UIButton = {
        let button = UIButton()
        button.setTitle("-", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 36/2
        button.backgroundColor = .systemGray6
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let countLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let increaseButton: UIButton = {
        let button = UIButton()
        button.setTitle("+", for: .normal)
        button.layer.cornerRadius = 36/2
        button.backgroundColor = .orange
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Приятное дополнение"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let menuListView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width - 40, height: 100)
        layout.minimumLineSpacing = 20
        layout.scrollDirection = .vertical
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.showsVerticalScrollIndicator = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var controller: ProductInfoViewController?
    
    override func setup() {
        super.setup()
        setupSubviews()
        setupConstraints()
        
        menuListView.register(
            MenuListCollectionViewCell.self,
            forCellWithReuseIdentifier: MenuListCollectionViewCell.reuseId
        )
        menuListView.dataSource = self
        menuListView.backgroundColor = .darkGray
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
        NSLayoutConstraint.activate(
            [
                imageView.topAnchor.constraint(equalTo: topAnchor),
                imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
                imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
                imageView.heightAnchor.constraint(equalToConstant: 200),
                
                whiteView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -20),
                whiteView.leadingAnchor.constraint(equalTo: leadingAnchor),
                whiteView.trailingAnchor.constraint(equalTo: trailingAnchor),
                whiteView.bottomAnchor.constraint(equalTo: bottomAnchor),
                
                nameLabel.topAnchor.constraint(equalTo: whiteView.topAnchor, constant: 20),
                nameLabel.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: 16),
                nameLabel.trailingAnchor.constraint(equalTo: priceLabel.leadingAnchor, constant: -16),
                nameLabel.heightAnchor.constraint(equalToConstant: 50),
                
                priceLabel.topAnchor.constraint(equalTo: whiteView.topAnchor, constant: 20),
                priceLabel.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 16),
                priceLabel.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -16),
                priceLabel.heightAnchor.constraint(equalToConstant: 50),
                
                descriptionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
                descriptionLabel.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: 16),
                descriptionLabel.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -16),
                descriptionLabel.bottomAnchor.constraint(equalTo: stackView.topAnchor, constant: -10),
                
                stackView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10),
                stackView.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -16),
                stackView.heightAnchor.constraint(equalToConstant: 36),
                stackView.widthAnchor.constraint(equalToConstant: 100),
                
                decreaseButton.heightAnchor.constraint(equalToConstant: 36),
                decreaseButton.widthAnchor.constraint(equalToConstant: 36),
                
                increaseButton.heightAnchor.constraint(equalToConstant: 36),
                increaseButton.widthAnchor.constraint(equalToConstant: 36),
                
                titleLabel.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 10),
                titleLabel.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: 16),
                titleLabel.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -16),
                titleLabel.heightAnchor.constraint(equalToConstant: 50),
                
                menuListView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
                menuListView.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: 16),
                menuListView.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -16),
                menuListView.bottomAnchor.constraint(equalTo: whiteView.bottomAnchor)
            ]
        )
    }
}

extension ProductInfoView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return controller?.products.count ?? .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: MenuListCollectionViewCell.reuseId,
            for: indexPath
        ) as! MenuListCollectionViewCell
        cell.fill2(with: controller?.products[indexPath.row])
        cell.backgroundColor = .blue
        return cell
    }
    
    
}
