//
//  HomeOperationTests.swift
//  Fyndiq
//
//  Created by Mohammed Diaa on 10/10/16.
//  Copyright © 2016 MohamedDiaa. All rights reserved.
//

import UIKit
import XCTest
@testable import Fyndiq

class HomeOperationTests: XCTestCase {

    let homeOp = HomeOperation()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
 
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testLoadSavedFile(){
        if let json = homeOp.loadSavedFile(){
            XCTAssert(json.count != 0 , "Importing JSON file returns empty")

        }
        else{
            XCTAssert(false , "Can not read json file")
        }
    }
    
    func testParse(){
        
        if let json = homeOp.loadSavedFile(),let products = homeOp.parse(json){
            
            XCTAssert(products.count != 0 , "Cannot parse data")
        }
        else{
            XCTAssert(false , "Parse failure")

        }
    }
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
