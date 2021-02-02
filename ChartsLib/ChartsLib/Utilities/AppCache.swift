//
//  AppCache.swift
//  ChartsApp
//
//  Created by Gaurav Tiwari on 01/02/21.
//  Copyright © 2021 Gaurav Tiwari. All rights reserved.
//

import Foundation

let UserScoreValue = "5c85320da6f54eb"

protocol AppCacheProtocol {
    func update(property: CacheableProperty, value: Int)
    func get(property: CacheableProperty) -> Int?
    func clear(property: CacheableProperty)
}

class AppCache: NSObject, AppCacheProtocol {

    static let shared: AppCache = AppCache()
    
    private override init() {}
    
    func update(property: CacheableProperty, value: Int) {
        clear(property: property)
        
        switch property.store.cacheStore {
        case .userDefaults:
            UserDefaults.standard.setValue(value, forKey: property.store.key)
            UserDefaults.standard.synchronize()
        case .keychain:
            // persist in keychain with key
            print("To do")
        }
    }

    func get(property: CacheableProperty) -> Int? {
        switch property.store.cacheStore {
        case .userDefaults:
            return UserDefaults.standard.value(forKey: property.store.key) as? Int ?? nil
        case .keychain:
            // retrieve from keychain
            print("To do")
            return 0
        }
    }

    func clear(property: CacheableProperty) {
        let key = property.store.key
        switch property.store.cacheStore {
        case .userDefaults:
            UserDefaults.standard.removeObject(forKey: key)
        case .keychain:
            // remove from keychain
            print("To do")
        }
    }
}

enum CacheableStore {
    case keychain
    case userDefaults
}

enum CacheableProperty: Int {
    case userScoreValue

    var store: (key: String, cacheStore: CacheableStore) {
        switch self {
        case .userScoreValue:
            return (UserScoreValue, CacheableStore.userDefaults)
        }
    }
}
