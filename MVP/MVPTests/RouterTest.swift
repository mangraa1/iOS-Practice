//
//  RouterTest.swift
//  MVPTests
//
//  Created by mac on 31.10.2023.
//

import XCTest
@testable import MVP

class MockNavigationController: UINavigationController {
    var prestntedVC: UIViewController!

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        self.prestntedVC = viewController
        super.pushViewController(viewController, animated: animated)
    }
}

final class RouterTest: XCTestCase {

    var router: RouterProtocol!
    var navigationController = MockNavigationController()
    let assembly = AsselderModuleBuilder()

    override func setUpWithError() throws {
        router = Router(navigationController: navigationController, assemblyBuilder: assembly)
    }

    override func tearDownWithError() throws {
        router = nil
    }

    func testRouter() {
        router.showDetail(comment: nil)
        let detailVC = navigationController.prestntedVC
        XCTAssertTrue(detailVC is DetailViewController)
    }
}
