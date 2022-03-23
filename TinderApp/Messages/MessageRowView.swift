//
//  MessageRowView.swift
//  TinderApp
//
//  Created by adam janusewski on 3/15/22.
//

import SwiftUI
import Kingfisher // Importing because we are dealing with pictures

struct MessageRowView: View {
    var preview: MessagePreview
    
    var body: some View {
        HStack {
            RoundedImage(url: preview.person.imageURLS.first)
                .frame(height: 90)
            
            VStack(alignment: .leading, spacing: 8) {
                Text(preview.person.name)
                    .font(.system(size: 21, weight: .semibold))
                
                
                Text(preview.lastMessage)
                    .foregroundColor(Color.textPrimary)
                    .lineLimit(1)
                    .multilineTextAlignment(.leading)
                
                    
                
            }
            
            Spacer()
        }
                     
    }
}

struct MessageRowView_Previews: PreviewProvider {
    static var previews: some View {
        MessageRowView(preview: MessagePreview.exampleMessage)
    }
}
