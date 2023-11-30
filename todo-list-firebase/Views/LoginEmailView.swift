//
//  LoginEmailView.swift
//  todo-list-firebase
//
//  Created by magistra aptam on 30/11/23.
//

import SwiftUI

final class LoginEmailViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    
    func userLogin() async throws {
        guard !email.isEmpty, !password.isEmpty else {
            print("Missing email or password")
            return
        }
        
        try await AuthManager.shared.userLogin(email: email, password: password)
    }
}

struct LoginEmailView: View {
    @StateObject var loginVM = LoginEmailViewModel()
    @Binding var showSignView: Bool
    var body: some View {
        VStack{
            TextField("Email...", text: $loginVM.email)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
            SecureField("Password", text: $loginVM.password)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
            Button {
                Task{
                    do{
                        try await loginVM.userLogin()
                        showSignView = false
                        print("success")
                    }catch{
                        print(error)
                    }
                }
            } label: {
                Text("Create account")
                    .padding()
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .background(.blue)
                    .cornerRadius(10)
            }
            Spacer()
        }
        .padding()
        .navigationTitle("Log in with email")
    }
}

struct LoginEmailView_Previews: PreviewProvider {
    static var previews: some View {
        LoginEmailView(showSignView: .constant(false))
    }
}
