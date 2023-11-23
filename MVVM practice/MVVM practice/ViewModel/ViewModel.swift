//
//  ViewModel.swift
//  MVVM practice
//
//  Created by mac on 22.11.2023.
//

import Foundation


class ViewModel: TableViewViewModelType {

    private var profiles = [
        Profile(name: "John", secondName: "Smith", age: 23),
        Profile(name: "Mark", secondName: "Blank", age: 43),
        Profile(name: "Kelvin", secondName: "Kurvel", age: 21)
    ]

    func numberOfRows() -> Int {
        return profiles.count
    }

    // Returns data for a specific cell
    func cellViewModel(forIndexPath indexPath: IndexPath) -> TableViewCellViewModelType? {
        let profile = profiles[indexPath.row]
        return TableViewCellViewModel(profile: profile)
    }
}
