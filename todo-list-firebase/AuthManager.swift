//
//  AuthManager.swift
//  todo-list-firebase
//
//  Created by magistra aptam on 30/11/23.
//

import Foundation
import FirebaseAuth

class AuthManager{
    let shared = AuthManager()
    
    init(){}
    
    let firebaseAuth = Auth.auth()
    
    func createNewUser(email: String, password: String) async throws {
        
        try await firebaseAuth.createUser(withEmail: email, password: password)
        
    }
}
