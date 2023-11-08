//
//  ArticleDetailsRouter.swift
//  Clean Swift
//
//  Created by mac on 08.11.2023.
//

import Foundation


protocol ArticleDetailsRoutingLogic {

}

protocol ArticleDetailsDataPassingProtocol {
    var dataStore: ArticleDetailsStoreProtocol? { get }
}

class ArticleDetailsRouter: ArticleDetailsDataPassingProtocol {

    weak var dataStore: ArticleDetailsStoreProtocol?
}

//MARK: - Routing Logic
extension ArticleDetailsRouter: ArticleDetailsRoutingLogic {
    
}
