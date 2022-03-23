//
//  TabBarButtonView.swift
//  TinderApp
//
//  Created by adam janusewski on 3/10/22.
//

import SwiftUI

enum TabBarButtonType: String {
    case fire = "flame.fill"
    case star = "star.fill"
    case message = "message.fill"
    case profile = "person.fill"
}

struct TabBarButtonView: View {
    
    var type: TabBarButtonType
//    var action: () -> Void
    
    @EnvironmentObject var appState: AppStateManager
    
    var body: some View {
        //  Whatever action you want to happen, goes in action
        Button(action: { appState.selectedTab = type }, label: {
            // type.rawValue refers to the enum
            Image(systemName: type.rawValue)
                .resizable()
                .aspectRatio(contentMode: .fit)
            // This changes the color
            // if the selected tab is the same type, then apply this transformation
                .if(appState.selectedTab == type, transform: {
                    //  returns view, changes to red, or yellow if the type is star
                    $0.foregroundColor(type == .star ? Color.yellow : Color.red)
                })
                
                .foregroundColor(Color.gray.opacity(0.5))
                
        })
        // Makes buttons smaller
            .frame(height: 32)
    }
}

struct TabBarButtonView_Previews: PreviewProvider {
    static var previews: some View {
        //  initialize TabBarButtonView.  This action will happen when you click it
        TabBarButtonView(type: .profile)
    }
}
