//
//  TopPicksView.swift
//  TinderApp
//
//  Created by adam janusewski on 3/18/22.
//

import SwiftUI

struct TopPicksView: View {
    @EnvironmentObject var userMng: UserManager
    @EnvironmentObject var appState: AppStateManager
    
    private var user: User{
        return userMng.currentUser
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false, content: {
            if !user.goldSubscriber {
            // Should only see if user is not Gold
               Text("Upgrade to Tinder Gold for more Top Picks!")
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
                    .foregroundColor(.textTitle)
                    .font(.system(size: 16, weight: .medium))
                    .padding(.horizontal, 40)
                    .padding(.vertical, 24)
            }
            // Lazy meaning it will only render a few below the screen.  as you scroll,
            // more will render
            LazyVGrid(
                columns: [GridItem(.flexible()), GridItem(.flexible())],
                alignment: .center,
                spacing: 20,
                content: {
                    ForEach(userMng.matches) { person in
                        PersonSquare(person: person, blur: false)
                            .frame(height:240)
                            .onTapGesture {
                                personTapped(person)
                            }
                    }
                })
            .padding(.horizontal, 6)
        })
    }
    
    func personTapped(_ person: Person) {
        if user.goldSubscriber {
            appState.showPersonsProfile(person)
        } else {
            appState.showPurchaseScreen()
        }
    }
}

struct TopPicksView_Previews: PreviewProvider {
    static var previews: some View {
        LikesView()
            .environmentObject(UserManager())
            .environmentObject(AppStateManager())
    }
}
