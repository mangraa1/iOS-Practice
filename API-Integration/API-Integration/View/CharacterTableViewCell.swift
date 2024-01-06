//
//  CharacterCell.swift
//  API-Integration
//
//  Created by mac on 06.01.2024.
//

import UIKit


class CharacterTableViewCell: UITableViewCell {

    //MARK: - Properties
    static let identifier = "CharacterTableViewCell"
    private var imageCache = NSCache<NSString, UIImage>()

    //MARK: - External methods
    public func configureCell(_ cell: UITableViewCell, with character: Character) {
        cell.textLabel?.text = character.name
        cell.detailTextLabel?.text = character.status

        if let cachedImage = imageCache.object(forKey: character.image as NSString) {
            cell.imageView?.image = cachedImage
        } else {
            loadImage(for: character) { [weak self] image in
                guard let self = self, let image = image else { return }

                let insets: CGFloat = 50
                let newImage = self.addInsets(to: image, insets: insets)
                cell.imageView?.image = newImage
                cell.setNeedsLayout()
            }
        }
    }

    //MARK: - Internal methods
    private func loadImage(for character: Character, completion: @escaping (UIImage?) -> Void) {
        guard let url = URL(string: character.image) else {
            completion(nil)
            return
        }

        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url), let image = UIImage(data: data) {
                self.imageCache.setObject(image, forKey: character.image as NSString)
                DispatchQueue.main.async {
                    completion(image)
                }
            } else {
                completion(nil)
            }
        }
    }

    // Function to add insets to an image
    private func addInsets(to image: UIImage, insets: CGFloat) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(
            CGSize(width: image.size.width + insets * 2, height: image.size.height + insets * 2), false, 0)

        image.draw(in: CGRect(x: insets, y: insets, width: image.size.width, height: image.size.height))

        let newImage = UIGraphicsGetImageFromCurrentImageContext()

        UIGraphicsEndImageContext()
        return newImage
    }
}
