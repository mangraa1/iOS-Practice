//
//  ArticlesInteractor.swift
//  Clean Swift
//
//  Created by mac on 06.11.2023.
//

import Foundation


protocol ArticlesBusinessLogic {
    func fetchArticles()
}

class ArticlesInteractor {

    //MARK: External vars
    var presenter: ArticlesPresentationLogic?
}

//MARK: - Business Logic
extension ArticlesInteractor: ArticlesBusinessLogic {
    func fetchArticles() {
        var backendResponse = [ArticleBackendModel]()
        let testModel = ArticleBackendModel(id: "0",
                                            name: "Lorem Ipsum",
                                            body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                                            wordCount: 21,
                                            image: Data())

        for _ in 0 ..< 8 { backendResponse.append(testModel) }

        presenter?.presentData(data: backendResponse)
    }
}
