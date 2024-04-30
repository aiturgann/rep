//
//  SplashViewController.swift
//  62CafeApp
//
//  Created by Aiturgan Kurmanbekova on 29/4/24.
//

import UIKit

class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        if !UserSessionManager.shared.isSessionActive {
            let viewController = StartViewController()
            let navigation = UINavigationController(rootViewController: viewController)
            navigation.modalPresentationStyle = .fullScreen
            navigationController?.present(navigation, animated: false)
        } else {
            let viewController = MainViewController()
            let navigation = UINavigationController(rootViewController: viewController)
            navigation.modalPresentationStyle = .fullScreen
            navigationController?.present(navigation , animated: false)
        }
    }
}
