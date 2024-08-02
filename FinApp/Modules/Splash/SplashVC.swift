//
//  SplashVC.swift
//  FinApp
//
//  Created by Muhammad Ziddan on 30/07/24.
//

import UIKit

protocol SplashVCProtocol: AnyObject {
    func assignState(state: ApiState)
}

class SplashVC: BaseViewController, SplashVCProtocol {
    
    private let presenter: SplashPresenterProtocol
    
    init(presenter: SplashPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    internal override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    internal override func viewDidAppear(_ animated: Bool) {
        presenter.fetch()
    }
    
    override func assignState(state: ApiState) {
        super.assignState(state: state)
        switch state {
        case .idle:
            print("idle state on view")
        case .loading:
            print("loading state on view")
        case .failure:
            print("failure state on view")
        case .success:
            navigateToWelcomeScreen()
        }
    }
    
    func setupView() {
        print("setup view!")
    }
    
    func navigateToWelcomeScreen() {
        presenter.navigateToWelcomeScreen(navigation: navigationController ?? UINavigationController())
    }
    
}
