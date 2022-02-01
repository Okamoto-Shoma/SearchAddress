//
//  HomeProtocols.swift
//  PizzaConsumerAddress
//
//  Created by 岡本 翔真 on 2022/01/25.
//

// MARK: - View

protocol HomeViewProtocol: AnyObject {
    var presenter: HomePresenterProtocol? { get set }

    func applyDesign()
}

// MARK: - Presenter

protocol HomePresenterProtocol: AnyObject {
    var view: HomeViewProtocol? { get set }
    var interactor: HomeInteractorInputProtocol { get set }
    var router: HomeRouterProtocol { get set }

    func viewDidLoad()
    func addressRegistrationButtonTapped()
    func addressListButtonTapped()
}

// MARK: - Interactor

protocol HomeInteractorInputProtocol: AnyObject {
    var output: HomeInteractorOutputProtocol? { get set }
}

protocol HomeInteractorOutputProtocol: AnyObject {
}

// MARK: - Router

protocol HomeRouterProtocol: AnyObject {
    func pushAddressRegistrationViewController()
    func pushAddressListViewController()
}
