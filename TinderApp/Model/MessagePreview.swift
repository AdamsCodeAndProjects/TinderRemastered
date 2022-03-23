//
//  MessageThread.swift
//  TinderApp
//
//  Created by adam janusewski on 3/14/22.
//

import Foundation

struct MessagePreview: Hashable {
    var person: Person
    var lastMessage: String
}

extension MessagePreview {
    static let exampleMessage = MessagePreview(person: Person.examplePerson, lastMessage: "Hello there stranger!  Are you still holding fight club at your house??")
    
    static let examples: [MessagePreview] = [
        MessagePreview(person: Person.examplePerson, lastMessage: "I think the sun is made of fire"),
        MessagePreview(person: Person.examplePerson2, lastMessage: "Ho ho ho!  Merry Tuesday!")
    ]
}
