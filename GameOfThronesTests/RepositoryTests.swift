//
//  RepositoryTests.swift
//  GameOfThronesTests
//
//  Created by Carlos on 25/04/2020.
//  Copyright © 2020 TestCompany. All rights reserved.
//

import XCTest
@testable import GameOfThrones

class RepositoryTests: XCTestCase {

    
    // MARK: Personal vars
    var localData   : LocalFactory!
    var houses      : [House]!
    var seasons     : [Season]!

    override func setUp() {
        localData = Repository.local
        houses = localData.houses
        seasons = localData.seasons
    }
    
    
    // MARK: Default tests
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    
    // MARK: Personal tests
    
    func testRepositoryExists() {
        XCTAssertNotNil(Repository())
    }
    
    func testRepositoryLocalExists() {
        XCTAssertNotNil(localData)
    }
    
    // MARK: - Houses
    func testRepositoryLocalHouseExists() {
        XCTAssertNotNil(houses)
    }
    
    func testLocalRepositoryHousesCreation() {
        XCTAssertEqual(houses.count, 6)
    }
    
    func testFindHouseNamed() {
        let houseToFind1 = localData.houses[0]
        let houseFindedInLowercase1 = localData.house(named: houseToFind1.name.lowercased())

        XCTAssertNotNil(houseToFind1)
        XCTAssertNotNil(houseFindedInLowercase1)
        
        XCTAssertEqual(houseToFind1, houseFindedInLowercase1)

        let houseToFind2 = localData.houses[0]
        let houseFindedInLowercase2 = localData.house(named: houseToFind2.name.uppercased())

        XCTAssertNotNil(houseToFind2)
        XCTAssertNotNil(houseFindedInLowercase2)
        
        XCTAssertEqual(houseToFind2, houseFindedInLowercase2)
    }
    
    func testFilterHousesByName() {
        XCTAssertEqual(localData.houses(filteredByName: "Stark")?.count, 1)
    }
    
    func testFilterHousesByMembersMoreThanOrEqualTo() {
        XCTAssertEqual(localData.houses(filteredByMembersMoreThanOrEqualTo: 0)?.count, 6)
        XCTAssertEqual(localData.houses(filteredByMembersMoreThanOrEqualTo: 10)?.count, 0)
    }
    
    func testFilterHousesByClosure() {
        var housesFiltered : [House]
        
        housesFiltered = localData.houses(filteredByFunction: { $0.name == "Stark" })
        XCTAssertEqual(housesFiltered.count, 1)
        
        housesFiltered = localData.houses(filteredByFunction: { $0.count >= 0 })
        XCTAssertEqual(housesFiltered.count, 6)
        XCTAssertNotEqual(housesFiltered.count, 0)
        
        housesFiltered = localData.houses(filteredByFunction: { $0.count <= 0 })
        XCTAssertEqual(housesFiltered.count, 0)
        XCTAssertNotEqual(housesFiltered.count, 2)
        
        housesFiltered = localData.houses(filteredByFunction: { $0.count >= 10 })
        XCTAssertEqual(housesFiltered.count, 0)
        XCTAssertNotEqual(housesFiltered.count, 2)
        
        housesFiltered = localData.houses(filteredByFunction: { $0.count <= 10 })
        XCTAssertEqual(housesFiltered.count, 6)
        XCTAssertNotEqual(housesFiltered.count, 0)
    }
    
    func testSortedHousesFromLocalDataWhenAre2() {
        XCTAssertEqual(localData.houses, localData.houses.sorted())
        XCTAssertEqual(localData.houses.reversed(), localData.houses.reversed())
        XCTAssertNotEqual(localData.houses.reversed(), localData.houses.sorted())
    }
    
    // MARK: - Seasons
    func testLocalRepositorySeasonsExists() {
        XCTAssertNotNil(seasons)
    }
    
    func testLocalRepositorySeasonsCreationWhen7() {
        XCTAssertEqual(seasons.count, 7)
    }
    
    func testFindSeasonNamed() {
        let seasonToFind1 = localData.seasons[0]
        let seasonFindedInLowercase1 = localData.season(named: seasonToFind1.name.lowercased())

        XCTAssertNotNil(seasonToFind1)
        XCTAssertNotNil(seasonFindedInLowercase1)
        
        XCTAssertEqual(seasonToFind1, seasonFindedInLowercase1)

        let seasonToFind2 = localData.seasons[0]
        let seasonFindedInLowercase2 = localData.season(named: seasonToFind2.name.uppercased())

        XCTAssertNotNil(seasonToFind2)
        XCTAssertNotNil(seasonFindedInLowercase2)
        
        XCTAssertEqual(seasonToFind2, seasonFindedInLowercase2)
    }
    
    func testFilterSeasonsByName() {
        XCTAssertEqual(localData.seasons(filteredByName: "Season 1")?.count, 1)
    }
    
    func testFilterSeasonsByEpisodesMoreThanOrEqualToWhen7() {
        XCTAssertEqual(localData.seasons(filteredByEpisodesMoreThanOrEqualTo: 0)?.count, 7)
        XCTAssertEqual(localData.seasons(filteredByEpisodesMoreThanOrEqualTo: 15)?.count, 0)
    }
    
    func testFilterSeasonsByClosureWhen7() {
        var seasonsFiltered : [Season]
        
        seasonsFiltered = localData.seasons(filteredByFunction: { $0.name == "Season 1" })
        XCTAssertEqual(seasonsFiltered.count, 1)
        
        seasonsFiltered = localData.seasons(filteredByFunction: { $0.count >= 0 })
        XCTAssertEqual(seasonsFiltered.count, 7)
        XCTAssertNotEqual(seasonsFiltered.count, 0)
        
        seasonsFiltered = localData.seasons(filteredByFunction: { $0.count <= 0 })
        XCTAssertEqual(seasonsFiltered.count, 0)
        XCTAssertNotEqual(seasonsFiltered.count, 2)
        
        seasonsFiltered = localData.seasons(filteredByFunction: { $0.count >= 15 })
        XCTAssertEqual(seasonsFiltered.count, 0)
        XCTAssertNotEqual(seasonsFiltered.count, 2)
        
        seasonsFiltered = localData.seasons(filteredByFunction: { $0.count <= 15 })
        XCTAssertEqual(seasonsFiltered.count, 7)
        XCTAssertNotEqual(seasonsFiltered.count, 0)
    }
    
    func testSortedSeasonsFromLocalDataWhenAre2() {
        XCTAssertEqual(localData.seasons, localData.seasons.sorted())
        XCTAssertEqual(localData.seasons.reversed(), localData.seasons.reversed())
        XCTAssertNotEqual(localData.seasons.reversed(), localData.seasons.sorted())
    }

}
