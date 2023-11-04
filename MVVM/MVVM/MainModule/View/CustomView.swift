//
//  CustomView.swift
//  MVVM
//
//  Created by mac on 03.11.2023.
//

import UIKit

class CustomView: UIView {
    var viewData: ViewData = .initial {
        didSet {
            setNeedsLayout()
        }
    }

    lazy var imageView = makeImageView()
    lazy var activityIndicator = makeActivityIndicatorView()
    lazy var titleLabel = makeTitleLabel()
    lazy var descriptionLabel = makeDescriptionLabel()

    override func layoutSubviews() {
        super.layoutSubviews()

        switch viewData {
        case .initial:
            update(viewData: nil, isHidden: true)
            activityIndicatorState(isHidden: true, startAnimating: false)
        case .loading(let loading):
            update(viewData: loading, isHidden: false)
            activityIndicatorState(isHidden: false, startAnimating: true)
        case .success(let success):
            update(viewData: success, isHidden: false)
            activityIndicatorState(isHidden: true, startAnimating: false)
        case .failure(let failure):
            update(viewData: failure, isHidden: false)
            activityIndicatorState(isHidden: true, startAnimating: false)
        }
    }

    //MARK: - Internal functions

    private func update(viewData: ViewData.Data?, isHidden: Bool) {
        imageView.image = UIImage(named: viewData?.icon ?? "")
        titleLabel.text = viewData?.title
        descriptionLabel.text = viewData?.description
        imageView.isHidden = isHidden
        titleLabel.isHidden = isHidden
        descriptionLabel.isHidden = isHidden
    }

    private func activityIndicatorState(isHidden: Bool, startAnimating: Bool) {
        activityIndicator.isHidden = isHidden
        (startAnimating == true) ? (activityIndicator.startAnimating()) : (activityIndicator.stopAnimating())
    }
}
