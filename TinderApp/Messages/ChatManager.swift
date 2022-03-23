//
//  ChatManager.swift
//  TinderApp
//
//  Created by adam janusewski on 3/14/22.
//

import Foundation
import Combine
import UIKit

class ChatManager: ObservableObject {
    @Published var messages: [Message] = []
    @Published var keyboardIsShowing: Bool = false
    
    // Place to store subscritions for memory
    var cancellable: AnyCancellable? = nil
    
    //  who we are communicating with
    private var person: Person
    
    init(person: Person) {
        self.person = person
        loadMessages()
    }
    
    public func sendMessage(_ message: Message) {
        messages.append(message)
        // if networking failure, then show an error with some retry options
    }
    
    // Show keyboard
    private let keyboardWillShow = NotificationCenter.default
        .publisher(for: UIResponder.keyboardWillShowNotification)
        .map({ _ in true })
    
    // Hide keyboard
    private let keyboardWillHide = NotificationCenter.default
        .publisher(for: UIResponder.keyboardWillHideNotification)
        .map({ _ in false })
    
    // merging both into one.  we only want one value coming out
    private func setupPublishers() {
        cancellable = Publishers.Merge(keyboardWillShow, keyboardWillHide)
            .subscribe(on: DispatchQueue.main)
            .assign(to: \.keyboardIsShowing, on: self)
    }
    
    private func loadMessages() {
        // Replace below with a network request
        messages = [Message.exampleSent, Message.exampleReceived]
    }
    
    
    deinit {
        cancellable?.cancel()
    }
}
