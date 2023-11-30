//
//  AuthView.swift
//  todo-list-firebase
//
//  Created by magistra aptam on 30/11/23.
//

import SwiftUI

struct AuthView: View {
    var body: some View {
        VStack{
            NavigationLink {
                SignUpWithEmailView()
            } label: {
                Text("Sign in with Email")
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(.blue)
                    .cornerRadius(10)
            }
        }
        .padding()
        .navigationTitle("Authentication")
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            AuthView()
        }
    }
}
