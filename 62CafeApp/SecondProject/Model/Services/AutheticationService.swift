//
//  AutheticationService.swift
//  62CafeApp
//
//  Created by Aiturgan Kurmanbekova on 7/5/24.
//

import Foundation
import FirebaseAuth

struct AuthenticationService {
    
    private let auth = Auth.auth()
    
    func signIn(with phone: String,
                complition: @escaping (Result<Void, Error>) -> Void
    ) {
        PhoneAuthProvider.provider().verifyPhoneNumber(phone, uiDelegate: nil) { verificationId, error in
            if let verificationId {
                UserDefaults.standard.set(verificationId, forKey: "vID")
                complition(.success(()))
            }
            if let error {
                complition(.failure(error))
            }
        }
    }
    
    func verifyPhone(with code: String, completion: @escaping (Result<AuthDataResult, Error>) -> Void
    ) {
        if let verificationId = UserDefaults.standard.string(forKey: "vID") {
            let credentials = PhoneAuthProvider.provider().credential(
                withVerificationID: verificationId,
                verificationCode: code
            )
            auth.signIn(with: credentials) { data, error in
                if let error {
                    completion(.failure(error))
                }
                if let data {
                    completion(.success(data))
                }
            }
        }
    }
    
    func signIn(with email: String,
                password: String,
                completion: @escaping (Result<AuthDataResult, Error>) -> Void
    ) {
        auth.signIn(withEmail: email, password: password) { data, error in
            if let error {
                completion(.failure(error))
            }
            if let data {
                completion(.success(data))
            }
        }
    }
}
