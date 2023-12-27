//
//  ViewController.swift
//  Basic request
//
//  Created by mac on 27.12.2023.
//

import UIKit

class ViewController: UIViewController {

    //MARK: - Internal variables
    private let urlString = "https://v2.jokeapi.dev/joke/Any?safe-mode"

    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeRequest(withURL: urlString) { joke in
            print(joke.id ?? 0)
        }
    }

    //MARK: - Internal logic
    private func makeRequest(withURL urlString: String, completion: @escaping (Joke) -> ()) {

        guard let url = URL(string: urlString) else { return }

        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = ["authToken": "nil"]
        request.httpMethod = "GET"

        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else { return }

            do {
                let joke = try JSONDecoder().decode(Joke.self, from: data)
                completion(joke)

            } catch let error {
                print("Error: ", error.localizedDescription)
            }

        }.resume()
    }
}

