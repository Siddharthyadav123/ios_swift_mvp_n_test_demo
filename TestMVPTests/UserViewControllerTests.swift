//
//  UserViewControllerTests.swift
//  TestMVP
//
//  Created by Ranjit singh on 5/31/17.
//  Copyright © 2017 is24. All rights reserved.
//

import XCTest
@testable import TestMVP

/**
 * Testing View Controller
 */
class UserViewControllerTests: XCTestCase {
    var userVC : UserViewController!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        userVC = UserViewController()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
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

    
    /**
     * Testing function StartLoading()
     */
    func testStartLoading() {
        userVC.startLoading()
    }
    
    /**
     * Testing function Setusers()
     */
    func testSetusers() {
        let users = [UserViewData(name: "Neel", age: "26"),
                     UserViewData(name: "Mila", age: "24"),
                     UserViewData(name: "Mark", age: "39")]
        userVC.setUsers(users)
        print(userVC.usersToDisplay)
        XCTAssert(userVC.usersToDisplay != nil)
    }
    
}
