//
//  BaseCollectionViewCell.swift
//  62CafeApp
//
//  Created by Aiturgan Kurmanbekova on 14/5/24.
//

import UIKit

class BaseCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        setupSubviews()
        setupConstraints()
    }
    
    func setupSubviews() { }
    
    func setupConstraints() { }
}
