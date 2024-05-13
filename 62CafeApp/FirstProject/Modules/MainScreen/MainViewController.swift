//
//  MainViewController.swift
//  62CafeApp
//
//  Created by Aiturgan Kurmanbekova on 24/4/24.
//

import UIKit
import SnapKit

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
        
        mainView.delegate = self
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
        
        mainView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(10)
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalToSuperview()
        }
    }
    
    private func getCategories() {
        parser.getItems(from: jsonData) { [weak self] (result: Result<Category, JSONParser.CustomError>) in
            guard let self else { return }
            switch result {
            case .success(let model):
                mainView.fill(with: model.categories)
            case.failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    private func getProducts() {
        guard let path = Bundle.main.path(forResource: "Products", ofType: "json"),
              case let url = URL(fileURLWithPath: path),
              let data = try? Data(contentsOf: url) else {
            return
        }
        
        JSONParser().getItems(from: data) { (result: Result<Products, JSONParser.CustomError>) in
            switch result {
            case .success(let productCategory):
                mainView.fill(
                    with: productCategory.products)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    @objc
    private func rightBarButtonItemTapped() { }
}

extension MainViewController: MainViewDelegate {
    func didCellTapped(with item: Products.ProductsModel) {
        let vc = ProductInfoViewController()
        vc.selectedImage = item.image
        vc.selectedName = item.name
        vc.selectedDescription = item.type
        vc.selectedPrice = "\(item.price)"
        navigationController?.pushViewController(vc, animated: true)
    }
}
