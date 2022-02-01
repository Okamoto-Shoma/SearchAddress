//
//  UIButton+CAGradationLayer.swift
//  PizzaConsumerAddress
//
//  Created by 岡本 翔真 on 2022/01/25.
//

import Foundation
import UIKit

extension UIButton {

    var gradationLayer: CAGradientLayer {
        return layer as! CAGradientLayer
    }

    public override static var layerClass: AnyClass {
        return CAGradientLayer.self
    }
}
