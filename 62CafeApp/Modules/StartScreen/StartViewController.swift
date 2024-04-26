//
//  StartViewController.swift
//  62CafeApp
//
//  Created by Aiturgan Kurmanbekova on 24/4/24.
//

import UIKit

class StartViewController: UIViewController {
    
    private let startView: StartView = {
        let view = StartView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setup()
    }
    
    private func setup() {
        setupSubviews()
        setupConstraints()
    }
    
    private func setupSubviews() {
        view.addSubview(startView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate(
            [
                startView.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
                startView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                startView.heightAnchor.constraint(equalToConstant: 200),
                startView.widthAnchor.constraint(equalToConstant: view.frame.width - 32)
            ]
        )
    }

}
