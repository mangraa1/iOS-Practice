//
//  DetailViewController.swift
//  MVP
//
//  Created by mac on 28.10.2023.
//

import UIKit

class DetailViewController: UIViewController {

    //MARK: - @IBOutlet
    @IBOutlet weak var detailLabel: UILabel!

    //MARK: - External vars
    public var presenter: DetailPresenterProtocol!

    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter.setComment()
    }

    //MARK: - @IBAction
    @IBAction func tapAction(_ sender: Any) {
        presenter.tap()
    }
}

//MARK: - DetailViewProtocol
extension DetailViewController: DetailViewProtocol {
    func setComment(comment: CommentModel?) {
        detailLabel.text = comment?.body
    }
}
