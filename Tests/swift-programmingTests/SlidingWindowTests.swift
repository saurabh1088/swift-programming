//
//  SlidingWindowTests.swift
//  swift-programming
//
//  Created by Saurabh Verma on 31/12/25.
//

import XCTest
@testable import swift_programming

final class SlidingWindowTests: XCTestCase {
    
    func test_maximumSubArraySum_validArray() {
        let input: [Int] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 4, 2, 5, 7, 23, 6, 7, 9, 5, 6, 7, 1]
        let expected: Int = 36
        
        let result = SlidingWindow.maximumSubArraySum(for: input, of: 3)
        
        XCTAssertEqual(result, expected)
    }
    
    func test_maximumSubArraySum_invalidArrayEmpty() {
        let input: [Int] = []
        let expected: Int = 0
        
        let result = SlidingWindow.maximumSubArraySum(for: input, of: 3)
        
        XCTAssertEqual(result, expected)
    }
    
    func test_maximumSubArraySum_invalidArrayLesserSizeThanSlidingWindow() {
        let input: [Int] = [1, 2]
        let expected: Int = 0
        
        let result = SlidingWindow.maximumSubArraySum(for: input, of: 3)
        
        XCTAssertEqual(result, expected)
    }
    
    func test_maximumSubArraySum_arraySameSizeAsSlidingWindow() {
        let input: [Int] = [1, 2, 3]
        let expected: Int = 6
        
        let result = SlidingWindow.maximumSubArraySum(for: input, of: 3)
        
        XCTAssertEqual(result, expected)
    }
}
