//
//  SplashEntity.swift
//  FinApp
//
//  Created by Muhammad Ziddan on 07/08/24.
//

import Foundation

class SplashEntity: NSObject, Decodable  {
    
    var session: String?
    var version: String?
    var dataSavedTime: Int?
    
    init(session: String? = nil, version: String? = nil, dataSavedTime: Int? = nil) {
        self.session = session
        self.version = version
        self.dataSavedTime = dataSavedTime
    }
    
//    func copy(with zone: NSZone? = nil) -> Any {
//        let copy = SplashEntity(session: session, version: version, dataSavedTime: dataSavedTime)
//        return copy
//    }
}
