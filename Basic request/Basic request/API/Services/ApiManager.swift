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

    //MARK: - Variables
    static let shared = ApiManager()

    private let networkDataFetcher: DataFetcherProtocol

    //MARK: - Initialization
    private init() {
        self.networkDataFetcher = NetworkDataFetcher()
    }

    //MARK: - External logic
    public func getUsers(completion: @escaping (Users?) -> Void) {
        let request = ApiType.getUsers.request

        networkDataFetcher.fetchGenericJSONData(from: request, completion: completion)
    }

    public func getPosts(completion: @escaping (Posts?) -> Void) {
        let request = ApiType.getUsers.request
        
        networkDataFetcher.fetchGenericJSONData(from: request, completion: completion)
    }

    public func getAlbums(completion: @escaping (Albums?) -> Void) {
        let request = ApiType.getAlbums.request

        networkDataFetcher.fetchGenericJSONData(from: request, completion: completion)
    }
}
