//
//  TableViewModelType.swift
//  MVVM practice
//
//  Created by mac on 23.11.2023.
//

import Foundation


protocol TableViewViewModelType {
    func numberOfRows() -> Int
    func cellViewModel(forIndexPath indexPath: IndexPath) -> TableViewCellViewModelType?

    func viewModelFromSelectedRow() -> DetailViewModelType?
    func selectedRow(forIndexPath indexPath: IndexPath)
}
