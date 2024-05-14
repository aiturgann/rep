//
//  SplashScreenViewController.swift
//  62CafeApp
//
//  Created by Aiturgan Kurmanbekova on 14/5/24.
//

import UIKit

class SplashScreenViewController: BaseViewController {

    override func viewDidLoad() {
            super.viewDidLoad()
            if !UserSessionManager.shared.isSessionActive {
                let viewController = AuthenticationViewController()
                let navigation = UINavigationController(rootViewController: viewController)
                navigation.modalPresentationStyle = .fullScreen
                navigationController?.present(navigation, animated: false)
            } else {
                let viewController = ProductsViewController()
                let navigation = UINavigationController(rootViewController: viewController)
                navigation.modalPresentationStyle = .fullScreen
                navigationController?.present(navigation , animated: false)
            }
        }
}
