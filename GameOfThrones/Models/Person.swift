//
//  Person.swift
//  GameOfThrones
//
//  Created by Carlos on 23/04/2020.
//  Copyright © 2020 TestCompany. All rights reserved.
//

import UIKit

final class Person {
    let name    : String
    let house   : House
    private let _alias   : String?
    
    var alias : String {
        get {
            return _alias ?? ""
        }
    }
    
    init(name: String, house: House, alias: String?) {
        self.name = name
        self.house = house
        _alias = alias
    }
    
    convenience init(name: String, house: House) {
        self.init(name: name, house: house, alias: nil)
    }
    
}

extension Person {
    var fullName: String {
        return "\(name) \(house.name)"
    }
}

extension Person {
    var proxy : String {
        return "\(name) \(alias) \(house.name)"
    }
}

extension Person : Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(proxy.hashValue)
    }
}

extension Person : Equatable {
    static func == (lhs: Person, rhs: Person) -> Bool {
        return lhs.proxy == rhs.proxy
    }
}

extension Person : Comparable {
    
    static func < (lhs: Person, rhs: Person) -> Bool {
        return lhs.proxy < rhs.proxy
    }
    
    static func <= (lhs: Person, rhs: Person) -> Bool {
        return lhs.proxy <= rhs.proxy
    }
    
    static func >= (lhs: Person, rhs: Person) -> Bool {
        return lhs.proxy >= rhs.proxy
    }
    
    static func > (lhs: Person, rhs: Person) -> Bool {
        return lhs.proxy > rhs.proxy
    }
    
}
