//
//  BasePresenter.swift
//  FinApp
//
//  Created by Muhammad Ziddan on 30/07/24.
//

import Foundation
import Combine

class BasePresenter {
    
    @Published var apiState: ApiState = .idle
    var cancellableBag = Set<AnyCancellable>()
    
}
