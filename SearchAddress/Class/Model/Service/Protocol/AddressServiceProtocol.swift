//
//  AddressServiceProtocol.swift
//  PizzaConsumerAddress
//
//  Created by 岡本 翔真 on 2022/01/26.
//

import Foundation

protocol AddressServiceProtocol: AnyObject {
    func fetchTopAddressId() -> Int
    func applyNewTopAddressId(_ addressId: Int) -> Bool

    func fetchAddressList() -> [AddressListModel]
    func applyAddress(_ addressListModel: AddressListModel) -> Bool
    func deleteAddressData(_ addressId: Int) -> Bool
}
