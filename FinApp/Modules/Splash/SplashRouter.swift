//
//  SplashRouter.swift
//  FinApp
//
//  Created by Muhammad Ziddan on 30/07/24.
//

import Foundation

struct SplashRouter {
    
    static func showView() -> SplashVC {
        let router = SplashRouter()
        let presenter = SplashPresenter(router: router)
        let view = SplashVC(presenter: presenter)
        presenter.view = view
        
        return view
    }
    
}
