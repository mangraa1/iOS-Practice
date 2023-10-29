//
//  ModuleBuilder.swift
//  MVP
//
//  Created by mac on 27.10.2023.
//

import UIKit


protocol Builder {
    static func createMainModule() -> UIViewController
    static func createDetailModule(comment: CommentModel?) -> UIViewController
}

class ModuleBuilder: Builder {
    static func createMainModule() -> UIViewController {
        let view = MainViewController()
        let networkService = NetworkService()
        let presenter = MainPresenter(view: view, networkService: networkService)
        view.presenter = presenter
        return view
    }

    static func createDetailModule(comment: CommentModel?) -> UIViewController {
        let view = DetailViewController()
        let networkService = NetworkService()
        let presenter = DetailPresenter(view: view, networkService: networkService, comment: comment)
        view.presenter = presenter
        return view
    }
}
