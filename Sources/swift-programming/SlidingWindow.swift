//
//  SlidingWindow.swift
//  swift-programming
//
//  Created by Saurabh Verma on 17/12/25.
//

import Foundation

/// A utility struct providing efficient sliding window algorithms for array processing.
///
/// The `SlidingWindow` struct implements optimized solutions for common array problems using
/// the sliding window technique. This technique maintains a window of elements that slides
/// across the array, avoiding redundant calculations and achieving optimal time complexity.
///
/// ## Sliding Window Technique
///
/// The sliding window technique is an algorithmic approach that maintains a subset of elements
/// (a "window") that moves through a larger collection. Instead of recalculating values for
/// every possible subarray, the algorithm efficiently updates the window by adding new elements
/// and removing old ones, typically achieving O(n) time complexity instead of O(n²) or O(n*k).
///
/// ## Available Methods
///
/// - `maximumSubArraySum(for:of:)` - Finds the maximum sum of a subarray with a fixed window size.
/// - `minimumSubArrayLength(withSum:forArray:)` - Finds the minimum length subarray with sum >= target.
/// - `newArrayByMovingAverage(from:size:)` - Creates a new array by computing moving averages with a specified window size.
///
/// ## Usage Example
///
/// ```swift
/// // Find maximum sum of subarray of size 3
/// let array = [1, 4, 2, 10, 23, 3, 1, 0, 20]
/// if let maxSum = SlidingWindow.maximumSubArraySum(for: array, of: 3) {
///     print("Maximum sum: \(maxSum)") // Prints: Maximum sum: 36
/// }
///
/// // Find minimum length subarray with sum >= 7
/// let array2 = [2, 1, 5, 2, 3, 2]
/// if let minLength = SlidingWindow.minimumSubArrayLength(withSum: 7, forArray: array2) {
///     print("Minimum length: \(minLength)") // Prints: Minimum length: 2
/// }
/// ```
///
/// ## Performance Characteristics
///
/// All methods in this struct are optimized for performance:
/// - **Time Complexity**: O(n) where n is the array length
/// - **Space Complexity**: O(1) constant extra space
///
/// - Note: This struct contains only static methods and should not be instantiated.
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
            
            while sum >= targetSum, leftIndex <= rightIndex {
                let currentMinLength = rightIndex - leftIndex + 1
                minLength = min(minLength, currentMinLength)
                sum = sum - array[leftIndex]
                leftIndex = leftIndex + 1
            }
        }
        return minLength == Int.max ? nil : minLength
    }
    
    /// Creates a new array by computing the moving average with a specified window size.
    ///
    /// This method calculates a moving average where each element is the average of the current
    /// element and the previous `size - 1` elements (or all available elements if fewer than `size`
    /// elements have been processed). This technique is commonly used to smooth out "spiky" data,
    /// such as raw CPU readings in system monitoring tools, to provide a better user experience in
    /// UI visualizations.
    ///
    /// The moving average helps reduce noise in time-series data by averaging values over a window,
    /// making trends more visible and patterns easier to identify.
    ///
    /// - Parameters:
    ///   - array: The input array of integers to process.
    ///   - size: The window size for the moving average. Must be greater than 0.
    /// - Returns: A new array of `Double` values where each element is the average of the current
    ///            element and the previous `size - 1` elements (or all available elements if fewer
    ///            than `size` elements have been processed). Returns an empty array if the input
    ///            array is empty or size is 0 or negative.
    ///
    /// ## Usage Example
    ///
    /// ```swift
    /// let input = [10, 20, 30, 40]
    /// let smoothed = SlidingWindow.newArrayByMovingAverage(from: input, size: 2)
    /// // Result: [10.0, 15.0, 25.0, 35.0]
    /// // Explanation:
    /// // - First element: average of [10] = 10.0 / 1 = 10.0
    /// // - Second element: average of [10, 20] = 30.0 / 2 = 15.0
    /// // - Third element: average of [20, 30] = 50.0 / 2 = 25.0
    /// // - Fourth element: average of [30, 40] = 70.0 / 2 = 35.0
    /// ```
    ///
    /// ## Real-World Application
    ///
    /// In system monitoring tools like System Pulse, raw CPU data can be "spiky" with sudden
    /// jumps and drops. Engineers use moving averages to "smooth" this data, making it easier
    /// to visualize trends and identify patterns in the UI without the visual noise of rapid
    /// fluctuations.
    ///
    /// ------------------------------------------------------------------------
    /// `Validation`
    ///
    /// `Correctness`
    ///
    /// `Core Logic`
    /// - The implementation correctly calculates moving averages using a sliding window of specified size.
    /// - For each position, calculates the average of the current element and previous `size - 1` elements.
    /// - When fewer than `size` elements are available, averages all available elements.
    /// - Properly handles type conversion from Int to Double for accurate floating-point arithmetic.
    ///
    /// `Edge Cases`
    /// - Empty Array: newArrayByMovingAverage(from: [], size: 2) returns [] (correct, no elements to process).
    /// - Single Element: newArrayByMovingAverage(from: [5], size: 2) returns [5.0] (correct, only one element).
    /// - Two Elements: newArrayByMovingAverage(from: [10, 20], size: 2) returns [10.0, 15.0] (correct).
    /// - Negative Numbers: newArrayByMovingAverage(from: [-10, 10, -5], size: 2) correctly handles negatives.
    /// - Zero Values: newArrayByMovingAverage(from: [0, 0, 0], size: 2) returns [0.0, 0.0, 0.0] (correct).
    /// - Large Numbers: Correctly handles large integer values when converting to Double.
    /// - Invalid Size: newArrayByMovingAverage(from: [1, 2, 3], size: 0) returns [] (correct).
    ///
    /// ------------------------------------------------------------------------
    /// `Efficiency`
    ///
    /// `Time Complexity`
    /// - Single pass through the array: O(n) where n is the array length.
    /// - Each element is accessed once and added/removed from the window sum once.
    /// - Total: O(n) which is optimal for this problem, as every element must be processed.
    ///
    /// `Space Complexity`
    /// - O(n) as a new array of the same size is created to store the results.
    /// - Additional constant space for loop variables and temporary calculations (sum, index).
    /// - Space complexity cannot be improved as we need to return a new array.
    ///
    /// `Algorithm Efficiency`
    /// - The implementation processes elements sequentially in a single pass.
    /// - Uses sliding window technique to efficiently update the sum without recalculating.
    /// - Efficient type conversion and arithmetic operations.
    /// - Optimal for the problem requirements.
    ///
    /// ------------------------------------------------------------------------
    /// `Potential Issues`
    ///
    /// `Performance`
    /// - The implementation is optimal with O(n) time complexity.
    /// - No unnecessary iterations or redundant calculations.
    /// - Array appending is efficient in Swift (amortized O(1) per append).
    ///
    /// `Precision`
    /// - Uses Double for floating-point arithmetic, providing good precision for most use cases.
    /// - For extremely large integers, precision loss may occur when converting to Double.
    /// - Consider using Decimal for financial or high-precision applications if needed.
    ///
    /// `Integer Overflow`
    /// - When adding integers before converting to Double, integer overflow could occur for
    ///   very large values near Int.max.
    /// - Consider converting to Double before addition if dealing with very large numbers.
    static func newArrayByMovingAverage(from array: [Int], size: Int) -> [Double] {
        guard size > 0, !array.isEmpty else { return [] }
        var finalArray = [Double]()
        var sum = 0
        for index in 0..<array.count {
            sum = sum + array[index]
            
            if index >= size {
                sum = sum - array[index - size]
            }
            
            var divisor = min(index + 1, size)
            finalArray.append(Double(sum) / Double(divisor))
        }
        return finalArray
    }
    
    // TODO: Future TODOs
    /**

     ### 2. The "Two-Pointer" Reverse (Strings)

     **The Goal:** Write a function that takes a string and returns it reversed **without** using the built-in `.reversed()` method.

     * **Why do this?** This is the foundation of the **Two-Pointer technique**. You’ll have a `left` pointer at index 0 and a `right` pointer at the end, swapping them as they move toward the middle.
     * **Logic Visualization:**

     ---

     ### 3. The "Duplicate Finder" (Sets/Dictionaries)

     **The Goal:** Given an array of integers, return `true` if any value appears at least twice, and `false` if every element is distinct.

     * **Why do this?** This teaches you about **Sets**. A Set is a data structure that only stores unique items. It’s significantly faster for "existence checks" than an Array (O(1) vs O(N)).
     * **Pro Tip:** Try solving this by inserting items into a `Set` one by one. If an item is already there, you've found a duplicate!

     ### 4. The "Bracket Validator" (Stacks)

     **The Goal:** Given a string containing just the characters `(`, `)`, `[`, `]`, `{`, and `}`, determine if the input string is valid (every opener has a closer in the right order).

     * **Why do this?** This is the classic introduction to the **Stack** (Last-In, First-Out).
     * **The Logic:**
     1. If you see an opener `(`, **push** it onto the stack.
     2. If you see a closer `)`, **pop** the top item off the stack.
     3. If they don't match, or the stack is empty at the end, it’s invalid.



     ---

     ### 📈 Beginner Data Structure Cheat Sheet

     | Data Structure | Best Used For... | Example in your Pulse Tool |
     | --- | --- | --- |
     | **Array** | Ordered lists of items. | Storing the last 10 CPU readings. |
     | **Set** | Unique items, fast lookups. | Keeping track of unique Process IDs (PIDs). |
     | **Dictionary** | Key-Value pairs. | Mapping a Process Name to its CPU %: `["Xcode": 15.2]`. |
     | **Stack** | Undo/Redo or nested logic. | Managing a "Back" button in a CLI menu. |

     ---
     */
}
