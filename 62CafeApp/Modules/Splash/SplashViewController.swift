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
        if UserSessionManager.shared.isSessionActive {
            let viewController = StartViewController()
            navigationController?.pushViewController(viewController, animated: true)
        } else {
            let viewController = AuthorizationViewController()
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
}
