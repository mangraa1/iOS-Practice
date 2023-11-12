//
//  ViewController+alertController.swift
//  SOLID
//
//  Created by mac on 12.11.2023.
//

import UIKit


extension ViewController {
    func showAlert(withTitle title: String, message: String) {
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Ok", style: .default))
        present(ac, animated: true)
    }
}
