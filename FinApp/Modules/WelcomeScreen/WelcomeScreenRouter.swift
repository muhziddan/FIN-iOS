//
//  WelcomeScreenRouter.swift
//  FinApp
//
//  Created by Muhammad Ziddan on 30/07/24.
//

import UIKit

struct WelcomeScreenRouter {
    
    static func showView() -> WelcomeScreenVC {
        let interactor = WelcomeScreenInteractor()
        let presenter = WelcomeScreenPresenter(interactor: interactor)
        let view = WelcomeScreenVC(presenter: presenter)
        presenter.view = view
        
        return view
    }
    
    static func navigateToLoginAndSignup(navigation: UINavigationController) {
        navigation.pushViewController(LoginAndSignupRouter.showView(), animated: true)
    }
    
    static func navigateToSplash(navigation: UINavigationController) {
        navigation.popViewController(animated: true)
    }
    
}
