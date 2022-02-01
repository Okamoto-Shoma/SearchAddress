//
//  MapProtocols.swift
//  PizzaConsumerAddress
//
//  Created by 岡本 翔真 on 2022/01/31.
//

// MARK: - View

protocol MapViewProtocol: AnyObject {
    var presenter: MapPresenterProtocol? { get set }

    func applyCurrentText(firstAddressText: String,
                          secondAddressText: String,
                          buildingNameText: String,
                          roomNumberText: String)
    func applyMapView(address: String)
}

// MARK: - Presenter

protocol MapPresenterProtocol: AnyObject {
    var view: MapViewProtocol? { get set }
    var interactor: MapInteractorInputProtocol { get set }
    var router: MapRouterProtocol { get set }

    func viewWillAppear()
    func viewDidDisappear()
}

// MARK: - Interactor

protocol MapInteractorInputProtocol: AnyObject {
    var output: MapInteractorOutputProtocol? { get set }

    func fetchAddressInformation()
    func deleteSearchServiceData()
}

protocol MapInteractorOutputProtocol: AnyObject {
    func didFetchAddressInformation(_ addressInformation: AddressListModel)
}

// MARK: - Router

protocol MapRouterProtocol: AnyObject {
}
