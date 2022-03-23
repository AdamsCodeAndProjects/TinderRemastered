//
//  ProfileView.swift
//  TinderApp
//
//  Created by adam janusewski on 3/10/22.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var userMng: UserManager
    @EnvironmentObject var appState: AppStateManager
    
    var user: User {
        return userMng.currentUser
    }
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack(alignment: .topTrailing) {
                RoundedImage(url: user.imageURLS.first)
                    .frame(height: 175)
                
                Button(action: {}, label: {
                    Image(systemName: "pencil")
                        .font(.system(size: 18, weight: .heavy))
                        .foregroundColor((Color.gray.opacity(0.5)))
                        .frame(width: 32, height: 32)
                        .background(Color.white)
                        .clipShape(Circle())
                        .shadow(radius: 6)
                })
                // Position of pencil icon for editing photo
                    .padding(.vertical, 10)
                    .offset(x: -12)
            }
            Spacer().frame(height:18)
            
            // Name & Job Title
            Group {
                Text("\(user.name), \(user.age)")
                    .foregroundColor(.textTitle)
                    .font(.system(size: 26, weight: .medium))
                
                
                Spacer().frame(height:8)
                
                Text("\(user.jobTitle)")
                
                Spacer().frame(height: 22)
                
            }
            
            HStack(alignment: .top) {
                
                // Gear Icon
                
                Spacer()
                
                    Button(action: {}, label: {
                        VStack{
                            Image(systemName: "gearshape.fill")
                                .foregroundColor(Color.gray.opacity(0.5))
                                .font(.system(size: 30))
                                .padding(10)
                                .background(Color.white)
                                .clipShape(Circle())
                                .shadow(radius: 6)
                    
                    Text("SETTINGS")
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(.textSecondary)
                    }
                })
                
                Spacer()
                
                Button(action: {}, label: {
                    VStack{
                        Image(systemName: "camera.fill")
                            .foregroundColor(Color.white)
                            .font(.system(size: 38))
                            .padding(22)
                            .background(Color.red)
                            .clipShape(Circle())
                            .shadow(radius: 6)
                
                Text("ADD MEDIA")
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(.textSecondary)
                }
            })
                
                Spacer()
                
                Button(action: {}, label: {
                    VStack{
                        Image(systemName: "shield.fill")
                            .foregroundColor(Color.gray.opacity(0.5))
                            .font(.system(size: 30))
                            .padding(10)
                            .background(Color.white)
                            .clipShape(Circle())
                            .shadow(radius: 6)
                
                Text("SAFETY")
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(.textSecondary)
                }
            })
                
                Spacer()
                
            }
            
            Spacer().frame(height: 13)
            
            if !user.profileTip.isEmpty {
                HStack {
                    Text("\(user.profileTip)")
                        .multilineTextAlignment(.leading)
                        .lineLimit(3)
                        .foregroundColor(.white)
                        .font(.system(size: 14))
                    
                    Button(action: {}, label: {
                        Image(systemName: "plus")
                            .font(.system(size: 12, weight: .heavy))
                            .foregroundColor(.pink)
                            .padding(6)
                    })
                        .background(Color.white)
                        .clipShape(Circle())
                }
                .padding()
                .background(Color.pink)
                .cornerRadius(12)
            .padding(.horizontal, 8)
            }
            
            //  ----------------- Adding bottom Promo --------------
            
            if !user.goldSubscriber {
                ZStack {
                    Color.gray.opacity(0.15)
                    ProfileSwiplePromo {
                        appState.showPurchaseScreen()
                    }
                }
                .padding(.top, 18)
            }
            Spacer()
        }
        //  Changes font color of all text inside the VStack
        .foregroundColor(Color.black.opacity(0.75))
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        //  Background is only set to gray to adjust pencil
        ProfileView()
            .background(Color.defaultBackground)
            .environmentObject(UserManager())
            .environmentObject(AppStateManager())
    }
}
