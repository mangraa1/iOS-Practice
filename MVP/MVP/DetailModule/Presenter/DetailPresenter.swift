//
//  DetailPresenter.swift
//  MVP
//
//  Created by mac on 28.10.2023.
//

import Foundation


protocol DetailViewProtocol: AnyObject {
    func setComment(comment: CommentModel?)
}

protocol DetailPresenterProtocol: AnyObject {
    init(view: DetailViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol, comment: CommentModel?)
    func setComment()
    func tap()
}

class DetailPresenter: DetailPresenterProtocol {
    weak var view: DetailViewProtocol?
    var comment: CommentModel?
    var router: RouterProtocol?
    let networkService: NetworkServiceProtocol

    required init(view: DetailViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol, comment: CommentModel?) {
        self.view = view
        self.networkService = networkService
        self.comment = comment
        self.router = router
    }

    func setComment() {
        view?.setComment(comment: comment)
    }

    func tap() {
        router?.popToRoot()
    }
}
