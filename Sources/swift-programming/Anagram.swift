//
//  Anagram.swift
//  swift-programming
//
//  Created by Saurabh Verma on 26/03/25.
//

import Foundation

struct Anagram {
    
    /// Checks if two given strings are anagrams of each other.
    ///
    /// An anagram is a word or phrase formed by rearranging the letters of another.
    /// This method sorts both input strings and compares them to determine if they contain the same characters in the same frequency.
    ///
    /// - Parameters:
    ///   - string1: The first string to compare.
    ///   - string2: The second string to compare.
    /// - Returns: A Boolean value indicating whether the two strings are anagrams.
    ///
    ///
    /// `Validation`
    ///
    /// `Correctness`
    ///
    /// Core Logic:
    /// The implementation correctly identifies anagrams by sorting and comparing the strings.
    /// Two strings are anagrams if their sorted forms are identical.
    ///
    /// Edge Cases:
    /// - Empty Strings: areAnaagrams("", "") returns true (correct, as two empty strings are anagrams).
    /// - Different Lengths: areAnaagrams("cat", "cats") returns false (correct, as anagrams must have the same length).
    /// - Case Sensitivity: areAnaagrams("Cat", "cat") returns false (correct behavior depends on requirements, but this is the default Swift behavior since sorting is case-sensitive).
    /// - Whitespace: areAnaagrams("cat ", "cat") returns false (correct, as extra spaces are treated as characters).
    ///
    /// `Efficiency`
    ///
    /// `Time Complexity`
    /// - sorted() has a time complexity of O(n log n), where n is the string length.
    /// - reduce() is O(n) for concatenating characters.
    /// - Total: O(n log n) for each string, so O(n log n) overall.
    ///
    /// `Space Complexity`
    /// - O(n) for the sorted arrays and resulting strings.
    static func areAnaagramsUsingSimpleSortCompare(_ string1: String, _ string2: String) -> Bool {
        let sortedString1 = string1.sorted().reduce("") { partialResult, character in
            partialResult + String(character)
        }
        let sortedString2 = string2.sorted().reduce("") { partialResult, character in
            partialResult + String(character)
        }
        return sortedString1 == sortedString2
    }
}
