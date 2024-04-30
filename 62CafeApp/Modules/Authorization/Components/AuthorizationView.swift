//
//  AuthorizationView.swift
//  62CafeApp
//
//  Created by Aiturgan Kurmanbekova on 24/4/24.
//

import UIKit

class AuthorizationView: BaseView {
    
    private let firstTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "кофейня"
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let secondTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Geeks"
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 30)
        label.textColor = .yellow
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let thirdTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Вход"
        label.font = .systemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter your name"
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: 8))
        textField.leftView = leftView
        textField.leftViewMode = .always
        textField.backgroundColor = .systemGray6
        textField.layer.cornerRadius = 18
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let phoneNumberTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "555 555 555"
        textField.keyboardType = .phonePad
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: 8))
        textField.leftView = leftView
        textField.leftViewMode = .always
        textField.backgroundColor = .systemGray6
        textField.layer.cornerRadius = 18
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let signInButton: UIButton = {
        let button = UIButton()
        button.setTitle("Войти", for: .normal)
        button.backgroundColor = .orange
        button.layer.cornerRadius = 18
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var nameText: String {
        return nameTextField.text ?? ""
    }
    
    var phoneNumberText: String {
        return phoneNumberTextField.text ?? ""
    }
    
    var signInTapped: (() -> Void)?
        
    override func setup() {
        super.setup()
        setupSubviews()
        setupConstraints()
        
        signInButton.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)
    }
    
    override func setupSubviews() {
        super.setupSubviews()
        addSubview(firstTitleLabel)
        addSubview(secondTitleLabel)
        addSubview(thirdTitleLabel)
        addSubview(nameTextField)
        addSubview(phoneNumberTextField)
        addSubview(signInButton)
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        NSLayoutConstraint.activate(
            [
                firstTitleLabel.topAnchor.constraint(equalTo: topAnchor),
                firstTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
                firstTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
                
                secondTitleLabel.topAnchor.constraint(equalTo: firstTitleLabel.bottomAnchor, constant: 5),
                secondTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
                secondTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
                
                thirdTitleLabel.topAnchor.constraint(equalTo: secondTitleLabel.bottomAnchor, constant: 60),
                thirdTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
                thirdTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
                
                nameTextField.topAnchor.constraint(equalTo: thirdTitleLabel.bottomAnchor, constant: 10),
                nameTextField.leadingAnchor.constraint(equalTo: leadingAnchor),
                nameTextField.trailingAnchor.constraint(equalTo: trailingAnchor),
                nameTextField.heightAnchor.constraint(equalToConstant: 50),
                
                phoneNumberTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 10),
                phoneNumberTextField.leadingAnchor.constraint(equalTo: leadingAnchor),
                phoneNumberTextField.trailingAnchor.constraint(equalTo: trailingAnchor),
                phoneNumberTextField.heightAnchor.constraint(equalToConstant: 50),
                
                signInButton.topAnchor.constraint(equalTo: phoneNumberTextField.bottomAnchor, constant: 16),
                signInButton.leadingAnchor.constraint(equalTo: leadingAnchor),
                signInButton.trailingAnchor.constraint(equalTo: trailingAnchor),
                signInButton.heightAnchor.constraint(equalToConstant: 50)
            ]
        )
    }
    
    @objc
    private func signInButtonTapped() {
        signInTapped?()
    }
}
