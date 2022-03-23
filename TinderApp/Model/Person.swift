//
//  Person.swift
//  TinderApp
//
//  Created by adam janusewski on 3/14/22.
//

import SwiftUI

// Any person other than the user
struct Person: Hashable, Identifiable {
    let id = UUID().uuidString
    
    var name: String
    var imageURLS: [URL]
    var bio: String
    var age: Int
    var distance: Int
    
    var biolong: String
    
    //  Used for card manipulaton
    var x: CGFloat = 0.0
    var y: CGFloat = 0.0
    var degree: Double = 0.0
    
}

// example people
extension Person {
    static let examplePerson = Person(
        name: "Kana",
        imageURLS: [
            URL(string: "https://picsum.photos/400/300")!,
            URL(string: "https://picsum.photos/400/308")!,
            URL(string: "https://picsum.photos/400/309")!,
            URL(string: "https://picsum.photos/400/307")!,
            URL(string: "https://picsum.photos/400/311")!
        ],
        bio: "You definitely Kana choose me!",
        age: 44,
        distance: 20,
        biolong: "I came from the heavens and the stars.  Everyone told me that I am really meant for something in this world.  As it turns out, they were right.  You are speaking to, the now partial owner of Bill-Bobs Ant Farm and Grille Restaurant.  It was a long difficuly journey, but I must say, I did it!"
    )
    static let examplePerson2 = Person(
        name: "Santa Roboto",
        imageURLS: [
            URL(string: "https://picsum.photos/400/301")!,
            URL(string: "https://picsum.photos/400/302")!,
            URL(string: "https://picsum.photos/400/303")!,
            URL(string: "https://picsum.photos/400/304")!,
            URL(string: "https://picsum.photos/400/305")!
        ],
        bio: "I love Christmas more than you do",
        age: 62,
        distance: 25,
        biolong: "A scientist created me in a lap.  I was engineered to love Christmas above all else. But do not worry, I would like a boyfriend as well."
    )
    static let examples: [Person] = [
        Person.examplePerson,
        Person.examplePerson2,
        Person(
            name: "Cooper Copperpiece",
            imageURLS: [
                URL(string: "https://picsum.photos/400/306")!,
                URL(string: "https://picsum.photos/400/307")!,
                URL(string: "https://picsum.photos/400/312")!,
                URL(string: "https://picsum.photos/400/313")!,
                URL(string: "https://picsum.photos/400/314")!
            ],
            bio: "You want a piece of the Copper?",
            age: 33,
            distance: 40,
            biolong: "My name is the most interesting thing about me"
        ),
        Person(
            name: "Dr Chocolate",
            imageURLS: [
                URL(string: "https://picsum.photos/400/315")!,
                URL(string: "https://picsum.photos/400/316")!,
                URL(string: "https://picsum.photos/400/317")!,
                URL(string: "https://picsum.photos/400/318")!,
                URL(string: "https://picsum.photos/400/319")!
            ],
            bio: "Who ordered the Doctor?  I'm the LOVE doctor?",
            age: 67,
            distance: 44,
            biolong: "I am the creator of chocolate.  I've gone to chocolate school and graduated with a major in chocolate studies.  I even changed my name.  Now, I'm ready to change my relationship status."
        ),
        Person(
            name: "Colonal Mustard",
            imageURLS: [
                URL(string: "https://picsum.photos/400/320")!,
                URL(string: "https://picsum.photos/400/321")!,
                URL(string: "https://picsum.photos/400/322")!,
                URL(string: "https://picsum.photos/400/323")!,
                URL(string: "https://picsum.photos/400/324")!
            ],
            bio: "You cannot have a bite without Mustard!",
            age: 68,
            distance: 45,
            biolong: "War!  Death!  Famine!  I've seen it all.  What I haven't seen?  A long, steady relationship with the woman I love."
        ),
        Person(
            name: "Ginger Ail",
            imageURLS: [
                URL(string: "https://picsum.photos/400/325")!,
                URL(string: "https://picsum.photos/400/326")!,
                URL(string: "https://picsum.photos/400/327")!,
                URL(string: "https://picsum.photos/400/328")!,
                URL(string: "https://picsum.photos/400/329")!
            ],
            bio: "You don't know nasty until you sniff some Ginger",
            age: 68,
            distance: 46,
            biolong: "I would like a boyfriend who will treat me just like a perfect can of ginger ale."
        ),
        Person(
            name: "Pickle Penny",
            imageURLS: [
                URL(string: "https://picsum.photos/400/330")!,
                URL(string: "https://picsum.photos/400/331")!,
                URL(string: "https://picsum.photos/400/332")!,
                URL(string: "https://picsum.photos/400/333")!,
                URL(string: "https://picsum.photos/400/334")!
            ],
            bio: "I'm after a man who knows his pickling process well",
            age: 68,
            distance: 50,
            biolong: "I cannot say how many pickles I've injested for sure."
        ),
    ]
}
