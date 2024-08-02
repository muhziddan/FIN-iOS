//
//  LoginAndSignupVC.swift
//  FinApp
//
//  Created by Muhammad Ziddan on 02/08/24.
//

import UIKit

protocol LoginAndSignupVCProtocol: AnyObject {
    func assignState(state: ApiState)
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
        setupMainLabel()
        setupDescriptionLabel()
        setupSignupButton()
        setupLoginButton()
    }
    
    private func setupImage() {
        
    }
    
    private func setupMainLabel() {
        
    }
    
    private func setupDescriptionLabel() {
        
    }
    
    private func setupSignupButton() {
        signupButton.constraints(leading: backgroundView.leadingAnchor, bottom: loginButton.topAnchor, trailing: backgroundView.trailingAnchor, height: 56, padding: .init(top: 0, left: 16, bottom: 16, right: 16))
        signupButton.tintColor = .lightGray
        signupButton.backgroundColor = .black
        signupButton.addTarget(self, action: #selector(handleSignup), for: .touchUpInside)
        signupButton.layer.masksToBounds = true
        signupButton.layer.cornerRadius = 3
    }
    
    private func setupLoginButton() {
        loginButton.constraints(leading: backgroundView.leadingAnchor, bottom: backgroundView.safeAreaLayoutGuide.bottomAnchor, trailing: backgroundView.trailingAnchor, height: 56, padding: .init(top: 0, left: 16, bottom: 0, right: 16))
        loginButton.tintColor = .black
        loginButton.backgroundColor = .lightGray
        loginButton.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        loginButton.layer.masksToBounds = true
        loginButton.layer.cornerRadius = 3
    }
    
    override func assignState(state: ApiState) {
        
    }
    
}

extension LoginAndSignupVC {
    
    @objc private func handleSignup() {
        
    }
    
    @objc private func handleLogin() {
        
    }
    
}
