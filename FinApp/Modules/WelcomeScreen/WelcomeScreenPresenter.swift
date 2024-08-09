//
//  WelcomeScreenPresenter.swift
//  FinApp
//
//  Created by Muhammad Ziddan on 30/07/24.
//

import UIKit

protocol WelcomeScreenPresenterProtocol: AnyObject {
    func navigateToLoginAndSignup(navigation: UINavigationController)
    func navigateToSplash(navigation: UINavigationController)
    func fetch()
}

class WelcomeScreenPresenter: BasePresenter, WelcomeScreenPresenterProtocol {
    
    private let interactor: WelcomeScreenInteractorProtocol
    weak var view: WelcomeScreenVCProtocol?
    
    init(interactor: WelcomeScreenInteractorProtocol) {
        self.interactor = interactor
        super.init()
        
        $apiState.sink { [weak self] state in
            guard let self = self else { return }
            self.view?.assignState(state: state)
        }.store(in: &cancellableBag)
    }
    
    func fetch() {
        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.enter()
        interactor.fetchWelcomeData { response in
            guard let response = response else { return }
            print("data in presenter: \(response)")
            dispatchGroup.leave()
        }
        
        dispatchGroup.notify(queue: .main) {
            print("done fetcing!")
        }
    }
    
    func navigateToLoginAndSignup(navigation: UINavigationController) {
        WelcomeScreenRouter.navigateToLoginAndSignup(navigation: navigation)
    }
    
    func navigateToSplash(navigation: UINavigationController) {
        WelcomeScreenRouter.navigateToSplash(navigation: navigation)
    }
    
}
