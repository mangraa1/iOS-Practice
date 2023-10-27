//
//  ModuleBuilder.swift
//  MVP
//
//  Created by mac on 27.10.2023.
//

import UIKit


protocol Builder {
    static func createMainModule() -> UIViewController
}

class ModuleBuilder: Builder {
    static func createMainModule() -> UIViewController {
        let model = Person(firstName: "Artem", secondName: "Blaine")
        let view = MainViewController()
        let presenter = MainPresenter(view: view, person: model)
        view.presenter = presenter
        return view
    }
}
