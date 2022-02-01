//
//  AddressListPresenter.swift
//  PizzaConsumerAddress
//
//  Created by 岡本 翔真 on 2022/01/27.
//

import Foundation

final class AddressListPresenter {
    weak var view: AddressListViewProtocol?
    var interactor: AddressListInteractorInputProtocol
    var router: AddressListRouterProtocol

    // private
    private var addressModel: [AddressListModel] = []

    // MARK: - Initialize

    init(view: AddressListViewProtocol,
         interactor: AddressListInteractorInputProtocol,
         router: AddressListRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }

    // MARK: - Private Methods

    /// TableViewのセルを作成
    private func tableViewText() {
        var contents: [CellContents] = []

        self.addressModel.enumerated().forEach {
            var firstAddress: String = Const.kEmpty
            var secondAddress: String = Const.kEmpty

            switch $0.element.address {
            case .centerNorth:
                if $0.element.fourthAddress == nil {
                    secondAddress = "\($0.element.thirdAddress?.description ?? Const.kEmpty)"
                } else {
                    secondAddress = "\($0.element.thirdAddress?.description ?? Const.kEmpty)-\($0.element.fourthAddress?.description ?? Const.kEmpty)"
                }
                firstAddress = "南\($0.element.firstAddress?.description ?? Const.kEmpty)条西\($0.element.secondAddress?.description ?? Const.kEmpty)丁目"
            default:
                if $0.element.thirdAddress == nil {
                    secondAddress = "\($0.element.secondAddress?.description ?? Const.kEmpty)"
                } else {
                    secondAddress = "\($0.element.secondAddress?.description ?? Const.kEmpty)-\($0.element.thirdAddress?.description ?? Const.kEmpty)"
                }
                firstAddress = "\($0.element.address.displayName)\($0.element.firstAddress?.description ?? Const.kEmpty)丁目"
            }

            contents.append(CellContents(name: "\($0.element.firstName) \($0.element.lastName)",
                                         firstAddress: firstAddress,
                                         secondAddress: secondAddress,
                                         buildingName: $0.element.buildingName,
                                         roomNumber: $0.element.roomNumber))
        }

        self.view?.reloadData(contents)
    }
}

// MARK: - AddressListPresenterProtocol

extension AddressListPresenter: AddressListPresenterProtocol {

    /// viewWillAppear時
    func viewWillAppear() {
        self.interactor.fetchAddressList()
    }

    /// 住所情報選択時
    ///
    /// - Parameter selectedSection: 選択したセクション番号
    func selectedAddressData(_ selectedSection: Int) {
        self.interactor.applyAddressList(self.addressModel[selectedSection])
    }

    /// 右スワイプ時
    /// 
    /// - Parameter selectedSection: 選択したセクション番号
    func rightSwipeTableViewCell(_ selectedSection: Int) {
        self.interactor.deleteAddressData(self.addressModel[selectedSection].addressId)
    }
}

// MARK: - AddressListInteractorOutputProtocol

extension AddressListPresenter: AddressListInteractorOutputProtocol {

    /// 住所情報の取得後
    /// - Parameter addressListModel: [AddressListModel]
    func didFetchAddressList(_ addressListModel: [AddressListModel]) {
        self.addressModel = addressListModel
        self.tableViewText()
    }

    /// 住所情報の削除後
    ///
    /// - Parameter isDelete: true: 成功 false: 失敗
    func didDeleteAddressData(_ isDelete: Bool) {
        isDelete ? self.interactor.fetchAddressList() : print("削除に失敗しました")
    }

    /// 住所情報の適用後
    func didApplyAddressList() {
        self.router.pushMapViewController()
    }
}
