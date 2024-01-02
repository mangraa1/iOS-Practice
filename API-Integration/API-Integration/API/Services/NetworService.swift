//
//  NetworkManager.swift
//  API-Integration
//
//  Created by mac on 02.01.2024.
//

import Foundation
import Alamofire

class NetworkService {

    //MARK: - Internal properties
    static let shared = NetworkService()

    //MARK: - Initialization
    private init() {}

    //MARK: - External methods

    public func sendMultipleRequests<T: Codable>(baseURLString: String, paths: [Int], responseType: T.Type, completion: @escaping (Result<[T], Error>) -> Void) {

        // Create a group for tracking requests
        let group = DispatchGroup()

        var results: [T] = []
        var errors: [Error] = []

        // Get all the characters
        for path in paths {
            let urlString = baseURLString + "\(path)"

            // Login to the group before each request
            group.enter()

            sendRequest(urlString: urlString, responseType: responseType, group: group) { result in
                switch result {
                case .success(let dataModel):
                    results.append(dataModel)
                case .failure(let error):
                    errors.append(error)
                }
            }
        }

        // Wait for all requests to complete
        group.notify(queue: .main) {
            if !errors.isEmpty {
                completion(.failure(errors.first!))
            } else {
                completion(.success(results))
            }
        }
    }

    //MARK: - Internal methods
    private func sendRequest<T: Codable>(urlString: String, responseType: T.Type, group: DispatchGroup, completion: @escaping (Result<T, Error>) -> Void) {

        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }

        AF.request(url).responseDecodable(of: responseType) { response in
            switch response.result {
            case .success(let dataModel):
                completion(.success(dataModel))
            case .failure(let error):
                completion(.failure(error))
            }

            // Exit the group after processing the response
            group.leave()
        }
    }
}
