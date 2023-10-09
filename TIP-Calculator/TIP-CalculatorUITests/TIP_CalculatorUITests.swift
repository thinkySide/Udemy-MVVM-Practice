//
//  TIP_CalculatorUITests.swift
//  TIP-CalculatorUITests
//
//  Created by 김민준 on 10/3/23.
//

import XCTest

final class TIP_CalculatorUITests: XCTestCase {

    private var app: XCUIApplication!
    
    private var screen: CalculatorScreen {
        CalculatorScreen(app: app)
    }
    
    override func setUp() {
        super.setUp()
        app = .init()
        app.launch()
    }
    
    override func tearDown() {
        super.tearDown()
        app = nil
    }
    
    func testResultViewDefaultValues() {
        XCTAssertEqual(screen.totalAmountPerPersonValueLabel.label, "$0")
        XCTAssertEqual(screen.totalBillValueLabel.label, "$0")
        XCTAssertEqual(screen.totalTipValueLabel.label, "$0")
    }
    
    func testRegularTip() {
        screen.enterBill(amout: 100)
        XCTAssertEqual(screen.totalAmountPerPersonValueLabel.label, "$100")
        XCTAssertEqual(screen.totalBillValueLabel.label, "$100")
        XCTAssertEqual(screen.totalTipValueLabel.label, "$0")
        
        screen.selectTip(tip: .tenPercent)
        XCTAssertEqual(screen.totalAmountPerPersonValueLabel.label, "$110")
        XCTAssertEqual(screen.totalBillValueLabel.label, "$110")
        XCTAssertEqual(screen.totalTipValueLabel.label, "$10")
        
        screen.selectTip(tip: .fifteenPercent)
        XCTAssertEqual(screen.totalAmountPerPersonValueLabel.label, "$115")
        XCTAssertEqual(screen.totalBillValueLabel.label, "$115")
        XCTAssertEqual(screen.totalTipValueLabel.label, "$15")
        
        screen.selectTip(tip: .twentyPercent)
        XCTAssertEqual(screen.totalAmountPerPersonValueLabel.label, "$120")
        XCTAssertEqual(screen.totalBillValueLabel.label, "$120")
        XCTAssertEqual(screen.totalTipValueLabel.label, "$20")
        
        screen.selectIncrementButton(numberOfTaps: 3)
        XCTAssertEqual(screen.totalAmountPerPersonValueLabel.label, "$30")
        XCTAssertEqual(screen.totalBillValueLabel.label, "$120")
        XCTAssertEqual(screen.totalTipValueLabel.label, "$20")
        
        screen.selectDecrementButton(numberOfTaps: 2)
        XCTAssertEqual(screen.totalAmountPerPersonValueLabel.label, "$60")
        XCTAssertEqual(screen.totalBillValueLabel.label, "$120")
        XCTAssertEqual(screen.totalTipValueLabel.label, "$20")
    }
    
    func testCustomTipAndSplitBillBy2() {
        screen.enterBill(amout: 300)
        screen.selectTip(tip: .custom(value: 200))
        screen.selectIncrementButton(numberOfTaps: 1)
        XCTAssertEqual(screen.totalBillValueLabel.label, "$500")
        XCTAssertEqual(screen.totalTipValueLabel.label, "$200")
        XCTAssertEqual(screen.totalAmountPerPersonValueLabel.label, "$250")
    }
    
    func testResetButton() {
        screen.enterBill(amout: 300)
        screen.selectTip(tip: .custom(value: 200))
        screen.selectIncrementButton(numberOfTaps: 1)
        screen.doubleTapLogoView()
        XCTAssertEqual(screen.totalBillValueLabel.label, "$0")
        XCTAssertEqual(screen.totalTipValueLabel.label, "$0")
        XCTAssertEqual(screen.totalAmountPerPersonValueLabel.label, "$0")
        XCTAssertEqual(screen.billInputViewTextField.label, "")
        XCTAssertEqual(screen.splitValueLabel.label, "1")
        XCTAssertEqual(screen.customTipButton.label, "Custom tip")
    }
}
