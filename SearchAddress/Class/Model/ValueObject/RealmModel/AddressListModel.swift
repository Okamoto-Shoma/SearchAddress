//
//  AddressListModel.swift
//  PizzaConsumerAddress
//
//  Created by 岡本 翔真 on 2022/01/26.
//

import Foundation


struct AddressListModel: Equatable {
    var addressId: Int
    var firstName: String
    var lastName: String
    var address: AddressType
    var firstAddress: Int?
    var secondAddress: Int?
    var thirdAddress: Int?
    var fourthAddress: Int?
    var buildingName: String
    var roomNumber: String

    init() {
        self.addressId = 0
        self.firstName = Const.kEmpty
        self.lastName = Const.kEmpty
        self.address = .centerNorth
        self.firstAddress = nil
        self.secondAddress = nil
        self.thirdAddress = nil
        self.fourthAddress = nil
        self.buildingName = Const.kEmpty
        self.roomNumber = Const.kEmpty
    }

    init(addressId: Int,
         firstName: String,
         lastName: String,
         address: AddressType,
         firstAddress: Int?,
         secondAddress: Int?,
         thirdAddress: Int?,
         fourthAddress: Int?,
         buildingName: String,
         roomNumber: String) {
        self.addressId = addressId
        self.firstName = firstName
        self.lastName = lastName
        self.address = address
        self.firstAddress = firstAddress
        self.secondAddress = secondAddress
        self.thirdAddress = thirdAddress
        self.fourthAddress = fourthAddress
        self.buildingName = buildingName
        self.roomNumber = roomNumber
    }

    init(addressListObject: AddressListObject) {
        self.addressId = addressListObject.addressId
        self.firstName = addressListObject.firstName
        self.lastName = addressListObject.lastName
        self.firstAddress = addressListObject.firstAddress.value
        self.secondAddress = addressListObject.secondAddress.value
        self.thirdAddress = addressListObject.thirdAddress.value
        self.fourthAddress = addressListObject.fourthAddress.value
        self.buildingName = addressListObject.buildingName
        self.roomNumber = addressListObject.roomNumber

        switch addressListObject.address {
        case 0: self.address = .centerNorth
        case 1: self.address = .river
        case 2: self.address = .hill
        case 3: self.address = .underTheSeaweed
        default: self.address = .centerNorth
        }
    }

}
