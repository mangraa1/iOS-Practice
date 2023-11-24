//
//  TableViewController.swift
//  MVVM practice
//
//  Created by mac on 22.11.2023.
//

import UIKit


class TableViewController: UITableViewController {

    //MARK: - Internal variables
    private var viewModel: TableViewViewModelType?

    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel = ViewModel()
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfRows() ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Identifire.tableViewCell.rawValue, for: indexPath) as? TableViewCell

        guard let tableViewCell = cell, let viewModel = viewModel else { return UITableViewCell() }

        // Sets current profile data
        let cellViewModel = viewModel.cellViewModel(forIndexPath: indexPath)
        tableViewCell.cellViewModel = cellViewModel

        return tableViewCell
    }

    //MARK: - Table view delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        guard let viewModel = viewModel else { return }
        viewModel.selectedRow(forIndexPath: indexPath)

        performSegue(withIdentifier: Identifire.detailSegue.rawValue, sender: nil)
    }

    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier, let viewModel = viewModel else { return }

        if identifier == Identifire.detailSegue.rawValue {
            if let destinationVC = segue.destination as? DetailViewController {
                // Setting data for detailViewModel
                destinationVC.detailViewModel = viewModel.viewModelFromSelectedRow()
            }
        }
    }
}
