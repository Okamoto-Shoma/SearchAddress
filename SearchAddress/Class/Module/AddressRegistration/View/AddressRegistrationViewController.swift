//
//  AddressRegistrationViewController.swift
//  PizzaConsumerAddress
//
//  Created by 岡本 翔真 on 2022/01/25.
//

import UIKit

final class AddressRegistrationViewController: UIViewController {
    var presenter: AddressRegistrationPresenterProtocol?

    // private
    private let addressList = [
        Const.Word.NewAddress.address.centerAndNorthAddress,
        Const.Word.NewAddress.address.riverAddress,
        Const.Word.NewAddress.address.hillAddress,
        Const.Word.NewAddress.address.underTheSeaweedAddress
    ]
    private var cellTitles: [String] = [
        Const.Word.NewAddress.detailAddress.northAddress,
        Const.Word.NewAddress.detailAddress.westAddress,
        Const.Word.NewAddress.detailAddress.detailFirstAddress,
        Const.Word.NewAddress.detailAddress.detailSecondAddress
    ]

    // IBOutlet
    @IBOutlet private weak var firstNameTextField: UITextField!
    @IBOutlet private weak var lastNameTextField: UITextField!
    @IBOutlet private weak var buildingNameTextField: UITextField!
    @IBOutlet private weak var roomNumberTextField: UITextField!
    @IBOutlet private weak var pickerView: UIPickerView!
    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            self.tableView.register(R.nib.southWestAddressCell)
        }
    }
    @IBOutlet private weak var registrationButton: UIButton!

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        self.presenter?.viewWillAppear()
    }

    // MARK: - IBAction

    /// 姓TextFieldの編集後
    ///
    /// - Parameter sender: UITextField
    @IBAction func firstNameEdited(_ sender: UITextField) {
        self.presenter?.editedFirstName(sender.text ?? Const.kEmpty)
    }

    /// 名TextFieldの編集後
    ///
    /// - Parameter sender: UITextField
    @IBAction func lastNameEdited(_ sender: UITextField) {
        self.presenter?.editedLastName(sender.text ?? Const.kEmpty)
    }

    /// 建物名TextFieldの編集後
    ///
    /// - Parameter sender: UITextField
    @IBAction func buildingNameEdited(_ sender: UITextField) {
        self.presenter?.editedBuildingName(sender.text ?? Const.kEmpty)
    }

    /// 部屋番号TextFieldの編集後
    ///
    /// - Parameter sender: UITextField
    @IBAction func roomNumberEdited(_ sender: UITextField) {
        self.presenter?.editedRoomNumber(sender.text ?? Const.kEmpty)
    }

    /// 登録ボタン押下時
    ///
    /// - Parameter sender: UIButton
    @IBAction private func registrationButtonTapped(_ sender: UIButton) {
        self.presenter?.registrationButtonTapped()
    }
}

// MARK: - AddressRegistrationViewProtocol

extension AddressRegistrationViewController: AddressRegistrationViewProtocol {

    /// TableViewのセルを適用
    ///
    /// - Parameter cellTitles: セル文言
    func applyTableViewCell(cellTitles: [String]) {
        self.cellTitles = cellTitles

        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension AddressRegistrationViewController: UITableViewDelegate, UITableViewDataSource {

    /// セクション数を設定
    ///
    /// - Parameter tableView: UITableView
    /// - Returns: セクション数
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    /// セル数を設定
    ///
    /// - Parameters:
    ///   - tableView: UITableView
    ///   - section: セクション情報
    /// - Returns: セル数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cellTitles.count
    }

    /// セルの高さを設定
    ///
    /// - Parameters:
    ///   - tableView: UITableView
    ///   - indexPath: セクション情報及びセル情報
    /// - Returns: セルの高さ
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(Const.Int.TableView.cellHeight32)
    }

    /// セルの内容を設定
    ///
    /// - Parameters:
    ///   - tableView: UITableView
    ///   - indexPath: セクション情報及びセル情報
    /// - Returns: セル
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: R.nib.southWestAddressCell.identifier, for: indexPath) as! SouthWestAddressCell

        cell.setup(title: self.cellTitles[indexPath.row])

        cell.valueCallBack = { [weak self] text in
            guard let self = self else { return }

            self.presenter?.editAddressText(row: indexPath.row,
                                            text: text)
        }

        cell.selectionStyle = .none

        return cell
    }
}

// MARK: - UIPickerViewDelegate, UIPickerViewDataSource

extension AddressRegistrationViewController: UIPickerViewDelegate, UIPickerViewDataSource {

    /// コンポーネント数を設定
    ///
    /// - Parameter pickerView: UIPickerView
    /// - Returns: コンポーネント数
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    /// コンポーネント内の数を設定
    ///
    /// - Parameters:
    ///   - pickerView: UIPickerView
    ///   - component: コンポーネント
    /// - Returns: コンポーネント内の数
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.addressList.count
    }

    /// コンポーネント名を設定
    ///
    /// - Parameters:
    ///   - pickerView: UIPickerView
    ///   - row: 洗濯中のセル
    ///   - component: コンポーネント
    /// - Returns: コンポーネント名
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.addressList[row]
    }

    /// UIPickerViewのRowが選択された時の挙動
    ///
    /// - Parameters:
    ///   - pickerView: UIPickerView
    ///   - row: 選択したPicker
    ///   - component: コンポーネント
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.presenter?.selectPickerView(selectedRow: row)
    }
}

// MARK: - UITextFieldDelegate

extension AddressRegistrationViewController: UITextFieldDelegate {

    /// TextFieldの編集時にReturnが押下された時
    ///
    /// - Parameter textField: UITextField
    /// - Returns: Returnを許可するか
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()

        return true
    }
}
