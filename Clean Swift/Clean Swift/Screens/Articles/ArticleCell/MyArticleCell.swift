//
//  ArticleCell.swift
//  Clean Swift
//
//  Created by mac on 06.11.2023.
//

import UIKit


protocol ArticleCellDelegate: AnyObject {
    func didArticleTap(articleId: Int)
}

class MyArticleCell: UITableViewCell {

    static let cellIdentifire = "ArticleCell"

    //MARK: - External vars
    weak var delegate: ArticleCellDelegate?

    //MARK: - Internal vars
    private var articleId: Int?

    //MARK: - @IBOutlets
    @IBOutlet private weak var txtTitle: UILabel!
    @IBOutlet private weak var txtBody: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    @IBAction func didNextTap(_ sender: Any) {
        guard let articleId = articleId else { return }
        
        delegate?.didArticleTap(articleId: articleId)
    }

    func setup(data: ArticleCellModel) {
        articleId = data.articleId
        txtTitle.text = data.titleText
        txtBody.text = data.bodyText
    }
}
