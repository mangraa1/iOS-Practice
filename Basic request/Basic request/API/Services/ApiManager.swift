//
//  ApiManager.swift
//  Basic request
//
//  Created by mac on 28.12.2023.
//

import Foundation


enum ApiType {
    case login
    case getUsers
    case getPosts
    case getAlbums

    var baseURL: String {
        return "https://jsonplaceholder.typicode.com/"
    }

    var headers: [String: String] {
        switch self {
        case .login:
            return ["authToken": "1234"]
        default:
            return [:]
        }
    }

    var path: String {
        switch self {
        case .login: return "login"
        case .getUsers: return "users"
        case .getPosts: return "posts"
        case .getAlbums: return "albums"
        }
    }

    var request: URLRequest {
        let url = URL(string: path, relativeTo: URL(string: baseURL)!)!
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = headers

        switch self {
        case .login:
            request.httpMethod = "POST"
            return request
        default:
            request.httpMethod = "GET"
            return request
        }
    }
}

class ApiManager {

    static let shared = ApiManager()

    private init() {}

    func getUsers(completion: @escaping (Users) -> Void) {
        let request = ApiType.getUsers.request

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard error == nil else { return }

            if let data = data, let users = try? JSONDecoder().decode(Users.self, from: data) {
                completion(users)
            } else {
                completion([])
            }
        }
        task.resume()
    }

    func getPosts(completion: @escaping (Posts) -> Void) {
        let request = ApiType.getUsers.request

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard error == nil else { return }

            if let data = data, let posts = try? JSONDecoder().decode(Posts.self, from: data) {
                completion(posts)
            } else {
                completion([])
            }
        }
        task.resume()
    }
}
