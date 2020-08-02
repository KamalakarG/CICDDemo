//
//  SubstarctionModelTest.swift
//  CICDDemoTests
//
//  Created by DEFTeam on 01/08/20.
//  Copyright © 2020 com.defteam.com. All rights reserved.
//

import XCTest
@testable import CICDDemo

class SubstarctionModelTest: XCTestCase {

    var substarctionModel: SubstractionModel?
    
    override func setUp() {
        substarctionModel = SubstractionModel()
    }

    override func tearDown() {
        substarctionModel = nil
    }
    
    func testSubstraction() {
        let result = substarctionModel?.getSubtract(value1: 5, value2: 10)
        XCTAssertEqual(result, 5, "5 - 10 should be 5")
    }

}
