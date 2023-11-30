//
//  MainView.swift
//  todo-list-firebase
//
//  Created by magistra aptam on 30/11/23.
//

import SwiftUI

struct MainView: View {
    @State var showSignView: Bool = false
   
    var body: some View {
        VStack {
            Text("hello world")
        }
        .navigationTitle("Profile")
        .onAppear{
            let currentUser = try? AuthManager.shared.getAuthUser()
            self.showSignView = currentUser == nil
        }
        .fullScreenCover(isPresented: $showSignView) {
            NavigationStack {
                AuthView(showSignView: $showSignView)
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing){
                NavigationLink {
                    SettingsView(showSignView: $showSignView)
                } label: {
                    Image(systemName: "gear")
                }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            MainView()
        }
    }
}
