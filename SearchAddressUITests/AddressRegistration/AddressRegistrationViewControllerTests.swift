//
//  AddressRegistrationViewControllerTests.swift
//  SearchAddressUITests
//
//  Created by Kakeshin on 2022/06/12.
//

import XCTest
@testable import SearchAddress

class AddressRegistrationViewControllerTests: XCTestCase {
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

    func test_AddressRegistrationViewController_2022_06_11() {
        let expectedButton = self.app.buttons["RegistAddressButton"].firstMatch

        XCTContext.runActivity(named: "Button is transition") { _ in
            expectedButton.tap()
            XCTContext.runActivity(named: "AddressRegistrationのテスト") { _ in
                XCTContext.runActivity(named: "NameLabelのテスト") { _ in
                    let expectedLabel = self.app.staticTexts["NameLabel"].firstMatch

                    XCTContext.runActivity(named: "Label is exsit") { _ in
                        XCTAssertTrue(expectedLabel.exists)
                    }

                    XCTContext.runActivity(named: "Label word is appropriate") { _ in
                        XCTAssertEqual(expectedLabel.label, "氏名")
                    }
                }

                XCTContext.runActivity(named: "FirstNameエリアのテスト") { _ in
                    XCTContext.runActivity(named: "FirstNameLabelのテスト") { _ in
                        let expectedLabel = self.app.staticTexts["FirstNameLabel"].firstMatch

                        XCTContext.runActivity(named: "Label is exsit") { _ in
                            XCTAssertTrue(expectedLabel.exists)
                        }

                        XCTContext.runActivity(named: "Label word is appropriate") { _ in
                            XCTAssertEqual(expectedLabel.label, "姓")
                        }
                    }

                    XCTContext.runActivity(named: "FirstNameTextFieldのテスト") { _ in
                        let expectedTextField = self.app.textFields["FirstNameTextField"].firstMatch

                        XCTContext.runActivity(named: "TextField is exit") { _ in
                            XCTAssertTrue(expectedTextField.exists)
                        }

                        XCTContext.runActivity(named: "TextField word is empty") { _ in
                            XCTAssertTrue(expectedTextField.label.isEmpty)
                        }

                        XCTContext.runActivity(named: "TextField word is test") { _ in
                            expectedTextField.tap()
                            self.app.keys["f"].tap()
                            self.app.keys["i"].tap()
                            self.app.keys["r"].tap()
                            self.app.keys["s"].tap()
                            self.app.keys["t"].tap()
                            self.app.buttons["Done"].tap()

                            XCTAssertEqual(expectedTextField.value as! String, "first")
                        }
                    }
                }

                XCTContext.runActivity(named: "LastNameエリアのテスト") { _ in
                    XCTContext.runActivity(named: "LastNameLabelのテスト") { _ in
                        let expectedLabel = self.app.staticTexts["LastNameLabel"].firstMatch

                        XCTContext.runActivity(named: "Label is exsit") { _ in
                            XCTAssertTrue(expectedLabel.exists)
                        }

                        XCTContext.runActivity(named: "Label word is appropriate") { _ in
                            XCTAssertEqual(expectedLabel.label, "名")
                        }
                    }

                    XCTContext.runActivity(named: "LastNameTextFieldのテスト") { _ in
                        let expectedTextField = self.app.textFields["LastNameTextField"].firstMatch

                        XCTContext.runActivity(named: "TextField is exsit") { _ in
                            XCTAssertTrue(expectedTextField.exists)
                        }

                        XCTContext.runActivity(named: "TextField word is empty") { _ in
                            XCTAssertTrue(expectedTextField.label.isEmpty)
                        }

                        XCTContext.runActivity(named: "TextField word is test") { _ in
                            expectedTextField.tap()
                            self.app.keys["l"].tap()
                            self.app.keys["a"].tap()
                            self.app.keys["s"].tap()
                            self.app.keys["t"].tap()
                            self.app.buttons["Done"].tap()

                            XCTAssertEqual(expectedTextField.value as! String, "last")
                        }
                    }
                }

                XCTContext.runActivity(named: "PickerViewのテスト") { _ in
                    let expectedPickerView = self.app.pickers["PickerView"].firstMatch
                    let expectedWheel = expectedPickerView.pickerWheels.firstMatch
                    XCTContext.runActivity(named: "PickerView is exsit") { _ in
                        XCTAssertTrue(expectedPickerView.exists)
                    }

                    XCTContext.runActivity(named: "selected is first") { _ in
                        expectedWheel.adjust(toPickerWheelValue: "中央区、南区")
                    }
                }

                XCTContext.runActivity(named: "TableViewのテスト") { _ in

                }

                let tablesQuery = self.app.tables
                tablesQuery.cells.containing(.staticText, identifier:"南").children(matching: .textField).element.tap()
                self.app.keys["1"].tap()
                self.app.keys["4"].tap()
                self.app.buttons["Done"].tap()
                tablesQuery.cells.containing(.staticText, identifier:"西").children(matching: .textField).element.tap()
                self.app.keys["8"].tap()
                self.app.buttons["Done"].tap()
                tablesQuery.cells.containing(.staticText,
                                             identifier: "番").children(matching: .textField).element.tap()
                self.app.keys["5"].tap()
                self.app.buttons["Done"].tap()
                tablesQuery.cells.containing(.staticText,
                                             identifier: "号").children(matching: .textField).element.tap()
                self.app.keys["8"].tap()
                self.app.buttons["Done"].tap()

                self.app.buttons["RegistButton"].tap()
            }
        }
    }
}
