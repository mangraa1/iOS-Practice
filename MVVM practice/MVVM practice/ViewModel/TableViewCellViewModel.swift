//
//  TableViewCellViewModel.swift
//  MVVM practice
//
//  Created by mac on 23.11.2023.
//

import Foundation


// Creates a cell for tableView
class TableViewCellViewModel: TableViewCellViewModelType {

    private var profile: Profile

    var fullName: String {
        return profile.name + " " + profile.secondName
    }

    var age: Int {
        return profile.age
    }

    init(profile: Profile) {
        self.profile = profile
    }
}
