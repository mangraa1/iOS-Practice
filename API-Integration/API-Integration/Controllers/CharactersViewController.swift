//
//  MainViewController.swift
//  API-Integration
//
//  Created by mac on 01.01.2024.
//

import UIKit
import SnapKit


class CharactersViewController: UIViewController {

    //MARK: - Internal properties
    private var tableView: UITableView = .init(frame: .zero, style: .insetGrouped)
    private var characters: Characters = []
    private let charactersFetcher = CharactersFetcher()
    private let imageFetcher = ImageFetcher()
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

        tableView.register(CharacterTableViewCell.self, forCellReuseIdentifier: CharacterTableViewCell.identifier)
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
