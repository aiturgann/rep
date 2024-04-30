//
//  AuthorizationViewController.swift
//  62CafeApp
//
//  Created by Aiturgan Kurmanbekova on 24/4/24.
//

import UIKit


class AuthorizationViewController: BaseViewController {
    
    private let authorizationView: AuthorizationView = {
        let view = AuthorizationView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func setup() {
        super.setup()
        setupSubviews()
        setupConstraints()
        signInButtonTapped()
    }
    
    override func setupSubviews() {
        super.setupSubviews()
        view.addSubview(authorizationView)
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        NSLayoutConstraint.activate(
            [
                authorizationView.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
                authorizationView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                authorizationView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                authorizationView.widthAnchor.constraint(equalToConstant: view.frame.width - 32)
            ]
        )
    }
    
    func signInButtonTapped() {
        authorizationView.signInTapped = { [weak self] in
            guard let self else { return }
            validateTextField()
        }
    }
    
    func validateTextField() {
        guard
            case let name = authorizationView.nameText, !name.isEmpty,
            case let phoneNumber = authorizationView.phoneNumberText, !phoneNumber.isEmpty
        else {
            return
        }
        UserSessionManager.shared.saveSession(
            with: name,
            phoneNumber: phoneNumber
        ) { [weak self] in
            guard let self else { return }
            let vc = MainViewController()
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
