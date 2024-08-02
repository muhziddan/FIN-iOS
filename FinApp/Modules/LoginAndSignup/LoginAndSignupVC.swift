//
//  LoginAndSignupVC.swift
//  FinApp
//
//  Created by Muhammad Ziddan on 02/08/24.
//

import UIKit

protocol LoginAndSignupVCProtocol: AnyObject {
    
}

class LoginAndSignupVC: BaseViewController, LoginAndSignupVCProtocol {
    
    private let presenter: LoginAndSignupPresenter
    
    private let backgroundView = UIView()
    private let imageView = UIImageView()
    private let mainLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let signupButton = UIButton()
    private let loginButton = UIButton()
    
    init(presenter: LoginAndSignupPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    internal override func viewDidLoad() {
        super.viewDidLoad()
        setupMainView()
    }
    
    private func setupMainView() {
        view.addSubview([backgroundView])
        backgroundView.constraints(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
        backgroundView.backgroundColor = .white
        backgroundView.addSubview([imageView, mainLabel, descriptionLabel, signupButton, loginButton])
        setupMainSubview()
    }
    
    private func setupMainSubview() {
        setupImage()
        setupMainLaebl()
        setupDescriptionLabel()
        setupSignupButton()
        setupLoginButton()
    }
    
    private func setupImage() {
        
    }
    
    private func setupMainLaebl() {
        
    }
    
    private func setupDescriptionLabel() {
        
    }
    
    private func setupSignupButton() {
        
    }
    
    private func setupLoginButton() {
        
    }
    
}
