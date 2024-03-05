//
//  DataManager.swift
//  MarketCircleAssessment
//
//  Created by Sagar Gupta on 05/03/24.
//

import Foundation

enum DataManagerError: Error {
    case jsonFileNotFound
    case dataDecodingError
    case none
    
    var message: String {
        switch self {
        case .dataDecodingError:
            "Data decoding error."
        case .jsonFileNotFound:
            "json file not found"
        case .none:
            ""
        }
    }
    
}

class DataManager {
    
    ///  Read data from loca json file
    /// - Parameter completion: completion block
    func getData(completion:(Result<[MyData], DataManagerError>) -> Void) {
        guard let url = Bundle.main.url(forResource: "data", withExtension: "json") else { return completion(.failure(.jsonFileNotFound)) }
        guard let data = try? Data(contentsOf: url) else { return completion(.failure(.jsonFileNotFound)) }
        let decoder = JSONDecoder()
        guard let decodData = try? decoder.decode([MyData].self, from: data) else { return completion(.failure(.dataDecodingError)) }
        completion(.success(decodData))
    }
    
}
