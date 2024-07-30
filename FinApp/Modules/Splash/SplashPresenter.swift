//
//  SplashPresenter.swift
//  FinApp
//
//  Created by Muhammad Ziddan on 30/07/24.
//

import UIKit

class SplashPresenter: BasePresenter {
    
    private let router: SplashRouter
    weak var view: SplashVC?
    
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
        print("fetch data")
        dispatchGroup.leave()
        
        dispatchGroup.notify(queue: .main) { [weak self] in
            guard let self = self else { return }
            self.apiState = .success
        }
    }
    
}
