//
//  WelcomeScreenPresenter.swift
//  FinApp
//
//  Created by Muhammad Ziddan on 30/07/24.
//

import UIKit

protocol WelcomeScreenPresenterProtocol: AnyObject {
    
}

class WelcomeScreenPresenter: BasePresenter, WelcomeScreenPresenterProtocol {
    
    private let router: WelcomeScreenRouter
    private let interactor: WelcomeScreenInteractorProtocol
    weak var view: WelcomeScreenVCProtocol?
    
    init(router: WelcomeScreenRouter, interactor: WelcomeScreenInteractorProtocol) {
        self.router = router
        self.interactor = interactor
        super.init()
    }
    
}
