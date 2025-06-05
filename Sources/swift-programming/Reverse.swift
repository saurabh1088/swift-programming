//
//  Reverse.swift
//  swift-programming
//
//  Created by Saurabh Verma on 06/04/25.
//

import Foundation

struct Reverse {
    
    /// Reverses the characters in a given string.
    ///
    /// This method takes an input string and returns a new string with all characters in reverse order.
    /// The implementation uses Swift's built-in reversed() method and converts the result back to a String.
    ///
    /// - Parameters:
    ///   - input: The string to be reversed.
    /// - Returns: A new string with the characters in reverse order.
    ///
    /// ------------------------------------------------------------------------
    /// `Validation`
    ///
    /// `Correctness`
    ///
    /// `Core Logic`
    /// - The implementation correctly reverses a string by using reversed() to create a reversed collection.
    /// - The collection is then converted back to a String using String.init().
    ///
    /// `Edge Cases`
    /// - Empty String: reverseString("") returns "" (correct, empty string remains empty).
    /// - Single Character: reverseString("a") returns "a" (correct, single character remains unchanged).
    /// - Unicode: reverseString("héllo") returns "olléh" (correct, preserves Unicode characters).
    /// - Whitespace: reverseString("hello world") returns "dlrow olleh" (correct, preserves spaces).
    ///
    /// ------------------------------------------------------------------------
    /// `Efficiency`
    ///
    /// `Time Complexity`
    /// - reversed() has a time complexity of O(1) as it creates a lazy reversed view.
    /// - String.init() from ReversedCollection is O(n) where n is the string length.
    /// - Total: O(n) overall.
    ///
    /// `Space Complexity`
    /// - O(n) for the new String that’s created, where n is the length of the input string.
    ///
    /// `String Construction`
    /// - The String.init() operation creates a single new string from the reversed collection.
    /// - This is efficient as it avoids multiple string concatenations.
    ///
    /// ------------------------------------------------------------------------
    /// `Potential Issues`
    ///
    /// `Performance`
    /// - The implementation is generally efficient with linear time complexity.
    /// - No unnecessary copies or intermediate strings are created beyond the final result.
    ///
    /// `Unicode Handling`
    /// - Properly handles Unicode characters and multi-byte sequences.
    /// - No special consideration needed as Swift’s String handles this natively.
    ///
    /// `Memory`
    /// - Creates exactly one new String instance, which is optimal for this operation.
    static func reverseString(_ input: String) -> String {
        return String(input.reversed())
    }
    
    /// Reverses the characters in a given string using reduce.
    ///
    /// This method takes an input string and returns a new string with all characters in reverse order.
    /// The implementation uses the reduce method, prepending each character to the accumulator string.
    ///
    /// - Parameters:
    ///   - input: The string to be reversed.
    /// - Returns: A new string with the characters in reverse order.
    ///
    /// ------------------------------------------------------------------------
    /// `Validation`
    ///
    /// `Correctness`
    ///
    /// `Core Logic`
    /// - The implementation correctly reverses a string by using reduce to iterate over characters.
    /// - Each character is prepended to the accumulator, effectively reversing the order.
    ///
    /// `Edge Cases`
    /// - Empty String: reverseStringUsingReduce("") returns "" (correct).
    /// - Single Character: reverseStringUsingReduce("a") returns "a" (correct).
    /// - Unicode: reverseStringUsingReduce("héllo") returns "olléh" (correct, handles Unicode).
    /// - Whitespace: reverseStringUsingReduce("hello world") returns "dlrow olleh" (correct).
    ///
    /// ------------------------------------------------------------------------
    /// `Efficiency`
    ///
    /// `Time Complexity`
    /// - Each character is processed once: O(n) where n is the input string length.
    /// - Each prepend operation creates a new string: O(n) per operation in worst case.
    /// - Total: O(n^2) in the worst case due to repeated string allocations.
    ///
    /// `Space Complexity`
    /// - O(n^2) in the worst case due to repeated allocations from prepending.
    ///
    /// `String Construction`
    /// - Constructs new intermediate strings during each reduce step.
    /// - Less efficient than using reversed() due to repeated copying.
    ///
    /// ------------------------------------------------------------------------
    /// `Potential Issues`
    ///
    /// `Performance`
    /// - Less efficient due to repeated string allocations when prepending.
    ///
    /// `Unicode Handling`
    /// - Correctly handles Unicode characters due to Swift’s String model.
    ///
    /// `Memory`
    /// - Allocates multiple intermediate strings, unlike the reversed() approach.
    static func reverseStringUsingReduce(_ input: String) -> String {
        return input.reduce("") { partialResult, character in
            String(character) + partialResult
        }
    }
    

    /// Reverses the characters in a given string using a for-loop.
    ///
    /// This method removes all whitespace from the input string, then reverses the characters using a for-loop.
    /// It builds the reversed string by prepending each character, which effectively reverses the order.
    ///
    /// - Parameters:
    ///   - input: The string to be reversed.
    /// - Returns: A new string with the characters reversed and spaces removed.
    ///
    /// ------------------------------------------------------------------------
    /// `Validation`
    ///
    /// `Correctness`
    ///
    /// `Core Logic`
    /// - Removes whitespace using replacingOccurrences(of:with:).
    /// - Iterates through each character and prepends it to the result string.
    ///
    /// `Edge Cases`
    /// - Empty String: reverseStringUsingLoop("") returns "".
    /// - Only Spaces: reverseStringUsingLoop("   ") returns "".
    /// - Single Character: reverseStringUsingLoop("a") returns "a".
    /// - Unicode: reverseStringUsingLoop("héllo") returns "olléh".
    ///
    /// ------------------------------------------------------------------------
    /// `Efficiency`
    ///
    /// `Time Complexity`
    /// - O(n^2) in the worst case due to string prepending inside the loop.
    ///
    /// `Space Complexity`
    /// - O(n^2) due to intermediate string allocations.
    ///
    /// `String Construction`
    /// - Each prepend operation allocates a new string.
    ///
    /// ------------------------------------------------------------------------
    /// `Potential Issues`
    ///
    /// `Performance`
    /// - Repeated prepending causes poor performance on long strings.
    ///
    /// `Whitespace Handling`
    /// - Intentionally removes all whitespaces before reversal.
    ///
    /// `Unicode Handling`
    /// - Properly handles Unicode characters due to Swift’s String model.
    static func reverseStringUsingLoop(_ input: String) -> String {
        var reversedString = ""
        for character in input.replacingOccurrences(of: " ", with: "") {
            // string concatenation, especially when performed repeatedly by prepending a character, can be inefficient.
            // here this operation leads to time complexity of O(n^2)
            reversedString = String(character) + reversedString
        }
        return reversedString
    }
}
