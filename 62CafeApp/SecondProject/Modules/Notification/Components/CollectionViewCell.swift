//
//  CollectionViewCell.swift
//  62CafeApp
//
//  Created by Aiturgan Kurmanbekova on 14/5/24.
//

import UIKit
import SnapKit

class CollectionViewCell: BaseCollectionViewCell {
    
    static let reuseId = String(describing: CollectionViewCell.self)
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    override func setup() {
        super.setup()
        backgroundColor = .darkGray
        layer.cornerRadius = 12
        
        setupSubviews()
        setupConstraints()
    }
    
    override func setupSubviews() {
        super.setupSubviews()
        addSubview(titleLabel)
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        titleLabel.snp.makeConstraints { make in
            make.directionalEdges.equalToSuperview()
        }
    }
    
    func fill(with item: Product) {
        titleLabel.text = item.title
    }
}
