//
//  MainView.swift
//  TinderApp
//
//  Created by adam janusewski on 3/10/22.
//

import SwiftUI

struct MainView: View {
    
    // Buttons can access this appState, and AppStateManager file
    //  Not initialized, because this is not where it lives.  it lives in the ContentView
    @EnvironmentObject var appState: AppStateManager
    
    func correctViewForState() -> some View {
        switch appState.selectedTab {
        case .fire:
            let view = HomeView()
            return AnyView(view)
        case .star:
            let view = MatchesView()
            return AnyView(view)
        case .message:
            let view = MessageListView()
            return AnyView(view)
        case .profile:
            // Will direct to the ProfileView
            let view = ProfileView()
            return AnyView(view)
            // All returns originially like this, but above is more effective
            // Because now we can return any return type (Text, or color)
//        case .profile:
//            return Text("Profile")
        }
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                //  Original Color for whole app
                Color(.systemGray6)
                    .opacity(0.35)
                    .edgesIgnoringSafeArea(.vertical)
                
                VStack {
                    HStack {
                        // The 4 top buttons
                        
                        Spacer()
                        
                        TabBarButtonView(type: .fire)
                        
                        Spacer()
                        
                        TabBarButtonView(type: .star)
                        
                        Spacer()
                        
                        TabBarButtonView(type: .message)
                        
                        Spacer()
                        
                        TabBarButtonView(type: .profile)
                        
                        Spacer()
                    }
                    
                    //  Give the HStack a frame so buttons can know what size to be
                    .frame(height: 100)
                    .padding(.top, 30)
                    
                    
                    // Could do it like this, but we created a func with a switch statement instead
                    
    //                if appState.selectedTab == .fire {
    //                    Color.red
    //                } else {
    //                    Color.blue
    //                }
                    correctViewForState()
                    
                    Spacer()
                }
                .edgesIgnoringSafeArea(.vertical)
                
                if appState.showPurchasePopup {
                    PurchasePopup(isVisible: $appState.showPurchasePopup)
                        .animation(.spring(response: 0.3, dampingFraction: 0.75, blendDuration: 0.5))
                        .transition(.offset(y: 800))
                        
                }
            }
            .modifier(HideNavigationView())
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        //  Without this, the preview will crash.  
        MainView()
            .environmentObject(AppStateManager())
            .environmentObject(UserManager())
    }
}


