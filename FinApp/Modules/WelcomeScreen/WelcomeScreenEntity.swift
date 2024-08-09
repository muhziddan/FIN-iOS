//
//  WelcomeScreenEntity.swift
//  FinApp
//
//  Created by Muhammad Ziddan on 07/08/24.
//

import Foundation

class WelcomeScreenEntity: NSObject, Decodable {
    
    var image: String?
    var title: String?
    var subtitle: String?
    var dataSavedTime: Int?
    
    init(image: String? = nil, title: String? = nil, subtitle: String? = nil, dataSavedTime: Int? = nil) {
        self.image = image
        self.title = title
        self.subtitle = subtitle
        self.dataSavedTime = dataSavedTime
    }
    
//    func copy(with zone: NSZone? = nil) -> Any {
//        return WelcomeScreenEntity(image: image, title: title, subtitle: subtitle, dataSavedTime: dataSavedTime)
//    }
    
}
