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

    override func viewDidLoad() {
        super.viewDidLoad()

        detailViewModel?.age.bind(listener: { [unowned self] in
            guard let string = $0 else { return }
            self.textLabel.text = string
        })

        delay(delay: 5) {
            self.detailViewModel?.age.value = "Some new value"
        }
    }

    //MARK: - Internal logic
    private func delay(delay: Double, completion: @escaping () -> Void) {
        DispatchQueue.main.asyncAfter(wallDeadline: .now() + delay) {
            completion()
        }
    }
}
