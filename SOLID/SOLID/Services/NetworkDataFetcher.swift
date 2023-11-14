//
//  NetworkDataFetcher.swift
//  SOLID
//
//  Created by mac on 12.11.2023.
//

import Foundation

protocol DataFetcherProtocol {
    func fetchGenericJSONData<T: Decodable>(urlString: String, response: @escaping (T?) -> Void)
}

class NetworkDataFetcher: DataFetcherProtocol {

    //MARK: - Internal variables
    private let networking: Networking

    //MARK: - Initialization
    init(networking: Networking = NetworkService()) {
        self.networking = networking
    }

    func fetchGenericJSONData<T: Decodable>(urlString: String, response: @escaping (T?) -> Void) {
        networking.request(urlString: urlString) { data, error in
            if let error = error {
                print("Error received requesting data: \(error.localizedDescription)")
                response(nil)
            }

            let decoded = self.decodedJSON(type: T.self, from: data)
            response(decoded)
        }
    }

    func decodedJSON<T: Decodable>(type: T.Type, from data: Data?) -> T? {
        do {
            guard let data = data else { return nil }
            let objects = try JSONDecoder().decode(type.self, from: data)
            return objects
        } catch let error {
            print("Failed to decode JSON: ", error)
            return nil
        }
    }
}
