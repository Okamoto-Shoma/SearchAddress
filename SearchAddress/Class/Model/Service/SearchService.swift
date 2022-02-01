//
//  SearchService.swift
//  PizzaConsumerAddress
//
//  Created by 岡本 翔真 on 2022/01/31.
//

import Foundation

final class SearchService: NSObject {
    // Singleton
    static let sharedInstance = SearchService()

    private override init() {}

    private(set) var addressList: AddressListModel?
}

// MARK: - SearchServiceProtocol

extension SearchService: SearchServiceProtocol {

    /// 住所情報を保存
    ///
    /// - Parameter addressList: 住所リスト
    func setAddressList(_ addressList: AddressListModel) {
        self.addressList = addressList
    }

    /// 住所情報の取得
    ///
    /// - Returns: AddressListModel
    func getAddressList() -> AddressListModel {
        guard let addressList = self.addressList else {
            return AddressListModel()
        }

        return addressList
    }

    /// 住所情報の削除
    func deleteAddressList() {
        self.addressList = nil
    }
}
