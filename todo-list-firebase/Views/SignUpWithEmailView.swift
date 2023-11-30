//
//  SignUpWithEmailView.swift
//  todo-list-firebase
//
//  Created by magistra aptam on 30/11/23.
//

import SwiftUI

final class SignUpViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    
    func signUpUser()async throws{
        guard !email.isEmpty, !password.isEmpty else {
            print("email or password not found!")
            return
        }
        try await AuthManager.shared.createNewUser(email: email, password: password)
    }
}

struct SignUpWithEmailView: View {
    @StateObject var signUpVM = SignUpViewModel()
    var body: some View {
        VStack{
            TextField("Email...", text: $signUpVM.email)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
            SecureField("Password", text: $signUpVM.password)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
            Button {
                Task{
                    do{
                        try await signUpVM.signUpUser()
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
        .navigationTitle("Sign up with email")
    }
}

struct SignUpWithEmailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SignUpWithEmailView()
        }
    }
}
