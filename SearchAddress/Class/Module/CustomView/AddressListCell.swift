//
//  AddressListCell.swift
//  PizzaConsumerAddress
//
//  Created by 岡本 翔真 on 2022/01/27.
//

import UIKit

final class AddressListCell: UITableViewCell {

    // IBOutlet
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var firstAddressLabel: UILabel!
    @IBOutlet private weak var secondAddressLabel: UILabel!
    @IBOutlet private weak var buildingNameLabel: UILabel!
    @IBOutlet private weak var roomNumberLabel: UILabel!

    // MARK: - Life Cycle

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    // MARK: - Public Methods

    /// セットアップ
    ///
    /// - Parameters:
    ///   - name: 氏名
    ///   - firstAddress: 住所1
    ///   - secondAddress: 住所2
    ///   - buildingName: 建物名
    ///   - roomNumber: 部屋番号
    func setup(name: String,
               firstAddress: String,
               secondAddress: String,
               buildingName: String = Const.kEmpty,
               roomNumber: String = Const.kEmpty) {
        self.titleLabel.text = name
        self.firstAddressLabel.text = firstAddress
        self.secondAddressLabel.text = secondAddress
        self.buildingNameLabel.text = buildingName
        self.roomNumberLabel.text = roomNumber
    }
}
