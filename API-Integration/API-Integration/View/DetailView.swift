//
//  DetailView.swift
//  API-Integration
//
//  Created by mac on 12.01.2024.
//

import UIKit
import SnapKit


class DetailView: UIView {

    //MARK: - External properties
    public var currentCharacter: Character!

    //MARK: - Internal properties
    private var generalStack: UIStackView = UIStackView()

    private var characterImageView: UIImageView = UIImageView()
    private var characterStatus: UILabel = UILabel()
    private var characterSpecies: UILabel = UILabel()
    private var characterGender: UILabel = UILabel()

    //MARK: - Life Cycle
    override func layoutSubviews() {
        configure()
    }

    //MARK: - Internal methods
    private func configure() {
        dataInitialization(from: currentCharacter)

        // generalStack configure
        generalStack.axis = .vertical
        generalStack.alignment = .fill
        generalStack.distribution = .fillProportionally
        generalStack.spacing = 10

        generalStack.addArrangedSubview(characterImageView)

        [characterStatus, characterSpecies, characterGender].forEach {
            generalStack.addArrangedSubview($0)
            $0.font = UIFont(name: "Apple SD Gothic Neo Regular", size: 21)

            let textInsets = UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 0)
        }

        addSubview(generalStack)

        generalStack.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(16)
            make.leading.equalTo(self.snp.leading).offset(16)
            make.trailing.equalTo(self.snp.trailing).offset(-16)
            make.centerX.equalTo(self.center.x)
        }
    }

    func dataInitialization(from character: Character) {
        ImageFetcher.shared.loadImage(for: character, completion: {[weak self] image in
            self?.characterImageView.image = image
        })
        characterStatus.text  = "Status: " + character.status
        characterSpecies.text = "Species: " + character.species
        characterGender.text  = "Gender: " + character.gender
    }
}
