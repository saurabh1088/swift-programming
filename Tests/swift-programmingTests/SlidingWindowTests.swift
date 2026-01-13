//
//  SlidingWindowTests.swift
//  swift-programming
//
//  Created by Saurabh Verma on 31/12/25.
//

import XCTest
@testable import swift_programming

final class SlidingWindowTests: XCTestCase {
    
    // Helper function to compare arrays of Double with accuracy
    private func XCTAssertEqualArrays(_ result: [Double], _ expected: [Double], accuracy: Double = 0.0001, file: StaticString = #file, line: UInt = #line) {
        XCTAssertEqual(result.count, expected.count, "Array counts don't match", file: file, line: line)
        for (index, (resultValue, expectedValue)) in zip(result, expected).enumerated() {
            XCTAssertEqual(resultValue, expectedValue, accuracy: accuracy, "Values don't match at index \(index)", file: file, line: line)
        }
    }
    
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
    
    // -------------------------------------------------------------------------
    // MARK: Tests for minimumSubArrayLength - valid inputs
    
    func test_minimumSubArrayLength_withValidArray() {
        let input: [Int] = [2, 1, 5, 2, 3, 2]
        let targetSum: Int = 7
        let expected: Int = 2  // [5, 2] = 7
        
        let result = SlidingWindow.minimumSubArrayLength(withSum: targetSum, forArray: input)
        
        XCTAssertEqual(result, expected)
    }
    
    func test_minimumSubArrayLength_withSingleElementSufficient() {
        let input: [Int] = [1, 2, 3, 5]
        let targetSum: Int = 5
        let expected: Int = 1  // [5] = 5
        
        let result = SlidingWindow.minimumSubArrayLength(withSum: targetSum, forArray: input)
        
        XCTAssertEqual(result, expected)
    }
    
    func test_minimumSubArrayLength_withEntireArrayRequired() {
        let input: [Int] = [1, 2, 3, 4]
        let targetSum: Int = 10
        let expected: Int = 4  // [1, 2, 3, 4] = 10
        
        let result = SlidingWindow.minimumSubArrayLength(withSum: targetSum, forArray: input)
        
        XCTAssertEqual(result, expected)
    }
    
    func test_minimumSubArrayLength_withMultipleValidSubarrays() {
        let input: [Int] = [2, 3, 1, 2, 4, 3]
        let targetSum: Int = 7
        let expected: Int = 2  // [4, 3] = 7 (minimum length)
        
        let result = SlidingWindow.minimumSubArrayLength(withSum: targetSum, forArray: input)
        
        XCTAssertEqual(result, expected)
    }
    
    func test_minimumSubArrayLength_withLargerTargetSum() {
        let input: [Int] = [1, 4, 4]
        let targetSum: Int = 4
        let expected: Int = 1  // [4] = 4
        
        let result = SlidingWindow.minimumSubArrayLength(withSum: targetSum, forArray: input)
        
        XCTAssertEqual(result, expected)
    }
    
    // -------------------------------------------------------------------------
    // MARK: Tests for minimumSubArrayLength - arrays with negative numbers
    
    func test_minimumSubArrayLength_withNegativeNumbers() {
        let input: [Int] = [-1, 2, 3, -2, 4]
        let targetSum: Int = 3
        let expected: Int = 1  // [3] = 3 or [4] = 4, minimum length is 1
        
        let result = SlidingWindow.minimumSubArrayLength(withSum: targetSum, forArray: input)
        
        XCTAssertEqual(result, expected)
    }
    
    func test_minimumSubArrayLength_withMixedPositiveAndNegative() {
        let input: [Int] = [2, -1, 3, 4, -2, 5]
        let targetSum: Int = 5
        let expected: Int = 2  // [5] = 5
        
        let result = SlidingWindow.minimumSubArrayLength(withSum: targetSum, forArray: input)
        
        XCTAssertEqual(result, expected)
    }
    
    func test_minimumSubArrayLength_withNegativeTargetSum() {
        let input: [Int] = [1, 2, 3]
        let targetSum: Int = -5
        let expected: Int = 1  // Any single element satisfies negative target
        
        let result = SlidingWindow.minimumSubArrayLength(withSum: targetSum, forArray: input)
        
        XCTAssertEqual(result, expected)
    }
    
    // -------------------------------------------------------------------------
    // MARK: Tests for minimumSubArrayLength - invalid inputs
    
