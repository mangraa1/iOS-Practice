//
//  ViewController.swift
//  MVP
//
//  Created by mac on 27.10.2023.
//

import UIKit

class MainViewController: UIViewController {

    //MARK: - @IBOutlet
    @IBOutlet weak var greetingLabel: UILabel!

    //MARK: - External vars
    var presenter: MainViewPresenterProtocol!

    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    //MARK: - @IBAction
    @IBAction func didTapButtonAction(_ sender: UIButton) {
        presenter.showGreeting()
    }
}

extension MainViewController: MainViewProtocol {
    func setGreeting(greeting: String) {
        greetingLabel.text = greeting
    }
}

