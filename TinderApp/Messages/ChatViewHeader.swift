//
//  ChatViewHeader.swift
//  TinderApp
//
//  Created by adam janusewski on 3/14/22.
//

import SwiftUI

struct ChatViewHeader: View {
    @Environment(\.presentationMode) var presentationMode
    
    let name: String
    let imageURL: URL?
    let videoActoin: () -> Void
    
    var body: some View {
        ZStack {
            Color.white
                .edgesIgnoringSafeArea(.top)
                .shadow(radius: 3)
            
            HStack {
                //  The action is saying go back, dimiss the current view
                Button(action: { presentationMode.wrappedValue.dismiss() }, label: {
                    Image(systemName: "chevron.left")
                        .foregroundColor(Color.textPrimary)
                        .font(.system(size: 28, weight: .semibold))
                })
                Spacer()
                
                VStack(spacing: 6) {
                    RoundedImage(url: imageURL)
                        .frame(height: 50)
                    
                    Text(name)
                        .foregroundColor(Color.textSecondary)
                        .font(.system(size: 14))
                }
                Spacer()
                
                Button(action: { videoActoin() }, label: {
                    Image(systemName: "video.fill")
                        .font(.system(size: 20, weight: .bold))
                })
            }
            .padding(.horizontal, 22)
            .padding(.vertical, 10)
        }
        .frame(height: 50)
    }
}

struct ChatViewHeader_Previews: PreviewProvider {
    static var previews: some View {
        let person = Person.examplePerson
        ChatViewHeader(
            name: person.name,
            imageURL: person.imageURLS.first,
            videoActoin: {
                //
            }
        )
    }
}
