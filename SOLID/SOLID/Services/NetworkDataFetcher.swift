//
//  NetworkDataFetcher.swift
//  SOLID
//
//  Created by mac on 12.11.2023.
//

import Foundation


class NetworkDataFetcher {

    let networkService: NetworkService!

    init(networkService: NetworkService = NetworkService()) {
        self.networkService = networkService
    }

    func fetchCountry(with urlString: String, completion: @escaping ([Country]?) -> Void) {
        networkService.request(urlString: urlString) { data, error in
            do {
                let decoder = JSONDecoder()
                guard let data = data else { return }
                let response = try decoder.decode([Country].self, from: data)
                completion(response)
            } catch let error {
                print("Error: ", error.localizedDescription)
            }
        }
    }
}
