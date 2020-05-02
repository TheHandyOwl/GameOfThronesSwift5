//
//  Repository.swift
//  GameOfThrones
//
//  Created by Carlos on 25/04/2020.
//  Copyright © 2020 TestCompany. All rights reserved.
//

import UIKit

final class Repository {
    
    static let local = LocalFactory()
    
}

protocol HouseFactory {
    
    var houses : [House] { get }
    func house(named: String) -> House?
    func houses(filteredByName filter: String) -> [House]?
    func houses(filteredByMembersMoreThanOrEqualTo filter: Int) -> [House]?
    
    typealias HouseFilterFunction = ((House) -> Bool)
    func houses(filteredByFunction filter: HouseFilterFunction ) -> [House]
    
}

protocol SeasonFactory {
    
    var seasons : [Season] { get }
    func season(named: String) -> Season?
    func seasons(filteredByName filter: String) -> [Season]?
    func seasons(filteredByEpisodesMoreThanOrEqualTo filter: Int) -> [Season]?
    
    typealias SeasonsFilterFunction = ((Season) -> Bool)
    func seasons(filteredByFunction filter: SeasonsFilterFunction ) -> [Season]
    
}

final class LocalFactory : HouseFactory, SeasonFactory{
    
    var houses : [House] {
        get{
            // Aquí es donde te creamos casas
            
            // Sigils
            // ^^^^^^
            let starkSigil = Sigil(description: "Direwolf", image: UIImage(imageLiteralResourceName: "stark.png"))
            let lannisterSigil = Sigil(description: "Rampant Lion", image: UIImage(imageLiteralResourceName: "lannister.jpg"))
            let mormontSigil = Sigil(description: "Rampant bear", image: UIImage(imageLiteralResourceName: "mormont.png"))
            let greyjoySigil = Sigil(description: "A golden kraken on a black field", image: UIImage(imageLiteralResourceName: "greyjoy.png"))
            let targaryenSigil = Sigil(description: "A red three-headed dragon", image: UIImage(imageLiteralResourceName: "targaryen.png"))
            let tyrellSigil = Sigil(description: "A golden rose on a green field", image: UIImage(imageLiteralResourceName: "tyrell.png"))
            
            // URLs
            // ^^^^
            let starkURL = URL(string: "https://awoiaf.westeros.org/index.php/House_Stark")!
            let lannisterURL = URL(string: "https://awoiaf.westeros.org/index.php/House_Lannister")!
            let mormontURL = URL(string: "https://awoiaf.westeros.org/index.php/House_Mormont")!
            let greyjoykURL = URL(string: "https://awoiaf.westeros.org/index.php/House_Greyjoy")!
            let targaryenURL = URL(string: "https://awoiaf.westeros.org/index.php/House_Targaryen")!
            let tyrellURL = URL(string: "https://awoiaf.westeros.org/index.php/House_Tyrell")!
            
            // Houses
            // ^^^^^^
            let stark = House(name: "Stark", sigil: starkSigil, words: "Winter is coming!", url: starkURL)
            let lannister = House(name: "Lannister", sigil: lannisterSigil, words: "Hear me roar!", url: lannisterURL)
            let mormont = House(name: "Mormont", sigil: mormontSigil, words: "Here we stand!", url: mormontURL)
            let greyjoy = House(name: "Greyjoy", sigil: greyjoySigil, words: "We Do Not Sow", url: greyjoykURL)
            let targaryen = House(name: "Targaryen", sigil: targaryenSigil, words: "Fire and Blood", url: targaryenURL)
            let tyrell = House(name: "Tyrell", sigil: tyrellSigil, words: "Growing Strong", url: tyrellURL)
            
            // Characters
            // ^^^^^^^^^^
            // ---- Stark ----
            let robb = Person(name: "Robb", house: stark, alias: "The young wolf")
            let arya = Person(name: "Arya", house: stark)
            let sansa = Person(name: "Sansa", house: stark, alias: "Little bird")
            let brandon = Person(name: "Brandon", house: stark, alias: "The winged wolf")
            let rickon  = Person(name: "Rickon", house: stark)
            
            // ---- Lannister ----
            let tyrion = Person(name: "Tyrion", house: lannister, alias: "The Imp")
            let cersei = Person(name: "Cersei", house: lannister)
            let jaime = Person(name: "Jaime", house: lannister, alias: "KingSlayer")
            let tywin = Person(name: "Tywin", house: lannister, alias: "Lannister's Lion")
            
            // ---- Mormont ----
            let lyanna  = Person(name: "Lyanna", house: mormont)
            
            // ---- Greyjoy ----
            let asha  = Person(name: "Asha", house: greyjoy, alias: "Esgred")
            let theon  = Person(name: "Theon", house: greyjoy, alias: "Reek")
            let euron  = Person(name: "Euron III", house: greyjoy, alias: "Crow's Eye")
            
            // ---- Targaryen ----
            let daenerys  = Person(name: "Daenerys", house: targaryen, alias: "Dragonmother")
            let viserys  = Person(name: "Viserys", house: targaryen, alias: "The Beggar King")
            
            // ---- Tyrell ----
            let mace  = Person(name: "Mace", house: tyrell, alias: "Lord Oaf")
            let loras  = Person(name: "Loras", house: tyrell, alias: "The Knight of Flowers")
            let margaery  = Person(name: "Margaery", house: tyrell, alias: "Little rose")
            let olenna  = Person(name: "Olenna", house: tyrell, alias: "Queen of Thorns")
            
            stark.add(persons: robb, arya, sansa, brandon, rickon)
            lannister.add(persons: tyrion, cersei, jaime, tywin)
            mormont.add(person: lyanna)
            greyjoy.add(persons: asha, theon, euron)
            targaryen.add(persons: daenerys, viserys)
            tyrell.add(persons: mace, loras, margaery, olenna)
            
            //return [stark, lannister].sorted()
            return [stark, lannister, mormont, greyjoy, targaryen, tyrell].sorted()
        }

    }
    
