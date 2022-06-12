//
//  HomeViewController.swift
//  PizzaConsumerAddress
//
//  Created by 岡本 翔真 on 2022/01/25.
//

import UIKit

final class HomeViewController: UIViewController {
    var presenter: HomePresenterProtocol?

    // IBOutlet
    @IBOutlet private weak var newAddressButton: UIButton!
    @IBOutlet private weak var addressListButton: UIButton!
    @IBOutlet private weak var newAddressLabel: UILabel!
    @IBOutlet private weak var addressListLabel: UILabel!
    @IBOutlet private var buttons: [UIButton] = []

    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()

        self.presenter?.viewDidLoad()
    }

    // MARK: - IBAction

    /// 新規登録ボタン押下時
    ///
    /// - Parameter sender: UIButton
    @IBAction func newRegistrationButtonTapped(_ sender: UIButton) {
        self.presenter?.addressRegistrationButtonTapped()
    }

    /// 住所一覧ボタン押下時
    ///
    /// - Parameter sender: UIButton
    @IBAction func addressListButtonTapped(_ sender: UIButton) {
        self.presenter?.addressListButtonTapped()
    }

    // MARK: - PrivateMethods

    /// 文言の適用
    private func applyText() {
        self.newAddressLabel.text = Const.Word.Home.newAddressText
        self.addressListLabel.text = Const.Word.Home.addressListText
    }
}

// MARK: - HomeViewProtocol

extension HomeViewController: HomeViewProtocol {

    // TODO: 正直PrivateMethodでいい。今回はVIPERの学習ということで無理矢理presenterを介している
    /// デザインの適用
    func applyDesign() {
        DispatchQueue.main.async {
            self.newAddressLabel.font = UIFont.systemFont(ofSize: CGFloat(Const.Int.Button.buttonFontSize40))
            self.addressListLabel.font = UIFont.systemFont(ofSize: CGFloat(Const.Int.Button.buttonFontSize40))
            self.buttons.forEach {
                $0.gradationLayer.colors = [UIColor(named: Const.Color.buttonStartGradationColor)!.cgColor,
                                            UIColor(named: Const.Color.buttonEndGradationColor)!.cgColor]
                $0.layer.shadowColor = UIColor(named: Const.Color.buttonShadowColor)!.cgColor
                $0.layer.shadowOffset = CGSize(width: CGFloat(Const.Int.Button.shadowOffSet3), height: CGFloat(Const.Int.Button.shadowOffSet3))
                $0.layer.shadowRadius = CGFloat(Const.Int.Button.cornerRadius15)
                $0.layer.shadowOpacity = 1
                $0.layer.cornerRadius = CGFloat(Const.Int.Button.cornerRadius15)
            }
        }

        self.applyText()
    }
}
