//
//  SearchAddressUITests.swift
//  SearchAddressUITests
//
//  Created by Kakeshin on 2022/06/12.
//

import XCTest
@testable import SearchAddress

class SearchAddressUITests: XCTestCase {
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

    func test_HomeViewController_2022_06_11() {
        // MARK: - HomeViewController Tests

        XCTContext.runActivity(named: "HomeViewControllerのテスト") { _ in
            XCTContext.runActivity(named: "RegistAddressLabelのテスト") { _ in
                let expectedLabel = self.app.staticTexts["RegistAddressLabel"].firstMatch

                XCTContext.runActivity(named: "Label is exsit") { _ in
                    XCTAssertTrue(expectedLabel.exists)
                }
                XCTContext.runActivity(named: "Label word is appropriate") { _ in
                    XCTAssertEqual(expectedLabel.label, "新規登録")
                }
            }

            XCTContext.runActivity(named: "AddressListLabelのテスト") { _ in
                let expectedLabel = self.app.staticTexts["AddressListLabel"]

                XCTContext.runActivity(named: "Label is exsit") { _ in
                    XCTAssertTrue(expectedLabel.exists)
                }
                XCTContext.runActivity(named: "Label word is appropriate") { _ in
                    XCTAssertEqual(expectedLabel.label, "住所一覧")
                }
            }

            XCTContext.runActivity(named: "RegistAddressButtonのテスト") { _ in
                XCTContext.runActivity(named: "BackButton is transition") { _ in
                    let expectedBackButton = self.app.navigationBars["SearchAddress.AddressRegistrationView"].buttons["Back"]

                    self.app.buttons["RegistAddressButton"].firstMatch.tap()

                    XCTContext.runActivity(named: "BackButton is exsit") { _ in
                        XCTAssertTrue(expectedBackButton.exists)
                    }

                    XCTContext.runActivity(named: "BackButton is enabled") { _ in
                        XCTAssertTrue(expectedBackButton.isEnabled)
                    }

                    expectedBackButton.tap()
                }
            }

            XCTContext.runActivity(named: "AddressListのテスト") { _ in
                XCTContext.runActivity(named: "BackButton is transition")  { _ in
                    let expectedBackButton = self.app.navigationBars["SearchAddress.AddressListView"].buttons["Back"]

                    self.app.buttons["AddressListButton"].firstMatch.tap()

                    XCTContext.runActivity(named: "Button is exsti") { _ in
                        XCTAssertTrue(expectedBackButton.exists)
                    }

                    XCTContext.runActivity(named: "BackButton is enabled") { _ in
                        XCTAssertTrue(expectedBackButton.isEnabled)
                    }

                    expectedBackButton.tap()
                }
            }
        }
    }
}
