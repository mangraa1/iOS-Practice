//
//  ViewController.swift
//  SOLID
//
//  Created by mac on 10.11.2023.
//

import UIKit


struct Country: Decodable {
    var Id: String
    var Time: String
    var Name: String
    var Image: String?
}

final class ViewController: UIViewController {

    //MARK: - @IBOutlets
    @IBOutlet weak var myTextField: UITextField!
    @IBOutlet weak var textLabel: UILabel!

    //MARK: - Internal variables
    private let urlString = "https://raw.githubusercontent.com/Softex-Group/task-mobile/master/test.json"

    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        dataFetcher()
    }

    //MARK: - Business logic
    func changeName() {
        guard let name = myTextField.text, name != "" else {
            showAlert()
            return
        }
        saveNameInCache(name: name)
    }

    //MARK: - Data store
    public func saveNameInCache(name: String) {
        print("\(name) saved")
    }

    public func getNameFromCache() -> String {
        return "Some name"
    }

    //MARK: - Networking
    func dataFetcher() {
        request { data, error in
            let decoder = JSONDecoder()
            guard let data = data else { return }
            let response = try? decoder.decode([Country].self, from: data)
            print(response ?? "")
        }
    }

    func request(completion: @escaping (Data?, Error?) -> Void) {
        guard let url = URL(string: urlString) else { return }

        let request = URLRequest(url: url)
        let session = URLSession.shared

        session.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                completion(data, error)
            }
        }.resume()
    }

    //MARK: - User interface
    func showAlert() {
        let alert = UIAlertController(title: "WARNING", message: "you did not enter a name", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        present(alert, animated: true)
    }

    //MARK: - @IBActions
    @IBAction func changeLabel(_ sender: UITextField) {
        textLabel.text = myTextField.text
    }
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        changeName()
    }
}

