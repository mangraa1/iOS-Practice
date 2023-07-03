//
//  ViewController.swift
//  UICollectionView
//
//  Created by mac on 03.07.2023.
//

import UIKit

class ViewController: UIViewController {

    //MARK: - Outlets & Variables
    
    @IBOutlet weak var collectionView: UICollectionView!

    var itemMenuArray: [Menu] = {
        var blankMenuCola = Menu()
        blankMenuCola.name = "Coca-cola"
        blankMenuCola.imageName = "cola"

        var blankMenuSprite = Menu()
        blankMenuSprite.name = "Sprite"
        blankMenuSprite.imageName = "sprite"
        
        return [blankMenuCola, blankMenuSprite]
    }()
    var identifier = "menuCell"

    //MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showVC" {
            guard let vc = segue.destination as? DetailViewController else { return }

            let menu = sender as? Menu
            print(menu ?? "nil")
            vc.menu = menu
        }
    }
}

//MARK: - extension

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemMenuArray.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let itemCell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? MenuCollectionViewCell else { return UICollectionViewCell() }

        itemCell.menu = itemMenuArray[indexPath.row]
        return itemCell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Tap")
        let menu = itemMenuArray[indexPath.row]
        performSegue(withIdentifier: "showVC", sender: menu)
    }

}

