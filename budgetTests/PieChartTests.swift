//
//  PieChartTests.swift
//  budgetTests
//
//  Created by Annie Persson on 04/12/2018.
//  Copyright © 2018 Annie Persson. All rights reserved.
//

import XCTest
@testable import budget

class PieChartTests: XCTestCase {
  
  var pieChart: PieChart!

  override func setUp() {
    super.setUp()
    
    self.pieChart = PieChart()
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
  }

  func testPieChart100Percent() {
    self.pieChart.categories = self.generateCategories(amount: 1, value: 10)
    let firstPercentage = self.pieChart.fields.first
    let value = firstPercentage!.value
    XCTAssertEqual(value, 100)
  }
  
  func testPieChart50Percent() {
    self.pieChart.categories = generateCategories(amount: 2, value: 10)
    
    let firstPercentage = self.pieChart.fields.first
    let value = firstPercentage?.value
    XCTAssertEqual(value, 50)
  }
  
  func testPieChart25Percent() {
    self.pieChart.categories = generateCategories(amount: 4, value: 10)
    let firstPercentage = self.pieChart.fields.first
    let value = firstPercentage?.value
    XCTAssertEqual(value, 25)
  }
  
  private func generateCategories(amount: Int, value: Double) -> [PCCategory] {
    return Array(repeating: PCCategory(name: "", value: value), count: amount)
  }
}
