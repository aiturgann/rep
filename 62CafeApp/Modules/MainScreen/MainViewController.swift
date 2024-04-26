//
//  MainViewController.swift
//  62CafeApp
//
//  Created by Aiturgan Kurmanbekova on 24/4/24.
//

import UIKit

class MainViewController: UIViewController {
    
    private let mainView: MainView = {
        let view = MainView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var counter = CounterModel(number: 0)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setup()
        setupNavigationItem()
    }
    
    private func setupNavigationItem() {
        navigationItem.title = "Меню"
        let rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "bell"), style: .plain, target: self, action: #selector(rightBarButtonItemTapped))
        navigationItem.rightBarButtonItem = rightBarButtonItem
        navigationItem.rightBarButtonItem?.tintColor = .black
        navigationItem.setHidesBackButton(true, animated: false)
    }
    
    private func setup() {
        setupSubviews()
        setupConstraints()
    }
    
    private func setupSubviews() {
        view.addSubview(mainView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate(
    [
        mainView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
        mainView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
        mainView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
        mainView.heightAnchor.constraint(equalToConstant: 50)
    ]
        )
    }
    
    @objc
    private func rightBarButtonItemTapped() {
        
    }

}
