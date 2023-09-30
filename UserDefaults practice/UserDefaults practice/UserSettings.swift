//
//  UserSettings.swift
//  UserDefaults practice
//
//  Created by mac on 30.09.2023.
//

import Foundation


fileprivate enum UserSettingsCoding: String {
    case isAuthorized
}

class UserSettings: NSObject, NSCoding {
    public var isAuth = true

    init(authorized: Bool) {
        isAuth = authorized
    }

    required init?(coder: NSCoder) {
        coder.decodeBool(forKey: UserSettingsCoding.isAuthorized.rawValue)
    }

    func encode(with coder: NSCoder) {
        coder.encode(isAuth, forKey: UserSettingsCoding.isAuthorized.rawValue)
    }
}
