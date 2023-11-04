//
//  CustomView + Extension.swift
//  MVVM
//
//  Created by mac on 03.11.2023.
//

import UIKit


extension CustomView {
    func makeImageView() -> UIImageView {
        let imageView = UIImageView()
        addSubview(imageView)
        imageView.contentMode = .scaleAspectFill

        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 2).isActive = true
        imageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        return imageView
    }

    func makeActivityIndicatorView() -> UIActivityIndicatorView {
        let activityIndicator = UIActivityIndicatorView(style: .medium)
        activityIndicator.color = .gray
        activityIndicator.hidesWhenStopped = true
        addSubview(activityIndicator)

        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 5).isActive = true
        activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        return activityIndicator
    }

    func makeTitleLabel() -> UILabel {
        let titleLabel = makeLabel(size: 20)
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        titleLabel.numberOfLines = 0

        titleLabel.topAnchor.constraint(equalToSystemSpacingBelow: imageView.bottomAnchor, multiplier: 1).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        return titleLabel
    }

    func makeDescriptionLabel() -> UILabel {
        let descriptionLabel = makeLabel(size: 14)
        descriptionLabel.numberOfLines = 0

        descriptionLabel.topAnchor.constraint(equalToSystemSpacingBelow: titleLabel.bottomAnchor, multiplier: 1).isActive = true
        descriptionLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        return descriptionLabel
    }

    func makeLabel(size: CGFloat) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: size)
        addSubview(label)
        return label
    }
}
