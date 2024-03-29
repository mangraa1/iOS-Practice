//
//  DetailViewModel.swift
//  MVVM practice
//
//  Created by mac on 23.11.2023.
//

import Foundation


class DetailViewModel: DetailViewModelType {

    private var profile: Profile

    var description: String {
        return "\(profile.name) \(profile.secondName) is \(profile.age) y.o"
    }

    // Set the observed object
    var age: Box<String?> = Box(nil)

    init(profile: Profile) {
        self.profile = profile
    }
}
