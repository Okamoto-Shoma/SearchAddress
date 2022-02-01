//
//  MapInteractor.swift
//  PizzaConsumerAddress
//
//  Created by 岡本 翔真 on 2022/01/31.
//

import Foundation

final class MapInteractor {
    weak var output: MapInteractorOutputProtocol?

    private let searchService: SearchServiceProtocol

    // MARK: - Initialize

    init(searchService: SearchServiceProtocol) {
        self.searchService = searchService
    }
}

// MARK: - MapInteractorInputProtocol

extension MapInteractor: MapInteractorInputProtocol {

    /// 住所情報の取得
    func fetchAddressInformation() {
        self.output?.didFetchAddressInformation(self.searchService.getAddressList())
    }

    /// SearchServiceの住所情報を削除
    func deleteSearchServiceData() {
        self.searchService.deleteAddressList()
    }
}
