//
//  LoginAndSignupRouter.swift
//  FinApp
//
//  Created by Muhammad Ziddan on 02/08/24.
//

import Foundation

struct LoginAndSignupRouter {
    
    static func showView() -> LoginAndSignupVC {
        let interactor = LoginAndSignupInteractor()
        let presenter = LoginAndSignupPresenter(interactor: interactor)
        let view = LoginAndSignupVC(presenter: presenter)
        presenter.view = view
        
        return view
    }
    
}
