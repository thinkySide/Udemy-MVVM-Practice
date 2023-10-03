//
//  SplitInpitView.swift
//  TIP-Calculator
//
//  Created by 김민준 on 10/3/23.
//

import UIKit

class SplitInpitView: UIView {
    
    init() {
        super.init(frame: .zero)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layout() {
        backgroundColor = .systemPurple
    }
}
