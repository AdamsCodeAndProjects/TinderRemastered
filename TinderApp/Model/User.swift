//
//  User.swift
//  TinderApp
//
//  Created by adam janusewski on 3/17/22.
//

import Foundation


struct User {
    var name: String
    var age: Int
    var jobTitle: String
    
    var goldSubscriber: Bool = false
    var profileTip: String = ""
    
    var imageURLS: [URL] = []
}

extension User {
    static let example = User(
        name: "Adam",
        age: 21,
        jobTitle: "Software Engineer",
        goldSubscriber: false,
        profileTip: "Photo Tip: Show your audience that you love life!",
        imageURLS: [URL(string: "https://picsum.photos/400/310")!]
    )
}
