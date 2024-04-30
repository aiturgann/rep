//
//  MainViewController.swift
//  62CafeApp
//
//  Created by Aiturgan Kurmanbekova on 24/4/24.
//

import UIKit

class MainViewController: BaseViewController {
    
    private let mainView: MainView = {
        let view = MainView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
        
    private let parser = JSONParser()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationItem()
        getCategories()
        getProducts()
    }
    
    private func setupNavigationItem() {
        navigationItem.title = "Меню"
        let rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "bell"), style: .plain, target: self, action: #selector(rightBarButtonItemTapped))
        navigationItem.rightBarButtonItem = rightBarButtonItem
        navigationItem.rightBarButtonItem?.tintColor = .black
        navigationItem.setHidesBackButton(true, animated: false)
    }
    
    override func setup() {
        super.setup()
        setupSubviews()
        setupConstraints()
    }
    
    override func setupSubviews() {
        super.setupSubviews()
        view.addSubview(mainView)
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        NSLayoutConstraint.activate(
    [
        mainView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
        mainView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
        mainView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
        mainView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
    ]
        )
    }
    
    private func getCategories() {
        parser.getCategories { [weak self] categories in
            guard let self else { return }
            mainView.fill(with: categories)
        }
    }
    
    private func getProducts() {
        parser.getProducts { [weak self] products in
            guard let self else { return }
            mainView.fill(with: products)
        }
    }
    
    func navigation() {
        let vc = ProductInfoViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc
    private func rightBarButtonItemTapped() { }

}
