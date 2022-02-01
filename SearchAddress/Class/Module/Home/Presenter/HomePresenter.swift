//
//  HomePresenter.swift
//  PizzaConsumerAddress
//
//  Created by 岡本 翔真 on 2022/01/25.
//

import Foundation

final class HomePresenter {
    weak var view: HomeViewProtocol?
    var interactor: HomeInteractorInputProtocol
    var router: HomeRouterProtocol

    // MARK: - Initialize

    init(view: HomeViewProtocol,
         interactor: HomeInteractorInputProtocol,
         router: HomeRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

// MARK: - HomePresenterProtocol

extension HomePresenter: HomePresenterProtocol {

    /// viewDidLoad時
    func viewDidLoad() {
        self.view?.applyDesign()
    }

    /// 新規登録ボタン押下時
    func addressRegistrationButtonTapped() {
        self.router.pushAddressRegistrationViewController()
    }

    /// 住所一覧ボタン押下時
    func addressListButtonTapped() {
        self.router.pushAddressListViewController()
    }
}

// MARK: - HomeInteractorOutputProtocol

extension HomePresenter: HomeInteractorOutputProtocol {
}
