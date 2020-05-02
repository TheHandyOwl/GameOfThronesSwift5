//
//  PersonTests.swift
//  GameOfThronesTests
//
//  Created by Carlos on 23/04/2020.
//  Copyright © 2020 TestCompany. All rights reserved.
//

import XCTest
@testable import GameOfThrones

class PersonTests: XCTestCase {

    // MARK: Personal vars
    
    var localData : LocalFactory!

    var starkHouse  : House!
    var starkSigil  : Sigil!
    var ned         : Person!
    var arya        : Person!
    var anotherNed  : Person!
    
    override func setUp() {
        localData = Repository.local
        
        starkHouse = localData.house(named: "Stark")
        starkSigil = starkHouse.sigil
        
        ned = Person(name: "Eddard", house: starkHouse, alias: "Ned")
        arya = Person(name: "Arya", house: starkHouse)
        anotherNed = Person(name: "Eddard", house: starkHouse, alias: "Ned")
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
    
    func testPersonExistence() {
        XCTAssertNotNil(ned)
    }
    
    func testFullName() {
        XCTAssertNotNil(ned.fullName, "Eddard Stark")
    }
    
    func testHashablePerson() {
        XCTAssertNotNil(ned.hashValue)
    }
    
    func testEquatablePerson() {
        XCTAssertEqual(ned, ned)
        XCTAssertEqual(ned, anotherNed)
        XCTAssertNotEqual(arya, ned)
    }
    
    func testComparePerson() {
        XCTAssertLessThan(arya, ned)
        XCTAssertLessThanOrEqual(arya, arya)
        XCTAssertGreaterThan(ned, arya)
        XCTAssertGreaterThanOrEqual(ned, ned)
    }
    
}
