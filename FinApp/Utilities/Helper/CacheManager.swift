//
//  CacheManager.swift
//  FinApp
//
//  Created by Muhammad Ziddan on 07/08/24.
//

import Foundation

class CacheManager {
    
    static let shared = CacheManager()
    var entity = NSCache<NSString, NSObject>()
    
    func removeObject(with keys: [NSString]) {
        for key in keys {
            entity.removeObject(forKey: key)
        }
    }
}

enum CacheKey: NSString {
    case welcomeData = "welcomeData"
    case splashBinding = "splashBinding"
    
    func value() -> NSString {
        return self.rawValue
    }
}
