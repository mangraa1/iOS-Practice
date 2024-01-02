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
    private var tableView = UITableView()

    private let charactersFetcher = CharactersFetcher()
    private let cellIdentifier = "cell"

    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        charactersFetcher.fetchCharacters { characters in
            print(characters.first?.name)
            print(characters.last?.name)
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

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
    }
}

//MARK: - UITableViewDataSource
extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)!

        var content = cell.defaultContentConfiguration()
        content.text = "Initial text"
        content.textProperties.color = .black

        cell.contentConfiguration = content

        return cell
    }
}

//MARK: - UITableViewDelegate
extension MainViewController: UITableViewDelegate {

}
