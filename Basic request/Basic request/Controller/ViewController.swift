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
            print("Users count: ", users?.count as Any)
        }

        ApiManager.shared.getPosts { posts in
            print("Posts count: ", posts?.count as Any)
        }

        ApiManager.shared.getAlbums { albums in
            print("Albums count: ", albums?.count as Any)
        }
    }
}

