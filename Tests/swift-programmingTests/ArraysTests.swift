//
//  ArraysTests.swift
//  swift-programming
//
//  Created by Saurabh Verma on 19/07/25.
//

import XCTest
@testable import swift_programming

final class ArraysTests: XCTestCase {
    
    func test_largestElement() {
        XCTAssertEqual(Arrays.largestElement(in: [3, 2, 5, 1, 0, 22, 32, 12, 44, 89, 23, 34, 60, 50]), 89)
        XCTAssertEqual(Arrays.largestElement(in: [10, 5, 15, 20, 0, 8, 25, 30, 2, 12, 7, 18, 22]), 30)
        XCTAssertEqual(Arrays.largestElement(in: [99, 1, 88, 2, 77, 3, 66, 4, 55, 5, 44, 6, 33, 7, 22, 8, 11, 9]), 99)
        XCTAssertEqual(Arrays.largestElement(in: [100, 200, 50, 300, 10, 400, 250, 150, 500]), 500)
        XCTAssertEqual(Arrays.largestElement(in: [7, 1, 9, 3, 5]), 9)
        XCTAssertEqual(Arrays.largestElement(in: [111, 222, 333, 444, 555, 666, 777, 888, 999]), 999)
        XCTAssertEqual(Arrays.largestElement(in: [42]), 42)
        XCTAssertEqual(Arrays.largestElement(in: [Int]()), nil)
        XCTAssertEqual(Arrays.largestElement(in: [-5, -10, 0, 1, -2, 8, 15, -1]), 15)
        XCTAssertEqual(Arrays.largestElement(in: [1000, 500, 750, 250, 1250, 100, 1500, 50, 1750, 2000]), 2000)
    }
}
