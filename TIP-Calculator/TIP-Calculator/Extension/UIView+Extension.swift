//
//  UIView+Extension.swift
//  TIP-Calculator
//
//  Created by 김민준 on 10/3/23.
//

import UIKit

extension UIView {
    
    func addShadow(
        offset: CGSize,
        color: UIColor,
        radius: CGFloat,
        opacity: Float) {
            layer.cornerRadius = radius
            layer.masksToBounds = false
            layer.shadowOffset = offset
            layer.shadowColor = color.cgColor
            layer.shadowRadius = radius
            layer.shadowOpacity = opacity
            
            let backgroundCGColor = backgroundColor?.cgColor
            backgroundColor = nil
            layer.backgroundColor = backgroundCGColor
    }
}
