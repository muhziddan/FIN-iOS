//
//  WelcomeScreenInteractor.swift
//  FinApp
//
//  Created by Muhammad Ziddan on 31/07/24.
//

import Foundation

protocol WelcomeScreenInteractorProtocol {
    func fetchWelcomeData(completion: @escaping (WelcomeScreenEntity?) -> ())
}

class WelcomeScreenInteractor: BaseInteractor, WelcomeScreenInteractorProtocol {
    
    let cachedData = CacheManager.shared.entity as? NSCache<NSString, WelcomeScreenEntity>
    let currentTime = 3200
    
    func fetchWelcomeData(completion: @escaping (WelcomeScreenEntity?) -> ()) {
        if let cachedData = cachedData?.object(forKey: CacheKey.welcomeData.value()), let savedTime = cachedData.dataSavedTime, (currentTime - savedTime) < 300 {
            print("cache data welcome get: \(String(describing: cachedData))")
            completion(cachedData)
            return
        }
        
        remoteFetchWelcomeData { [weak self] response in
            guard let self = self, let response = response else { return }
            
            self.cachedData?.setObject(response, forKey: CacheKey.welcomeData.value())
            print("cache data welcome after set: \(String(describing: self.cachedData?.object(forKey: CacheKey.welcomeData.value())?.dataSavedTime))")
            completion(response)
        }
    }
    
    func remoteFetchWelcomeData(completion: @escaping (WelcomeScreenEntity?) -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            let response = WelcomeScreenEntity(image: "123.jpg", title: "picture one", subtitle: "hello this is picture one", dataSavedTime: 3000)
            completion(response)
        }
    }
    
}
