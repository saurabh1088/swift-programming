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
}
