//
//  VerificationView.swift
//  62CafeApp
//
//  Created by Aiturgan Kurmanbekova on 7/5/24.
//

import UIKit
import SnapKit

protocol VerificationViewDelegate: AnyObject {
    func verifyCode(with code: String)
}

class VerificationView: BaseView {

    private let userHintLabel: UILabel = {
        let label = UILabel()
        label.text = "Введите код отправленный на ваш номер телефона"
        label.numberOfLines = 0
        label.textAlignment = .center
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
    
    weak var delegate: VerificationViewDelegate?

    override func setup() {
        super.setup()
        setupSubviews()
        setupConstraints()
        
        verifyButton.addTarget(self, action: #selector(verifyButtonTapped), for: .touchUpInside)
    }
    
    override func setupSubviews() {
        super.setupSubviews()
        addSubview(userHintLabel)
        addSubview(codeTextField)
        addSubview(verifyButton)
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        userHintLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(100)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(50)
        }
        codeTextField.snp.makeConstraints { make in
            make.top.equalTo(userHintLabel.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(50)
        }
        verifyButton.snp.makeConstraints { make in
            make.top.equalTo(codeTextField.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(50)
        }
    }
    
    @objc
    private func verifyButtonTapped() {
        delegate?.verifyCode(with: codeTextField.text ?? "")
    }
}
