//
//  ContentView.swift
//  todo-list-firebase
//
//  Created by magistra aptam on 30/11/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{
            AuthView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