    var seasons: [Season] {
        get {
            // Aquí es donde te creas tus temporadas
            
            // Seasons
            // ^^^^^^^
            let season1 = Season(numberOf: 1, name: "Season 1", releaseDateFromString: "2011-04-17")
            let season2 = Season(numberOf: 2, name: "Season 2", releaseDateFromString: "2012-04-01")
            let season3 = Season(numberOf: 3, name: "Season 3", releaseDateFromString: "2013-03-31")
            let season4 = Season(numberOf: 4, name: "Season 4", releaseDateFromString: "2014-04-06")
            let season5 = Season(numberOf: 5, name: "Season 5", releaseDateFromString: "2015-04-12")
            let season6 = Season(numberOf: 6, name: "Season 6", releaseDateFromString: "2016-04-24")
            let season7 = Season(numberOf: 7, name: "Season 7", releaseDateFromString: "2017-07-16")

            
            // Episodes
            // ^^^^^^^^
            // ---- Season 1 ----
            let episode_1_1 = Episode(numberOf: 1, title: "Winter Is Coming", broadcastDateFromString: "2011-04-17", episodeFromSeason: season1)
            let episode_1_2 = Episode(numberOf: 2, title: "The Kingsroad", broadcastDateFromString: "2011-04-24", episodeFromSeason: season1)
            let episode_1_3 = Episode(numberOf: 3, title: "Lord Snow", broadcastDateFromString: "2011-05-01", episodeFromSeason: season1)
            let episode_1_4 = Episode(numberOf: 4, title: "Cripples, Bastards, and Broken Things", broadcastDateFromString: "2011-05-08", episodeFromSeason: season1)
            let episode_1_5 = Episode(numberOf: 5, title: "The Wolf and the Lion", broadcastDateFromString: "2011-05-15", episodeFromSeason: season1)
            let episode_1_6 = Episode(numberOf: 6, title: "A Golden Crown", broadcastDateFromString: "2011-05-22", episodeFromSeason: season1)
            let episode_1_7 = Episode(numberOf: 7, title: "You Win or You Die", broadcastDateFromString: "2011-05-22", episodeFromSeason: season1)
            let episode_1_8 = Episode(numberOf: 8, title: "The Pointy End", broadcastDateFromString: "2011-06-05", episodeFromSeason: season1)
            let episode_1_9 = Episode(numberOf: 9, title: "Baelor", broadcastDateFromString: "2011-06-12", episodeFromSeason: season1)
            let episode_1_10 = Episode(numberOf: 10, title: "Fire and Blood", broadcastDateFromString: "2011-06-19", episodeFromSeason: season1)
            
            // ---- Season 2 ----
            let episode_2_11 = Episode(numberOf: 11, title: "The North Remembers", broadcastDateFromString: "2012-04-01", episodeFromSeason: season2)
            let episode_2_12 = Episode(numberOf: 12, title: "The Night Lands", broadcastDateFromString: "2012-04-08", episodeFromSeason: season2)
            let episode_2_13 = Episode(numberOf: 13, title: "What Is Dead May Never Die", broadcastDateFromString: "2012-04-15", episodeFromSeason: season2)
            let episode_2_14 = Episode(numberOf: 14, title: "Garden of Bones", broadcastDateFromString: "2012-04-22", episodeFromSeason: season2)
            let episode_2_15 = Episode(numberOf: 15, title: "The Ghost of Harrenhal", broadcastDateFromString: "2012-04-29", episodeFromSeason: season2)
            let episode_2_16 = Episode(numberOf: 16, title: "The Old Gods and the New", broadcastDateFromString: "2012-05-06", episodeFromSeason: season2)
            let episode_2_17 = Episode(numberOf: 17, title: "A Man Without Honor", broadcastDateFromString: "2012-05-13", episodeFromSeason: season2)
            let episode_2_18 = Episode(numberOf: 18, title: "The Prince of Winterfell", broadcastDateFromString: "2012-05-20", episodeFromSeason: season2)
            let episode_2_19 = Episode(numberOf: 19, title: "Blackwater", broadcastDateFromString: "2012-05-27", episodeFromSeason: season2)
            let episode_2_20 = Episode(numberOf: 20, title: "Valar Morghulis", broadcastDateFromString: "2012-06-03", episodeFromSeason: season2)
            
            // ---- Season 3 ----
            let episode_3_21 = Episode(numberOf: 21, title: "Valar Dohaeris", broadcastDateFromString: "2013-03-31", episodeFromSeason: season3)
            let episode_3_22 = Episode(numberOf: 22, title: "Dark Wings, Dark Words", broadcastDateFromString: "2013-04-07", episodeFromSeason: season3)
            let episode_3_23 = Episode(numberOf: 23, title: "Walk of Punishment", broadcastDateFromString: "2013-04-14", episodeFromSeason: season3)
            let episode_3_24 = Episode(numberOf: 24, title: "And Now His Watch Is Ended", broadcastDateFromString: "2013-04-21", episodeFromSeason: season3)
            let episode_3_25 = Episode(numberOf: 25, title: "Kissed by Fire", broadcastDateFromString: "2013-04-28", episodeFromSeason: season3)
            let episode_3_26 = Episode(numberOf: 26, title: "The Climb", broadcastDateFromString: "2013-05-05", episodeFromSeason: season3)
            let episode_3_27 = Episode(numberOf: 27, title: "The Bear and the Maiden Fair", broadcastDateFromString: "2013-05-12", episodeFromSeason: season3)
            let episode_3_28 = Episode(numberOf: 28, title: "Second Sons", broadcastDateFromString: "2013-05-19", episodeFromSeason: season3)
            let episode_3_29 = Episode(numberOf: 29, title: "The Rains of Castamere", broadcastDateFromString: "2013-06-02", episodeFromSeason: season3)
            let episode_3_30 = Episode(numberOf: 30, title: "Mhysa", broadcastDateFromString: "2013-06-09", episodeFromSeason: season3)
            
            // ---- Season 4 ----
            let episode_4_31 = Episode(numberOf: 31, title: "Two Swords", broadcastDateFromString: "2014-04-06", episodeFromSeason: season4)
            let episode_4_32 = Episode(numberOf: 32, title: "The Lion and the Rose", broadcastDateFromString: "2014-04-13", episodeFromSeason: season4)
            let episode_4_33 = Episode(numberOf: 33, title: "Breaker of Chains", broadcastDateFromString: "2014-04-20", episodeFromSeason: season4)
            let episode_4_34 = Episode(numberOf: 34, title: "Oathkeeper", broadcastDateFromString: "2014-04-27", episodeFromSeason: season4)
            let episode_4_35 = Episode(numberOf: 35, title: "First of His Name", broadcastDateFromString: "2014-05-04", episodeFromSeason: season4)
            let episode_4_36 = Episode(numberOf: 36, title: "The Laws of Gods and Men", broadcastDateFromString: "2014-05-11", episodeFromSeason: season4)
            let episode_4_37 = Episode(numberOf: 37, title: "Mockingbird", broadcastDateFromString: "2014-05-18", episodeFromSeason: season4)
            let episode_4_38 = Episode(numberOf: 38, title: "The Mountain and the Viper", broadcastDateFromString: "2014-06-01", episodeFromSeason: season4)
            let episode_4_39 = Episode(numberOf: 39, title: "The Watchers on the Wall", broadcastDateFromString: "2014-06-08", episodeFromSeason: season4)
            let episode_4_40 = Episode(numberOf: 40, title: "The Children", broadcastDateFromString: "2014-06-15", episodeFromSeason: season4)
            
            // ---- Season 5 ----
            let episode_5_41 = Episode(numberOf: 41, title: "The Wars to Come", broadcastDateFromString: "2015-04-12", episodeFromSeason: season5)
            let episode_5_42 = Episode(numberOf: 42, title: "The House of Black and White", broadcastDateFromString: "2015-04-19", episodeFromSeason: season5)
            let episode_5_43 = Episode(numberOf: 43, title: "High Sparrow", broadcastDateFromString: "2015-04-26", episodeFromSeason: season5)
            let episode_5_44 = Episode(numberOf: 44, title: "Sons of the Harpy", broadcastDateFromString: "2015-05-03", episodeFromSeason: season5)
            let episode_5_45 = Episode(numberOf: 45, title: "Kill the Boy", broadcastDateFromString: "2015-05-10", episodeFromSeason: season5)
            let episode_5_46 = Episode(numberOf: 46, title: "Unbowed, Unbent, Unbroken", broadcastDateFromString: "2015-05-17", episodeFromSeason: season5)
            let episode_5_47 = Episode(numberOf: 47, title: "The Gift", broadcastDateFromString: "2015-05-24", episodeFromSeason: season5)
            let episode_5_48 = Episode(numberOf: 48, title: "Hardhome", broadcastDateFromString: "2015-05-31", episodeFromSeason: season5)
            let episode_5_49 = Episode(numberOf: 49, title: "The Dance of Dragons", broadcastDateFromString: "2015-06-07", episodeFromSeason: season5)
            let episode_5_50 = Episode(numberOf: 50, title: "Mother's Mercy", broadcastDateFromString: "2015-06-14", episodeFromSeason: season5)
            
            // ---- Season 6 ----
            let episode_6_51 = Episode(numberOf: 51, title: "The Red Woman", broadcastDateFromString: "2016-04-24", episodeFromSeason: season6)
            let episode_6_52 = Episode(numberOf: 52, title: "Home", broadcastDateFromString: "2016-05-01", episodeFromSeason: season6)
            let episode_6_53 = Episode(numberOf: 53, title: "Oathbreaker", broadcastDateFromString: "2016-05-08", episodeFromSeason: season6)
            let episode_6_54 = Episode(numberOf: 54, title: "Book of the Stranger", broadcastDateFromString: "2016-05-15", episodeFromSeason: season6)
            let episode_6_55 = Episode(numberOf: 55, title: "The Door", broadcastDateFromString: "2016-05-22", episodeFromSeason: season6)
            let episode_6_56 = Episode(numberOf: 56, title: "Blood of My Blood", broadcastDateFromString: "2016-05-29", episodeFromSeason: season6)
            let episode_6_57 = Episode(numberOf: 57, title: "The Broken Man", broadcastDateFromString: "2016-06-05", episodeFromSeason: season6)
            let episode_6_58 = Episode(numberOf: 58, title: "No One", broadcastDateFromString: "2016-06-12", episodeFromSeason: season6)
            let episode_6_59 = Episode(numberOf: 59, title: "Battle of the Bastards", broadcastDateFromString: "2016-06-19", episodeFromSeason: season6)
            let episode_6_60 = Episode(numberOf: 60, title: "The Winds of Winter", broadcastDateFromString: "2016-06-26", episodeFromSeason: season6)
            
            // ---- Season 7 ----
            let episode_7_61 = Episode(numberOf: 61, title: "Dragonstone", broadcastDateFromString: "2017-07-16", episodeFromSeason: season7)
            let episode_7_62 = Episode(numberOf: 62, title: "Stormborn", broadcastDateFromString: "2017-07-23", episodeFromSeason: season7)
            let episode_7_63 = Episode(numberOf: 63, title: "The Queen's Justice", broadcastDateFromString: "2017-07-30", episodeFromSeason: season7)
            let episode_7_64 = Episode(numberOf: 64, title: "The Spoils of War", broadcastDateFromString: "2017-08-06", episodeFromSeason: season7)
            let episode_7_65 = Episode(numberOf: 65, title: "Unknown Episode 5", broadcastDateFromString: "2017-08-13", episodeFromSeason: season7)
            let episode_7_66 = Episode(numberOf: 66, title: "Unknown Episode 6", broadcastDateFromString: "2017-08-20", episodeFromSeason: season7)
            let episode_7_67 = Episode(numberOf: 67, title: "Unknown Episode 7", broadcastDateFromString: "2017-08-27", episodeFromSeason: season7)

            season1.add(episodes: episode_1_1, episode_1_2, episode_1_3, episode_1_4, episode_1_5, episode_1_6, episode_1_7, episode_1_8, episode_1_9, episode_1_10)
            season2.add(episodes: episode_2_11, episode_2_12, episode_2_13, episode_2_14, episode_2_15, episode_2_16, episode_2_17, episode_2_18, episode_2_19, episode_2_20)
            season3.add(episodes: episode_3_21, episode_3_22, episode_3_23, episode_3_24, episode_3_25, episode_3_26, episode_3_27, episode_3_28, episode_3_29, episode_3_30)
            season4.add(episodes: episode_4_31, episode_4_32, episode_4_33, episode_4_34, episode_4_35, episode_4_36, episode_4_37, episode_4_38, episode_4_39, episode_4_40)
            season5.add(episodes: episode_5_41, episode_5_42, episode_5_43, episode_5_44, episode_5_45, episode_5_46, episode_5_47, episode_5_48, episode_5_49, episode_5_50)
            season6.add(episodes: episode_6_51, episode_6_52, episode_6_53, episode_6_54, episode_6_55, episode_6_56, episode_6_57, episode_6_58, episode_6_59, episode_6_60)
            season7.add(episodes: episode_7_61, episode_7_62, episode_7_63, episode_7_64, episode_7_65, episode_7_66, episode_7_67)
            
            //return [season1, season2].sorted()
            return [season1, season2, season3, season4, season5, season6, season7].sorted()

        }
    }
    
}

