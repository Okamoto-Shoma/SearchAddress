//
//  HomeInteractor.swift
//  PizzaConsumerAddress
//
//  Created by 岡本 翔真 on 2022/01/25.
//

import Foundation

final class HomeInteractor {
    weak var output: HomeInteractorOutputProtocol?
}

// MARK: - HomeInteractorInputProtocol

extension HomeInteractor: HomeInteractorInputProtocol {
}
