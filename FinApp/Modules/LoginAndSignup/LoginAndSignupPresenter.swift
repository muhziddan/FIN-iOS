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
    
    private let interactor: LoginAndSignupInteractorProtocol
    weak var view: LoginAndSignupVCProtocol?
    
    init(interactor: LoginAndSignupInteractorProtocol) {
        self.interactor = interactor
        super.init()
        
        $apiState.sink { [weak self] state in
            guard let self = self else { return }
            self.view?.assignState(state: state)
        }.store(in: &cancellableBag)
    }
    
}
