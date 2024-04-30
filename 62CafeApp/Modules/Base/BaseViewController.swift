//
//  BaseViewController.swift
//  62CafeApp
//
//  Created by Aiturgan Kurmanbekova on 28/4/24.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setup()
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = setupTabBarController()
        window.makeKeyAndVisible()
        
    }
    
    func setup() {
        setupSubviews()
        setupConstraints()
    }
    
    func setupSubviews() { }
    
    func setupConstraints() { }
    
    func setupTabBarController() -> UITabBarController {
        // Создаем экземпляр UITabBarController
        let tabBarController = UITabBarController()
        
        // Создаем экземпляры UIViewController для ваших табов
        let firstViewController = UIViewController()
        firstViewController.view.backgroundColor = .red
        firstViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)
        
        let secondViewController = UIViewController()
        secondViewController.view.backgroundColor = .blue
        secondViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 1)
        
        // Устанавливаем дочерние представления для UITabBarController
        tabBarController.setViewControllers([firstViewController, secondViewController], animated: false)
        
        return tabBarController
    }
}
