//
//  NotificationViewController.swift
//  62CafeApp
//
//  Created by Aiturgan Kurmanbekova on 14/5/24.
//

import UIKit
import SnapKit

class NotificationViewController: BaseViewController {
    
    private lazy var collectionViewCell: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width - 40, height: 100)
        layout.minimumLineSpacing = 20
        layout.scrollDirection = .vertical
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.showsVerticalScrollIndicator = false
        view.refreshControl = refreshControl
        return view
    }()
    
    private lazy var refreshControl: UIRefreshControl = {
        let control = UIRefreshControl()
        control.addTarget(self, action: #selector(refreshProducts), for: .valueChanged)
        control.attributedTitle = NSAttributedString(string: "Данные прогружаются!")
        return control
    }()
    
    private let activity: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView()
        view.hidesWhenStopped = true
        view.style = .large
        return view
    }()
    
    private var isLoading: Bool = false {
        didSet {
            _ = isLoading ? activity.startAnimating() : activity.stopAnimating()
        }
    }
    
    private var products: [Product] = []
    
    private let networkService = NetworkService()
    
    private var skip = 0
    
    override func setup() {
        super.setup()
        collectionViewCell.delegate = self
        collectionViewCell.dataSource = self
        collectionViewCell.register(CollectionViewCell.self,
                                    forCellWithReuseIdentifier: CollectionViewCell.reuseId
        )
        
        setupSubviews()
        setupConstraints()
        fetchProducts()
    }
    
    override func setupSubviews() {
        super.setupSubviews()
        view.addSubview(collectionViewCell)
        view.addSubview(activity)
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        collectionViewCell.snp.makeConstraints { make in
            make.directionalEdges.equalToSuperview()
        }
        activity.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.size.equalTo(48)
        }
    }
    
    private func fetchProducts() {
        isLoading = true
        networkService.fetchProduct(limit: 10, skip: skip * 10) { [weak self] result in
            guard let self else { return }
            DispatchQueue.main.async {
                self.isLoading = false
                if case .success(let products) = result {
                    self.products.append(contentsOf: products)
                    self.collectionViewCell.reloadData()
                }
            }
        }
    }
    
    @objc
    private func refreshProducts() {
        skip = 0
        refreshControl.beginRefreshing()
        networkService.fetchProduct(limit: 10, skip: skip * 10) { [weak self] result in
            guard let self else { return }
            DispatchQueue.main.async {
                if case .success(let products) = result {
                    self.products.append(contentsOf: products)
                    self.collectionViewCell.reloadData()
                    self.refreshControl.endRefreshing()
                }
            }
        }
    }
}

extension NotificationViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.reuseId,
                                                      for: indexPath
        ) as! CollectionViewCell
        cell.fill(with: products[indexPath.row])
        return cell
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        willDisplay cell: UICollectionViewCell,
        forItemAt indexPath: IndexPath
    ) {
        if indexPath.row == products.count - 1, !isLoading {
            skip += 1
            fetchProducts()
        }
    }
}
