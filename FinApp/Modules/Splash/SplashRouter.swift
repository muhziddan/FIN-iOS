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
        let interactor = SplashInteractor()
        let presenter = SplashPresenter(router: router, interactor: interactor)
        let view = SplashVC(presenter: presenter)
        presenter.view = view
        interactor.presenter = presenter
        
        return view
    }
    
}
