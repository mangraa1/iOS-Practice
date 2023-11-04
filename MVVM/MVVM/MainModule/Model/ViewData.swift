//
//  ViewData.swift
//  MVVM
//
//  Created by mac on 03.11.2023.
//

import Foundation


enum ViewData {
    case initial
    case loading(Data)
    case success(Data)
    case failure(Data)

    struct Data {
        let icon: String?
        let title: String?
        let description: String?
        let numberPhone: String?
    }
}
