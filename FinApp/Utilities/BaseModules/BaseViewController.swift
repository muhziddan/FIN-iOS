//
//  BaseViewController.swift
//  FinApp
//
//  Created by Muhammad Ziddan on 30/07/24.
//

import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    func assignState(state: ApiState) {
        switch state {
        case .idle:
            print("idle state")
        case .loading:
            print("loading state")
        case .failure:
            print("failure state")
        case .success:
            print("success state")
        }
    }
    
}
