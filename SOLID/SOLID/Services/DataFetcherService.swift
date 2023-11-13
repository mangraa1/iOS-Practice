//
//  DataFetcherService.swift
//  SOLID
//
//  Created by mac on 13.11.2023.
//

import Foundation


class DataFetcherService {
    
    var dataFetcher: DataFetcherProtocol

    init(dataFetcher: DataFetcherProtocol = NetworkDataFetcher()) {
        self.dataFetcher = dataFetcher
    }

    func fetchCountry(completion: @escaping ([Country]?) -> Void) {
        let urlCountryString = "https://raw.githubusercontent.com/Softex-Group/task-mobile/master/test.json"
        dataFetcher.fetchGenericJSONData(urlString: urlCountryString, response: completion)
    }

    func fetchFreeApps(completion: @escaping (AppGroup?) -> Void) {
        let urlFreeAppsString = "https://rss.applemarketingtools.com/api/v2/us/apps/top-free/10/apps.json"
        dataFetcher.fetchGenericJSONData(urlString: urlFreeAppsString, response: completion)
    }

    func fetchMusic(completion: @escaping (AppGroup?) -> Void) {
        let urlMusicString = "https://rss.applemarketingtools.com/api/v2/us/music/most-played/10/albums.json"
        dataFetcher.fetchGenericJSONData(urlString: urlMusicString, response: completion)
    }
}
