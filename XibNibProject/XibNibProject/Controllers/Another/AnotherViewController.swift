//
//  AnotherViewController.swift
//  XibNibProject
//
//  Created by mac on 15.01.2024.
//

import UIKit

class AnotherViewController: UIViewController {

    //MARK: - @IBOutlets
    @IBOutlet weak var tableView: UITableView!

    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: AnotherTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: AnotherTableViewCell.identifier)
    }
}

//MARK: - UITableViewDataSource
extension AnotherViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AnotherTableViewCell.identifier, for: indexPath) as? AnotherTableViewCell
        else {
            return UITableViewCell()
        }

        cell.configure(for: ViewModel(imageURL: "", title: "Number of section: \(indexPath.section)", subtitle: "Number of row: \(indexPath.row)"))

        return cell
    }
}

//MARK: - UITableViewDelegate
extension AnotherViewController: UITableViewDelegate {}
