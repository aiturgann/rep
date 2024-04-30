//
//  MainView.swift
//  62CafeApp
//
//  Created by Aiturgan Kurmanbekova on 24/4/24.
//

import UIKit

class MainView: BaseView {
    
    private let sectionsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 100, height: 40)
        layout.minimumLineSpacing = 20
        layout.scrollDirection = .horizontal
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.showsHorizontalScrollIndicator = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Кофе"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 20)
        return label
    }()
    
    private let menuListCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width - 40, height: 100)
        layout.minimumLineSpacing = 20
        layout.scrollDirection = .vertical
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.showsVerticalScrollIndicator = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var categories: [CategoryModel] = [] {
        didSet {
            categories.forEach { category in
                productsC[category] = []
            }
        }
    }
    
    private var products: [Products.ProductsModel] = []
    
    private var productsC: [CategoryModel: [Products.ProductsModel]] = [:]
    
    private var selectedCategory: CategoryModel? {
        didSet {
            guard selectedCategory != nil else { return }
            menuListCollectionView.reloadData()
        }
    }
    
    weak var controller: MainViewController?
    
    override func setup() {
        super.setup()
        setupSubviews()
        setupConstraints()
        
        sectionsCollectionView.delegate = self
        sectionsCollectionView.dataSource = self
        sectionsCollectionView.register(SectionsCollectionViewCell.self,
                                        forCellWithReuseIdentifier: SectionsCollectionViewCell.reuseId)
        
        menuListCollectionView.delegate = self
        menuListCollectionView.dataSource = self
        menuListCollectionView.register(MenuListCollectionViewCell.self,
                                        forCellWithReuseIdentifier: MenuListCollectionViewCell.reuseId)
    }
    
    override func setupSubviews() {
        super.setupSubviews()
        addSubview(sectionsCollectionView)
        addSubview(titleLabel)
        addSubview(menuListCollectionView)
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        NSLayoutConstraint.activate(
            [
                sectionsCollectionView.topAnchor.constraint(equalTo: topAnchor),
                sectionsCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
                sectionsCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
                sectionsCollectionView.heightAnchor.constraint(equalToConstant: 50),
                
                titleLabel.topAnchor.constraint(equalTo: sectionsCollectionView.bottomAnchor, constant: 10),
                titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
                titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
                titleLabel.heightAnchor.constraint(equalToConstant: 24),
                
                menuListCollectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
                menuListCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
                menuListCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
                menuListCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
            ]
        )
    }
    
    func fill(with categories: [CategoryModel]) {
        self.categories = categories
        sectionsCollectionView.reloadData()
    }
    
    func fill(with products: [Products.ProductsModel]) {
        self.productsC[selectedCategory ?? .init(categoryName: "Кофе")] = products
        menuListCollectionView.reloadData()
    }
    
}

extension MainView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == sectionsCollectionView {
            return categories.count
        } else {
            return productsC[selectedCategory ?? .init(categoryName: "Кофе")]?.count ?? .zero
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == sectionsCollectionView {
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: SectionsCollectionViewCell.reuseId,
                for: indexPath
            ) as! SectionsCollectionViewCell
            cell.fill(with: categories[indexPath.row])
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: MenuListCollectionViewCell.reuseId,
                for: indexPath
            ) as! MenuListCollectionViewCell
            if let product = productsC[selectedCategory ?? .init(categoryName: "Кофе")]?[indexPath.row] {
                cell.fill(with: product)
            }
            return cell
        }
    }
}

extension MainView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView == sectionsCollectionView {
            let title = categories[indexPath.row]
            titleLabel.text = title.categoryName
            selectedCategory = categories[indexPath.row]
        } else {
            controller?.navigation()
            if controller == nil {
                print("nil")
            }
        }
    }
}
