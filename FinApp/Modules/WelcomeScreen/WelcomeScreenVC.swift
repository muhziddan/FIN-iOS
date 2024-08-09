//
//  WelcomeScreenVC.swift
//  FinApp
//
//  Created by Muhammad Ziddan on 30/07/24.
//

import UIKit

protocol WelcomeScreenVCProtocol: AnyObject {
    func assignState(state: ApiState)
}

class WelcomeScreenVC: BaseViewController, WelcomeScreenVCProtocol {
    
    private let presenter: WelcomeScreenPresenterProtocol
    
    private let backgroundView = UIView()
    private let welcomeImage = UIImageView()
    private let backButton = CircleButton()
    private let bottomView = UIView()
    private let titleLabel = UILabel()
    private let subtitleLabel = UILabel()
    private let pageControl = UIPageControl()
    private var pageIndex = 0
    private let nextButton = CircleButton()
    
    init(presenter: WelcomeScreenPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        setupView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        presenter.fetch()
    }
    
    private func setupView() {
        view.addSubview([backgroundView])
        backgroundView.constraints(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
        backgroundView.backgroundColor = .white
        backgroundView.addSubview([bottomView, welcomeImage, backButton])
        setupMainSubview()
    }
    
    private func setupMainSubview() {
        setupBottomView()
        setupWelcomeImage()
        setupBackButton()
    }
    
    private func setupWelcomeImage() {
        welcomeImage.constraints(top: backgroundView.topAnchor, leading: backgroundView.leadingAnchor, bottom: bottomView.topAnchor, trailing: backgroundView.trailingAnchor)
        welcomeImage.image = UIImage(named: "welcome1")
    }
    
    private func setupBottomView() {
        bottomView.constraints(leading: backgroundView.leadingAnchor, bottom: backgroundView.bottomAnchor, trailing: backgroundView.trailingAnchor, height: view.frame.size.height * 5 / 12)
        bottomView.backgroundColor = .white
        bottomView.addSubview([titleLabel, subtitleLabel, pageControl, nextButton])
        setupBottomSubview()
    }
    
    private func setupBackButton() {
        backButton.constraints(top: backgroundView.safeAreaLayoutGuide.topAnchor, leading: backgroundView.leadingAnchor, width: 40, height: 40, padding: .init(top: 0, left: 32, bottom: 0, right: 0))
        backButton.isHidden = false
        backButton.tintColor = .black
        backButton.backgroundColor = .white
        backButton.setImage(UIImage(systemName: "arrow.backward"), for: .normal)
        backButton.addTarget(self, action: #selector(handleBackButton), for: .touchUpInside)
    }
    
    private func setupBottomSubview() {
        setuptitleLabel()
        setupSubtitleLabel()
        setupPageControl()
        setupNextButton()
    }
    
    private func setuptitleLabel() {
        titleLabel.constraints(top: bottomView.topAnchor, leading: bottomView.leadingAnchor, trailing: bottomView.trailingAnchor, height: 48, padding: .init(top: 56, left: 72, bottom: 0, right: 72))
        titleLabel.numberOfLines = 0
        titleLabel.text = "Transfer money faster than ever before"
        titleLabel.textColor = .black
    }
    
    private func setupSubtitleLabel() {
        subtitleLabel.constraints(top: titleLabel.bottomAnchor, leading: bottomView.leadingAnchor, trailing: bottomView.trailingAnchor, height: 48, padding: .init(top: 16, left: 72, bottom: 0, right: 72))
        subtitleLabel.numberOfLines = 0
        subtitleLabel.text = "Set the amount you need, select a person and send the transaction in one click"
        subtitleLabel.textColor = .black
    }
    
    private func setupPageControl() {
        pageControl.constraints(top: subtitleLabel.bottomAnchor,leading: bottomView.leadingAnchor, trailing: bottomView.trailingAnchor, padding: .init(top: 32, left: 72, bottom: 0, right: 72))
        pageControl.currentPageIndicatorTintColor = .blue
        pageControl.pageIndicatorTintColor = .lightGray
        pageControl.numberOfPages = 3
        pageControl.currentPage = pageIndex
    }
    
    private func setupNextButton() {
        nextButton.constraints(bottom: bottomView.safeAreaLayoutGuide.bottomAnchor, centerX: (bottomView.centerXAnchor, 0), width: 56, height: 56)
        nextButton.tintColor = .white
        nextButton.backgroundColor = .blue
        nextButton.setImage(UIImage(systemName: "arrow.forward"), for: .normal)
        nextButton.addTarget(self, action: #selector(handleNextButton), for: .touchUpInside)
    }
    
}

extension WelcomeScreenVC {
    
    @objc private func handleBackButton() {
        if pageIndex != 0 {
            pageIndex -= 1
        }
        
        pageHandler()
    }
    
    @objc private func handleNextButton() {
        pageIndex += 1
        pageHandler()
    }
    
    private func pageHandler() {
        switch pageIndex  {
        case 0:
//            backButton.isHidden = false
            navigateToSplash()
        case 1:
            backButton.isHidden = false
        case 2:
            print("page final")
        case 3:
            pageIndex -= 1
            navigateToLoginAndSignup()
        default: break
        }
        pageControl.currentPage = pageIndex
    }
    
    private func navigateToLoginAndSignup() {
        presenter.navigateToLoginAndSignup(navigation: navigationController ?? UINavigationController())
    }
    
    private func navigateToSplash() {
        presenter.navigateToSplash(navigation: navigationController ?? UINavigationController())
    }
    
}