    func test_minimumSubArrayLength_withEmptyArray() {
        let input: [Int] = []
        let targetSum: Int = 5
        let expected: Int? = nil
        
        let result = SlidingWindow.minimumSubArrayLength(withSum: targetSum, forArray: input)
        
        XCTAssertEqual(result, expected)
    }
    
    func test_minimumSubArrayLength_withTargetSumNotAchievable() {
        let input: [Int] = [1, 2, 3]
        let targetSum: Int = 100
        let expected: Int? = nil
        
        let result = SlidingWindow.minimumSubArrayLength(withSum: targetSum, forArray: input)
        
        XCTAssertEqual(result, expected)
    }
    
    func test_minimumSubArrayLength_withAllNegativeNumbersAndPositiveTarget() {
        let input: [Int] = [-1, -2, -3]
        let targetSum: Int = 5
        let expected: Int? = nil
        
        let result = SlidingWindow.minimumSubArrayLength(withSum: targetSum, forArray: input)
        
        XCTAssertEqual(result, expected)
    }
    
    func test_minimumSubArrayLength_withZeroTargetSum() {
        let input: [Int] = [1, 2, 3]
        let targetSum: Int = 0
        let expected: Int = 1  // Any single element (>= 0) satisfies
        
        let result = SlidingWindow.minimumSubArrayLength(withSum: targetSum, forArray: input)
        
        XCTAssertEqual(result, expected)
    }
    
    func test_minimumSubArrayLength_withAllZeros() {
        let input: [Int] = [0, 0, 0, 0]
        let targetSum: Int = 0
        let expected: Int = 1  // Any single zero satisfies
        
        let result = SlidingWindow.minimumSubArrayLength(withSum: targetSum, forArray: input)
        
        XCTAssertEqual(result, expected)
    }
    
    func test_minimumSubArrayLength_withAllZerosAndPositiveTarget() {
        let input: [Int] = [0, 0, 0, 0]
        let targetSum: Int = 1
        let expected: Int? = nil
        
        let result = SlidingWindow.minimumSubArrayLength(withSum: targetSum, forArray: input)
        
        XCTAssertEqual(result, expected)
    }
    
    // -------------------------------------------------------------------------
    // MARK: Tests for newArrayByMovingAverage - valid inputs
    
    func test_newArrayByMovingAverage_withValidArray() {
        let input: [Int] = [10, 20, 30, 40]
        let expected: [Double] = [10.0, 15.0, 25.0, 35.0]
        // Explanation:
        // - First element: 10.0 (unchanged)
        // - Second element: (10 + 20) / 2 = 15.0
        // - Third element: (20 + 30) / 2 = 25.0
        // - Fourth element: (30 + 40) / 2 = 35.0
        
        let result = SlidingWindow.newArrayByMovingAverage(from: input)
        
        XCTAssertEqualArrays(result, expected, accuracy: 0.0001)
    }
    
    func test_newArrayByMovingAverage_withSingleElement() {
        let input: [Int] = [5]
        let expected: [Double] = [5.0]
        
        let result = SlidingWindow.newArrayByMovingAverage(from: input)
        
        XCTAssertEqualArrays(result, expected, accuracy: 0.0001)
    }
    
    func test_newArrayByMovingAverage_withTwoElements() {
        let input: [Int] = [10, 20]
        let expected: [Double] = [10.0, 15.0]
        // First element: 10.0 (unchanged)
        // Second element: (10 + 20) / 2 = 15.0
        
        let result = SlidingWindow.newArrayByMovingAverage(from: input)
        
        XCTAssertEqualArrays(result, expected, accuracy: 0.0001)
    }
    
    func test_newArrayByMovingAverage_withMultipleElements() {
        let input: [Int] = [1, 3, 5, 7, 9]
        let expected: [Double] = [1.0, 2.0, 4.0, 6.0, 8.0]
        // [1.0, (1+3)/2=2.0, (3+5)/2=4.0, (5+7)/2=6.0, (7+9)/2=8.0]
        
        let result = SlidingWindow.newArrayByMovingAverage(from: input)
        
        XCTAssertEqualArrays(result, expected, accuracy: 0.0001)
    }
    
    func test_newArrayByMovingAverage_withLargeArray() {
        let input: [Int] = [2, 4, 6, 8, 10, 12, 14, 16, 18, 20]
        let expected: [Double] = [2.0, 3.0, 5.0, 7.0, 9.0, 11.0, 13.0, 15.0, 17.0, 19.0]
        
        let result = SlidingWindow.newArrayByMovingAverage(from: input)
        
        XCTAssertEqualArrays(result, expected, accuracy: 0.0001)
    }
    
