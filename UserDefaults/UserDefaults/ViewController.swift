//
//  ViewController.swift
//  UserDefaults
//
//  Created by mac on 03.07.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    //MARK: - Variables
    private var saveButton = UIBarButtonItem()

    private var registrationLabel = UILabel()
    private var firstNameLabel = UILabel()
    private var secondNameLabel = UILabel()
    private var cityNameLabel = UILabel()
    private var cityPickerView = UIPickerView()
    private var genderLabel = UILabel()

    private var firstNameTextField = UITextField()
    private var secondNameTextField = UITextField()

    private var segmentedControll: UISegmentedControl!

    private let cities = ["London", "Kyiv", "Vien", "Bratislava"]

    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupInterface()
    }

    //MARK: - UI

    private func setupInterface() {
        //NavigationBar
        createSaveButton()

        //registrationLabel
        createLabel(registrationLabel, withText: "Registration", topConstraint: view.safeAreaLayoutGuide.snp.top)
        registrationLabel.font = UIFont.boldSystemFont(ofSize: 30)

        //firstNameLabel
        createLabel(firstNameLabel, withText: "First name", topConstraint: registrationLabel.snp.bottom)

        //firstNameTextField
        createTextField(firstNameTextField, topConstraint: firstNameLabel.snp.bottom)
        firstNameTextField.delegate = self

        //secondNameLabel
        createLabel(secondNameLabel, withText: "Second name", topConstraint: firstNameTextField.snp.bottom)

        //secondNametextField
        createTextField(secondNameTextField, topConstraint: secondNameLabel.snp.bottom)
        secondNameTextField.delegate = self

        //cityNameLabel
        createLabel(cityNameLabel, withText: "City", topConstraint: secondNameTextField.snp.bottom)

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

    //MARK: - #selector
    @objc func saveAction() {

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
        return city
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == firstNameTextField {
            secondNameTextField.becomeFirstResponder()
        } else if textField == secondNameTextField {
            secondNameTextField.resignFirstResponder()
        }
        return true
    }
}
