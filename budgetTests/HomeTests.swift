//
//  HomeTests.swift
//  budgetTests
//
//  Created by Annie Persson on 04/12/2018.
//  Copyright © 2018 Annie Persson. All rights reserved.
//

import XCTest
@testable import budget

class HomeTests: XCTestCase {
  
  var viewController: HomeViewController!
  
  override func setUp() {
    super.setUp()
    
    let storyboard = UIStoryboard(name: "Home", bundle: Bundle.main)
    self.viewController = (storyboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController)
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
  }
  
  func testHomeViewControllerExists() {
    XCTAssertNotNil(self.viewController)
  }
  
}
