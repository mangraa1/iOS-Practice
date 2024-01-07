//
//  CharactersView.swift
//  API-Integration
//
//  Created by mac on 07.01.2024.
//

import UIKit
import SnapKit


class CharactersView: UIView {

    //MARK: - External properties
    public var tableView: UITableView = .init(frame: .zero, style: .insetGrouped)

    //MARK: - Life Cycle
    override func layoutSubviews() {
        configure()
    }

    //MARK: - Interna methods
    private func configure() {
        self.addSubview(tableView)

        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        tableView.separatorInset = .init(top: 0, left: 16, bottom: 0, right: 16)

        tableView.register(CharacterTableViewCell.self, forCellReuseIdentifier: CharacterTableViewCell.identifier)
    }
}
