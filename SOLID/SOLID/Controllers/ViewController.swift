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

    //MARK: - Internal variables
    private let urlString = "https://raw.githubusercontent.com/Softex-Group/task-mobile/master/test.json"
    private let urlFreeApps = "https://rss.applemarketingtools.com/api/v2/us/apps/top-free/10/apps.json"
    private let urlMusicString = "https://rss.applemarketingtools.com/api/v2/us/music/most-played/10/albums.json"

    private let networkDataFetcher = NetworkDataFetcher()
    private let dataStore = DataStore()

    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        networkDataFetcher.fetchCountry(with: urlString) { countries in
            guard let countries = countries, let firstCountry = countries.first else { return }
            print(firstCountry.Name)
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

