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
    init(view: DetailViewProtocol, networkService: NetworkServiceProtocol, comment: CommentModel?)
    func setComment()
}

class DetailPresenter: DetailPresenterProtocol {
    weak var view: DetailViewProtocol?
    let networkService: NetworkServiceProtocol
    var comment: CommentModel?

    required init(view: DetailViewProtocol, networkService: NetworkServiceProtocol, comment: CommentModel?) {
        self.view = view
        self.networkService = networkService
        self.comment = comment
    }

    func setComment() {
        view?.setComment(comment: comment)
    }
}
