//
//  ArticleDetailsInteractor.swift
//  Clean Swift
//
//  Created by mac on 08.11.2023.
//

import Foundation


protocol ArticleDetailsBusinessLogic {
    func fetchDetails()
}

protocol ArticleDetailsStoreProtocol: AnyObject {
    var articleId: Int { get set }
}

class ArticleDetailsInteractor: ArticleDetailsStoreProtocol {
    var articleId: Int = 3
}

//MARK: - Business Logic
extension ArticleDetailsInteractor: ArticleDetailsBusinessLogic {
    func fetchDetails() {
        print("Article id: ", articleId)
    }
}
