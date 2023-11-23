//
//  TableViewCell.swift
//  MVVM practice
//
//  Created by mac on 22.11.2023.
//

import UIKit


class TableViewCell: UITableViewCell {

    //MARK: IBOutlets
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!

    // Updates data according to the selected profile
    weak var cellViewModel: TableViewCellViewModelType? {
        willSet (viewModel) {
            guard let viewModel = viewModel else { return }
            self.fullNameLabel.text = viewModel.fullName
            self.ageLabel.text = String(describing: viewModel.age)
        }
    }
}
