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

    private var characters: Characters = []
    private let charactersFetcher = CharactersFetcher()
    private let imageFetcher = ImageFetcher()
    private let cellIdentifier = "cell"

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
}

//MARK: - UITableViewDataSource
extension MainViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)!

        let character = characters[indexPath.row]

        var content = cell.defaultContentConfiguration()
        content.text = character.name
        content.textProperties.color = .black

        cell.contentConfiguration = content

        return cell
    }
}

//MARK: - UITableViewDelegate
extension MainViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
}
