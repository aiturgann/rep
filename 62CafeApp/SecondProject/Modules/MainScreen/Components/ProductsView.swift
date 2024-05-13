//
//  ProductsView.swift
//  62CafeApp
//
//  Created by Aiturgan Kurmanbekova on 4/5/24.
//

import UIKit
import SnapKit

//protocol ProductsViewDelegate: AnyObject {
//    func didSelectTap()
//}
//
//class ProductsView: BaseView {
//    
//    private let categoriesCollectionView: UICollectionView = {
//        let layout = UICollectionViewFlowLayout()
//        layout.itemSize = CGSize(width: UIScreen.main.bounds.width - 40, height: 50)
//        layout.minimumLineSpacing = 20
//        layout.scrollDirection = .horizontal
//        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        view.showsHorizontalScrollIndicator = false
//        return view
//    }()
//    
//    private let titleLabel: UILabel = {
//        let label = UILabel()
//        return label
//    }()
//    
//    private let productsCollectionView: UICollectionView = {
//        let layout = UICollectionViewFlowLayout()
//        layout.itemSize = CGSize(width: UIScreen.main.bounds.width - 40, height: 120)
//        layout.minimumLineSpacing = 20
//        layout.scrollDirection = .vertical
//        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        view.showsVerticalScrollIndicator = false
//        return view
//    }()
//    
//    var categoryCollectionView: UICollectionView {
//        return categoriesCollectionView
//    }
//    
//    var title: UILabel {
//        return titleLabel
//    }
//    
//    var productCollectionView: UICollectionView {
//        return productsCollectionView
//    }
//    
//    weak var delegate: ProductsViewController?
//    
//    override func setup() {
//        super.setup()
//        setupSubviews()
//        setupConstraints()
//        
//        productsCollectionView.register(
//            ProductCollectionViewCell.self,
//            forCellWithReuseIdentifier: ProductCollectionViewCell.reuseId
//        )
//        productsCollectionView.dataSource = self
//        productsCollectionView.delegate = self
//    }
//    
//    override func setupSubviews() {
//        super.setupSubviews()
//        addSubview(categoriesCollectionView)
//        addSubview(titleLabel)
//        addSubview(productsCollectionView)
//    }
//    
//    override func setupConstraints() {
//        super.setupConstraints()
//        categoryCollectionView.snp.makeConstraints { make in
//            make.top.equalToSuperview().inset(10)
//            make.leading.trailing.equalToSuperview()
//            make.height.equalTo(50)
//        }
//        titleLabel.snp.makeConstraints { make in
//            make.top.equalTo(categoryCollectionView.snp.bottom).inset(-10)
//            make.leading.trailing.equalToSuperview()
//            make.height.equalTo(24)
//        }
//        productCollectionView.snp.makeConstraints { make in
//            make.top.equalTo(titleLabel.snp.bottom).inset(-10)
//            make.leading.trailing.equalToSuperview()
//            make.bottom.equalToSuperview()
//        }
//    }
//}
//
//extension ProductsView: UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        if collectionView == categoriesCollectionView {
//            return delegate?.categories.count ?? .zero
//        } else {
//            return delegate?.products.count ?? .zero
//        }
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        if collectionView == categoriesCollectionView {
//            let cell = collectionView.dequeueReusableCell(
//                withReuseIdentifier: CategoriesCollectionViewCell.reuseId,
//                for: indexPath
//            ) as! CategoriesCollectionViewCell
//            return cell
//        } else {
//            let cell = collectionView.dequeueReusableCell(
//                withReuseIdentifier: ProductCollectionViewCell.reuseId,
//                for: indexPath
//            ) as! ProductCollectionViewCell
//            return cell
//        }
//    }
//}
