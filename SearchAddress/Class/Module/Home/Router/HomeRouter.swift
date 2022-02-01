//
//  HomeRouter.swift
//  PizzaConsumerAddress
//
//  Created by 岡本 翔真 on 2022/01/25.
//

import UIKit

final class HomeRouter {
    private weak var viewController: UIViewController?

    private init(viewController: UIViewController) {
        self.viewController = viewController
    }

    static func createHomeModule() -> UIViewController {
        let view = HomeViewController()
        let interactor = HomeInteractor()
        let router = HomeRouter(viewController: view)
        let presenter = HomePresenter(view: view,
                                      interactor: interactor,
                                      router: router)

        interactor.output = presenter
        view.presenter = presenter

        return view
    }
}

// MARK: - HomeRouterProtocol

extension HomeRouter: HomeRouterProtocol {

    /// 新規登録画面に遷移
    func pushAddressRegistrationViewController() {
        let viewController = AddressRegistrationRouter.createAddressRegistrationModule()
        self.viewController?.pushViewController(viewController)
    }

    /// 住所一覧画面に遷移
    func pushAddressListViewController() {
        let viewController = AddressListRouter.createAddressListModule()
        self.viewController?.pushViewController(viewController)
    }
}
