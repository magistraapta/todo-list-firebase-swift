//
//  AuthManager.swift
//  todo-list-firebase
//
//  Created by magistra aptam on 30/11/23.
//

import Foundation
import FirebaseAuth

struct AuthDataResultModel{
    var uid: String
    var email: String?
    var photoUrl: String?
    
    init(user: User) {
        self.uid = user.uid
        self.email = user.email
        self.photoUrl = user.photoURL?.absoluteString
    }
}

class AuthManager{
    static let shared = AuthManager()
    
    init(){}
    
    let firebaseAuth = Auth.auth()
    
    func createNewUser(email: String, password: String) async throws -> AuthDataResultModel {
        
        let authDataResult = try await firebaseAuth.createUser(withEmail: email, password: password)
        return AuthDataResultModel(user: authDataResult.user)
    }
}
