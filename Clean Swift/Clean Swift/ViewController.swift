//
//  ViewController.swift
//  Clean Swift
//
//  Created by mac on 06.11.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "First VC"
    }

    @IBAction func nextVCButton(_ sender: UIButton ) {
        let storyboard = UIStoryboard.init(name: "Articles", bundle: nil)
        guard
            let articlesVC = storyboard.instantiateViewController(identifier: "Articles") as? ArticlesViewController
            else { return }

        self.navigationController?.pushViewController(articlesVC, animated: true)
    }
}

