//
//  ArticlesPresenter.swift
//  Clean Swift
//
//  Created by mac on 06.11.2023.
//

import Foundation


protocol ArticlesPresentationLogic: AnyObject {
    func presentData(data: [ArticleBackendModel])
}

class ArticlesPresenter {

    //MARK: External vars
    var viewController: ArticlesDisplayLogic?
}

//MARK: - Presentation Logic
extension ArticlesPresenter: ArticlesPresentationLogic {
    func presentData(data: [ArticleBackendModel]) {
        let viewModel = data.map { model -> ArticleCellModel in
            let cellModel = ArticleCellModel(articleId: Int(model.id) ?? 0,
                                             titleText: model.name,
                                             bodyText: model.body)
            return cellModel
        }

        viewController?.displayData(data: viewModel)
    }
}
