//
//  Convex_HullTests.swift
//  Convex HullTests
//
//  Created by Matthew Nespor on 10/7/17.
//  Copyright © 2017 Workmoose. All rights reserved.
//

import XCTest

class Convex_HullTests: XCTestCase {
  func testHorizontalInitialLine() {
    let view = View()
    let excludedPoint = CGPoint(x: 146, y: 284)
    let includedPoints = [
      CGPoint(x: 353, y: 22),
      CGPoint(x: 22, y: 22),
      CGPoint(x: 157, y: 447),
    ]

    view.points.append(contentsOf: includedPoints)
    view.points.append(excludedPoint)
    view.points.sort { (a: CGPoint, b: CGPoint) -> Bool in
      return a.x < b.x
    }

    view.quickHull(points: view.points)

    assert(includedPoints.filter({ view.convexHull.contains($0) }).count == 3,
           "\(includedPoints) should have been included")
    assert(!view.convexHull.contains(excludedPoint),
           "\(excludedPoint) should have been excluded")
    }
}
