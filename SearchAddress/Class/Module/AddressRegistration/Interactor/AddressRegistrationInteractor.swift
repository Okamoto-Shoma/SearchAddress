//
//  AddressRegistrationInteractor.swift
//  PizzaConsumerAddress
//
//  Created by 岡本 翔真 on 2022/01/25.
//

import Foundation

final class AddressRegistrationInteractor {
    weak var output: AddressRegistrationInteractorOutputProtocol?

    // private
    private let addressService: AddressServiceProtocol
    private var addressId: Int = 0
    private var addressListModel: AddressListModel = AddressListModel()

    // MARK: - Initialize

    init(addressService: AddressServiceProtocol) {
        self.addressService = addressService
    }
}

// MARK: - AddressRegistrationInteractorInputProtocol

extension AddressRegistrationInteractor: AddressRegistrationInteractorInputProtocol {

    /// 最上位住所IDの取得
    func fetchTopAddressId() {
        self.addressId = self.addressService.fetchTopAddressId()
    }

    /// First Nameの適用
    ///
    /// - Parameter name: First Name
    func applyFirstName(_ name: String) {
        self.addressListModel.firstName = name
    }

    /// Last Nameの適用
    ///
    /// - Parameter name: Last Name
    func applyLastName(_ name: String) {
        self.addressListModel.lastName = name
    }

    /// 大まかな住所の適用
    ///
    /// - Parameter address: AddressType
    func applyAddress(_ address: AddressType) {
        self.addressListModel.address = address
    }

    /// 第一住所の適用
    ///
    /// - Parameter address: 住所
    func applyFirstAddress(_ address: Int?) {
        self.addressListModel.firstAddress = address
    }

    /// 第二住所の適用
    ///
    /// - Parameter address: 住所
    func applySecondAddress(_ address: Int?) {
        self.addressListModel.secondAddress = address
    }

    /// 第三住所の適用
    ///
    /// - Parameter address: 住所
    func applyThirdAddress(_ address: Int?) {
        self.addressListModel.thirdAddress = address
    }

    /// 第四住所の適用
    ///
    /// - Parameter address: 住所
    func applyFourthAddress(_ address: Int?) {
        self.addressListModel.fourthAddress = address
    }

    /// 建物名の適用
    ///
    /// - Parameter buildingName: 建物名
    func applyBuildingName(_ buildingName: String) {
        self.addressListModel.buildingName = buildingName
    }

    /// 部屋番号の適用
    ///
    /// - Parameter roomNumber: 部屋番号
    func applyRoomNumber(_ roomNumber: String) {
        self.addressListModel.roomNumber = roomNumber
    }

    /// 住所情報の登録
    func applyAddressInformation() {
        self.addressListModel.addressId = self.addressId
        self.output?.didApplyAddressInformation(self.addressService.applyAddress(self.addressListModel))
    }

    /// 最上位住所IDの適用
    func applyNewTopAddressId() {
        self.addressId += 1
        self.output?.didApplyNewTopAddressId(self.addressService.applyNewTopAddressId(self.addressId))
    }
}
