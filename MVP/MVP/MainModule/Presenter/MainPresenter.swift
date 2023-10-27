//
//  MainPresenter.swift
//  MVP
//
//  Created by mac on 27.10.2023.
//

import Foundation


protocol MainViewProtocol: AnyObject {
    func setGreeting(greeting: String)
}

protocol MainViewPresenterProtocol: AnyObject {
    init(view: MainViewProtocol, person: Person)
    func showGreeting()
}

class MainPresenter: MainViewPresenterProtocol {

    let view: MainViewProtocol
    let person: Person

    required init(view: MainViewProtocol, person: Person) {
        self.view = view
        self.person = person
    }

    func showGreeting() {
        let greeting = person.firstName + " " + person.secondName
        view.setGreeting(greeting: greeting)
    }
}
