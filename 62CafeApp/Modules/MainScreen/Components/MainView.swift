//
//  MainView.swift
//  62CafeApp
//
//  Created by Aiturgan Kurmanbekova on 24/4/24.
//

import UIKit

protocol MainViewDelegate: AnyObject {
     func increaseTap()
     func decreaseTap()
}

class MainView: UIView {
    
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
        label.text = "00"
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
        view.showsHorizontalScrollIndicator = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let title: [SectionsModel] = [SectionsModel(title: "Кофе"),
                                  SectionsModel(title: "Десерты"),
                                  SectionsModel(title: "Выпечка"),
                                  SectionsModel(title: "Напитки"),
                                  SectionsModel(title: "Торты")]
    
    let menulist: [MenuListModel] = [MenuListModel(image: "cap",
                                                   title: "Капучино",
                                                   description: "Кофейный напиток",
                                                   price: "140c"),
                                     MenuListModel(image: "latt",
                                                   title: "Латте",
                                                   description: "Кофейный напиток",
                                                   price: "140c"),
                                     MenuListModel(image: "amer",
                                                   title: "Американо",
                                                   description: "Кофейный напиток",
                                                   price: "100c"),
                                     MenuListModel(image: "raff",
                                                   title: "Раф",
                                                   description: "Кофейный напиток",
                                                   price: "170c"),
                                     MenuListModel(image: "ess",
                                                   title: "Эспрессо",
                                                   description: "Кофейный напиток",
                                                   price: "100c"),
                                     MenuListModel(image: "mocc",
                                                   title: "Мокко",
                                                   description: "Кофейный напиток",
                                                   price: "120c")]

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        setupSubviews()
        setupConstraints()
        
        sectionsCollectionView.dataSource = self
        sectionsCollectionView.register(SectionsCollectionViewCell.self,
                                        forCellWithReuseIdentifier: SectionsCollectionViewCell.reuseId)
        
        menuListCollectionView.dataSource = self
        menuListCollectionView.register(MenuListCollectionViewCell.self,
                                        forCellWithReuseIdentifier: MenuListCollectionViewCell.reuseId)
    }
    
    private func setupSubviews() {
        addSubview(sectionsCollectionView)
        addSubview(titleLabel)
        addSubview(menuListCollectionView)
    }
    
    private func setupConstraints() {
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
        menuListCollectionView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height)
    ]
        )
    }
    
}

extension MainView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == sectionsCollectionView {
            return title.count
        } else {
            return menulist.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == sectionsCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SectionsCollectionViewCell.reuseId, for: indexPath) as! SectionsCollectionViewCell
            cell.setData(model: title[indexPath.row])
            cell.backgroundColor = .magenta
            cell.layer.cornerRadius = 12
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MenuListCollectionViewCell.reuseId, for: indexPath) as! MenuListCollectionViewCell
            cell.setData(menuList: menulist[indexPath.row])
            return cell
        }
    }
}

extension MainView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        ()
    }
}
