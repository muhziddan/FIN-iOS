//
//  SplashInteractor.swift
//  FinApp
//
//  Created by Muhammad Ziddan on 30/07/24.
//

import Foundation

protocol SplashInteractorProtocol: AnyObject {
    func fetchBinding(callback: @escaping (String?) -> ())
}

class SplashInteractor: SplashInteractorProtocol {
    
    weak var presenter: SplashPresenterProtocol?
    
    func fetchBinding(callback: @escaping (String?) -> ()) {
        print("binding in interactor!")
        callback("data from binding")
    }
    
}
