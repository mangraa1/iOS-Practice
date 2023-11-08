//
//  ArticleDetailsViewController.swift
//  Clean Swift
//
//  Created by mac on 08.11.2023.
//

import UIKit

class ArticleDetailsViewController: UIViewController {

    //MARK: - External vars
    private(set) var router: (ArticleDetailsRoutingLogic & ArticleDetailsDataPassingProtocol)?

    //MARK: - Internal vars
    private var interactor: (ArticleDetailsBusinessLogic & ArticleDetailsStoreProtocol)?

    //MARK: - Initialization
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    private func setup() {
        let viewController = self
        let interactor = ArticleDetailsInteractor()
        let router = ArticleDetailsRouter()
        router.dataStore = interactor
        viewController.interactor = interactor
        viewController.router = router
    }

    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        interactor?.fetchDetails()
    }
}
