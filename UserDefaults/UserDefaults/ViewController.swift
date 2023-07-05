//
//  ViewController.swift
//  UserDefaults
//
//  Created by mac on 03.07.2023.
//

import UIKit
import SnapKit

enum Gender: String {
    case male
    case female
}

class UserModel: NSObject, NSCoding {

    let name: String
    let surname: String
    let city: String
    let gender: Gender

    init(name: String, surname: String, city: String, gender: Gender) {
        self.name = name
        self.surname = surname
        self.city = city
        self.gender = gender
    }

    func encode(with coder: NSCoder) {
        coder.encode(name, forKey: "name")
        coder.encode(surname, forKey: "surname")
        coder.encode(city, forKey: "city")
        coder.encode(gender.rawValue, forKey: "gender")
    }

    required init?(coder: NSCoder) {
        name = coder.decodeObject(forKey: "name") as? String ?? ""
        surname = coder.decodeObject(forKey: "surname") as? String ?? ""
        city = coder.decodeObject(forKey: "city") as? String ?? ""
        gender = Gender(rawValue: coder.decodeObject(forKey: "gender") as! String) ?? Gender.male
    }
}

class ViewController: UIViewController {

    //MARK: - Variables
    private var saveButton = UIBarButtonItem()

    private var registrationLabel = UILabel()
    private var name = UILabel()
    private var surname = UILabel()
    private var cityNameLabel = UILabel()
    private var genderLabel = UILabel()

    private var nameTextField = UITextField()
    private var surnameTextField = UITextField()

    private var segmentedControll: UISegmentedControl!

    private var cityPickerView = UIPickerView()
    private let cities = ["London", "Kyiv", "Vien", "Bratislava"]

    var pickedCity: String?
    var pickedGender: Gender?

    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupInterface()
//        nameTextField.text = UserSettings.userName
        nameTextField.text = UserSettings.userModel.name
    }

    //MARK: - UI

    private func setupInterface() {
        //NavigationBar
        createSaveButton()

        //registrationLabel
        createLabel(registrationLabel, withText: "Registration", topConstraint: view.safeAreaLayoutGuide.snp.top)
        registrationLabel.font = UIFont.boldSystemFont(ofSize: 30)

        //firstNameLabel
        createLabel(name, withText: "First name", topConstraint: registrationLabel.snp.bottom)

        //firstNameTextField
        createTextField(nameTextField, topConstraint: name.snp.bottom)
        nameTextField.delegate = self

        //secondNameLabel
        createLabel(surname, withText: "Second name", topConstraint: nameTextField.snp.bottom)

        //secondNametextField
        createTextField(surnameTextField, topConstraint: surname.snp.bottom)
        surnameTextField.delegate = self

        //cityNameLabel
        createLabel(cityNameLabel, withText: "City", topConstraint: surnameTextField.snp.bottom)

        //cityPickerView
        view.addSubview(cityPickerView)

        cityPickerView.dataSource = self
        cityPickerView.delegate = self
        cityPickerView.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)

        cityPickerView.snp.makeConstraints { make in
            make.top.equalTo(cityNameLabel.snp.bottom).offset(-40)
            make.centerX.equalToSuperview()
        }

        //genderLabel
        createLabel(genderLabel, withText: "Gender", topConstraint: cityPickerView.snp.bottom)

        //segmentedControl
        let genders = ["male", "female"]
        segmentedControll = UISegmentedControl(items: genders)
        view.addSubview(segmentedControll)

        segmentedControll.snp.makeConstraints { make in
            make.top.equalTo(genderLabel.snp.bottom).offset(15)
            make.left.right.equalTo(view.safeAreaLayoutGuide).inset(16)
        }
    }

    //MARK: - Secondary functions

    private func createSaveButton() {
        saveButton = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(saveAction))
        navigationItem.rightBarButtonItem = saveButton
    }

    private func createLabel(_ label: UILabel, withText text: String, topConstraint top: ConstraintRelatableTarget) {
        view.addSubview(label)
        label.text = text
        label.font = UIFont.systemFont(ofSize: 18)

        label.snp.makeConstraints { make in
            make.top.equalTo(top).offset(35)
            make.left.right.equalTo(view.safeAreaLayoutGuide).inset(16)
        }
    }

    private func createTextField(_ textField: UITextField, topConstraint top: ConstraintRelatableTarget) {
        view.addSubview(textField)
        textField.borderStyle = .roundedRect
        textField.placeholder = "Enter"
        textField.font = UIFont.systemFont(ofSize: 18)
        textField.clearButtonMode = .whileEditing
        textField.keyboardAppearance = .dark

        textField.snp.makeConstraints { make in
            make.top.equalTo(top).offset(15)
            make.left.right.equalTo(view.safeAreaLayoutGuide).inset(16)
        }
    }

    //MARK: - #selector(saveAction)
    @objc func saveAction() {
        var nameTrimmedText: String?
        var surnameTrimmedText: String?

        switch segmentedControll.selectedSegmentIndex {
        case 0:
            pickedGender = .male
        case 1:
            pickedGender = .female
        default:
            break
        }

        if let text = nameTextField.text {
            nameTrimmedText = text.trimmingCharacters(in: .whitespacesAndNewlines)
        }

        if let text = surnameTextField.text {
            surnameTrimmedText = text.trimmingCharacters(in: .whitespacesAndNewlines)
        }

        guard let myPickedCity = pickedCity, let myPickedGender = pickedGender else { return }
        let userObject = UserModel(name: nameTrimmedText ?? "", surname: surnameTrimmedText ?? "", city: myPickedCity, gender: myPickedGender)
        print(userObject)

        UserSettings.userName = nameTrimmedText
        print(UserSettings.userName ?? "")
        UserSettings.userModel = userObject
        print(UserSettings.userModel ?? "")
    }
}

//MARK: - extensions

extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        cities.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let city = cities[row]
        pickedCity = city
        return city
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == nameTextField {
            surnameTextField.becomeFirstResponder()
        } else if textField == surnameTextField {
            surnameTextField.resignFirstResponder()
        }
        return true
    }
}
