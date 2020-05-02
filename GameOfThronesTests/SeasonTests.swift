//
//  SeaseonTests.swift
//  GameOfThronesTests
//
//  Created by Carlos on 01/05/2020.
//  Copyright © 2020 TestCompany. All rights reserved.
//

import XCTest
@testable import GameOfThrones

class SeaseonTests: XCTestCase {
    
    var localData : LocalFactory!
    var seasons : [Season]!
    
    var season1 : Season!
    var season2 : Season!
    
    var episode_1_1 : Episode!
    var episode_1_2 : Episode!
    
    var episode_2_1 : Episode!
    var episode_2_2 : Episode!
    
    override func setUp() {
        localData = LocalFactory()
        seasons = localData.seasons
        
        season1 = seasons[0]
        episode_1_1 = season1.episodes[0]
        episode_1_2 = season1.episodes[1]
        
        season2 = seasons[1]
        episode_2_1 = season2.episodes[0]
        episode_2_2 = season2.episodes[1]
    }
    
    
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
    
    func testSeasonExistence() {
        XCTAssertNotNil(season1)
    }
    
    func testAddEpisodesToLocalFactorySeasonWhen10() {
        XCTAssertEqual(season1.count, 10)
        
        season1.add(episodes: episode_1_1)
        XCTAssertEqual(season1.count, 10)
        
        season1.add(episodes: episode_1_2)
        XCTAssertEqual(season1.count, 10)
        
        season1.add(episodes: episode_1_2)
        XCTAssertEqual(season1.count, 10)
        
        season1.add(episodes: episode_2_1)
        XCTAssertEqual(season1.count, 10)
    }
    
    func testEquatableHouse() {
        
        XCTAssertEqual(season1, season1)
        XCTAssertEqual(season2,season2)
        XCTAssertNotEqual(season1, season2)
    }
    
    func testComparableHouse() {
        XCTAssertLessThan(season1, season2)
        XCTAssertLessThanOrEqual(season1, season1)
        XCTAssertGreaterThan(season2, season1)
        XCTAssertGreaterThanOrEqual(season2, season2)
    }
    
    func testHashableHouse() {
        XCTAssertNotNil(season1.hashValue)
    }
    
    func testSeasonDescription() {
        XCTAssertEqual(season1.description, "<T1> Season 1")
    }
    
}