    // -------------------------------------------------------------------------
    // MARK: Tests for newArrayByMovingAverage - arrays with negative numbers
    
    func test_newArrayByMovingAverage_withNegativeNumbers() {
        let input: [Int] = [-10, 10, -5]
        let expected: [Double] = [-10.0, 0.0, 2.5]
        // [-10.0, (-10+10)/2=0.0, (10+(-5))/2=2.5]
        
        let result = SlidingWindow.newArrayByMovingAverage(from: input)
        
        XCTAssertEqualArrays(result, expected, accuracy: 0.0001)
    }
    
    func test_newArrayByMovingAverage_withAllNegativeNumbers() {
        let input: [Int] = [-5, -10, -15, -20]
        let expected: [Double] = [-5.0, -7.5, -12.5, -17.5]
        // [-5.0, (-5+(-10))/2=-7.5, (-10+(-15))/2=-12.5, (-15+(-20))/2=-17.5]
        
        let result = SlidingWindow.newArrayByMovingAverage(from: input)
        
        XCTAssertEqualArrays(result, expected, accuracy: 0.0001)
    }
    
    func test_newArrayByMovingAverage_withMixedPositiveAndNegative() {
        let input: [Int] = [10, -5, 8, -2, 15]
        let expected: [Double] = [10.0, 2.5, 1.5, 3.0, 6.5]
        // [10.0, (10+(-5))/2=2.5, (-5+8)/2=1.5, (8+(-2))/2=3.0, (-2+15)/2=6.5]
        
        let result = SlidingWindow.newArrayByMovingAverage(from: input)
        
        XCTAssertEqualArrays(result, expected, accuracy: 0.0001)
    }
    
    // -------------------------------------------------------------------------
    // MARK: Tests for newArrayByMovingAverage - edge cases
    
    func test_newArrayByMovingAverage_withEmptyArray() {
        let input: [Int] = []
        let expected: [Double] = []
        
        let result = SlidingWindow.newArrayByMovingAverage(from: input)
        
        XCTAssertEqual(result, expected)
    }
    
    func test_newArrayByMovingAverage_withZeroValues() {
        let input: [Int] = [0, 0, 0]
        let expected: [Double] = [0.0, 0.0, 0.0]
        
        let result = SlidingWindow.newArrayByMovingAverage(from: input)
        
        XCTAssertEqualArrays(result, expected, accuracy: 0.0001)
    }
    
    func test_newArrayByMovingAverage_withMixedZerosAndNonZeros() {
        let input: [Int] = [0, 10, 0, -10, 5]
        let expected: [Double] = [0.0, 5.0, 5.0, -5.0, -2.5]
        // [0.0, (0+10)/2=5.0, (10+0)/2=5.0, (0+(-10))/2=-5.0, (-10+5)/2=-2.5]
        
        let result = SlidingWindow.newArrayByMovingAverage(from: input)
        
        XCTAssertEqualArrays(result, expected, accuracy: 0.0001)
    }
    
    func test_newArrayByMovingAverage_withLargeNumbers() {
        let input: [Int] = [1000, 2000, 3000]
        let expected: [Double] = [1000.0, 1500.0, 2500.0]
        
        let result = SlidingWindow.newArrayByMovingAverage(from: input)
        
        XCTAssertEqualArrays(result, expected, accuracy: 0.0001)
    }
    
    func test_newArrayByMovingAverage_withOddNumbers() {
        let input: [Int] = [1, 3, 5]
        let expected: [Double] = [1.0, 2.0, 4.0]
        // [1.0, (1+3)/2=2.0, (3+5)/2=4.0]
        
        let result = SlidingWindow.newArrayByMovingAverage(from: input)
        
        XCTAssertEqualArrays(result, expected, accuracy: 0.0001)
    }
    
    func test_newArrayByMovingAverage_withEvenNumbers() {
        let input: [Int] = [2, 4, 6, 8]
        let expected: [Double] = [2.0, 3.0, 5.0, 7.0]
        // [2.0, (2+4)/2=3.0, (4+6)/2=5.0, (6+8)/2=7.0]
        
        let result = SlidingWindow.newArrayByMovingAverage(from: input)
        
        XCTAssertEqualArrays(result, expected, accuracy: 0.0001)
    }
}
