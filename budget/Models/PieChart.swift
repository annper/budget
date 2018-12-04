//
//  PieChart.swift
//  budget
//
//  Created by Annie Persson on 04/12/2018.
//  Copyright © 2018 Annie Persson. All rights reserved.
//

import UIKit

struct PieChart {
  
  var categories: [PCCategory] {
    didSet {
      self.fields = self.calculateFieldValues(basedOn: self.categories)
    }
  }
  
  private(set) var fields: [PCField] = []
  
  var numberOfCategories: Int {
    return self.categories.count
  }
}

extension PieChart {
  
  init() {
    self.categories = []
  }
  
}

extension PieChart {
  
  /// Create an array of fields that holds the value a percentage
  private func calculateFieldValues(basedOn categories: [PCCategory]) -> [PCField] {
    
    let totalValue = categories.reduce(into: 0.0) { $0 += $1.value }
    
    let fields = categories.reduce(into: [PCField]()) { (result, category) in
      result.append(PCField(value: percentageOf(value: category.value, outOfTotal: totalValue), category: category, color: nil))
    }
    
    return fields
  }
  
  private func percentageOf(value: Double, outOfTotal total: Double) -> Double {
    return (value / total) * 100
  }
}


struct PCField {
  var value: Double
  var category: PCCategory
  var color: UIColor?
}
