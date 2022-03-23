//
//  ProfileSwiplePromo.swift
//  TinderApp
//
//  Created by adam janusewski on 3/11/22.
//

import SwiftUI

struct ProfileSwiplePromo: View {
    var action: () -> Void
    
    var body: some View {
        VStack(spacing: 0) {
            
            //  With this tabView, we are able to swipe right to left and see new text appear
            TabView {
                VStack(spacing: 8) {
                    Spacer()
                    Text("Go with Gold")
                        .font(.system(size: 26, weight: .semibold))
                    Text("You deserve to be well known")
                }
                
                .padding(.bottom, 45)
                
                VStack(spacing: 9) {
                    Spacer()
                    Text("Find Love Quicker")
                        .font(.system(size: 26, weight: .semibold))
                    Text("Get Gold and be forever grateful")
                }
                
                .padding(.bottom, 45)
                
                VStack(spacing: 9) {
                    Spacer()
                    Text("Much More Rewarding")
                        .font(.system(size: 26, weight: .semibold))
                    Text("You can thank us later")
                }
                
                .padding(.bottom, 45)
            
            }
            .tabViewStyle(PageTabViewStyle())
            
            Button(action: { action() }, label: {
                Text("MY TINDER PLUS")
                    .foregroundColor(.red)
                    .font(.system(size: 18, weight: .semibold))
                    .padding(.vertical, 10)
                    .padding(.horizontal, 50)
                    .background(Color.white)
                    .cornerRadius(30)
                    .shadow(color: Color.gray.opacity(0.2), radius: 10)
            })
                .padding(10)
        }
    }
}

struct ProfileSwiplePromo_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.gray.opacity(0.2)
                .edgesIgnoringSafeArea(.all)
            
            //  What action are we wanting when they click the MY TINDER PLUS button
            ProfileSwiplePromo {
                print("TEST")
            }
        }
        .frame(height: 400)
    }
}
