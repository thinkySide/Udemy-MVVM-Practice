//
//  UIResponder+Extension.swift
//  TIP-Calculator
//
//  Created by 김민준 on 10/8/23.
//

import UIKit

extension UIResponder {
    var parentViewController: UIViewController? {
        return next as? UIViewController ?? next?.parentViewController
    }
}
