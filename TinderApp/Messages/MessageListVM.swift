//
//  MessageListVM.swift
//  TinderApp
//
//  Created by adam janusewski on 3/15/22.
//

import Foundation

class MessageListVM: ObservableObject {
    @Published var messagePreviews: [MessagePreview] = []
    
    init() {
        loadPreviews()
    }
    
    func loadPreviews() {
        // Handle networking to load message Previews from a server
        self.messagePreviews = MessagePreview.examples
    }
}
