//
//  HomePresenterTests.swift
//  SearchAddressTests
//
//  Created by 岡本 翔真 on 2022/06/11.
//

import XCTest
import Cuckoo
@testable import SearchAddress

class HomePresenterTests: XCTestCase {
    // private
    private let view = MockHomeViewProtocol()
    private let interactor = MockHomeInteractorInputProtocol()
    private let router = MockHomeRouterProtocol()
    private var presente: HomePresenter!

    override func setUp() {
        super.setUp()

        self.presente = HomePresenter(view: self.view,
                                      interactor: self.interactor,
                                      router: self.router)
    }

    override func tearDown() {
        super.tearDown()
    }

    // MARK: - Tests

    func test_viewDidLoad() {
        stub(self.view) { stub in
            when(stub.applyDesign()).thenDoNothing()
        }

        self.presente.viewDidLoad()

        _ = XCTContext.runActivity(named: "View.applyDesign is called.") { _ in
            verify(self.view, times(1)).applyDesign()
        }
    }

    func test_addressRegistrationButtonTapped() {
        stub(self.router) { stub in
            when(stub.pushAddressRegistrationViewController()).thenDoNothing()
        }

        self.presente.addressRegistrationButtonTapped()

        _ = XCTContext.runActivity(named: "Router.pushAddressRegistrationViewController is called.") { _ in
            verify(self.router, times(1)).pushAddressRegistrationViewController()
        }
    }

    func test_addressListButtonTapped() {
        stub(self.router) { stub in
            when(stub.pushAddressListViewController()).thenDoNothing()
        }

        self.presente.addressListButtonTapped()

        _ = XCTContext.runActivity(named: "Router.pushAddressListViewController is called.") { _ in
            verify(self.router, times(1)).pushAddressListViewController()
        }
    }
}
