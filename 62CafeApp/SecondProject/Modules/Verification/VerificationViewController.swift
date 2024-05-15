//
//  VerificationViewController.swift
//  62CafeApp
//
//  Created by Aiturgan Kurmanbekova on 7/5/24.
//

import UIKit
import SnapKit

class VerificationViewController: BaseViewController {
    
    private let verificationView: VerificationView = {
        let view = VerificationView()
        return view
    }()
    
    private var autheticationService = AuthenticationService()
    
    var phoneNumber: String?

    override func setup() {
        super.setup()
        setupSubviews()
        setupConstraints()
        verificationView.delegate = self
    }
    
    override func setupSubviews() {
        super.setupSubviews()
        view.addSubview(verificationView)
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        verificationView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(200)
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalToSuperview()
        }
    }
}

extension VerificationViewController: VerificationViewDelegate {
    func verifyCode(with code: String) {
        autheticationService.verifyPhone(with: code, completion: { result in
            switch result {
            case .success:
                let vc = ProductsViewController()
                vc.modalPresentationStyle = .fullScreen
                self.navigationController?.present(vc, animated: true)
            case .failure:
                ()
            }
        })
    }
}
