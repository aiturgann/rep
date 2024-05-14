//
//  ProductsViewController.swift
//  62CafeApp
//
//  Created by Aiturgan Kurmanbekova on 4/5/24.
//

import UIKit
import SnapKit

class ProductsViewController: BaseViewController {
    
    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Search"
        searchBar.backgroundImage = UIImage()
        searchBar.searchTextField.addTarget(self, action: #selector(searchBarEditingChanged), for: .editingChanged)
        return searchBar
    }()
    
    private let categoriesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width - 40, height: 50)
        layout.minimumLineSpacing = 20
        layout.scrollDirection = .horizontal
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.showsHorizontalScrollIndicator = false
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let productsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width - 40, height: 120)
        layout.minimumLineSpacing = 20
        layout.scrollDirection = .vertical
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.showsVerticalScrollIndicator = false
        return view
    }()
    
    private var networkService: NetworkService?
    
    private var categories: [Categories] = []
    
    private var products: [ProductModel] = []
        
    private var product: ProductModel?
    
    private var selectedIndex = 0
    
    override func setup() {
        super.setup()
        setupSubviews()
        setupConstraints()
        
        categoriesCollectionView.delegate = self
        categoriesCollectionView.dataSource = self
        categoriesCollectionView.register(CategoriesCollectionViewCell.self, 
                                          forCellWithReuseIdentifier: CategoriesCollectionViewCell.reuseId
        )
        productsCollectionView.delegate = self
        productsCollectionView.dataSource = self
        productsCollectionView.register(ProductCollectionViewCell.self, 
                                        forCellWithReuseIdentifier: ProductCollectionViewCell.reuseId
        )
        getCategories()
        setupNavigationItem()
    }
    
    override func setupSubviews() {
        super.setupSubviews()
        view.addSubview(searchBar)
        view.addSubview(categoriesCollectionView)
        view.addSubview(titleLabel)
        view.addSubview(productsCollectionView)
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        searchBar.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(100)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        categoriesCollectionView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(50)
        }
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(categoriesCollectionView.snp.bottom).inset(-10)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(24)
        }
        productsCollectionView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).inset(-10)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    private func setupNavigationItem() {
        navigationItem.title = "Меню"
        let rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "bell"), style: .plain, target: self, action: #selector(rightBarButtonItemTapped))
        navigationItem.rightBarButtonItem = rightBarButtonItem
        navigationItem.rightBarButtonItem?.tintColor = .black
        navigationItem.setHidesBackButton(true, animated: false)
    }
    
    private func getCategories() {
        networkService?.getCategories { [weak self] result in
            DispatchQueue.main.async { [weak self] in guard let self else { return }
                switch result {
                case .success(let model):
                    self.categories = model
                    self.categoriesCollectionView.reloadData()
                    if let firstCategory = self.categories.first {
                        self.getProducts(with: firstCategory)
                        self.titleLabel.text = self.categories.first?.categoryName
                        self.productsCollectionView.reloadData()
                    }
                case .failure(let error):
                    print("\(error.localizedDescription)")
                }
            }
        }
    }
        
    private func getProducts(with item: Categories) {
        networkService?.getProducts(with: item.categoryName) { [weak self] result in
            DispatchQueue.main.async { [weak self] in guard let self = self else { return }
                switch result {
                case .success(let model):
                    self.products = model
                    self.productsCollectionView.reloadData()
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    @objc 
    private func searchBarEditingChanged() { }
    
    @objc
    private func rightBarButtonItemTapped() { }
}

extension ProductsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == categoriesCollectionView {
            return categories.count
        } else {
            return products.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == categoriesCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoriesCollectionViewCell.reuseId, for: indexPath) as! CategoriesCollectionViewCell
            cell.fill(with: categories[indexPath.row])
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCollectionViewCell.reuseId, for: indexPath) as! ProductCollectionViewCell
            cell.fill(with: products[indexPath.row])
            return cell
        }
    }
}

extension ProductsViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == categoriesCollectionView {
            selectedIndex = indexPath.row
            categoriesCollectionView.reloadData()
            let selectedCategory = categories[indexPath.row]
            titleLabel.text = categories[indexPath.row].categoryName
            getProducts(with: selectedCategory)
        } else {
            let vc = ProductDetailsViewController()
            vc.selectedProducts = product?.productName ?? ""
            vc.modalPresentationStyle = .fullScreen
            navigationController?.present(vc, animated: true)
        }
    }
}
