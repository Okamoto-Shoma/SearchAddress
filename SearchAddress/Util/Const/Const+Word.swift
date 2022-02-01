//
//  Const+Word.swift
//  PizzaConsumerAddress
//
//  Created by 岡本 翔真 on 2022/01/25.
//

import Foundation

extension Const {
    struct Word {
        struct Error {
            static let addressRegistrationFailed = "住所情報の登録に失敗しました。"
            static let addressIDUpdateFailed = "最上位住所IDの更新に失敗しました。"
        }

        struct Home {
            static let newAddressText = "新規登録"
            static let addressListText = "住所一覧"
        }

        struct NewAddress {
            struct address {
                static let centerAndNorthAddress = "中央区、南区"
                static let riverAddress = "界川"
                static let hillAddress = "旭ヶ丘"
                static let underTheSeaweedAddress = "藻岩下"
            }
            struct detailAddress {
                static let northAddress = "南"
                static let westAddress = "西"
                static let address = "丁目"
                static let detailFirstAddress = "番"
                static let detailSecondAddress = "号"
            }
        }
    }
}
