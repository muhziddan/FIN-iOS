//
//  CircleButton.swift
//  FinApp
//
//  Created by Muhammad Ziddan on 02/08/24.
//

import UIKit

class CircleButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func setupButton() {
        layer.masksToBounds = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.size.width / 2
    }
    
}
