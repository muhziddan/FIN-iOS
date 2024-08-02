//
//  LoginAndSignupPresenter.swift
//  FinApp
//
//  Created by Muhammad Ziddan on 02/08/24.
//

import Foundation

protocol LoginAndSignupPresenterProtocol: AnyObject {
    
}

class LoginAndSignupPresenter: BasePresenter {
    
    private let router: LoginAndSignupRouter
    weak var view: LoginAndSignupVCProtocol?
    
    init(router: LoginAndSignupRouter) {
        self.router = router
        super.init()
        
        $apiState.sink { [weak self] state in
            guard let self = self else { return }
        }.store(in: &cancellableBag)
    }
    
}
