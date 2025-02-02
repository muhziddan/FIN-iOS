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
    
    weak var view: SplashVCProtocol?
    private let interactor: SplashInteractorProtocol
    
    init(interactor: SplashInteractor) {
        self.interactor = interactor
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
        interactor.fetchBinding { dataResponse in
            print("response from presenter: \(String(describing: dataResponse))")
            dispatchGroup.leave()
        }
        
        dispatchGroup.notify(queue: .main) { [weak self] in
            guard let self = self else { return }
            self.apiState = .success
        }
    }
    
    func navigateToWelcomeScreen(navigation: UINavigationController) {
        SplashRouter.navigateToWelcomeScreen(navigation: navigation)
    }
    
}
