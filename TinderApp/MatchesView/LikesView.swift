//
//  LikesView.swift
//  TinderApp
//
//  Created by adam janusewski on 3/17/22.
//

import SwiftUI

struct LikesView: View {
    @EnvironmentObject var userMng: UserManager
    @EnvironmentObject var appState: AppStateManager
    
    private var user: User{
        return userMng.currentUser
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false, content: {
            if !user.goldSubscriber {
            // Should only see if user is not Gold
               Text("Upgrade to Gold to see people who already liked you")
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
                        PersonSquare(person: person, blur: !user.goldSubscriber)
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

struct LikesView_Previews: PreviewProvider {
    static var previews: some View {
        LikesView()
            .environmentObject(UserManager())
            .environmentObject(AppStateManager())
    }
}
