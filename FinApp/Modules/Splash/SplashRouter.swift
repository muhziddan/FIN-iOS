//
//  SplashRouter.swift
//  FinApp
//
//  Created by Muhammad Ziddan on 30/07/24.
//

import UIKit

struct SplashRouter {
    
    static func showView() -> SplashVC {
        let interactor = SplashInteractor()
        let presenter = SplashPresenter(interactor: interactor)
        let view = SplashVC(presenter: presenter)
        presenter.view = view
        
        return view
    }
    
    static func navigateToWelcomeScreen(navigation: UINavigationController?) {
        navigation?.pushViewController(WelcomeScreenRouter.showView(), animated: true)
    }
    
}
