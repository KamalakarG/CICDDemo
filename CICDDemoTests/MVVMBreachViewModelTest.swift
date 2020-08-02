//
//  MVVMBreachViewModelTest.swift
//  AllSwiftSamplesTests
//
//  Created by DEFTeam on 01/08/20.
//  Copyright © 2020 XYZ. All rights reserved.
//

import XCTest
@testable import CICDDemo

class MVVMBreachViewModelTest: XCTestCase {

    var breachViewModel: MVVMBreachViewModel?
    
    override func setUp() {
        breachViewModel = MVVMBreachViewModel()
    }

    override func tearDown() {
        breachViewModel = nil
    }

    func testToGetBreaches() {
        let expectation = XCTestExpectation(description: "must get all breaches")
        breachViewModel?.fetchBreaches(completion: { _ in
            //self.testBreachesCount()
            expectation.fulfill()
        })
        wait(for: [expectation], timeout: 10.0)
    }

    func testBreachesCount() {
//        XCTAssertEqual(breachViewModel?.breaches.count, 467, "didn't get all breaches")
    }

}
