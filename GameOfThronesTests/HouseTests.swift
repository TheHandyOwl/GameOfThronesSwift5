//
//  HouseTests.swift
//  GameOfThronesTests
//
//  Created by Carlos on 23/04/2020.
//  Copyright © 2020 TestCompany. All rights reserved.
//

import XCTest
@testable import GameOfThrones

class HouseTests: XCTestCase {
    
    // MARK: Personal vars
    
    var localData : LocalFactory!
    
    var starkSigil : Sigil!
    var lannisterSigil : Sigil!
    
    var starkHouse : House!
    var lannisterHouse : House!
    var jinxedHouse : House!

    var robb : Person!
    var arya: Person!
    var tyrion : Person!

    override func setUp() {
        
        localData = Repository.local

        starkHouse = localData.house(named: "Stark")
        lannisterHouse = localData.house(named: "Lannister")
        jinxedHouse = localData.house(named: "Stark")
        
        starkSigil = starkHouse.sigil
        lannisterSigil = lannisterHouse.sigil
        
        robb = Person(name: "Robb", house: starkHouse, alias: "The young wolf")
        arya = Person(name: "Arya", house: starkHouse)
        tyrion = Person(name: "Tyrion", house: lannisterHouse, alias: "The Imp")
        
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
    
    func testHouseExistence() {
        XCTAssertNotNil(starkHouse)
    }
    
    func testSigilExistence() {
        XCTAssertNotNil(starkSigil)
        XCTAssertNotNil(lannisterSigil)
    }
    
    func testAddPersonsToLocalFactory() {
        XCTAssertEqual(starkHouse.count, 5)
        starkHouse.add(person: robb)
        
        XCTAssertEqual(starkHouse.count, 5)
        starkHouse.add(person: arya)
        
        XCTAssertEqual(starkHouse.count, 5)
        
        starkHouse.add(person: tyrion)
        XCTAssertEqual(starkHouse.count, 5)
    }
    
    func testEquatableHouse() {
        
        XCTAssertEqual(starkHouse, starkHouse)
        
        XCTAssertEqual(starkHouse, jinxedHouse)
        
        XCTAssertNotEqual(lannisterHouse, jinxedHouse)
    }
    
    func testComparableHouse() {
        XCTAssertLessThan(lannisterHouse, starkHouse)
        XCTAssertLessThanOrEqual(lannisterHouse, lannisterHouse)
        XCTAssertGreaterThan(starkHouse, lannisterHouse)
        XCTAssertGreaterThanOrEqual(starkHouse, starkHouse)
    }
    
    func testHashableHouse() {
        XCTAssertNotNil(starkHouse.hashValue)
    }
    
}
