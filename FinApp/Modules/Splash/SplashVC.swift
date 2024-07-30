//
//  SplashVC.swift
//  FinApp
//
//  Created by Muhammad Ziddan on 30/07/24.
//

import UIKit

class SplashVC: BaseViewController {
    
    private var presenter: SplashPresenter
    
    init(presenter: SplashPresenter) {
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
            print("success state on view")
        }
    }
    
}
