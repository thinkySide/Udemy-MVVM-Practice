//
//  ViewController.swift
//  TIP-Calculator
//
//  Created by 김민준 on 10/3/23.
//

import UIKit

class CalculatorVC: UIViewController {
    
    private let logoView = LogoView()
    private let resultView = ResultView()
    private let billInputView = BillInputView()
    private let tipInputView = TipInputView()
    private let splitInputView = SplitInpitView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGreen
    }


}

