//
//  MapPresenter.swift
//  PizzaConsumerAddress
//
//  Created by 岡本 翔真 on 2022/01/31.
//

import Foundation

final class MapPresenter {
    weak var view: MapViewProtocol?
    var interactor: MapInteractorInputProtocol
    var router: MapRouterProtocol

    // MARK: - Initialize

    init(view: MapViewProtocol,
         interactor: MapInteractorInputProtocol,
         router: MapRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

// MARK: - MapPresenterProtocol

extension MapPresenter: MapPresenterProtocol {

    /// viewWillAppear時
    func viewWillAppear() {
        self.interactor.fetchAddressInformation()
    }

    /// viewDidDisappear時
    func viewDidDisappear() {
        self.interactor.deleteSearchServiceData()
    }

}

// MARK: - MapInteractorOutputProtocol

extension MapPresenter: MapInteractorOutputProtocol {

    /// 住所情報の取得後
    ///
    /// - Parameter addressInformation: AddressListModel
    func didFetchAddressInformation(_ addressInformation: AddressListModel) {
        var firstAddressText: String = Const.kEmpty
        var secondAddressText: String = Const.kEmpty
        var mapAddressText: String = Const.kEmpty

        switch addressInformation.address {
        case .centerNorth:
            if addressInformation.fourthAddress != nil {
                secondAddressText = "\(addressInformation.thirdAddress?.description ?? Const.kEmpty)-\(addressInformation.fourthAddress?.description ?? Const.kEmpty)"
            } else {
                secondAddressText = "\(addressInformation.thirdAddress?.description ?? Const.kEmpty)"
            }
            firstAddressText = "南\(addressInformation.firstAddress?.description ?? Const.kEmpty)条西\(addressInformation.secondAddress?.description ?? Const.kEmpty)"
            mapAddressText = "札幌市\(firstAddressText)-\(secondAddressText)"
        default:
            if addressInformation.thirdAddress != nil {
                secondAddressText = "\(addressInformation.secondAddress?.description ?? Const.kEmpty)"
            } else {
                secondAddressText = "\(addressInformation.secondAddress?.description ?? Const.kEmpty)-\(addressInformation.thirdAddress?.description ?? Const.kEmpty)"
            }
            firstAddressText = "\(addressInformation.address.displayName)\(addressInformation.firstAddress?.description ?? Const.kEmpty)"
            mapAddressText = "札幌市\(firstAddressText)-\(secondAddressText)"
        }

        self.view?.applyCurrentText(firstAddressText: firstAddressText,
                                    secondAddressText: secondAddressText,
                                    buildingNameText: addressInformation.buildingName,
                                    roomNumberText: addressInformation.roomNumber)

        self.view?.applyMapView(address: mapAddressText)
    }
}
