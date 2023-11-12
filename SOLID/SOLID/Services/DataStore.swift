//
//  DataStor.swift
//  SOLID
//
//  Created by mac on 12.11.2023.
//

import Foundation


final class DataStore {

    public func saveNameInCache(name: String) {
        print("\(name) saved")
    }

    public func getNameFromCache() -> String {
        return "Some name"
    }
}
