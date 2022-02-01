//
//  SouthWestAddressCell.swift
//  PizzaConsumerAddress
//
//  Created by 岡本 翔真 on 2022/01/26.
//

import UIKit

final class SouthWestAddressCell: UITableViewCell {
    // Public
    var valueCallBack: (_ value: String) -> Void = { _ in }
    var beginEditCallBack: (_ textField: UITextField) -> Void = { _ in }

    // IBOutlet
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var textField: UITextField!

    // MARK: - LifeCycle

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    // MARK: - PublicMethods

    /// セットアップ
    ///
    /// - Parameters:
    ///   - title: タイトル
    ///   - text: 文言
    func setup(title: String,
               text: String = Const.kEmpty) {
        self.titleLabel.text = title
        self.textField.text = text
    }
}

// MARK: - UITextFieldDelegate

extension SouthWestAddressCell: UITextFieldDelegate {

    /// TextFieldの編集時にReturnが押下された時
    ///
    /// - Parameter textField: UITextField
    /// - Returns: Returnを許可するか
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    /// TextFieldの編集が開始された時
    ///
    /// - Parameter textField: UITextField
    /// - Returns: 編集を許可するか
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        self.beginEditCallBack(textField)
        return true
    }

    /// TextFieldの編集が終了する直後
    ///
    /// - Parameter textField: TextField
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = textField.text else { return }

        self.valueCallBack(text)
    }
}
