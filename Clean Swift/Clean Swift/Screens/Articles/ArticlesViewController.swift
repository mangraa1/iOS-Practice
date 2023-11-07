//
//  ArticlesViewController.swift
//  Clean Swift
//
//  Created by mac on 06.11.2023.
//

import UIKit


protocol ArticlesDisplayLogic: AnyObject {
    func displayData(data: [ArticleCellModel])
}

class ArticlesViewController: UIViewController {

    //MARK: - @IBOutlets
    @IBOutlet private weak var tableView: UITableView!

    //MARK: External vars

    //MARK: - Internal vars
    private var interactor: ArticlesBusinessLogic?
    private var dataToDisplay = [ArticleCellModel]()

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
        let presenter = ArticlesPresenter()
        let interactor = ArticlesInteractor()
        interactor.presenter = presenter
        presenter.viewController = viewController
        viewController.interactor = interactor
    }

    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        interactor?.fetchArticles()
        configureTableView()
    }

    //MARK: - Internal logic
    private func configureTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "ArticleCell", bundle: nil), forCellReuseIdentifier: MyArticleCell.cellIdentifire)
    }
}

//MARK: - UITableViewDataSource & UITableViewDelegate implementation
extension ArticlesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataToDisplay.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: MyArticleCell.cellIdentifire, for: indexPath) as? MyArticleCell
            else { return UITableViewCell() }

        cell.setup(data: dataToDisplay[indexPath.row])
        cell.delegate = self
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
}

//MARK: - ArticleCellDelegate implementation
extension ArticlesViewController: ArticleCellDelegate {
    func didArticleTap(articleId: Int) {
        print("article tap: ", articleId)
    }
}

//MARK: - Display Logic
extension ArticlesViewController: ArticlesDisplayLogic {
    func displayData(data: [ArticleCellModel]) {
        dataToDisplay.removeAll()
        dataToDisplay.append(contentsOf: data)
        tableView.reloadData()
    }
}
