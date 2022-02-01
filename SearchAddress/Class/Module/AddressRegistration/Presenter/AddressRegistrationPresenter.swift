//
//  AddressRegistrationPresenter.swift
//  PizzaConsumerAddress
//
//  Created by 岡本 翔真 on 2022/01/25.
//

import Foundation

final class AddressRegistrationPresenter {
    weak var view: AddressRegistrationViewProtocol?
    var interactor: AddressRegistrationInteractorInputProtocol
    var router: AddressRegistrationRouterProtocol

    // private
    private var firstName: String = Const.kEmpty
    private var firstAddress: Int? = nil
    private var secondAddress: Int? = nil
    private var thirdAddress: Int? = nil

    init(view: AddressRegistrationViewProtocol,
         interactor: AddressRegistrationInteractorInputProtocol,
         router: AddressRegistrationRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }

    /// 空白の確認
    private func isEmptyText() {
        guard self.firstName != Const.kEmpty else {
            print("First Nameが空白です")
            return
        }

        guard self.firstAddress != nil else {
            print("住所1が空白です")
            return
        }

        guard self.secondAddress != nil else {
            print("住所2が空白です")
            return
        }

        guard self.thirdAddress != nil else {
            print("住所3が空白です")
            return
        }

        self.interactor.applyAddressInformation()
    }
}

// MARK: - AddressRegistrationPresenterProtocol

extension AddressRegistrationPresenter: AddressRegistrationPresenterProtocol {

    /// viewWillAppear時
    func viewWillAppear() {
        self.interactor.fetchTopAddressId()
    }

    /// ピッカーの選択時
    ///
    /// - Parameter selectedRow: 選択したセル情報
    func selectPickerView(selectedRow: Int) {

        var tableViewCellTitles: [String] = []

        if selectedRow == 0 {
            tableViewCellTitles = [
                Const.Word.NewAddress.detailAddress.northAddress,
                Const.Word.NewAddress.detailAddress.westAddress,
                Const.Word.NewAddress.detailAddress.detailFirstAddress,
                Const.Word.NewAddress.detailAddress.detailSecondAddress
            ]
        } else {
            tableViewCellTitles = [
                Const.Word.NewAddress.detailAddress.address,
                Const.Word.NewAddress.detailAddress.detailFirstAddress,
                Const.Word.NewAddress.detailAddress.detailSecondAddress
            ]
        }

        self.interactor.applyAddress(AddressType(rawValue: selectedRow) ?? .centerNorth)
        self.view?.applyTableViewCell(cellTitles: tableViewCellTitles)
    }

    /// First Nameの編集後
    ///
    /// - Parameter text: First Name
    func editedFirstName(_ text: String) {
        self.firstName = text
        self.interactor.applyFirstName(text)
    }

    /// Last Nameの編集後
    ///
    /// - Parameter text: Last Name
    func editedLastName(_ text: String) {
        self.interactor.applyLastName(text)
    }

    /// 建物名の編集後
    ///
    /// - Parameter text: 建物名
    func editedBuildingName(_ text: String) {
        self.interactor.applyBuildingName(text)
    }

    /// 部屋番号の編集後
    ///
    /// - Parameter roomNumber: 部屋番号
    func editedRoomNumber(_ roomNumber: String) {
        self.interactor.applyRoomNumber(roomNumber)
    }

    /// 住所編集時
    ///
    /// - Parameters:
    ///   - row: セル番号
    ///   - text: 文言
    func editAddressText(row: Int, text: String) {
        var address: Int? = nil

        if text != Const.kEmpty {
            address = Int(text)
        }

        switch row {
        case 0:
            self.firstAddress = address
            self.interactor.applyFirstAddress(address)
        case 1:
            self.secondAddress = address
            self.interactor.applySecondAddress(address)
        case 2:
            self.thirdAddress = address
            self.interactor.applyThirdAddress(address)
        case 3:
            self.interactor.applyFourthAddress(address)
        default: break
        }
    }

    /// 登録ボタン押下時
    func registrationButtonTapped() {
        self.isEmptyText()
    }
}

// MARK: - AddressRegistrationInteractorOutputProtocol

extension AddressRegistrationPresenter: AddressRegistrationInteractorOutputProtocol {

    /// 住所情報登録後
    ///
    /// - Parameter isSaved: true: 登録成功 false: 登録失敗
    func didApplyAddressInformation(_ isSaved: Bool) {
        isSaved ?
        self.interactor.applyNewTopAddressId() : print(Const.Word.Error.addressRegistrationFailed)
    }

    /// 最上位住所IDの適用後
    ///
    /// - Parameter isSaved: true: 登録成功 false: 登録失敗
    func didApplyNewTopAddressId(_ isSaved: Bool) {
        isSaved ?
        self.router.popViewController() : print(Const.Word.Error.addressIDUpdateFailed)
    }
}
