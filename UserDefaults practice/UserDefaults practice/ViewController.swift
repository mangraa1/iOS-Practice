//
//  ViewController.swift
//  UserDefaults practice
//
//  Created by mac on 30.09.2023.
//

import UIKit


enum UserDefaultsKeys {
    static let isTrue = "isTrue"
    static let userSettings = "userSettings"
    static let userSettingsStruct = "userSettingsStruct"
}

class ViewController: UIViewController {

    private let userDefaults = UserDefaults.standard
    private let isTrue = false
    private let userSettings = UserSettings(authorized: true)
    private let userSettingsStruct = UserSettingsSruct(isAuth: false)


    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // isTrue
        userDefaults.set(isTrue, forKey: UserDefaultsKeys.isTrue)

        // Class UserSettings
        let settingsData = try? NSKeyedArchiver.archivedData(withRootObject: userSettings, requiringSecureCoding: false)
        userDefaults.set(settingsData, forKey: UserDefaultsKeys.userSettings)

        // Struct UserSettings
        let jsonEncoder = JSONEncoder()
        let jsonData = try? jsonEncoder.encode(userSettingsStruct)
        userDefaults.set(jsonData, forKey: UserDefaultsKeys.userSettingsStruct)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        // isTrue
        if let valueIsTrue = userDefaults.object(forKey: UserDefaultsKeys.isTrue) as? Bool {
            print("Is true: ", valueIsTrue)
        }

        print("-----------------")

        // Class UserSettings
        if let userSettingsData = userDefaults.object(forKey: UserDefaultsKeys.userSettings) as? Data,
           let userSettings = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(userSettingsData) as? UserSettings {
                print(userSettings)
                print(userSettings.isAuth)
        }

        print("-----------------")

        // Struct UserSettings
        if let userSettingsStructData = userDefaults.object(forKey: UserDefaultsKeys.userSettingsStruct) as? Data {
            let jsonDecoder = JSONDecoder()
            do {
                let model = try jsonDecoder.decode(UserSettingsSruct.self, from: userSettingsStructData)
                print(model)
                print(model.isAuth)
            } catch let error {
                print(error.localizedDescription)
            }
        }
    }
}

