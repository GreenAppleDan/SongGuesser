//
//  FirebaseAuthService.swift
//  SongGuesser
//
//  Created by Денис Жукоборский on 28/07/2019.
//  Copyright © 2019 Денис Жукоборский. All rights reserved.
//

import Foundation
import Firebase
import PromiseKit
class FirebaseAuthService {
    
    // MARK: - Properties
    
    static let shared = FirebaseAuthService()
    
    
    // Initialization
    
    private init() { }
    
    func registerNewUser(email: String , password: String) -> Promise<Bool> {
        return Promise { seal in
        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
            if error != nil {
                print(error!.localizedDescription)
                seal.fulfill(false)
            } else {
                seal.fulfill(true)
            }
        }
        }
    }
    
    func logInUser(email: String , password: String) -> Promise<Bool> {
        return Promise { seal in
        Auth.auth().signIn(withEmail: email, password: password) {  user , error in
            if error != nil {
                print(error?.localizedDescription)
                seal.fulfill(false)
            } else {
                seal.fulfill(true)
            }
            
        }
        }
    }
    
//    Auth.auth().signIn(withEmail: email, password: password) { [weak self] user, error in
//    guard let strongSelf = self else { return }
//    // ...
//    }
}
