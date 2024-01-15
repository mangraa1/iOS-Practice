//
//  ViewController.swift
//  XibNibProject
//
//  Created by mac on 15.01.2024.
//

import UIKit

class MainViewController: UIViewController {

    //MARK: - @IBActions
    @IBAction func nextButtonTapped(_ sender: Any) {

        let anotherVC = AnotherViewController()
        navigationController?.pushViewController(anotherVC, animated: true)
    }
}
