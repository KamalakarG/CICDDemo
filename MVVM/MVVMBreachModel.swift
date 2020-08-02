//
//  MVVMBreachModel.swift
//  AllSwiftSamples
//
//  Created by DEFTeam on 31/07/20.
//  Copyright © 2020 XYZ. All rights reserved.
//

import Foundation

struct MVVMBreachModel: Codable {
    let name: String = ""
    let title: String = ""
    let domain: String = ""
    let breachDate: String = ""
    var breachDateformatted: String? { return usDateToUK(breachDate) }
    let addedDate: String = ""
    let modifiedDate: String = ""
    let pwnCount: Int = 0
    let description: String = ""
    let logoPath: String = ""
    let dataClasses: [String] = [String]()
    let verified: Bool = false
    let fabricated: Bool = false
    let sensitive: Bool = false
    let retired: Bool = false
    let spam: Bool = false

    private enum CodingKeys: String, CodingKey {
        case name = "Name"
        case title = "Title"
        case domain = "Domain"
        case breachDate = "BreachDate"
        case addedDate = "AddedDate"
        case modifiedDate = "ModifiedDate"
        case pwnCount = "PwnCount"
        case description = "Description"
        case logoPath = "LogoPath"
        case dataClasses = "DataClasses"
        case verified = "IsVerified"
        case fabricated = "IsFabricated"
        case sensitive = "IsSensitive"
        case retired = "IsRetired"
        case spam = "IsSpamList"
    }

    func usDateToUK (_ inpDate: String) -> String {
        let dateAsString = inpDate
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-mm-dd"
        if let date = dateFormatter.date(from: dateAsString) {
            dateFormatter.dateFormat = "dd-MMM-yyyy"
            let outputDate = dateFormatter.string(from: date)
            return outputDate
        }
        return inpDate
    }
}
