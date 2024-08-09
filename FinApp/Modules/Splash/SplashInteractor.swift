//
//  SplashInteractor.swift
//  FinApp
//
//  Created by Muhammad Ziddan on 30/07/24.
//

import Foundation

protocol SplashInteractorProtocol: AnyObject {
    func fetchBinding(completion: @escaping (SplashEntity?) -> ())
}

class SplashInteractor: BaseInteractor, SplashInteractorProtocol {
    
    let currentTime = 2000
    let cachedData = CacheManager.shared.entity as? NSCache<NSString, SplashEntity>
    let cachedDataWelcom = CacheManager.shared.entity as? NSCache<NSString, WelcomeScreenEntity>
    
    func fetchBinding(completion: @escaping (SplashEntity?) -> ()) {
        
        print("data welcome from splash interactor: \(String(describing: cachedDataWelcom?.object(forKey: CacheKey.welcomeData.value())?.dataSavedTime))")
        
        if let cachedResponse = cachedData?.object(forKey: CacheKey.splashBinding.value()), let saveTime = cachedResponse.dataSavedTime, (currentTime - saveTime) < 300 {
            completion(cachedResponse)
            print("called from cached")
            return
        }
        
        remoteBinding { [weak self] response in
            guard let self = self,  let response = response else { completion(nil); return }
            self.cachedData?.setObject(response, forKey: CacheKey.splashBinding.value())
            print("cache object: \(String(describing: self.cachedData?.object(forKey: CacheKey.splashBinding.value())))")
            print("called from fetch")
            completion(response)
        }
    }
    
    private func remoteBinding(callback: @escaping (SplashEntity?) -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            let response = SplashEntity(session: "ahbwdjawkdjnSOBNjnakl", version: "12", dataSavedTime: 1800)
            print("called from remote fetch")
            callback(response)
        }
    }
    
}
