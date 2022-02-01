//
//  AddressService.swift
//  PizzaConsumerAddress
//
//  Created by 岡本 翔真 on 2022/01/26.
//

import Foundation

final class AddressService: NSObject {
    // private
    private var realmOperator: RealmOperatorProtocol?

    // Singleton
    static let sharedInstance = AddressService()

    private override init() {
        self.realmOperator = RealmOperator()
    }
}

// MARK: - AddressServiceProtocol

extension AddressService: AddressServiceProtocol {

    /// 最上位住所IDの取得
    ///
    /// - Returns: 住所ID
    func fetchTopAddressId() -> Int {
        do {
            if let addressId = try self.realmOperator?.fetchAddressId() {
                return addressId
            }
            return 1
        } catch {
            return 1
        }
    }

    /// 新しい最上位住所IDの適用
    ///
    /// - Parameter addressId: 住所ID
    /// - Returns: true: 成功 false: 失敗
    func applyNewTopAddressId(_ addressId: Int) -> Bool {
        do {
            try self.realmOperator?.updateAddressId(addressId)
            return true
        } catch {
            return false
        }
    }

    /// 住所情報の取得
    ///
    /// - Returns: 住所情報
    func fetchAddressList() -> [AddressListModel] {
        do {
            if let addressListData = try self.realmOperator?.fetchAddressList() {
                return addressListData.map { AddressListModel(addressListObject: $0) }
            }
            return [AddressListModel]()
        } catch {
            return [AddressListModel]()
        }
    }

    /// 住所の適用
    ///
    /// - Parameter addressListModel: AddressListModel
    /// - Returns: true: 登録成功 false: 登録失敗
    func applyAddress(_ addressListModel: AddressListModel) -> Bool {
        do {
            try self.realmOperator?.addAddressList(addressListModel)
            return true
        } catch {
            return false
        }
    }

    /// 住所データの削除
    ///
    /// - Parameter addressId: 住所ID
    /// - Returns: true 成功 false 失敗
    func deleteAddressData(_ addressId: Int) -> Bool {
        do {
            try self.realmOperator?.deleteAddressList(addressId)
            return true
        } catch {
            return false
        }
    }
}
