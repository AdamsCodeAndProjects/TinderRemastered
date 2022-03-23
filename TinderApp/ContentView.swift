//
//  ContentView.swift
//  TinderApp
//
//  Created by adam janusewski on 3/10/22.
//

import SwiftUI

// Initializing MainView. MainView can now give access to the environmentObject.  To access:
//  use -> @EnvironmentObject

struct ContentView: View {
    @ObservedObject var mng: AppStateManager = AppStateManager()
    @ObservedObject var userMng: UserManager = UserManager()
    var body: some View {
        MainView()
        //  By injecting, we can check these anywhere in the application
            .environmentObject(mng)
            .environmentObject(userMng)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
