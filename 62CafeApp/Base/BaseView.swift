//
//  BaseView.swift
//  62CafeApp
//
//  Created by Aiturgan Kurmanbekova on 28/4/24.
//

import UIKit

class BaseView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    func setup() {
        setupSubviews()
        setupConstraints()
    }
    
    func setupSubviews() { }
    
    func setupConstraints() { }
}


extension UIView {
    @resultBuilder
    struct SubviewBuilder {
        static func buildBlock(_ components: UIView...) -> [UIView] { components }
    }
    
    func add(@SubviewBuilder _ components: () -> [UIView]) {
        components().forEach(addSubview)
    }
}
