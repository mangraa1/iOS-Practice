//
//  NetworkService.swift
//  SOLID
//
//  Created by mac on 12.11.2023.
//

import UIKit


class NetworkService {

    //MARK: - External logic
    func request(urlString: String, completion: @escaping (Data?, Error?) -> Void) {
        guard let url = URL(string: urlString) else { return }

        let request = URLRequest(url: url)
        let task = createDataTask(from: request, completion: completion)
        task.resume()
    }

    //MARK: - Internal logic
    private func createDataTask(from request: URLRequest, completion: @escaping (Data?, Error?) -> Void) -> URLSessionDataTask {
        return URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                completion(data, error)
            }
        }
    }
}
