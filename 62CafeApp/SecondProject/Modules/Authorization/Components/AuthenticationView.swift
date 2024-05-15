//
//  AuthorizationView.swift
//  62CafeApp
//
//  Created by Aiturgan Kurmanbekova on 7/5/24.
//

import UIKit
import SnapKit

protocol AuthenticationViewDelegate: AnyObject {
    func signIn(with phoneNumber: String)
    func emailTapped()
}

class AuthenticationView: BaseView {

    private let firstTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "кофейня"
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 30)
        return label
    }()
    
    private let secondTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Geeks"
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 30)
        label.textColor = .yellow
        return label
    }()
    
    private let thirdTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Вход"
        label.font = .systemFont(ofSize: 30)
        return label
    }()
    
    private let phoneNumberTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "+996 706 688 618"
        textField.keyboardType = .phonePad
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: 8))
        textField.leftView = leftView
        textField.leftViewMode = .always
        textField.backgroundColor = .systemGray6
        textField.layer.cornerRadius = 18
        return textField
    }()
    
    private let signInButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Проверить", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .orange
        button.layer.cornerRadius = 18
        return button
    }()
    
    private let signInWithEmailButton: UIButton = {
        let button = UIButton()
        button.setTitle("Войти через почту", for: .normal)
        button.setTitleColor(.orange, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15)
        return button
    }()
    
    var phoneNumberText: String {
        return phoneNumberTextField.text ?? ""
    }
    
    weak var delegate: AuthenticationViewDelegate?
    
    override func setup() {
        super.setup()
        setupSubviews()
        setupConstraints()
        
        signInButton.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)
        signInWithEmailButton.addTarget(self, action: #selector(signInWithEmailButtonTapped), for: .touchUpInside)
    }
    
    override func setupSubviews() {
        super.setupSubviews()
        addSubview(firstTitleLabel)
        addSubview(secondTitleLabel)
        addSubview(thirdTitleLabel)
        addSubview(phoneNumberTextField)
        addSubview(signInButton)
        addSubview(signInWithEmailButton)
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        firstTitleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
        }
        secondTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(firstTitleLabel.snp.bottom).inset(-5)
            make.leading.trailing.equalToSuperview()
        }
        thirdTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(secondTitleLabel.snp.bottom).inset(-60)
            make.leading.trailing.equalToSuperview()
        }
        phoneNumberTextField.snp.makeConstraints { make in
            make.top.equalTo(thirdTitleLabel.snp.bottom).inset(-10)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(50)
        }
        signInButton.snp.makeConstraints { make in
            make.top.equalTo(phoneNumberTextField.snp.bottom).inset(-16)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(50)
        }
        signInWithEmailButton.snp.makeConstraints { make in
            make.top.equalTo(signInButton.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(30)
        }
    }
    
    @objc
    private func signInButtonTapped() {
        delegate?.signIn(with: phoneNumberTextField.text ?? "")
    }
    
    @objc
    private func signInWithEmailButtonTapped() {
        delegate?.emailTapped()
    }
}
