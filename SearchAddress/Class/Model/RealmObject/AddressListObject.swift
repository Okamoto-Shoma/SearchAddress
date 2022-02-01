//
//  AddressListObject.swift
//  PizzaConsumerAddress
//
//  Created by 岡本 翔真 on 2022/01/26.
//

import Foundation
import RealmSwift

class AddressListObject: Object {
    @objc dynamic var addressId: Int = 0
    @objc dynamic var firstName: String = Const.kEmpty
    @objc dynamic var lastName: String = Const.kEmpty
    @objc dynamic var address: Int = 0
    var firstAddress = RealmProperty<Int?>()
    var secondAddress = RealmProperty<Int?>()
    var thirdAddress = RealmProperty<Int?>()
    var fourthAddress = RealmProperty<Int?>()
    @objc dynamic var buildingName: String = Const.kEmpty
    @objc dynamic var roomNumber: String = Const.kEmpty

    override static func primaryKey() -> String? {
        return "addressId"
    }

    convenience init(addressListModel: AddressListModel) {
        self.init()
        self.addressId = addressListModel.addressId
        self.firstName = addressListModel.firstName
        self.lastName = addressListModel.lastName
        self.address = addressListModel.address.rawValue
        self.firstAddress.value = addressListModel.firstAddress
        self.secondAddress.value = addressListModel.secondAddress
        self.thirdAddress.value = addressListModel.thirdAddress
        self.fourthAddress.value = addressListModel.fourthAddress
        self.buildingName = addressListModel.buildingName
        self.roomNumber = addressListModel.roomNumber
    }
}
