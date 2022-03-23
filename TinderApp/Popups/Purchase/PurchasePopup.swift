//
//  PurchasePopup.swift
//  TinderApp
//
//  Created by adam janusewski on 3/21/22.
//

import SwiftUI

struct PurchasePopup: View {
    
    
    @Binding var isVisible: Bool
    @State private var selectedIndex : Int = 1
    
    //  Gives us a rectangle.  the size of the screen
    let screen = UIScreen.main.bounds
    
    let subscriptions: [Subscription] = [
        Subscription.example1,
        Subscription.example2,
        Subscription.example3
    ]
    
    func processPayment() {
//        let product = subscriptions[selectedIndex]
    }
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                Spacer().frame(height: 10)
                
                VStack {
                    Text("Get Tinder Gold")
                        .foregroundColor(.yellow)
                        .font(.system(size: 24, weight: .bold))
                    
                    PurchaseSwipePromo()
                    // Want frame to take up 1/3 of the screen:
                        .frame(height: geo.size.height / 3)
                        .padding(.top, -35)
                        
                    HStack {
                        ForEach(subscriptions.indices) { subIndex in
                            let sub = subscriptions[subIndex]
                            PurchaseOptionView(sub: sub, isSelected: subIndex == selectedIndex)
                                .onTapGesture(perform: {
                                    selectedIndex = subIndex
                                })
                        }
                    }
                    
                    Spacer()
                    
                    Button(action: { processPayment() }, label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 45)
                                .foregroundColor(.yellow)
                            Text("CONTINUE")
                                .foregroundColor(.white)
                                .font(.system(size: 20, weight: .heavy))
                        }
                    })
                    .frame(height: 55)
                    .padding(.horizontal, 24)
                    .padding(.top, 12)
                    
                    Button(action: { isVisible = false }, label: {
                        Text("No Thanks")
                            .foregroundColor(.textPrimary)
                            .font(.system(size: 20, weight: .heavy))
                    })
                    .padding(.vertical, 18)
    
                }
                // Places frame back in the middle of the screen
                .frame(width: geo.size.width)
                .padding(.vertical, 20)
                .background(
                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                        .foregroundColor(.white)
            )
                Spacer()
                
                VStack(spacing: 4) {
                    Text("Recurring billing, cancel anytime")
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .semibold))
                    Text("By clicking, you agree that this payment will go through the Tinder processing and will be paid to Tinder Corp.  Furthermore, you agree that you have sufficient funds and will pay for this service.")
                        .foregroundColor(.white.opacity(0.5))
                        .font(.system(size: 14, weight: .semibold))
                        .multilineTextAlignment(.center)
                }
                .padding(.bottom, 20)
                .padding(.horizontal, 4)
                Spacer()
                
            }
            .background(Color.black.edgesIgnoringSafeArea(.all))
        }
        .frame(height: screen.height)
    }
}

struct PurchasePopup_Previews: PreviewProvider {
    static var previews: some View {
        PurchasePopup(isVisible: .constant(true))
    }
}