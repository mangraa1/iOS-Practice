//
//  Model.swift
//  MVP
//
//  Created by mac on 27.10.2023.
//

import Foundation


struct CommentModel: Decodable {
    var postId: Int
    var id: Int
    var name: String
    var email: String
    var body: String
}
