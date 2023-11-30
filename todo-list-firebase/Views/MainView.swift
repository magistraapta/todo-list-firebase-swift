//
//  MainView.swift
//  todo-list-firebase
//
//  Created by magistra aptam on 30/11/23.
//

import SwiftUI

final class SettingsViewModel: ObservableObject {
    
    func userLogOut() throws {
        try AuthManager.shared.userSignOut()
    }
    
}

struct MainView: View {
    @State var showSignView: Bool = false
    @StateObject var settingVM = SettingsViewModel()
    var body: some View {
        VStack {
            List {
                Button {
                    Task{
                        do{
                            try settingVM.userLogOut()
                            showSignView = true
                        }catch{
                            print(error)
                        }
                    }
                } label: {
                    Text("Log out")
                }
            }
        }
        .onAppear{
            let currentUser = try? AuthManager.shared.getAuthUser()
            self.showSignView = currentUser == nil
        }
        .fullScreenCover(isPresented: $showSignView) {
            NavigationStack {
                AuthView(showSignView: $showSignView)
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
