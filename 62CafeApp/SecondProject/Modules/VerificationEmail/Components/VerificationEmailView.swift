//
//  VerificationEmailView.swift
//  62CafeApp
//
//  Created by Aiturgan Kurmanbekova on 10/5/24.
//

import UIKit
import SnapKit

protocol VerificationEmailViewDelegate: AnyObject {
    func verifyEmail(with password: String, email: String)
}

class VerificationEmailView: BaseView {
    
    private let userHintLabel: UILabel = {
        let label = UILabel()
        label.text = "Введите ваш почтовый адрес"
        label.textAlignment = .center
        return label
    }()
    
    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.layer.cornerRadius = 12
        textField.backgroundColor = .systemGray6
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: 8))
        textField.leftView = leftView
        textField.leftViewMode = .always
        return textField
    }()
    
    private let enterLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Введите код"
        return label
    }()
    
    private let codeTextField: UITextField = {
        let textField = UITextField()
        textField.layer.cornerRadius = 12
        textField.backgroundColor = .systemGray6
        textField.textAlignment = .center
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: 8))
        textField.leftView = leftView
        textField.leftViewMode = .always
        return textField
    }()
    
    private let verifyButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .orange
        button.layer.cornerRadius = 12
        button.setTitle("Проверить", for: .normal)
        return button
    }()
    
    weak var delegate: VerificationEmailViewDelegate?

    override func setup() {
        super.setup()
        setupSubviews()
        setupConstraints()
        
        verifyButton.addTarget(self, action: #selector(verify), for: .touchUpInside)
    }
    
    override func setupSubviews() {
        super.setupSubviews()
        addSubview(userHintLabel)
        addSubview(emailTextField)
        addSubview(enterLabel)
        addSubview(codeTextField)
        addSubview(verifyButton)
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        userHintLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(100)
            make.leading.trailing.equalToSuperview()
        }
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(userHintLabel.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(50)
        }
        enterLabel.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview()
        }
        codeTextField.snp.makeConstraints { make in
            make.top.equalTo(enterLabel.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(50)
        }
        verifyButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(10)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(50)
        }
    }
    
    @objc
    private func verify() {
        delegate?.verifyEmail(with: codeTextField.text ?? "", email: emailTextField.text ?? "")
    }
}
