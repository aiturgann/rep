//
//  CollectionViewCell.swift
//  62CafeApp
//
//  Created by Aiturgan Kurmanbekova on 24/4/24.
//

import UIKit

class SectionsCollectionViewCell: UICollectionViewCell {
    
    static let reuseId = "cell"
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
        layer.cornerRadius = 12
        setupSubviews()
        setupConstraints()
    }
    
    private func setupSubviews() {
        addSubview(titleLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate(
    [
        titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
        titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
    ]
        )
    }
    
    func fill(with item: CategoryModel) {
        titleLabel.text = item.categoryName
    }
    
    func changeColor() {
        backgroundColor = .blue
    }
}
