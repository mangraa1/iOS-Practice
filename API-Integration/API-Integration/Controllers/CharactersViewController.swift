//
//  MainViewController.swift
//  API-Integration
//
//  Created by mac on 01.01.2024.
//

import UIKit


class CharactersViewController: UIViewController {

    //MARK: - Internal properties
    private var charactersView: CharactersView!
    private var characters: Characters = []
    private let detailSegueIdentifier = "showDetail"

    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        createView()

        CharactersFetcher.shared.fetchCharacters {[weak self] characters in
            self?.characters = characters
            self?.charactersView.tableView.reloadData()
        }
    }

    //MARK: - Internal methods
    private func createView() {
        charactersView = CharactersView()
        charactersView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        charactersView.center = view.center
        charactersView.tableView.dataSource = self
        charactersView.tableView.delegate = self
        view.addSubview(charactersView)
    }

    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == detailSegueIdentifier {
            guard let indexPath = charactersView.tableView.indexPathForSelectedRow else { return }

            let character = characters[indexPath.row]

            let detailVC = segue.destination as? DetailViewController
            detailVC?.currentCharacter = character
            detailVC?.navigationItem.title = character.name

            charactersView.tableView.deselectRow(at: indexPath, animated: false)
        }
    }
}

//MARK: - UITableViewDataSource
extension CharactersViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CharacterTableViewCell.identifier, for: indexPath) as? CharacterTableViewCell else {
            return UITableViewCell()
        }

        let character = characters[indexPath.row]

        cell.configureCell(cell, with: character)

        return cell
    }
}

//MARK: - UITableViewDelegate
extension CharactersViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: detailSegueIdentifier, sender: self)
    }
}
