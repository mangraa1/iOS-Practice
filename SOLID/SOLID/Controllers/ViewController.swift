//
//  ViewController.swift
//  SOLID
//
//  Created by mac on 10.11.2023.
//

import UIKit


final class ViewController: UIViewController {

    //MARK: - @IBOutlets
    @IBOutlet weak var myTextField: UITextField!
    @IBOutlet weak var textLabel: UILabel!

    private let dataFetcherService = DataFetcherService()
    private let dataStore = DataStore()

    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        dataFetcherService.fetchCountry { countries in
            guard let countries = countries, let firstCountry = countries.first else { return }
            print(firstCountry.Name)
        }

        dataFetcherService.fetchFreeApps { freeApps in
            print(freeApps?.feed.results.first?.name)
        }

        dataFetcherService.fetchMusic { music in
            print(music?.feed.results.first?.name)
        }
    }

    //MARK: - Business logic
    func changeName() {
        guard let name = myTextField.text, name != "" else {
            showAlert(withTitle: "Warning", message: "You did not enter a name")
            return
        }
        dataStore.saveNameInCache(name: name)
    }

    //MARK: - @IBActions
    @IBAction func changeLabel(_ sender: UITextField) {
        textLabel.text = myTextField.text
    }
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        changeName()
    }
}

