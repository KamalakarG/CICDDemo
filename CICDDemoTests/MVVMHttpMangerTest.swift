//
//  MVVMHttpMangerTest.swift
//  AllSwiftSamplesTests
//
//  Created by DEFTeam on 01/08/20.
//  Copyright © 2020 XYZ. All rights reserved.
//

import XCTest
@testable import CICDDemo

class MVVMHttpMangerTest: XCTestCase {

    override func setUp() {
    }

    override func tearDown() {
    }

    func testGetBreaches() {
        let expectation = XCTestExpectation(description: "must get breaches")
        MVVMHttpManager.shared.get(urlString: baseUrl + breachesExtensionURL) {
            result in
            
            switch result {
            case .failure(let error):
                XCTFail(error.localizedDescription)
            case .success(let dta):
                let decoder = JSONDecoder()
                do {
                   let temp = try decoder.decode([MVVMBreachModel].self, from: dta)
                    XCTAssertNotNil(temp, "No data was downloded")
                    XCTAssertGreaterThan(temp.count, 0, "count should not be zero")
                    //XCTAssertEqual(temp.count, 467, "must be 467")
                    expectation.fulfill()
               } catch let err {
                XCTFail(err.localizedDescription)
               }
            }
        }
        wait(for: [expectation], timeout: 10.0)
    }

}
