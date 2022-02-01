//
//  AddressIdObject.swift
//  PizzaConsumerAddress
//
//  Created by 岡本 翔真 on 2022/01/27.
//

import Foundation
import RealmSwift

class AddressIdObject: Object {
    @objc dynamic var primaryId: Int = 0
    @objc dynamic var addressId: Int = 1

    override static func primaryKey() -> String? {
        return "primaryId"
    }

    convenience init(addressIdModel: AddressIdModel) {
        self.init()
        self.primaryId = addressIdModel.primaryId
        self.addressId = addressIdModel.addressId
    }
}
