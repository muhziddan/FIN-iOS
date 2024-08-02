//
//  WelcomeScreenRouter.swift
//  FinApp
//
//  Created by Muhammad Ziddan on 30/07/24.
//

import Foundation

struct WelcomeScreenRouter {
    
    static func showView() -> WelcomeScreenVC {
        let router = WelcomeScreenRouter()
        let interactor = WelcomeScreenInteractor()
        let presenter = WelcomeScreenPresenter(router: router, interactor: interactor)
        let view = WelcomeScreenVC(presenter: presenter)
        presenter.view = view
        interactor.presenter = presenter
        
        return view
    }
    
}
