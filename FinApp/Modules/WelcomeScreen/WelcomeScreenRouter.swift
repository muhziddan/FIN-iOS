//
//  WelcomeScreenRouter.swift
//  FinApp
//
//  Created by Muhammad Ziddan on 30/07/24.
//

import UIKit

struct WelcomeScreenRouter {
    
    static func showView() -> WelcomeScreenVC {
        let router = WelcomeScreenRouter()
        let presenter = WelcomeScreenPresenter(router: router)
        let view = WelcomeScreenVC(presenter: presenter)
        presenter.view = view
        
        return view
    }
    
    func navigateToLoginAndSignup(navigation: UINavigationController) {
        navigation.pushViewController(LoginAndSignupRouter.showView(), animated: true)
    }
    
}
