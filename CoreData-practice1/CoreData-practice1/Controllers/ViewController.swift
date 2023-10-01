//
//  ViewController.swift
//  CoreData-practice1
//
//  Created by mac on 01.10.2023.
//

import UIKit

class ViewController: UIViewController {

    //MARK: - & Variables

    private let dataStoreManager = DataStoreManager()

    @IBOutlet weak var userInfoLabel: UILabel!
    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var textField: UITextField!


    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        textField.delegate = self

        let mainUser = dataStoreManager.obtainMainUser()

        userInfoLabel.text =  String("\(mainUser.name ?? "") \(mainUser.age)")
        companyNameLabel.text = mainUser.company?.name
    }

    //MARK: - @IBAction
    @IBAction func deleteAction(_ sender: Any) {
        dataStoreManager.removeMainUser()

        let ac = UIAlertController(title: "User is deleted", message: nil, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default)

        ac.addAction(okAction)
        present(ac, animated: true)
    }
}

//MARK: - UITextFieldDelegate
extension ViewController: UITextFieldDelegate {

    func textFieldDidEndEditing(_ textField: UITextField) {
        if let name = textField.text {
            dataStoreManager.updateMainUser(with: name)
        }
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

