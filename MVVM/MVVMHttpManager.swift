//
//  MVVMHttpManager.swift
//  AllSwiftSamples
//
//  Created by DEFTeam on 31/07/20.
//  Copyright © 2020 XYZ. All rights reserved.
//

import Foundation

class MVVMHttpManager {
    static let shared: MVVMHttpManager = MVVMHttpManager()

    enum HTTPError: Error {
        case invalidURL
        case invalidResponse(Data?, URLResponse?)
    }

    public func get(urlString: String, completion: @escaping (Result<Data, Error>) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(.failure(HTTPError.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in

            guard error == nil else {
                completion(.failure(error!))
                return
            }

            guard let responseData = data,
                  let httpResponse = response as? HTTPURLResponse,
                  200 ..< 300 ~= httpResponse.statusCode else {
                    completion(.failure(HTTPError.invalidResponse(data, response)))
                    return
            }
            completion(.success(responseData))

        }
        task.resume()
    }

}
