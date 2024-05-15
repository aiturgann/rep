//
//  BaseViewController.swift
//  62CafeApp
//
//  Created by Aiturgan Kurmanbekova on 28/4/24.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setup()
    }
    
    func setup() {
        setupSubviews()
        setupConstraints()
    }
    
    func setupSubviews() { }
    
    func setupConstraints() { }
}
