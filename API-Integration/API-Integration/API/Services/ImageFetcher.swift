//
//  ImageFetcher.swift
//  API-Integration
//
//  Created by mac on 03.01.2024.
//

import Foundation
import UIKit


class ImageFetcher {

    //MARK: - Properties
    static let shared = ImageFetcher()

    //MARK: - Initialization
    private init() {}

    //MARK: - External methods
    public func loadImage(for character: Character, completion: @escaping (UIImage?) -> Void) {
        guard let url = URL(string: character.image) else {
            completion(nil)
            return
        }

        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url), let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    completion(image)
                }
            } else {
                completion(nil)
            }
        }
    }
}
