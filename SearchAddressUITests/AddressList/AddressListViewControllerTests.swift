//
//  AddressListViewControllerTests.swift
//  SearchAddressUITests
//
//  Created by Kakeshin on 2022/06/12.
//

import XCTest
@testable import SearchAddress

class AddressListViewControllerTests: XCTestCase {
    // private
    private let app = XCUIApplication()

    override func setUp() {
        super.setUp()

        self.app.launch()
        self.continueAfterFailure = false
    }

    override func tearDown() {
        super.tearDown()
    }

    // MARK: - Tests

    func test_AddressList_2022_06_11() {
    }
}
