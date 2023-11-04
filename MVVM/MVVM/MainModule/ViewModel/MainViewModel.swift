//
//  MainViewModel.swift
//  MVVM
//
//  Created by mac on 03.11.2023.
//

import Foundation


protocol MainViewModelProtocol {
    var updateWithData: ((ViewData) -> ())? { get set }
    func startFetch()
    func error()
}

final class MainViewModel: MainViewModelProtocol {

    //MARK: External vars
    public var updateWithData: ((ViewData) -> ())?

    //MARK: - Initialization
    init() {
        updateWithData?(.initial)
    }

    //MARK: - External functions
    public func startFetch() {
        updateWithData?(.success(ViewData.Data(icon: "success",
                                               title: "Success",
                                               description: "Normal",
                                               numberPhone: nil)))
    }

    public func error() {
        updateWithData?(.failure(ViewData.Data(icon: "failure",
                                               title: "Error",
                                               description: "Failure",
                                               numberPhone: nil)))
    }
}
