//
//  NetworkService.swift
//  MVP
//
//  Created by mac on 28.10.2023.
//

import Foundation


protocol NetworkServiceProtocol: AnyObject {
    func getComments(completion: @escaping (Result <[CommentModel]?, Error>) -> Void)
}

class NetworkService: NetworkServiceProtocol {
    func getComments(completion: @escaping (Result<[CommentModel]?, Error>) -> Void) {
        let urlString = "https://jsonplaceholder.typicode.com/comments"
        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            do {
                let obj = try JSONDecoder().decode([CommentModel].self, from: data!)
                completion(.success(obj))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
