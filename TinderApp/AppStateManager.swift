//
//  AppStateManager.swift
//  TinderApp
//
//  Created by adam janusewski on 3/10/22.
//


// Any view has access to this.  Stores all info that could be used, changed, updated, anywhere within app

import Foundation

class AppStateManager: ObservableObject {
    
    @Published var selectedTab: TabBarButtonType = .fire
    @Published var showPersonsProfile: Person? = nil
    @Published var showPurchasePopup: Bool = false
    
    public func showPersonsProfile(_ person: Person) {
        self.showPersonsProfile = person  //  We can now fire off analytic calls with this function call
    }
    
    public func showPurchaseScreen() {
        self.showPurchasePopup = true
    }
}
