//
//  SplashPresenter.swift
//  FinApp
//
//  Created by Muhammad Ziddan on 30/07/24.
//

import UIKit

protocol SplashPresenterProtocol: AnyObject {
    func fetch()
    func navigateToWelcomeScreen(navigation: UINavigationController)
}

class SplashPresenter: BasePresenter, SplashPresenterProtocol {
    
    private let router: SplashRouter
    weak var view: SplashVCProtocol?
    
    init(router: SplashRouter) {
        self.router = router
        super.init()
        
        $apiState.sink { [weak self] state in
            guard let self = self else { return }
            self.view?.assignState(state: state)
        }.store(in: &cancellableBag)
    }
    
    func fetch() {
        apiState = .loading
        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.enter()
        SplashInteractor.fetchBinding { dataResponse in
            dispatchGroup.leave()
        }
        
        dispatchGroup.notify(queue: .main) { [weak self] in
            guard let self = self else { return }
            self.apiState = .success
        }
    }
    
    func navigateToWelcomeScreen(navigation: UINavigationController) {
        router.navigateToWelcomeScreen(navigation: navigation)
    }
    
}
