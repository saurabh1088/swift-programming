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
