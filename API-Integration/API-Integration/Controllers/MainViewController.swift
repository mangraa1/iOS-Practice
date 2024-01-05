//
//  MainViewController.swift
//  API-Integration
//
//  Created by mac on 01.01.2024.
//

import UIKit
import SnapKit


class MainViewController: UIViewController {

    //MARK: - Internal properties
    private var tableView: UITableView = .init(frame: .zero, style: .insetGrouped)
    private var imageCache = NSCache<NSString, UIImage>()

    private var characters: Characters = []

    private let charactersFetcher = CharactersFetcher()
    private let imageFetcher = ImageFetcher()

    private let cellIdentifier = "cell"
    private let detailSegueIdentifier = "showDetail"

    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        charactersFetcher.fetchCharacters {[weak self] characters in
            self?.characters = characters
            self?.tableView.reloadData()
        }

        makeTableView()
    }

    //MARK: - Internal methods
    private func makeTableView() {
        view.addSubview(tableView)

        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        tableView.delegate = self
        tableView.dataSource = self

        tableView.separatorInset = .init(top: 0, left: 16, bottom: 0, right: 16)

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
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

    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == detailSegueIdentifier {
            guard let indexPath = tableView.indexPathForSelectedRow else { return }

            let character = characters[indexPath.row]

            let detailVC = segue.destination as? DetailViewController
            detailVC?.currentCharacter = character

            tableView.deselectRow(at: indexPath, animated: false)
        }
    }
}

//MARK: - UITableViewDataSource
extension MainViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)!

        let character = characters[indexPath.row]

        cell.textLabel?.text = character.name
        cell.detailTextLabel?.text = character.status

        // Download image from URL
        if let cachedImage = imageCache.object(forKey: character.image as NSString) {
            cell.imageView?.image = cachedImage
        } else {
            // If the image is not in the cache, we load it from the URL
            if let url = URL(string: character.image) {
                DispatchQueue.global().async {
                    if let data = try? Data(contentsOf: url), let image = UIImage(data: data) {
                        // Store the downloaded image in the cache
                        self.imageCache.setObject(image, forKey: character.image as NSString)

                        DispatchQueue.main.async {
                            let insets: CGFloat = 50
                            let newImage = self.addInsets(to: image, insets: insets)

                            cell.imageView?.image = newImage
                            cell.setNeedsLayout()
                        }
                    }
                }
            }
        }

        return cell
    }
}

//MARK: - UITableViewDelegate
extension MainViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: detailSegueIdentifier, sender: self)
    }
}
