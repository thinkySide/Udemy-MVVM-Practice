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
    
    func testInitialBillInputView() {
        let size = CGSize(width: screenWidth, height: 56)
        let view = BillInputView()
        assertSnapshot(matching: view, as: .image(size: size))
    }
    
    func testInitialTipInputView() {
        let size = CGSize(width: screenWidth, height: 56+56+16)
        let view = TipInputView()
        assertSnapshot(matching: view, as: .image(size: size))
    }
    
    func testInitialSplitInputView() {
        let size = CGSize(width: screenWidth, height: 56)
        let view = SplitInputView()
        assertSnapshot(matching: view, as: .image(size: size))
    }
}
