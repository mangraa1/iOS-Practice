//
//  MainPresenterTest.swift
//  MVPTests
//
//  Created by mac on 28.10.2023.
//

import XCTest
@testable import MVP

/*
class MockView: MainViewProtocol {
    var titleTest: String?

    func setGreeting(greeting: String) {
        self.titleTest = greeting
    }
}

final class MainPresenterTest: XCTestCase {

    var view: MockView!
    var person: Person!
    var presenter: MainPresenter!

    override func setUpWithError() throws {
        view = MockView()
        person = Person(firstName: "Baz", secondName: "Bar")
        presenter = MainPresenter(view: view, person: person)
    }

    override func tearDownWithError() throws {
        view = nil
        person = nil
        presenter = nil
    }

    func testModuleIsNotNil() {
        XCTAssertNotNil(view, "view is not nil")
        XCTAssertNotNil(person, "person is not nil")
        XCTAssertNotNil(presenter, "presenter is not nil")
    }

    func testView() {
        presenter.showGreeting()
        XCTAssertEqual(view.titleTest, "Baz Bar")
    }

    func testPersonModel(){
        XCTAssertEqual(person.firstName, "Baz")
        XCTAssertEqual(person.secondName, "Bar")
    }
}
*/
