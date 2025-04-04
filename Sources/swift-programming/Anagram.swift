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
    /// ------------------------------------------------------------------------
    /// `Validation`
    ///
    /// `Correctness`
    ///
    /// `Core Logic`
    /// - The implementation correctly identifies anagrams by sorting and comparing the strings.
    /// - Two strings are anagrams if their sorted forms are identical.
    ///
    /// `Edge Cases`
    /// - Empty Strings: areAnaagramsUsingSimpleSortCompare("", "") returns true (correct, as two empty strings are anagrams).
    /// - Different Lengths: areAnaagramsUsingSimpleSortCompare("cat", "cats") returns false (correct, as anagrams must have the same length).
    /// - Case Sensitivity: areAnaagramsUsingSimpleSortCompare("Cat", "cat") returns false (correct behavior depends on requirements, but this is the default Swift behavior since sorting is case-sensitive).
    /// - Whitespace: areAnaagramsUsingSimpleSortCompare("cat ", "cat") returns false (correct, as extra spaces are treated as characters).
    ///
    /// ------------------------------------------------------------------------
    /// `Efficiency`
    ///
    /// `Time Complexity`
    /// - sorted() has a time complexity of O(n log n), where n is the string length.
    /// - reduce() is O(n) for concatenating characters.
    /// - Total: O(n log n) for each string, so O(n log n) overall.
    ///
    /// `Space Complexity`
    /// - O(n) for the sorted arrays and resulting strings.
    ///
    /// `String Concatenation`
    /// - Using + in reduce() repeatedly creates new String instances, which is inefficient due to string immutability in Swift.
    /// - This means every concatenation creates a new copy of the string.
    /// - This results in a quadratic O(n²) complexity due to repeated memory allocations.
    /// - This could be optimized.
    ///
    /// ------------------------------------------------------------------------
    /// `Potential Issues`
    ///
    /// `Performance`
    /// - The reduce() step with string concatenation is suboptimal.
    /// - Swift’s String is a value type, and repeated + operations create intermediate copies, increasing time
    /// complexity slightly beyond necessary.
    ///
    /// `Case Sensitivity`
    /// - The function is case-sensitive by default, which may not always be desired (e.g., "Cat" and "cat" are not considered anagrams).
    ///
    /// `Whitespace`
    /// - Spaces and special characters are included, which might not align with some anagram definitions (e.g., "cat " vs. "cat").
    ///
    /// `Code Duplication`
    /// - The sorted().reduce() logic is repeated for both strings, violating DRY (Don’t Repeat Yourself) principles.
    ///
    static func areAnaagramsUsingSimpleSortCompare(_ string1: String, _ string2: String) -> Bool {
        let sortedString1 = string1.sorted().reduce("") { partialResult, character in
            partialResult + String(character)
        }
        let sortedString2 = string2.sorted().reduce("") { partialResult, character in
            partialResult + String(character)
        }
        return sortedString1 == sortedString2
    }
    
    /// Checks if two given strings are anagrams of each other, ignoring case and whitespace.
    ///
    /// An anagram is a word or phrase formed by rearranging the letters of another.
    /// This method normalizes both input strings by converting them to lowercase, removing spaces,
    /// and sorting their characters to determine if they contain the same characters in the same frequency.
    ///
    /// - Parameters:
    ///   - string1: The first string to compare.
    ///   - string2: The second string to compare.
    /// - Returns: A Boolean value indicating whether the two strings are anagrams.
    ///
    /// ------------------------------------------------------------------------
    /// `Efficiency & Performance`
    ///
    /// `Time Complexity`
    /// - `lowercased()` runs in **O(n)** time.
    /// - `replacingOccurrences(of: " ", with: "")` iterates through the string, running in **O(n)**.
    /// - `sorted()` has a time complexity of **O(n log n)**.
    /// - The final comparison between sorted arrays runs in **O(n)**.
    /// - **Total Complexity: O(n log n)** due to sorting being the most expensive operation.
    ///
    /// `Space Complexity`
    /// - Creating a lowercase version: **O(n)**.
    /// - Removing spaces: **O(n)**.
    /// - Sorting generates a new array: **O(n)**.
    /// - **Total Space Complexity: O(n)**.
    ///
    /// ------------------------------------------------------------------------
    /// `Performance Considerations`
    ///
    /// `Strengths`
    /// ✅ Simple and easy to understand.
    /// ✅ Handles **case insensitivity** by converting to lowercase.
    /// ✅ Ignores spaces to allow anagrams with different spacing.
    ///
    /// `Potential Drawbacks`
    /// ❌ **Sorting is expensive**: Using `sorted()` increases complexity to **O(n log n)**.
    /// ❌ **Does not ignore special characters**: `"hello!"` and `"ohell!"` would be anagrams.
    /// ❌ **Whitespace handling is limited**: Only spaces are removed, not tabs or newlines.
    static func areAnaagramsUsingSimpleSortCompareImproved(_ string1: String, _ string2: String) -> Bool {
        guard string1.count == string2.count else { return false }
        return string1.lowercased().replacingOccurrences(of: " ", with: "").sorted() ==
                string2.lowercased().replacingOccurrences(of: " ", with: "").sorted()
    }
    
    /// Checks if two given strings are anagrams of each other using character frequency counting.
    ///
    /// An anagram is a word or phrase formed by rearranging the letters of another.
    /// This method normalizes both input strings by converting them to lowercase and removing spaces,
    /// then constructs frequency dictionaries for each string to compare character counts.
    ///
    /// - Parameters:
    ///   - string1: The first string to compare.
    ///   - string2: The second string to compare.
    /// - Returns: A Boolean value indicating whether the two strings are anagrams.
    ///
    /// ------------------------------------------------------------------------
    /// `Efficiency & Performance`
    ///
    /// `Time Complexity`
    /// - `lowercased()` runs in **O(n)**.
    /// - `replacingOccurrences(of: " ", with: "")` runs in **O(n)**.
    /// - Constructing the frequency dictionary requires **O(n)**.
    /// - Comparing two dictionaries (bounded by unique characters) runs in **O(n)** in the worst case.
    /// - **Total Complexity: O(n)** (faster than sorting-based approaches which take O(n log n)).
    ///
    /// `Space Complexity`
    /// - Storing the normalized strings requires **O(n)**.
    /// - Two frequency dictionaries, each requiring **O(n)** in the worst case (all unique characters).
    /// - **Total Space Complexity: O(n)** (can be optimized to **O(1)** for limited alphabets like English).
    ///
    /// ------------------------------------------------------------------------
    /// `Performance Considerations`
    ///
    /// `Strengths`
    /// ✅ More efficient than sorting-based methods (**O(n) vs. O(n log n)**).
    /// ✅ Handles **case insensitivity** by converting to lowercase.
    /// ✅ Ignores spaces, allowing anagrams with different spacing.
    ///
    /// `Potential Drawbacks`
    /// ❌ Uses two dictionaries, which **doubles** memory usage (**O(2n)** instead of **O(n)**).
    /// ❌ **Can be optimized**: A single dictionary could be used to count up for `string1` and count down for `string2`, reducing space complexity.
    static func areAnaagramsUsingCharacterFrequencyCount(_ string1: String, _ string2: String) -> Bool {
        let sanitisedStringOne = string1.lowercased().replacingOccurrences(of: " ", with: "")
        let sanitisedStringTwo = string2.lowercased().replacingOccurrences(of: " ", with: "")
        
        guard sanitisedStringOne.count == sanitisedStringTwo.count else { return false }
        
        var frequencyDictionaryOne: [Character: Int] = [:]
        var frequencyDictionaryTwo: [Character: Int] = [:]
        
        for character in sanitisedStringOne {
            frequencyDictionaryOne[character, default: 0] += 1
        }
        
        for character in sanitisedStringTwo {
            frequencyDictionaryTwo[character, default: 0] += 1
        }
        
        return frequencyDictionaryOne == frequencyDictionaryTwo
    }
    
    static func areAnaagramsUsingCharacterFrequencyCountUsingSingleDict(_ string1: String, _ string2: String) -> Bool {
        let sanitisedStringOne = string1.lowercased().replacingOccurrences(of: " ", with: "")
        let sanitisedStringTwo = string2.lowercased().replacingOccurrences(of: " ", with: "")
        
        guard sanitisedStringOne.count == sanitisedStringTwo.count else { return false }
        
        var frequencyDictionary: [Character: Int] = [:]
        
        for character in sanitisedStringOne {
            frequencyDictionary[character, default: 0] += 1
        }
        
        for character in sanitisedStringTwo {
            frequencyDictionary[character, default: 0] -= 1
        }
        
        return frequencyDictionary.values.allSatisfy { $0 == 0 }
    }
}
