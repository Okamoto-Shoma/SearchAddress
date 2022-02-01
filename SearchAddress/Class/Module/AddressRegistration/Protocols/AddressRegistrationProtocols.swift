//
//  AddressRegistrationProtocols.swift
//  PizzaConsumerAddress
//
//  Created by 岡本 翔真 on 2022/01/25.
//

// MARK: - View

protocol AddressRegistrationViewProtocol: AnyObject {
    var presenter: AddressRegistrationPresenterProtocol? { get set }

    func applyTableViewCell(cellTitles: [String])
}

// MARK: - Presenter

protocol AddressRegistrationPresenterProtocol: AnyObject {
    var view: AddressRegistrationViewProtocol? { get set }
    var interactor: AddressRegistrationInteractorInputProtocol { get set }
    var router: AddressRegistrationRouterProtocol { get set }

    func viewWillAppear()

    func selectPickerView(selectedRow: Int)
    func editedFirstName(_ text: String)
    func editedLastName(_ text: String)
    func editedBuildingName(_ text: String)
    func editedRoomNumber(_ roomNumber: String)
    func editAddressText(row: Int, text: String)
    func registrationButtonTapped()
}

// MARK: - Interactor

protocol AddressRegistrationInteractorInputProtocol: AnyObject {
    var output: AddressRegistrationInteractorOutputProtocol? { get set }

    func fetchTopAddressId()

    func applyFirstName(_ name: String)
    func applyLastName(_ name: String)
    func applyAddress(_ address: AddressType)
    func applyFirstAddress(_ address: Int?)
    func applySecondAddress(_ address: Int?)
    func applyThirdAddress(_ address: Int?)
    func applyFourthAddress(_ address: Int?)
    func applyBuildingName(_ buildingName: String)
    func applyRoomNumber(_ roomNumber: String)

    func applyAddressInformation()
    func applyNewTopAddressId()
}

protocol AddressRegistrationInteractorOutputProtocol: AnyObject {
    func didApplyAddressInformation(_ isSaved: Bool)
    func didApplyNewTopAddressId(_ isSaved: Bool)
}

// MARK: - Router

protocol AddressRegistrationRouterProtocol: AnyObject {
    func popViewController()
}
