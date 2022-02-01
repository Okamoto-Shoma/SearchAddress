//
//  AddressListRouter.swift
//  PizzaConsumerAddress
//
//  Created by 岡本 翔真 on 2022/01/27.
//

import UIKit

final class AddressListRouter {
    private weak var viewController: UIViewController?

    private init(viewController: UIViewController) {
        self.viewController = viewController
    }

    static func createAddressListModule() -> UIViewController {
        let addressService = AddressService.sharedInstance
        let searchService = SearchService.sharedInstance
        let view = AddressListViewController()
        let interactor = AddressListInteractor(addressService: addressService,
                                               searchService: searchService)
        let router = AddressListRouter(viewController: view)
        let presenter = AddressListPresenter(view: view,
                                             interactor: interactor,
                                             router: router)

        interactor.output = presenter
        view.presenter = presenter

        return view
    }
}

// MARK: - AddressListRouterProtocol

extension AddressListRouter: AddressListRouterProtocol {

    /// 一つ前の画面に遷移
    func popViewController() {
        self.viewController?.navigationController?.popViewController(animated: true)
    }

    /// マップ画面に遷移
    func pushMapViewController() {
        let viewController = MapRouter.createMapModule()
        self.viewController?.pushViewController(viewController)
    }
}
