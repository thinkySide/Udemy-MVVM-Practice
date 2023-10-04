//
//  Tip.swift
//  TIP-Calculator
//
//  Created by 김민준 on 10/4/23.
//

import Foundation

enum Tip {
    case none
    case tenPercent
    case fiftenPercent
    case twentyPercent
    case custom(value:Int)
    
    var stringValue: String {
        switch self {
        case .none:
            ""
        case .tenPercent:
            "10%"
        case .fiftenPercent:
            "15%"
        case .twentyPercent:
            "20%"
        case .custom(value: let value):
            "\(value)"
        }
    }
}
