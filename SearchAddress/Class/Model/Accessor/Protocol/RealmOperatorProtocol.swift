//
//  RealmOperatorProtocol.swift
//  PizzaConsumerAddress
//
//  Created by 岡本 翔真 on 2022/01/26.
//

import Foundation
import RealmSwift

protocol RealmOperatorProtocol {
    func fetchAddressId() throws -> Int
    func updateAddressId(_ addressId: Int) throws
    
    func fetchAddressList() throws -> Results<AddressListObject>
    func addAddressList(_ addressListModel: AddressListModel) throws
    func deleteAddressList(_ addressId: Int) throws
}
