//
//  Episode.swift
//  GameOfThrones
//
//  Created by Carlos on 01/05/2020.
//  Copyright © 2020 TestCompany. All rights reserved.
//

import Foundation

// let season1 = Season(numberOf: 1, name: "Season 1", releaseDateFromString: "2011-04-17")
// let episode_1_1 = Episode(numberOf: 1, title: "Winter Is Coming", broadcastDateFromString: "2011-04-17", episodeFromSeason: season1)

final class Episode {
    
    var numberOf : Int
    var title : String
    var broadcastDate : Date
    var episodeFromSeason : Season
    
    init(numberOf: Int, title: String, broadcastDateFromString : String, episodeFromSeason : Season) {
        (self.numberOf, self.title, self.broadcastDate, self.episodeFromSeason) = (numberOf, title, broadcastDateFromString.formatString2DateYYYYMMdd(), episodeFromSeason)
    }
    
}

extension Episode {
    var proxy : String {
        return description.uppercased()
    }
}

extension Episode : Hashable {
    func hash(into hasher: inout Hasher) {
        return hasher.combine(proxy.hashValue)
    }
}

extension Episode : Equatable {
    static func == (lhs: Episode, rhs: Episode) -> Bool {
        return lhs.numberOf == rhs.numberOf
    }
}

extension Episode : Comparable {
    static func < (lhs: Episode, rhs: Episode) -> Bool {
        return lhs.numberOf < rhs.numberOf
    }
    static func <= (lhs: Episode, rhs: Episode) -> Bool {
        return lhs.numberOf <= rhs.numberOf
    }
    static func > (lhs: Episode, rhs: Episode) -> Bool {
        return lhs.numberOf > rhs.numberOf
    }
    static func >= (lhs: Episode, rhs: Episode) -> Bool {
        return lhs.numberOf >= rhs.numberOf
    }
}

extension Episode : CustomStringConvertible {
    var description: String {
        get {
            return "<\(episodeFromSeason.numberOf)x\(numberOf)> \(title)"
        }
    }
}
