//
//  ImageFetcher.swift
//  API-Integration
//
//  Created by mac on 03.01.2024.
//

import Foundation
import UIKit


class ImageFetcher {

    //MARK: - Internal methods
    public func fetchImage(from urlString: String, completion: @escaping (UIImage?) -> Void) {

        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            completion(nil)
            return
        }

        NetworkService.shared.sendImageRequest(from: url) { data, error in
            guard let data = data, error == nil, let image = UIImage(data: data) else {
                print("Error: \(String(describing: error?.localizedDescription))")
                return
            }

            DispatchQueue.main.async {
                completion(image)
            }
        }
    }
}
