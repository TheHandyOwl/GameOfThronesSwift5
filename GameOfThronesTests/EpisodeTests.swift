//
//  EpisodeTests.swift
//  GameOfThronesTests
//
//  Created by Carlos on 01/05/2020.
//  Copyright © 2020 TestCompany. All rights reserved.
//

import XCTest
@testable import GameOfThrones

class EpisodeTests: XCTestCase {

    var season1 : Season!
    var episode_1_1 : Episode!
    var episode_1_2 : Episode!
    
    override func setUp() {
        season1 = Season(numberOf: 1, name: "Season 1", releaseDateFromString: "2011-04-17")
        episode_1_1 = Episode(numberOf: 1, title: "Winter Is Coming", broadcastDateFromString: "2011-04-17", episodeFromSeason: season1)
        episode_1_2 = Episode(numberOf: 2, title: "The Kingsroad", broadcastDateFromString: "2011-04-24", episodeFromSeason: season1)
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
    
    func testEpisodeExists() {
        XCTAssertNotNil(episode_1_1)
    }

    func testComparableEpisode() {
        XCTAssertLessThan(episode_1_1, episode_1_2)
        XCTAssertLessThanOrEqual(episode_1_1, episode_1_1)
        XCTAssertGreaterThan(episode_1_2, episode_1_1)
        XCTAssertGreaterThanOrEqual(episode_1_2, episode_1_2)
    }
    
    func testEquatable() {
        XCTAssertEqual(episode_1_1, episode_1_1)
        XCTAssertNotEqual(episode_1_1, episode_1_2)
        XCTAssertEqual(episode_1_2, episode_1_2)
    }
    
    func testEpisodeDescription() {
        let episodeWithOptional = Episode(numberOf: 101, title: "Winter Is Me", broadcastDateFromString: "2017-08-04", episodeFromSeason: season1)
        XCTAssertEqual(episodeWithOptional.description, "<1x101> Winter Is Me")
    }
    
}
