//
//  UserManager.swift
//  TinderApp
//
//  Created by adam janusewski on 3/17/22.
//

import Foundation

class UserManager: ObservableObject {
    @Published var currentUser: User  = User(name: "", age: 0, jobTitle: "")
    @Published var matches: [Person] = []     // When app first loads, you have no matches
    @Published var topPicks: [Person] = []
    @Published var cardPeople: [Person] = []
    
    
    // Will now run these functions as soon as app loads
    init() {
        loadUser()
        loadMatches()
        loadTopPicks()
        loadCardPeople()
    }
    
    private func loadCardPeople() {
        self.cardPeople = Person.examples
    }
    
    private func loadUser() {
        self.currentUser = User.example
        //  In a fully functional app, loadMatches() should be called here, along with Networking
    }
    
    private func loadMatches() {
        self.matches = Person.examples
    }
    
    private func loadTopPicks() {
        self.topPicks = Person.examples.shuffled()
    }
    
    public func swipe(_ person: Person, _ direction: SwipeDirection) {
        
        cardPeople.removeLast()
        // Networking to our back end
    }
    
    public func superLike(_ person: Person) {
        cardPeople.removeLast()
        // Networking to our back end
    }
}

enum SwipeDirection {
    case like
    case nope
}
