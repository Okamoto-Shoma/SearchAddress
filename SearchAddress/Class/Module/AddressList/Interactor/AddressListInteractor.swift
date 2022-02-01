//
//  AddressListInteractor.swift
//  PizzaConsumerAddress
//
//  Created by 岡本 翔真 on 2022/01/27.
//

import Foundation

final class AddressListInteractor {
    weak var output: AddressListInteractorOutputProtocol?

    // private
    private let addressService: AddressServiceProtocol
    private let searchService: SearchServiceProtocol

    // MARK: - Initialize

    init(addressService: AddressServiceProtocol,
         searchService: SearchServiceProtocol) {
        self.addressService = addressService
        self.searchService = searchService
    }
}

// MARK: - AddressListInteractorInputProtocol

extension AddressListInteractor: AddressListInteractorInputProtocol {

    /// 住所情報の取得
    func fetchAddressList() {
        self.output?.didFetchAddressList(self.addressService.fetchAddressList())
    }

    /// 住所情報の削除
    ///
    /// - Parameter addressId: 住所ID
    func deleteAddressData(_ addressId: Int) {
        self.output?.didDeleteAddressData(self.addressService.deleteAddressData(addressId))
    }

    /// 住所情報の適用
    ///
    /// - Parameter addressListModel: AddressListModel
    func applyAddressList(_ addressListModel: AddressListModel) {
        self.searchService.setAddressList(addressListModel)
        self.output?.didApplyAddressList()
    }
}
