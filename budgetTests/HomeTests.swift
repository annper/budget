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
    
    self.viewController.loadView()
    self.viewController.viewDidLoad()
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
  }
  
  func testHomeViewControllerExists() {
    XCTAssertNotNil(self.viewController)
  }
  
  func testHomeViewControllerIsInitialViewController() {
    let mainSBFileName = (Bundle.main.object(forInfoDictionaryKey: "UIMainStoryboardFile") as! String)
    
    XCTAssertEqual(mainSBFileName, "Main")
    
    let mainStoryboard = UIStoryboard(name: mainSBFileName, bundle: Bundle.main)
    let initialVC = mainStoryboard.instantiateInitialViewController() as! UITabBarController
    initialVC.selectedIndex = 0
    let homeVC = initialVC.viewControllers?[initialVC.selectedIndex] as! HomeViewController
    
    XCTAssertTrue(homeVC.isKind(of: HomeViewController.self))    
  }
  
  func testTitleLabelText() {
    let titleText = viewController.titleLabel.text ?? ""
    let expectedText = "Monthly spendings"
    XCTAssertEqual(titleText, expectedText)
  }
  
}
