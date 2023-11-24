//
//  DetailViewController.swift
//  MVVM practice
//
//  Created by mac on 23.11.2023.
//

import UIKit

class DetailViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var textLabel: UILabel!

    //MARK: - External logic
    public var detailViewModel: DetailViewModelType?

    //MARK: - Life Cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        guard let viewModel = detailViewModel else { return }
        self.textLabel.text = viewModel.description
    }
}
