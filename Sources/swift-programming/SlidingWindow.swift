//
//  SlidingWindow.swift
//  swift-programming
//
//  Created by Saurabh Verma on 17/12/25.
//

import Foundation

struct SlidingWindow {
    
    /// Finds the maximum sum of a subarray of a given window size using the sliding window technique.
    ///
    /// This method efficiently calculates the maximum sum of all possible subarrays of a specified size
    /// by using the sliding window algorithm. It first computes the sum of the initial window, then
    /// slides the window across the array by removing the leftmost element and adding the rightmost
    /// element, updating the maximum sum as it goes.
    ///
    /// - Parameters:
    ///   - array: The input array of integers to search within.
    ///   - windowSize: The size of the sliding window (must be less than or equal to array count).
    /// - Returns: The maximum sum of any subarray of the given window size, or `nil` if the array is
    ///            empty or the window size is greater than the array count.
    ///
    /// ------------------------------------------------------------------------
    /// `Validation`
    ///
    /// `Correctness`
    ///
    /// `Core Logic`
    /// - The implementation correctly uses the sliding window technique to find maximum subarray sum.
    /// - First calculates the sum of the initial window (indices 0 to windowSize-1).
    /// - Then slides the window by subtracting the leftmost element and adding the rightmost element.
    /// - Tracks and updates the maximum sum encountered during the sliding process.
    ///
    /// `Edge Cases`
    /// - Empty Array: maximumSubArraySum(for: [], of: 3) returns nil (correct, array is empty).
    /// - Window Size > Array Count: maximumSubArraySum(for: [1, 2], of: 5) returns nil (correct).
    /// - Window Size == Array Count: maximumSubArraySum(for: [1, 2, 3], of: 3) returns 6 (correct).
    /// - Single Element Window: maximumSubArraySum(for: [1, 2, 3], of: 1) returns 3 (correct).
    /// - Negative Numbers: maximumSubArraySum(for: [-1, 2, -3, 4], of: 2) correctly handles negatives.
    /// - All Negative: maximumSubArraySum(for: [-1, -2, -3], of: 2) returns -3 (correct, least negative).
    ///
    /// ------------------------------------------------------------------------
    /// `Efficiency`
    ///
    /// `Time Complexity`
    /// - Initial window sum calculation: O(k) where k is the window size.
    /// - Sliding window iteration: O(n-k) where n is the array length.
    /// - Total: O(n) where n is the array length, which is optimal for this problem.
    ///
    /// `Space Complexity`
    /// - O(1) as only a constant amount of extra space is used (currentSum, maxSum, indices).
    /// - No additional data structures are created proportional to input size.
    ///
    /// `Algorithm Efficiency`
    /// - The sliding window technique avoids recalculating the entire window sum each time.
    /// - Each element is added once and removed once, resulting in linear time complexity.
    /// - Much more efficient than the naive O(n*k) approach of recalculating each window.
    ///
    /// ------------------------------------------------------------------------
    /// `Potential Issues`
    ///
    /// `Performance`
    /// - The implementation is optimal with O(n) time complexity.
    /// - No unnecessary iterations or redundant calculations.
    ///
    /// `Integer Overflow`
    /// - For very large arrays with large integer values, integer overflow could occur.
    /// - Consider using Int64 or checking for overflow in production code if needed.
    ///
    /// `Window Size Validation`
    /// - Properly validates that window size is not greater than array count.
    /// - Returns nil for invalid inputs, which is appropriate behavior.
    static func maximumSubArraySum(for array: [Int], of windowSize: Int) -> Int? {
        guard !array.isEmpty, windowSize > 0, array.count >= windowSize else {
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
    
    /// Finds the minimum length of a contiguous subarray whose sum is at least equal to the target sum.
    ///
    /// This method efficiently calculates the minimum length of a subarray that has a sum greater than
    /// or equal to the target sum using the sliding window technique. It expands the window by moving
    /// the right pointer and shrinks it from the left when the sum condition is met, tracking the
    /// minimum length throughout the process.
    ///
    /// - Parameters:
    ///   - targetSum: The minimum sum that the subarray must achieve.
    ///   - array: The input array of integers to search within.
    /// - Returns: The minimum length of a contiguous subarray with sum >= targetSum, or `nil` if no
    ///            such subarray exists.
    ///
    /// ------------------------------------------------------------------------
    /// `Validation`
    ///
    /// `Correctness`
    ///
    /// `Core Logic`
    /// - The implementation correctly uses the sliding window technique to find minimum subarray length.
    /// - Expands the window by moving the right pointer and accumulating the sum.
    /// - When sum >= targetSum, shrinks the window from the left to find the minimum valid length.
    /// - Tracks and updates the minimum length encountered during the sliding process.
    ///
    /// `Edge Cases`
    /// - Empty Array: minimumSubArrayLength(withSum: 5, forArray: []) returns nil (correct, no subarray exists).
    /// - Target Sum Not Achievable: minimumSubArrayLength(withSum: 100, forArray: [1, 2, 3]) returns nil (correct).
    /// - Single Element Sufficient: minimumSubArrayLength(withSum: 5, forArray: [1, 2, 3, 5]) returns 1 (correct).
    /// - Entire Array Required: minimumSubArrayLength(withSum: 10, forArray: [1, 2, 3, 4]) returns 4 (correct).
    /// - Negative Numbers: minimumSubArrayLength(withSum: 3, forArray: [-1, 2, 3, -2, 4]) correctly handles negatives.
    /// - All Negative with Positive Target: minimumSubArrayLength(withSum: 5, forArray: [-1, -2, -3]) returns nil (correct).
    ///
    /// ------------------------------------------------------------------------
    /// `Efficiency`
    ///
    /// `Time Complexity`
    /// - Each element is visited at most twice (once by right pointer, once by left pointer).
    /// - Total: O(n) where n is the array length, which is optimal for this problem.
    ///
    /// `Space Complexity`
    /// - O(1) as only a constant amount of extra space is used (leftIndex, rightIndex, sum, minLength).
    /// - No additional data structures are created proportional to input size.
    ///
    /// `Algorithm Efficiency`
    /// - The sliding window technique avoids recalculating sums for all possible subarrays.
    /// - Each element is added once when expanding and removed once when shrinking.
    /// - Much more efficient than the naive O(n²) approach of checking all subarrays.
    ///
    /// ------------------------------------------------------------------------
    /// `Potential Issues`
    ///
    /// `Performance`
    /// - The implementation is optimal with O(n) time complexity.
    /// - No unnecessary iterations or redundant calculations.
    ///
    /// `Integer Overflow`
    /// - For very large arrays with large integer values, integer overflow could occur.
    /// - Consider using Int64 or checking for overflow in production code if needed.
    ///
    /// `Target Sum Validation`
    /// - The function handles cases where target sum cannot be achieved by returning nil.
    /// - Negative target sums are technically valid but may not be meaningful in all contexts.
    static func minimumSubArrayLength(withSum targetSum: Int, forArray array: [Int]) -> Int? {
        var leftIndex = 0
        var sum = 0
        var minLength = Int.max
        
        for rightIndex in 0..<array.count {
            sum = sum + array[rightIndex]
            
            while sum >= targetSum {
                let currentMinLength = rightIndex - leftIndex + 1
                minLength = min(minLength, currentMinLength)
                sum = sum - array[leftIndex]
                leftIndex = leftIndex + 1
            }
        }
        return minLength == Int.max ? nil : minLength
    }
    
    // MARK: - Future Enhancements
    
    /**
     - TODOs
     - 1. Variable-Size (Dynamic) Windows
     - 2. String-Based Windows with HashMaps
     - 3. Advanced State Management (The Monotonic Queue)
     - 4. Auxiliary Optimization: Two-Pointers vs. Sliding Window
     - 5. Bitmasking with Windows
     */
}
