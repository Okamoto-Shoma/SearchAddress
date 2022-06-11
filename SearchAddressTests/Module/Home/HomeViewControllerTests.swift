//
//  HomeViewControllerTests.swift
//  SearchAddressTests
//
//  Created by Kakeshin on 2022/06/11.
//

import XCTest
import Cuckoo
@testable import SearchAddress

class HomeViewControllerTests: XCTestCase {
    // private
    private let presenter = MockHomePresenterProtocol()
    private var view: HomeViewController!

    override func setUp() {
        super.setUp()

        self.continueAfterFailure = false
        self.view = HomeViewController()
    }

    override func tearDown() {
        super.tearDown()
    }

    // MARK: - Tests

    func test_applyDesign() {
        XCUIApplication().launch()
        
    }
}
