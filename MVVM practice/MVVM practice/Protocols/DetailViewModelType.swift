//
//  DetailViewModelType.swift
//  MVVM practice
//
//  Created by mac on 23.11.2023.
//

import Foundation


protocol DetailViewModelType {
    var description: String { get }
    var age: Box<String?> { get }
}
