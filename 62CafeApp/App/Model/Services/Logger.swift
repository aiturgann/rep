//
//  Logger.swift
//  62CafeApp
//
//  Created by Aiturgan Kurmanbekova on 26/4/24.
//

import Foundation

final class Logger {
    
    static let shared = Logger()
    
    private init() { }
    
    func increaseLog(with number: Int) {
        print("increase tapped with: \(number)")
    }
    
    func decreaseLog(with number: Int) {
        print("decrease tapped with: \(number)")
    }
}
