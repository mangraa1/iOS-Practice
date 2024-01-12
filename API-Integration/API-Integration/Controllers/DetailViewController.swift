//
//  DetailViewController.swift
//  API-Integration
//
//  Created by mac on 05.01.2024.
//

import UIKit


class DetailViewController: UIViewController {

    //MARK: - External properties
    public var currentCharacter: Character!

    //MARK: - Internal properties
    private var detailView: DetailView!

    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        createView()
    }

    private func createView() {
        detailView = DetailView()
        detailView.currentCharacter = currentCharacter
        detailView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        detailView.center = view.center
        view.addSubview(detailView)
    }
}
