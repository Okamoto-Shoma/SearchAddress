//
//  AddressType.swift
//  PizzaConsumerAddress
//
//  Created by 岡本 翔真 on 2022/01/31.
//

import Foundation

enum AddressType: Int, CaseIterable {
    case centerNorth
    case river
    case hill
    case underTheSeaweed

    // 表示用文言
    var displayName: String {

        switch self {
        case .centerNorth: return Const.Word.NewAddress.address.centerAndNorthAddress
        case .river: return Const.Word.NewAddress.address.riverAddress
        case .hill: return Const.Word.NewAddress.address.hillAddress
        case .underTheSeaweed: return Const.Word.NewAddress.address.underTheSeaweedAddress
        }
    }
}
