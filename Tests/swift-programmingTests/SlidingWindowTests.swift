//
//  SlidingWindowTests.swift
//  swift-programming
//
//  Created by Saurabh Verma on 31/12/25.
//

import XCTest
@testable import swift_programming

final class SlidingWindowTests: XCTestCase {
    
    // -------------------------------------------------------------------------
    // MARK: Tests for valid inputs
    
    func test_maximumSubArraySum_withValidArray() {
        let input: [Int] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 4, 2, 5, 7, 23, 6, 7, 9, 5, 6, 7, 1]
        let expected: Int = 36
        
        let result = SlidingWindow.maximumSubArraySum(for: input, of: 3)
        
        XCTAssertEqual(result, expected)
    }
    
    func test_maximumSubArraySum_withSingleElementWindow() {
        let input: [Int] = [1, 2, 3, 4, 5]
        let expected: Int = 5
        
        let result = SlidingWindow.maximumSubArraySum(for: input, of: 1)
        
        XCTAssertEqual(result, expected)
    }
    
    func test_maximumSubArraySum_withArraySameSizeAsSlidingWindow() {
        let input: [Int] = [1, 2, 3]
        let expected: Int = 6
        
        let result = SlidingWindow.maximumSubArraySum(for: input, of: 3)
        
        XCTAssertEqual(result, expected)
    }
    
    // -------------------------------------------------------------------------
    // MARK: Tests for arrays with negative numbers
    
    func test_maximumSubArraySum_withNegativeNumbers() {
        let input: [Int] = [-1, 2, -3, 4, -5, 6]
        let expected: Int = 5  // [4, -5, 6] = 5, or [2, -3, 4] = 3, max is 5
        
        let result = SlidingWindow.maximumSubArraySum(for: input, of: 3)
        
        XCTAssertEqual(result, expected)
    }
    
    func test_maximumSubArraySum_withAllNegativeNumbers() {
        let input: [Int] = [-1, -2, -3, -4]
        let expected: Int = -6  // [-1, -2, -3] = -6 (least negative)
        
        let result = SlidingWindow.maximumSubArraySum(for: input, of: 3)
        
        XCTAssertEqual(result, expected)
    }
    
    func test_maximumSubArraySum_withMixedPositiveAndNegative() {
        let input: [Int] = [10, -5, 8, -2, 15, -3, 20]
        let expected: Int = 32  // [15, -3, 20] = 32
        
        let result = SlidingWindow.maximumSubArraySum(for: input, of: 3)
        
        XCTAssertEqual(result, expected)
    }
    
    // -------------------------------------------------------------------------
    // MARK: Tests for invalid inputs
    
    func test_maximumSubArraySum_withEmptyArray() {
        let input: [Int] = []
        let expected: Int? = nil
        
        let result = SlidingWindow.maximumSubArraySum(for: input, of: 3)
        
        XCTAssertEqual(result, expected)
    }
    
    func test_maximumSubArraySum_withArraySmallerThanSlidingWindow() {
        let input: [Int] = [1, 2]
        let expected: Int? = nil
        
        let result = SlidingWindow.maximumSubArraySum(for: input, of: 3)
        
        XCTAssertEqual(result, expected)
    }
    
    func test_maximumSubArraySum_withNegativeWindowSize() {
        let input: [Int] = [1, 2, 3, 4, 5]
        let expected: Int? = nil
        
        let result = SlidingWindow.maximumSubArraySum(for: input, of: -1)
        
        XCTAssertEqual(result, expected)
    }
    
    func test_maximumSubArraySum_withZeroWindowSize() {
        // Note: Window size of 0 is semantically invalid but currently returns 0
        // Consider updating implementation to return nil for windowSize <= 0
        let input: [Int] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 4, 2, 5, 7, 23, 6, 7, 9, 5, 6, 7, 1]
        let expected: Int? = nil
        
        let result = SlidingWindow.maximumSubArraySum(for: input, of: 0)
        
        XCTAssertEqual(result, expected)
    }
}
