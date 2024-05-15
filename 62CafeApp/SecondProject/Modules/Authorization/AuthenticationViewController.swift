//
//  AuthorizationViewController.swift
//  62CafeApp
//
//  Created by Aiturgan Kurmanbekova on 7/5/24.
//

import UIKit
import SnapKit

class AuthenticationViewController: BaseViewController {

    private let authenticationView: AuthenticationView = {
        let view = AuthenticationView()
        return view
    }()
    
    private var autheticationService = AuthenticationService()
    
    override func setup() {
        super.setup()
        setupSubviews()
        setupConstraints()
        authenticationView.delegate = self
    }
    
    override func setupSubviews() {
        super.setupSubviews()
        view.addSubview(authenticationView)
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        authenticationView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(150)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview()
            make.width.equalToSuperview().inset(16)
        }
    }
}

extension AuthenticationViewController: AuthenticationViewDelegate {
    func signIn(with phoneNumber: String) {
        autheticationService.signIn(with: phoneNumber) { result in
            switch result {
            case .success:
                let vc = VerificationViewController()
                self.navigationController?.pushViewController(vc, animated: true)
            case .failure:
                print("incorrect phone number")
            }
        }
    }
    
    func emailTapped() {
        let vc = VerificationEmailViewController()
        vc.modalPresentationStyle = .fullScreen
        navigationController?.present(vc, animated: true)
    }
}
