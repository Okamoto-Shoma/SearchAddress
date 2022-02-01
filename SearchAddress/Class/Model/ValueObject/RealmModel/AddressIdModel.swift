//
//  AddressIdModel.swift
//  PizzaConsumerAddress
//
//  Created by 岡本 翔真 on 2022/01/27.
//

import Foundation

struct AddressIdModel: Equatable {
    var primaryId: Int
    var addressId: Int

    init() {
        self.primaryId = 0
        self.addressId = 1
    }

    init(addressIdObject: AddressIdObject) {
        self.primaryId = addressIdObject.primaryId
        self.addressId = addressIdObject.addressId
    }
}
