//
//  CustomView.swift
//  XibNibProject
//
//  Created by mac on 15.01.2024.
//

import UIKit

class CustomView: UIView {

    //MARK: - Properties
    static let identifier = "CustomView"

    //MARK: - @IBOutlets
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var label: UILabel!

    //MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupContentView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)

        setupContentView()
    }
    
    //MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()

        contentView.layer.borderColor = UIColor.black.cgColor
        contentView.layer.borderWidth = 1
        contentView.layer.cornerRadius = 10
    }

    //MARK: - Internal methods
    private func setupContentView() {
        Bundle.main.loadNibNamed(CustomView.identifier, owner: self)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
}
