//
//  AddressListProtocol.swift
//  PizzaConsumerAddress
//
//  Created by 岡本 翔真 on 2022/01/27.
//

// MARK: - View

protocol AddressListViewProtocol: AnyObject {
    var presenter: AddressListPresenterProtocol? { get set }

    func reloadData(_ contents: [CellContents])
}

// MARK: - Presenter

protocol AddressListPresenterProtocol: AnyObject {
    var view: AddressListViewProtocol? { get set }
    var interactor: AddressListInteractorInputProtocol { get set }
    var router: AddressListRouterProtocol { get set }

    func viewWillAppear()
    func selectedAddressData(_ selectedSection: Int)
    func rightSwipeTableViewCell(_ selectedSection: Int)
}

// MARK: - Interactor

protocol AddressListInteractorInputProtocol: AnyObject {
    var output: AddressListInteractorOutputProtocol? { get set }

    func fetchAddressList()
    func deleteAddressData(_ addressId: Int)
    func applyAddressList(_ addressListModel: AddressListModel)
}

protocol AddressListInteractorOutputProtocol: AnyObject {
    func didFetchAddressList(_ addressListModel: [AddressListModel])
    func didDeleteAddressData(_ isDelete: Bool)
    func didApplyAddressList()
}

// MARK: - Router

protocol AddressListRouterProtocol: AnyObject {
    func popViewController()
    func pushMapViewController()
}
