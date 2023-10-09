//
//  Tip_CalculatorSnapshotTest.swift
//  TIP-CalculatorTests
//
//  Created by 김민준 on 10/9/23.
//

import XCTest
import SnapshotTesting
@testable import TIP_Calculator

final class Tip_CalculatorSnapshotTest: XCTestCase {
    
    private var screenWidth: CGFloat {
        return UIScreen.main.bounds.size.width
    }
    
    func testLogoView() {
        let size = CGSize(width: screenWidth, height: 48)
        
        let view = LogoView()
        
        assertSnapshot(matching: view, as: .image(size: size))
    }
    
    func testInitialResultView() {
        let size = CGSize(width: screenWidth, height: 224)
        let view = ResultView()
        assertSnapshot(matching: view, as: .image(size: size))
    }
    
    func testResultViewWithValue() {
        let size = CGSize(width: screenWidth, height: 224)
        let result = Result(amountPerPerson: 100.25, totalBill: 45, totalTip: 60)
        let view = ResultView()
        view.configure(result: result)
        assertSnapshot(matching: view, as: .image(size: size))
    }
    
    func testInitialBillInputView() {
        let size = CGSize(width: screenWidth, height: 56)
        let view = BillInputView()
        assertSnapshot(matching: view, as: .image(size: size))
    }
    
    func testBillInputViewWithValue() {
        let size = CGSize(width: screenWidth, height: 56)
        let view = BillInputView()
        let textField = view.allSubViewsOf(type: UITextField.self).first
        textField?.text = "500"
        assertSnapshot(matching: view, as: .image(size: size))
    }
    
    func testInitialTipInputView() {
        let size = CGSize(width: screenWidth, height: 56+56+16)
        let view = TipInputView()
        assertSnapshot(matching: view, as: .image(size: size))
    }
    
    func testTipInputViewWithSelection() {
        let size = CGSize(width: screenWidth, height: 56+56+16)
        let view = TipInputView()
        let button = view.allSubViewsOf(type: UIButton.self).first
        button?.sendActions(for: .touchUpInside)
        assertSnapshot(matching: view, as: .image(size: size))
    }
    
    func testInitialSplitInputView() {
        let size = CGSize(width: screenWidth, height: 56)
        let view = SplitInputView()
        assertSnapshot(matching: view, as: .image(size: size))
    }
    
    func testSplitInputViewWithSelection() {
        let size = CGSize(width: screenWidth, height: 56)
        let view = SplitInputView()
        let button = view.allSubViewsOf(type: UIButton.self).last
        button?.sendActions(for: .touchUpInside)
        assertSnapshot(matching: view, as: .image(size: size))
    }
}

extension UIView {
    func allSubViewsOf<T: UIView>(type: T.Type) -> [T] {
        var all = [T]()
        func getSubView(view: UIView) {
            if let aView = view as? T {
                all.append(aView)
            }
            guard view.subviews.count > 0 else { return }
            view.subviews.forEach { getSubView(view: $0) }
        }
        getSubView(view: self)
        return all
    }
}
