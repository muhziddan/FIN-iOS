//
//  SplashRouter.swift
//  FinApp
//
//  Created by Muhammad Ziddan on 30/07/24.
//

import UIKit

struct SplashRouter {
    
    static func showView() -> SplashVC {
        let router = SplashRouter()
        let presenter = SplashPresenter(router: router)
        let view = SplashVC(presenter: presenter)
        presenter.view = view
        
        return view
    }
    
    func navigateToWelcomeScreen(navigation: UINavigationController?) {
        navigation?.pushViewController(WelcomeScreenRouter.showView(), animated: true)
    }
    
}
