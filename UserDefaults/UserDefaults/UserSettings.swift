//
//  UserSettings.swift
//  UserDefaults
//
//  Created by mac on 05.07.2023.
//

import Foundation

final class UserSettings {

    private enum SettingsKeys: String {
        case userName
        case userModel
    }

    static var userModel: UserModel! {
        get {
            guard let savedData = UserDefaults.standard.object(forKey: SettingsKeys.userModel.rawValue) as? Data, let decoderModel = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(savedData) as? UserModel else { return nil }
            return decoderModel
        } set {
            let defaults = UserDefaults.standard
            let key = SettingsKeys.userModel.rawValue

            if let userModel = newValue {
                if let savedData = try? NSKeyedArchiver.archivedData(withRootObject: userModel, requiringSecureCoding: false) {
                    defaults.set(savedData, forKey: key)
                }
            }
        }
    }

    static var userName: String! {
        get {
            return UserDefaults.standard.string(forKey: SettingsKeys.userName.rawValue)
        } set {
            let defaults = UserDefaults.standard
            let key = SettingsKeys.userName.rawValue

            if let name = newValue {
                print ("value \(name) was added to key \(key)")
                defaults.set(name, forKey: key)
            } else {
                defaults.removeObject(forKey: key)
            }
        }
    }
}
