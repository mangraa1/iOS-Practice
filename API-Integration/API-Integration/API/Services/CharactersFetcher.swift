//
//  CharactersFetcher.swift
//  API-Integration
//
//  Created by mac on 02.01.2024.
//

import Foundation


class CharactersFetcher {

    static let shared = CharactersFetcher()

    //MARK: - Internal properties
    private let baseURL = "https://rickandmortyapi.com/api/character/"

    //MARK: - Initialization
    private init() {}

    //MARK: - External methods
    public func fetchCharacters(completion: @escaping ([Character]) -> Void) {
        let paths = generateRandomNumbers(count: 20)

        NetworkService.shared.sendMultipleRequests(baseURLString: baseURL, paths: paths, responseType: Character.self) { result in
            switch result {
            case .success(let characters):
                completion(characters)
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }

    //MARK: - Internal methods
    private func generateRandomNumbers(count: Int) -> [Int] {
        var numbers: Set<Int> = []

        while numbers.count < count {
            let randomNumber = Int.random(in: 1...800)
            numbers.insert(randomNumber)
        }

        return Array(numbers)
    }
}
