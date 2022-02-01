//
//  RootRouter.swift
//  PizzaConsumerAddress
//
//  Created by 岡本 翔真 on 2022/01/26.
//

import UIKit

final class RootRouter {
    private init() {}

    static func createRootModule(window: UIWindow?) {
        let viewController = HomeRouter.createHomeModule()
        let navigationViewController = UINavigationController(rootViewController: viewController)
        navigationViewController.setNavigationBarHidden(false,
                                                        animated: true)
        window?.rootViewController = navigationViewController
        window?.makeKeyAndVisible()
    }
}
