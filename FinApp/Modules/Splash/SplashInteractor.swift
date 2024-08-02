//
//  SplashInteractor.swift
//  FinApp
//
//  Created by Muhammad Ziddan on 30/07/24.
//

import Foundation

struct SplashInteractor {
    
    static func fetchBinding(callback: @escaping (String?) -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            callback("data from binding")
        }
    }
    
}
