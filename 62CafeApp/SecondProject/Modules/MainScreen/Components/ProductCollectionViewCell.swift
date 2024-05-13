//
//  ProductCollectionViewCell.swift
//  62CafeApp
//
//  Created by Aiturgan Kurmanbekova on 4/5/24.
//

import UIKit
import SnapKit

class ProductCollectionViewCell: UICollectionViewCell {
    
    static let reuseId = String(describing: ProductCollectionViewCell.self)
    
    private let productImageView: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = 20
        view.clipsToBounds = true
        view.backgroundColor = .magenta
        return view
    }()
    
    private let productTitle: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let productDescription: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
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
        addSubview(productImageView)
        addSubview(productTitle)
        addSubview(productDescription)
        addSubview(stackView)
        stackView.addArrangedSubview(decreaseButton)
        stackView.addArrangedSubview(countLabel)
        stackView.addArrangedSubview(increaseButton)
    }
    
    private func setupConstraints() {
        productImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().inset(5)
            make.height.width.equalTo(72)
        }
        productTitle.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(20)
            make.leading.equalTo(productImageView.snp.trailing).inset(-10)
            make.trailing.equalToSuperview().inset(10)
            make.height.equalTo(20)
        }
        productDescription.snp.makeConstraints { make in
            make.top.equalTo(productTitle.snp.bottom).inset(-5)
            make.leading.equalTo(productImageView.snp.trailing).inset(-10)
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
    
    private var imageURL: URL?
    
    func fill(with item: ProductModel) {
        productTitle.text = item.productName
        productDescription.text = item.productDescription
        
        if let imageURL = URL(string: item.productImage) {
            self.imageURL = imageURL
            getImage()
        }
    }
    
    private func getImage(){
        guard let imageURL = imageURL else {return}
        
        let task = URLSession.shared.dataTask(with: imageURL) { data, response, error in
            guard let data = data, let image = UIImage(data: data) else {
                print(error?.localizedDescription ?? "error")
                return
            }
            DispatchQueue.main.async {
                self.productImageView.image = image
            }
        }
        task.resume()
    }
}



