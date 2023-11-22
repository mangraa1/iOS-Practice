//
//  TableViewController.swift
//  MVVM practice
//
//  Created by mac on 22.11.2023.
//

import UIKit


class TableViewController: UITableViewController {

    //MARK: - Internal variables
    private var profiles: [Profile]!

    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        profiles = [
            Profile(name: "John", secondName: "Smith", age: 23),
            Profile(name: "Mark", secondName: "Blank", age: 43),
            Profile(name: "Kelvin", secondName: "Kurvel", age: 21)]
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profiles.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableViewCell
        guard let tableViewCell = cell else { return UITableViewCell() }

        let profile = profiles[indexPath.row]
        tableViewCell.fullNameLabel.text = "\(profile.name) \(profile.secondName)"
        tableViewCell.ageLabel.text = "\(profile.age)"

        return tableViewCell
    }

    //MARK: - Table view delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