extension LocalFactory {
    
    func house(named: String) -> House? {
        let houseFinded = houses.filter { return $0.name.uppercased() == named.uppercased() }.first
        return houseFinded
    }
    
    func season(named: String) -> Season? {
        let seasonFinded = seasons.filter { $0.name.uppercased() == named.uppercased() }.first
        return seasonFinded
    }
    
}

extension LocalFactory {
    typealias HouseFilterFunction = ((House) -> Bool)
    
    func houses(filteredByName filter: String) -> [House]? {
        let housesFiltered = houses.filter { return $0.name.uppercased() == filter.uppercased() }
        return housesFiltered
    }
    
    func houses(filteredByMembersMoreThanOrEqualTo filter: Int) -> [House]? {
        let housesFiltered = houses.filter { return $0.count >= filter }
        return housesFiltered
    }
    
    func houses(filteredByFunction filter: HouseFilterFunction ) -> [House] {
        let housesFiltered = houses.filter { filter($0) }
        return housesFiltered
    }

}

extension LocalFactory {
    typealias SeasonFilterFunction = (Season) -> Bool
    
    func seasons(filteredByName filter: String) -> [Season]? {
        let seasonsFiltered = seasons.filter { $0.name.lowercased() == filter.lowercased() }
        return seasonsFiltered
    }
    
    func seasons(filteredByEpisodesMoreThanOrEqualTo filter: Int) -> [Season]? {
        let seasonsFiltered = seasons.filter { $0._episodes.count >= filter }
        return seasonsFiltered
    }
    
    func seasons(filteredByFunction filter: SeasonFilterFunction) -> [Season] {
        let seasonsFiltered = seasons.filter { filter($0) }
        return seasonsFiltered
    }
}






















