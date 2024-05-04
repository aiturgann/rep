//
//  StartView.swift
//  62CafeApp
//
//  Created by Aiturgan Kurmanbekova on 24/4/24.
//

import UIKit
import SnapKit

protocol StartViewDelegate: AnyObject {
    func signInButtonTapped()
}

class StartView: BaseView {
    
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
    
    private let signInButton: UIButton = {
        let button = UIButton()
        button.setTitle("Войти", for: .normal)
        button.backgroundColor = .orange
        button.layer.cornerRadius = 18
        return button
    }()
    
    weak var delegate: StartViewDelegate?
    
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
        addSubview(signInButton)
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
        signInButton.snp.makeConstraints { make in
            make.top.equalTo(secondTitleLabel.snp.bottom).inset(-70)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(50)
        }
    }
    
    @objc
    private func signInButtonTapped() {
        delegate?.signInButtonTapped()
    }
}
