//
//  MainPresenterTest.swift
//  MVPTests
//
//  Created by mac on 28.10.2023.
//

import XCTest
@testable import MVP


class MockView: MainViewProtocol {
    func success() {}
    func failure(error: Error) {}
}

class MockNetworkService: NetworkServiceProtocol {
    var comments: [CommentModel]!

    init() {}

    convenience init (comments: [CommentModel]?) {
        self.init()
        self.comments = comments
    }

    func getComments(completion: @escaping (Result<[MVP.CommentModel]?, Error>) -> Void) {
        if let comments = comments {
            completion(.success(comments))
        } else {
            let error = NSError(domain: "", code: 0)
            completion(.failure(error))
        }
    }
}

final class MainPresenterTest: XCTestCase {

    var view: MockView!
    var presenter: MainPresenter!
    var networkService: NetworkServiceProtocol!
    var router: RouterProtocol!
    var comments = [CommentModel]()

    override func setUpWithError() throws {}

    override func tearDownWithError() throws {
        view = nil
        networkService = nil
        presenter = nil
    }

    func testSuccessComments() {
        let comment = CommentModel(postId: 1, id: 2, name: "Bar", email: "Bazz", body: "Foo")
        var catchComments: [CommentModel]?

        networkService = MockNetworkService(comments: [comment])

        networkService.getComments { result in
            switch result {
            case .success(let comments):
                catchComments = comments
            case .failure(let error):
                print(error.localizedDescription)
            }
        }

        XCTAssertNotEqual(catchComments?.count, 0)
    }

    func testFailureComments() {
        var catchError: Error?

        networkService = MockNetworkService()

        networkService.getComments { result in
            switch result {
            case .success(let comments):
                print(comments ?? "")
            case .failure(let error):
                catchError = error
            }
        }

        XCTAssertNotNil(catchError)
    }
}

