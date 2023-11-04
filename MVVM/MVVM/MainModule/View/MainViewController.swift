//
//  ViewController.swift
//  MVVM
//
//  Created by mac on 03.11.2023.
//

import UIKit

class MainViewController: UIViewController {

    //MARK: Variables

    var viewModel: MainViewModelProtocol!
    var customView: CustomView!

    //MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = MainViewModel()

        createView()
        updateView()
    }

    //MARK: - External functions

    private func createView() {
        customView = CustomView()
        customView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        customView.center = view.center
        view.addSubview(customView)
    }

    private func updateView() {
        viewModel.updateWithData = { [weak self] viewData in
            self?.customView.viewData = viewData
        }
    }

    //MARK: - @IBActions

    @IBAction func startAction(_ sender: Any) {
        viewModel.startFetch()
    }
    
    @IBAction func errorAction(_ sender: Any) {
        viewModel.error()
    }
}

