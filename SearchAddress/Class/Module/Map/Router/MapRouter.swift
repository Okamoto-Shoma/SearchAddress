//
//  MapRouter.swift
//  PizzaConsumerAddress
//
//  Created by 岡本 翔真 on 2022/01/31.
//

import UIKit

final class MapRouter {
    private weak var viewController: UIViewController?

    private init(viewController: UIViewController) {
        self.viewController = viewController
    }

    static func createMapModule() -> UIViewController {
        let searchService = SearchService.sharedInstance
        let view = MapViewController()
        let interactor = MapInteractor(searchService: searchService)
        let router = MapRouter(viewController: view)
        let presenter = MapPresenter(view: view,
                                     interactor: interactor,
                                     router: router)

        interactor.output = presenter
        view.presenter = presenter

        return view
    }
}

// MARK: - MapRouterProtocol

extension MapRouter: MapRouterProtocol {

}
