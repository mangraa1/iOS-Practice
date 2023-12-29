//
//  NetworkDataFetcher.swift
//  Basic request
//
//  Created by mac on 29.12.2023.
//

import Foundation

protocol DataFetcherProtocol {
    func fetchGenericJSONData<T: Codable>(from request: URLRequest, completion: @escaping (T?) -> Void)
}

class NetworkDataFetcher: DataFetcherProtocol {
    
    func fetchGenericJSONData<T: Codable>(from request: URLRequest, completion: @escaping (T?) -> Void) {

        let task = URLSession.shared.dataTask(with: request) { data, response, error in

            let objects = self.decodedJSON(type: Users.self, with: data)

            if objects != nil {
                completion(objects as? T)
            } else {
                completion([] as? T)
            }
        }

        task.resume()
    }

    func decodedJSON<T: Codable>(type: T.Type, with data: Data?) -> T? {

        do {
            guard let data = data else { return nil }
            let objects = try JSONDecoder().decode(type.self, from: data)
            return objects
        } catch let error {
            print("Error: ", error.localizedDescription)
            return nil
        }
    }
}
