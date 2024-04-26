//
//  MenuListCollectionViewCell.swift
//  62CafeApp
//
//  Created by Aiturgan Kurmanbekova on 25/4/24.
//

import UIKit

class MenuListCollectionViewCell: UICollectionViewCell {
    
    static let reuseId = "cell"
    
    private let imageView: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = 20
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textColor = .orange
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
        button.layer.cornerRadius = 24/2
        button.backgroundColor = .systemGray6
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let countLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let increaseButton: UIButton = {
        let button = UIButton()
        button.setTitle("+", for: .normal)
        button.layer.cornerRadius = 24/2
        button.backgroundColor = .orange
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    weak var delegate: MainViewDelegate?
    
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
        NSLayoutConstraint.activate(
    [
        imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
        imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
        imageView.heightAnchor.constraint(equalToConstant: 72),
        imageView.widthAnchor.constraint(equalToConstant: 72),
        
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
        titleLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 10),
        titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
        titleLabel.heightAnchor.constraint(equalToConstant: 20),
        
        descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
        descriptionLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 10),
        descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
        descriptionLabel.heightAnchor.constraint(equalToConstant: 16),
        
        priceLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
        priceLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 10),
        priceLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
        priceLabel.heightAnchor.constraint(equalToConstant: 16),
        
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
        stackView.heightAnchor.constraint(equalToConstant: 24),
        stackView.widthAnchor.constraint(equalToConstant: 80),
        
        decreaseButton.heightAnchor.constraint(equalToConstant: 24),
        decreaseButton.widthAnchor.constraint(equalToConstant: 24),
        
        increaseButton.heightAnchor.constraint(equalToConstant: 24),
        increaseButton.widthAnchor.constraint(equalToConstant: 24)
    ]
        )
    }
    
    func setData(menuList: MenuListModel) {
        imageView.image = UIImage(named: menuList.image)
        titleLabel.text = menuList.title
        descriptionLabel.text = menuList.description
        priceLabel.text = menuList.price
    }
    
    @objc
    private func increaseButtonTapped() {
        delegate?.increaseTap()
    }
    
    @objc
    private func decreaseButtonTapped() {
        delegate?.decreaseTap()
    }
    
    func fill(with item: CounterModel) {
        countLabel.text = String(item.number)
    }

}
