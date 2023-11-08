//
//  ArticlesRouter.swift
//  Clean Swift
//
//  Created by mac on 08.11.2023.
//

import Foundation
import UIKit


protocol ArticlesRoutingLogic {
    func navigateToDetails(articleId: Int)
}

class ArticlesRouter {
    
    weak var viewController: UIViewController?
}

//MARK: - Routing Logic
extension ArticlesRouter: ArticlesRoutingLogic {
    func navigateToDetails(articleId: Int) {
        let storyboard = UIStoryboard.init(name: "ArticleDetailsViewController", bundle: nil)
        guard let articlesDetailVC = storyboard.instantiateViewController(withIdentifier: "ArticleDetailsViewController") as? ArticleDetailsViewController else { return }

        articlesDetailVC.router?.dataStore?.articleId = articleId
        viewController?.navigationController?.pushViewController(articlesDetailVC, animated: true)
    }
}
