//
//  MVVMBreachViewModel.swift
//  AllSwiftSamples
//
//  Created by DEFTeam on 31/07/20.
//  Copyright © 2020 XYZ. All rights reserved.
//

import Foundation

class MVVMBreachViewModel {
    // MARK: - Initialization
    init(model: [MVVMBreachModel]? = nil) {
        if let inputModel = model {
            breaches = inputModel
        }
    }
    var breaches = [MVVMBreachModel]()

    func sumOfPrimes(max: Int) -> Int {            // +1
        var total = 0
        OUT: for value1 in 1..<max {
            for value2 in 2..<value1 {
                if value1 % value2 == 0 {
                    continue OUT
                }
            }
            total += value1
        }
        return total
    }
}

extension MVVMBreachViewModel {

    func fetchBreaches(completion: @escaping (Result<[MVVMBreachModel], Error>) -> Void) {
        MVVMHttpManager.shared.get(urlString: baseUrl+breachesExtensionURL) { [weak self] (result) in
            guard let self = self else {return}
            switch result {
            case .failure(let error):
                print("failure", error)
            case .success(let dta):
                let decoder = JSONDecoder()
                do {
                    self.breaches = try decoder.decode([MVVMBreachModel].self, from: dta)
                    completion(.success(try decoder.decode([MVVMBreachModel].self, from: dta)))
                } catch { }
            }
        }
    }
}
