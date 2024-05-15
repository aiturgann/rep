//
//  VerificationEmailViewController.swift
//  62CafeApp
//
//  Created by Aiturgan Kurmanbekova on 10/5/24.
//

import UIKit
import SnapKit

class VerificationEmailViewController: BaseViewController {
    
    private let verificationEmailView: VerificationEmailView = {
        let view = VerificationEmailView()
        return view
    }()
    
    private let errorLabel: UILabel = {
        let label = UILabel()
        label.text = "Вы неправильно ввели данные"
        label.textColor = .white
        return label
    }()
    
    private var autheticationService = AuthenticationService()

    override func setup() {
        super.setup()
        setupSubviews()
        setupConstraints()
        
        verificationEmailView.delegate = self
    }
    
    override func setupSubviews() {
        super.setupSubviews()
        view.addSubview(verificationEmailView)
        view.addSubview(errorLabel)
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        verificationEmailView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(100)
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().inset(300)
        }
        errorLabel.snp.makeConstraints { make in
            make.top.equalTo(verificationEmailView.snp.top).offset(20)
            make.leading.trailing.equalToSuperview().inset(16)
        }
    }
}

extension VerificationEmailViewController: VerificationEmailViewDelegate {
    func verifyEmail(with password: String, email: String) {
        autheticationService.signIn(with: email, password: password, completion: { result in
            switch result {
            case .success:
                let vc = ProductsViewController()
                vc.modalPresentationStyle = .fullScreen
                self.navigationController?.present(vc, animated: true)
            case .failure:
                self.errorLabel.textColor = .red
            }
        })
    }
}
