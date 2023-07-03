//
//  MenuCollectionViewCell.swift
//  UICollectionView
//
//  Created by mac on 03.07.2023.
//

import UIKit

class MenuCollectionViewCell: UICollectionViewCell {

    //MARK: - Outlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!

    var menu: Menu? {
        didSet {
            nameLabel.text = menu?.name
            if let image = menu?.imageName {
                imageView.image = UIImage(named: image)
            }
        }
    }
}
