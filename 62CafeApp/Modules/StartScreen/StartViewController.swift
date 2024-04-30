//
//  StartViewController.swift
//  62CafeApp
//
//  Created by Aiturgan Kurmanbekova on 24/4/24.
//

import UIKit

class StartViewController: BaseViewController {
    
    private let startView: StartView = {
        let view = StartView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func setup() {
        super.setup()
        startView.delegate = self
        setupSubviews()
        setupConstraints()
    }
    
    override func setupSubviews() {
        super.setupSubviews()
        view.addSubview(startView)
    }
    
    override func setupConstraints() {
        super.setupConstraints()
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

extension StartViewController: StartViewDelegate {
    func signInButtonTapped() {
        let viewController = AuthorizationViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
}
