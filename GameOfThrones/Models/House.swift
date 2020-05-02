//
//  House.swift
//  GameOfThrones
//
//  Created by Carlos on 23/04/2020.
//  Copyright © 2020 TestCompany. All rights reserved.
//

import UIKit

//typealias House   = String
//typealias Sigil   = String
typealias Words     = String
typealias Members   = Set<Person>

final class House {
    
    let name    : String
    let sigil   : Sigil
    let words   : Words
    let url     : URL
    private var _members : Members
    
    var members : Members {
        get {
            return _members
        }
    }
    
    init(name: String, sigil: Sigil, words: String, url: URL) {
        (self.name, self.sigil, self.words, self.url) = (name, sigil, words, url)
        _members = Members()
    }
    
}

final class Sigil {
    
    let description : String
    let image       : UIImage
    
    init(description: String, image: UIImage) {
        (self.description, self.image) = (description, image)
    }
    
}

extension House {
    
    var count : Int {
        return _members.count
    }
    
    func add(person: Person) {
        guard name == person.house.name else {
            return
        }
        _members.insert(person)
    }
    
    func add(persons: Person...) {
        for person in persons {
            add(person: person)
        }
    }
    
    func sortedMembers() -> [Person] {
        return _members.sorted()
    }
    
}

extension House {
    var proxy : String {
        return "\(name) \(words)"
    }
}

extension House : Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(proxy.hashValue)
    }
}

extension House : Equatable {
    static func == (lhs: House, rhs: House) -> Bool {
        return lhs.proxy == rhs.proxy
    }
}

extension House : Comparable {
    
    static func < (lhs: House, rhs: House) -> Bool {
        return lhs.proxy < rhs.proxy
    }
    
    static func <= (lhs: House, rhs: House) -> Bool {
        return lhs.proxy <= rhs.proxy
    }
    
    static func >= (lhs: House, rhs: House) -> Bool {
        return lhs.proxy >= rhs.proxy
    }
    
    static func > (lhs: House, rhs: House) -> Bool {
        return lhs.proxy > rhs.proxy
    }
    
}
