//
//  Message.swift
//  TinderApp
//
//  Created by adam janusewski on 3/14/22.
//

import Foundation

struct Message: Hashable {
    
    var content: String
    //  Need person to diferentiate between are we the one receiving or sending - If nil, the sender is me
    var person: Person? = nil
    
    var fromCurrentUser: Bool {
        return person == nil
    }
}

extension Message {
    static let exampleSent = Message(content: "Hello yo")
    static let exampleReceived = Message(content: "Hiya =)", person: Person.examplePerson)
}
