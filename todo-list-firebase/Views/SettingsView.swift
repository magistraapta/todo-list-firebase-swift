//
//  SettingsView.swift
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

struct SettingsView: View {
    @Binding var showSignView: Bool
    @StateObject var settingVM = SettingsViewModel()
    var body: some View {
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
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(showSignView: .constant(false))
    }
}
