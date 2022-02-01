//
//  SearchServiceProtocol.swift
//  PizzaConsumerAddress
//
//  Created by 岡本 翔真 on 2022/01/31.
//

import Foundation

protocol SearchServiceProtocol: AnyObject {
    func setAddressList(_ addressList: AddressListModel)
    func getAddressList() -> AddressListModel
    func deleteAddressList()
}
