//
//  DataFetcherService.swift
//  SOLID
//
//  Created by mac on 13.11.2023.
//

import Foundation


class DataFetcherService {
    
    let networkDataFetcher: DataFetcherProtocol
    let localDataFetcher: DataFetcherProtocol

    init(networkDataFetcher: DataFetcherProtocol = NetworkDataFetcher(), localDataFetcher: DataFetcherProtocol = LocalDataFetcher()) {
        self.networkDataFetcher = networkDataFetcher
        self.localDataFetcher = localDataFetcher
    }

    func fetchNetworkCountry(completion: @escaping ([Country]?) -> Void) {
        let urlCountryString = "https://raw.githubusercontent.com/Softex-Group/task-mobile/master/test.json"
        networkDataFetcher.fetchGenericJSONData(urlString: urlCountryString, response: completion)
    }

    func fetchLocalCountry(completion: @escaping ([Country]?) -> Void) {
        let localUrlString = "usersAPI.txt"
        localDataFetcher.fetchGenericJSONData(urlString: localUrlString, response: completion)
    }

    func fetchFreeApps(completion: @escaping (AppGroup?) -> Void) {
        let urlFreeAppsString = "https://rss.applemarketingtools.com/api/v2/us/apps/top-free/10/apps.json"
        networkDataFetcher.fetchGenericJSONData(urlString: urlFreeAppsString, response: completion)
    }

    func fetchMusic(completion: @escaping (AppGroup?) -> Void) {
        let urlMusicString = "https://rss.applemarketingtools.com/api/v2/us/music/most-played/10/albums.json"
        networkDataFetcher.fetchGenericJSONData(urlString: urlMusicString, response: completion)
    }
}
