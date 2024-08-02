//
//  LoginAndSignupRouter.swift
//  FinApp
//
//  Created by Muhammad Ziddan on 02/08/24.
//

import Foundation

struct LoginAndSignupRouter {
    
    static func showView() -> LoginAndSignupVC {
        let router = LoginAndSignupRouter()
        let presenter = LoginAndSignupPresenter(router: router)
        let view = LoginAndSignupVC(presenter: presenter)
        presenter.view = view
        
        return view
    }
    
}
