//
//  UserSessionManager.swift
//  62CafeApp
//
//  Created by Aiturgan Kurmanbekova on 29/4/24.
//

import Foundation

final class UserSessionManager {
     
    static let shared = UserSessionManager()
    
    private init() { }
    
    var isSessionActive: Bool {
        let currentDate = Date()
        guard let sessionDate = UserDefaults.standard.object(
            forKey: "sessionDate"
        ) as? Date else {
            return false
        }
        return sessionDate > currentDate
    }
    
    func saveSession(with name: String, phoneNumber: String, completion: () -> Void) {
        if name == "Geeks" && phoneNumber == "00" {
            print("Session is saved")
            let currentDate = Date()
            let thirtySecondsAfter = Calendar.current.date(
                byAdding: .second,
                value: 30,
                to: currentDate
            )
            UserDefaults.standard.setValue(thirtySecondsAfter, forKey: "sessionDate")
            completion()
        } else {
            print("The data isn't correct")
        }
    }
}
