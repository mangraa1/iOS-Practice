//
//  LocalDataFetcher.swift
//  SOLID
//
//  Created by mac on 14.11.2023.
//

import Foundation


class LocalDataFetcher: NetworkDataFetcher {
    
    override func fetchGenericJSONData<T>(urlString: String, response: @escaping (T?) -> Void) where T : Decodable {
        guard let file = Bundle.main.url(forResource: urlString, withExtension: nil) else {
            print("Couldn't find \(urlString) in main bundle.")
            return
        }

        let data = try? Data(contentsOf: file)

        let decoded = self.decodedJSON(type: T.self, from: data)
        response(decoded)
    }
}
