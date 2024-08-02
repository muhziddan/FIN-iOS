//
//  WelcomeScreenPresenter.swift
//  FinApp
//
//  Created by Muhammad Ziddan on 30/07/24.
//

import UIKit

protocol WelcomeScreenPresenterProtocol: AnyObject {
    func navigateToLoginAndSignup(navigation: UINavigationController)
}

class WelcomeScreenPresenter: BasePresenter, WelcomeScreenPresenterProtocol {
    
    private let router: WelcomeScreenRouter
    weak var view: WelcomeScreenVCProtocol?
    
    init(router: WelcomeScreenRouter) {
        self.router = router
        super.init()
        
        $apiState.sink { [weak self] state in
            guard let self = self else { return }
            self.view?.assignState(state: state)
        }.store(in: &cancellableBag)
    }
    
    func navigateToLoginAndSignup(navigation: UINavigationController) {
        router.navigateToLoginAndSignup(navigation: navigation)
    }
    
}
