//
//  AppModel.swift
//  SOLID
//
//  Created by mac on 12.11.2023.
//

import Foundation


struct AppGroup: Decodable {
    let feed: Feed
}

struct Feed: Decodable {
    let title: String
    let result: [FeedResult]
}

struct FeedResult: Decodable {
    let artistName: String
    let name: String
    let id: String
}
