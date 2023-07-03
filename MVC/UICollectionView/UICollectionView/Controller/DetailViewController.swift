//
//  DetailViewController.swift
//  UICollectionView
//
//  Created by mac on 03.07.2023.
//

import UIKit

class DetailViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var imageView: UIImageView! {
        didSet{
            guard let image = menu?.imageName else { return }
            imageView.image = UIImage(named: image)
        }
    }
    @IBOutlet weak var nameLabel: UILabel! {
        didSet {
            nameLabel.text = menu?.name
        }
    }

    var menu: Menu?

    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
