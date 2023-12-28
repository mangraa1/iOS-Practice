//
//  ViewController.swift
//  Basic request
//
//  Created by mac on 27.12.2023.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ApiManager.shared.getUsers { users in
            print("Users count: ", users.count)
        }

        ApiManager.shared.getPosts { posts in
            print("Posts count: ", posts.count)
        }
    }
}

