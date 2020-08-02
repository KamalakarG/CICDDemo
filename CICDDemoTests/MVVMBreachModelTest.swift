//
//  MVVMBreachModelTest.swift
//  CICDDemoTests
//
//  Created by DEFTeam on 02/08/20.
//  Copyright © 2020 com.defteam.com. All rights reserved.
//

import XCTest
@testable import CICDDemo

class MVVMBreachModelTest: XCTestCase {

    var breachModel: MVVMBreachModel?
    override func setUp() {
        breachModel = MVVMBreachModel()
    }

    override func tearDown() {
        breachModel = nil
    }

    func testUstoUkDate() {
        let date = breachModel?.usDateToUK("2015-03-01")
        XCTAssertEqual(date, "01-Jan-2015", "date is not formatted")
    }

}
