//
//  AddressListViewController.swift
//  PizzaConsumerAddress
//
//  Created by 岡本 翔真 on 2022/01/27.
//

import UIKit

final class AddressListViewController: UIViewController {
    var presenter: AddressListPresenterProtocol?

    // private
    private var contents: [CellContents] = []

    // IBOutlet
    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            self.tableView.register(R.nib.addressListCell)
        }
    }

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        self.presenter?.viewWillAppear()
    }
}

// MARK: - AddressListViewProtocol

extension AddressListViewController: AddressListViewProtocol {

    /// データの更新
    ///
    /// - Parameter contents: [CellContents]
    func reloadData(_ contents: [CellContents]) {
        self.contents = contents

        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension AddressListViewController: UITableViewDelegate, UITableViewDataSource {

    /// セクション数を設定
    ///
    /// - Parameter tableView: UITableView
    /// - Returns: セクション数
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.contents.count
    }

    /// セクション内のセル数を設定
    ///
    /// - Parameters:
    ///   - tableView: UITableView
    ///   - section: セクション情報
    /// - Returns: セル数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    /// セルの高さを設定
    ///
    /// - Parameters:
    ///   - tableView: UITableView
    ///   - indexPath: セクション情報及びセル情報
    /// - Returns: セルの高さ
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(Const.Int.TableView.cellHeight119)
    }

    /// セルの内容を設定
    ///
    /// - Parameters:
    ///   - tableView: UITableView
    ///   - indexPath: セクション情報及びセル情報
    /// - Returns: セル
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: R.nib.addressListCell.identifier, for: indexPath) as! AddressListCell

        cell.setup(name: self.contents[indexPath.section].name,
                   firstAddress: self.contents[indexPath.section].firstAddress,
                   secondAddress: self.contents[indexPath.section].secondAddress,
                   buildingName: self.contents[indexPath.section].buildingName,
                   roomNumber: self.contents[indexPath.section].roomNumber)

        return cell
    }

    /// 押下直後の設定
    /// 
    /// - Parameters:
    ///   - tableView: UITableView
    ///   - indexPath: セクション情報及びセル情報
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.presenter?.selectedAddressData(indexPath.section)
        tableView.deselectRow(at: indexPath, animated: true)
    }

    /// 右スワイプ時の設定
    ///
    /// - Parameters:
    ///   - tableView: UITableView
    ///   - indexPath: セクション情報及びセル情報
    /// - Returns: UISwipeActionsConfiguration
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive,
                                            title: "Delete") { (action, view, completionHandler) in
            self.presenter?.rightSwipeTableViewCell(indexPath.section)
            completionHandler(true)
        }

        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
}
