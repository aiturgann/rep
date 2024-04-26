//
//  StartView.swift
//  62CafeApp
//
//  Created by Aiturgan Kurmanbekova on 24/4/24.
//

import UIKit

class StartView: UIView {
    
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
    
    private let signInButton: UIButton = {
        let button = UIButton()
        button.setTitle("Войти", for: .normal)
        button.backgroundColor = .orange
        button.layer.cornerRadius = 18
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        setupSubviews()
        setupConstraints()
    }
    
    private func setupSubviews() {
        addSubview(firstTitleLabel)
        addSubview(secondTitleLabel)
        addSubview(signInButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate(
            [
                firstTitleLabel.topAnchor.constraint(equalTo: topAnchor),
                firstTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
                firstTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
                
                secondTitleLabel.topAnchor.constraint(equalTo: firstTitleLabel.bottomAnchor, constant: 5),
                secondTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
                secondTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
                
                signInButton.topAnchor.constraint(equalTo: secondTitleLabel.bottomAnchor, constant: 70),
                signInButton.leadingAnchor.constraint(equalTo: leadingAnchor),
                signInButton.trailingAnchor.constraint(equalTo: trailingAnchor),
                signInButton.heightAnchor.constraint(equalToConstant: 50)
            ]
        )
    }
    
}
