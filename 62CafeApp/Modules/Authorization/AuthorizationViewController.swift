//
//  AuthorizationViewController.swift
//  62CafeApp
//
//  Created by Aiturgan Kurmanbekova on 24/4/24.
//

import UIKit

class AuthorizationViewController: UIViewController {
    
    private let authorizationView: AuthorizationView = {
        let view = AuthorizationView()
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
        view.addSubview(authorizationView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate(
    [
        authorizationView.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
        authorizationView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        authorizationView.heightAnchor.constraint(equalToConstant: 200),
        authorizationView.widthAnchor.constraint(equalToConstant: view.frame.width - 32)
    ]
        )
    }

}
