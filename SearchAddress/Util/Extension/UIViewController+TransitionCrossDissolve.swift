//
//  UIViewController+TransitionCrossDissolve.swift
//  PizzaConsumerAddress
//
//  Created by 岡本 翔真 on 2022/01/26.
//

import UIKit

extension UIViewController {

    func pushViewController(_ nextViewController: UIViewController) {
        UIView.transition(with: (self.navigationController?.view)!,
                          duration: 0.5,
                          options: .transitionCrossDissolve,
                          animations: { () -> Void in
            self.navigationController?.pushViewController(nextViewController, animated: false)
        },
                          completion: nil)
    }
}
