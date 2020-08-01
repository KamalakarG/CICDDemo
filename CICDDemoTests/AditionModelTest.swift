//
//  AditionModelTest.swift
//  CICDDemoTests
//
//  Created by DEFTeam on 01/08/20.
//  Copyright © 2020 com.defteam.com. All rights reserved.
//

import XCTest
@testable import CICDDemo

class AditionModelTest: XCTestCase {

    var additionModel: AdditionModel?
    
    override func setUp() {
        additionModel = AdditionModel()
    }

    override func tearDown() {
        additionModel = nil
    }
    
    func testAddition() {
        let result = additionModel?.getSum(a: 3, b: 5)
        XCTAssertEqual(result, 9, "sum of 3 and 5 should be 8")
    }

}
