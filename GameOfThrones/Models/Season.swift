//
//  Season.swift
//  GameOfThrones
//
//  Created by Carlos on 01/05/2020.
//  Copyright © 2020 TestCompany. All rights reserved.
//

import UIKit


// let season1 = Season(numberOf: 1, name: "Season 1", releaseDateFromString: "2011-04-17")
// let episode_1_1 = Episode(numberOf: 1, title: "Winter Is Coming", broadcastDateFromString: "2011-04-17", episodeFromSeason: season1)

final class Season {
    
    var numberOf : Int
    var numberInImage : UIImage
    var name : String
    var releaseDate : Date
    
    var _episodes : Set<Episode>
    
    let numberImageDictionary: [Int : UIImage] = [
        0: #imageLiteral(resourceName: "metal-number-0.png"),
        1: #imageLiteral(resourceName: "metal-number-1.png"),
        2: #imageLiteral(resourceName: "metal-number-2.png"),
        3: #imageLiteral(resourceName: "metal-number-3.png"),
        4: #imageLiteral(resourceName: "metal-number-4.png"),
        5: #imageLiteral(resourceName: "metal-number-5.png"),
        6: #imageLiteral(resourceName: "metal-number-6.png"),
        7: #imageLiteral(resourceName: "metal-number-7.png"),
        8: #imageLiteral(resourceName: "metal-number-8.png"),
        9: #imageLiteral(resourceName: "metal-number-9.png")
    ]
    
    init(numberOf: Int, name: String, releaseDateFromString : String) {
        (self.numberOf, self.numberInImage, self.name, self.releaseDate) = (numberOf, numberImageDictionary[numberOf]!, name, releaseDateFromString.formatString2DateYYYYMMdd())
        _episodes = []
    }
    
}

extension Season {

    var count : Int {
        return _episodes.count
    }
    
    var episodes : [Episode] {
        get {
            return _episodes.sorted()
        }
    }
    
    func add(episode: Episode) {
        guard (numberOf == episode.episodeFromSeason.numberOf) else {
            return
        }
        _episodes.insert(episode)
    }
    
    func add(episodes: Episode...) {
        for episode in episodes {
            add(episode: episode)
        }
    }
    
    func sortedEpisodes() -> [Episode] {
        return _episodes.sorted()
    }

}

extension Season {
    var proxy : String {
        return "\(numberOf) \(name)".uppercased()
    }
}

extension Season : Hashable {
    func hash(into hasher: inout Hasher) {
        return hasher.combine(proxy.hashValue)
    }
}

extension Season : Equatable {
    static func == (lhs: Season, rhs: Season) -> Bool {
        return lhs.numberOf == rhs.numberOf
    }
}

extension Season : Comparable {
    static func < (lhs: Season, rhs: Season) -> Bool {
        return lhs.numberOf < rhs.numberOf
    }
    static func <= (lhs: Season, rhs: Season) -> Bool {
        return lhs.numberOf <= rhs.numberOf
    }
    static func > (lhs: Season, rhs: Season) -> Bool {
        return lhs.numberOf > rhs.numberOf
    }
    static func >= (lhs: Season, rhs: Season) -> Bool {
        return lhs.numberOf >= rhs.numberOf
    }
}

extension Season : CustomStringConvertible {
    var description: String {
        return "<T\(numberOf)> \(name)"
    }
}
