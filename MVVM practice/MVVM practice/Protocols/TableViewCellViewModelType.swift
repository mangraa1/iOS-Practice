//
//  TableViewCellViewModelType.swift
//  MVVM practice
//
//  Created by mac on 23.11.2023.
//

import Foundation


protocol TableViewCellViewModelType: AnyObject {
    var fullName: String { get }
    var age: Int { get }
}
