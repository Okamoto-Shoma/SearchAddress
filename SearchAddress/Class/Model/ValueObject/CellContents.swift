//
//  CellContents.swift
//  PizzaConsumerAddress
//
//  Created by 岡本 翔真 on 2022/01/27.
//

import Foundation

struct CellContents {
    var name: String
    var firstAddress: String
    var secondAddress: String
    var buildingName: String
    var roomNumber: String

    init(name: String,
         firstAddress: String,
         secondAddress: String,
         buildingName: String,
         roomNumber: String) {
        self.name = name
        self.firstAddress = firstAddress
        self.secondAddress = secondAddress
        self.buildingName = buildingName
        self.roomNumber = roomNumber
    }
}
//
//extension CellContents: Equatable {
//    public static func == (lhs: CellContents<T>, rhs: CellContents<T>) -> Bool {
//        return (lhs.name == rhs.name &&
//                lhs.firstAddress == rhs.firstAddress &&
//                lhs.secondAddress == rhs.secondAddress &&
//                lhs.buildingName == rhs.buildingName &&
//                lhs.roomNumber == rhs.roomNumber)
//    }
//}
