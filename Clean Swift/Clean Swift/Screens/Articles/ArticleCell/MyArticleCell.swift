//
//  ArticleCell.swift
//  Clean Swift
//
//  Created by mac on 06.11.2023.
//

import UIKit

class MyArticleCell: UITableViewCell {

    static let cellIdentifire = "ArticleCell"

    @IBOutlet private weak var txtTitle: UILabel!
    @IBOutlet private weak var txtBody: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func setup(data: ArticleCellModel) {
        txtTitle.text = data.titleText
        txtBody.text = data.bodyText
    }
}
