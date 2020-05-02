//
//  ArrayDataSourceTests.swift
//  GameOfThronesTests
//
//  Created by Carlos on 29/04/2020.
//  Copyright © 2020 TestCompany. All rights reserved.
//

import XCTest
@testable import GameOfThrones

class ArrayDataSourceTests: XCTestCase {

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
    
    func testArrayDataSourceCreation() {
        let tv = UITableView()
        
        let ds = ArrayDataSource(model: [1, 2, 3, 4]) { (number: Int, tableView: UITableView) -> UITableViewCell in
            
            let cellID = "cellID"
            
            var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
            if cell == nil {
                cell = UITableViewCell(style: .default, reuseIdentifier: cellID)
            }
            
            cell?.textLabel?.text = "El número \(number)"
            
            return cell!
        }
        
        XCTAssertNotNil(tv)
        XCTAssertNotNil(ds)
    }

}
