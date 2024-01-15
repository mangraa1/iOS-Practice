//
//  TableViewCell.swift
//  XibNibProject
//
//  Created by mac on 15.01.2024.
//

import UIKit

class AnotherTableViewCell: UITableViewCell {

    //MARK: - Properties
    static let identifier = "AnotherTableViewCell"

    //MARK: - @IBOutlets
    @IBOutlet weak var customImageView: UIImageView!
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var bottomLabel: UILabel!

    //MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()

        topLabel.text = "Top label"
        bottomLabel.text = "Bottom label"
    }

    //MARK: - Internal logic
    public func configure(for viewModel: ViewModel) {
        // Сan implement asynchronous loading via URL
        topLabel.text = viewModel.title
        bottomLabel.text = viewModel.subtitle
    }
}
