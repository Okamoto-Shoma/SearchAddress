//
//  AddressRegistrationRouter.swift
//  PizzaConsumerAddress
//
//  Created by 岡本 翔真 on 2022/01/25.
//

import UIKit

final class AddressRegistrationRouter {
    private weak var viewController: UIViewController?

    private init(viewController: UIViewController) {
        self.viewController = viewController
    }

    static func createAddressRegistrationModule() -> UIViewController {
        let addressService = AddressService.sharedInstance
        let view = AddressRegistrationViewController()
        let interactor = AddressRegistrationInteractor(addressService: addressService)
        let router = AddressRegistrationRouter(viewController: view)
        let presenter = AddressRegistrationPresenter(view: view,
                                                     interactor: interactor,
                                                     router: router)

        interactor.output = presenter
        view.presenter = presenter

        return view
    }
}

// MARK: - AddressRegistrationRouterProtocol

extension AddressRegistrationRouter: AddressRegistrationRouterProtocol {

    /// 一つ前の画面に遷移する
    func popViewController() {
        self.viewController?.navigationController?.popViewController(animated: true)
    }
}
