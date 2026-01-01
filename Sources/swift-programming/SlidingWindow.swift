//
//  SlidingWindow.swift
//  swift-programming
//
//  Created by Saurabh Verma on 17/12/25.
//

import Foundation

/**
 - TODOs
 - 1. Variable-Size (Dynamic) Windows
 - 2. String-Based Windows with HashMaps
 - 3. Advanced State Management (The Monotonic Queue)
 - 4. Auxiliary Optimization: Two-Pointers vs. Sliding Window
 - 5. Bitmasking with Windows
 */
struct SlidingWindow {
    
    static func maximumSubArraySum(for array: [Int], of windowSize: Int) -> Int? {
        guard !array.isEmpty, array.count >= windowSize else {
            return nil
        }
        var currentSum = 0
        var maxSum: Int?
        let startingIndex = windowSize - 1
        let lastIndex = array.count - 1
        
        for index in 0..<windowSize {
            currentSum = currentSum + array[index]
        }
        
        maxSum = currentSum
        
        for index in startingIndex..<lastIndex {
            currentSum = currentSum - array[index - windowSize + 1]
            currentSum = currentSum + array[index + 1]
            if let maximumSum = maxSum, currentSum > maximumSum {
                maxSum = currentSum
            }
        }
        
        return maxSum
    }
}
