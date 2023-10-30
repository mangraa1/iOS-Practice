//
//  MainPresenter.swift
//  MVP
//
//  Created by mac on 27.10.2023.
//

import Foundation


protocol MainViewProtocol: AnyObject {
    func success()
    func failure(error: Error)
}

protocol MainViewPresenterProtocol: AnyObject {
    init(view: MainViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol)
    var comments: [CommentModel]? { get set }
    func getComments()
    func tapOnTheComment(comment: CommentModel?)
}

class MainPresenter: MainViewPresenterProtocol {
    weak var view: MainViewProtocol?
    let router: RouterProtocol?
    let networkService: NetworkServiceProtocol
    var comments: [CommentModel]?

    required init(view: MainViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol) {
        self.view = view
        self.networkService = networkService
        self.router = router
        self.getComments()
    }

    func tapOnTheComment(comment: CommentModel?) {
        router?.showDetail(comment: comment)
    }

    func getComments() {
        networkService.getComments { [weak self] result in
            guard let self = self else { return }

            DispatchQueue.main.async {
                switch result {
                case .success(let comments):
                    self.comments = comments
                    self.view?.success()
                case .failure(let error):
                    self.view?.failure(error: error)
                }
            }
        }
    }
}
