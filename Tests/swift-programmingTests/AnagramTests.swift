//
//  AnagramTests.swift
//  swift-programming
//
//  Created by Saurabh Verma on 30/03/25.
//

import XCTest
@testable import swift_programming

final class AnagramTests: XCTestCase {
    
    // MARK: Test data
    let anagramPairs: [(String, String)] = [
        ("listen", "silent"),
        ("earth", "heart"),
        ("evil", "vile"),
        ("dusty", "study"),
        ("angel", "glean"),
        ("stressed", "desserts"),
        ("brag", "grab"),
        ("cinema", "iceman"),
        ("save", "vase"),
        ("night", "thing")
    ]
        
    let nonAnagramPairs: [(String, String)] = [
        ("hello", "world"),
        ("swift", "swim"),
        ("apple", "maple"),
        ("moon", "soon"),
        ("train", "brain")
    ]
    
    // MARK: Tests for function areAnaagramsUsingSimpleSortCompare
    func test_areAnaagramsUsingSimpleSortCompare_empty() {
        XCTAssertTrue(Anagram.areAnaagramsUsingSimpleSortCompare("", ""))
    }
    
    func test_areAnaagramsUsingSimpleSortCompare_differentLength() {
        XCTAssertFalse(Anagram.areAnaagramsUsingSimpleSortCompare("evil", "vilee"))
    }
    
    func test_areAnaagramsUsingSimpleSortCompare_differentCase() {
        XCTAssertFalse(Anagram.areAnaagramsUsingSimpleSortCompare("listen", "Silent"))
    }
    
    func test_areAnaagramsUsingSimpleSortCompare_whiteSpace() {
        XCTAssertFalse(Anagram.areAnaagramsUsingSimpleSortCompare("angel ", "glean"))
    }
    
    func test_areAnaagramsUsingSimpleSortCompare_trueCase() {
        for (word1, word2) in anagramPairs {
            XCTAssertTrue(
                Anagram.areAnaagramsUsingSimpleSortCompare(word1, word2),
                "Expected \(word1) and \(word2) to be anagrams"
            )
        }
    }
    
    func test_areAnaagramsUsingSimpleSortCompare_falseCase() {
        for (word1, word2) in nonAnagramPairs {
            XCTAssertFalse(
                Anagram.areAnaagramsUsingSimpleSortCompare(word1, word2),
                "Expected \(word1) and \(word2) not to be anagrams"
            )
        }
    }
    
    // MARK: Tests for function areAnaagramsUsingSimpleSortCompareImproved
    func test_areAnaagramsUsingSimpleSortCompareImproved_empty() {
        XCTAssertTrue(Anagram.areAnaagramsUsingSimpleSortCompareImproved("", ""))
    }
    
    func test_areAnaagramsUsingSimpleSortCompareImproved_differentLength() {
        XCTAssertFalse(Anagram.areAnaagramsUsingSimpleSortCompareImproved("evil", "vilee"))
    }
    
    func test_areAnaagramsUsingSimpleSortCompareImproved_differentCase() {
        XCTAssertTrue(Anagram.areAnaagramsUsingSimpleSortCompareImproved("listen", "Silent"))
    }
    
    func test_areAnaagramsUsingSimpleSortCompareImproved_whiteSpace() {
        XCTAssertFalse(Anagram.areAnaagramsUsingSimpleSortCompareImproved("angel ", "glean"))
    }
    
    func test_areAnaagramsUsingSimpleSortCompareImproved_trueCase() {
        for (word1, word2) in anagramPairs {
            XCTAssertTrue(
                Anagram.areAnaagramsUsingSimpleSortCompareImproved(word1, word2),
                "Expected \(word1) and \(word2) to be anagrams"
            )
        }
    }
    
    func test_areAnaagramsUsingSimpleSortCompareImproved_falseCase() {
        for (word1, word2) in nonAnagramPairs {
            XCTAssertFalse(
                Anagram.areAnaagramsUsingSimpleSortCompareImproved(word1, word2),
                "Expected \(word1) and \(word2) not to be anagrams"
            )
        }
    }
    
    // MARK: Tests for function areAnaagramsUsingCharacterFrequencyCount
    func test_areAnaagramsUsingCharacterFrequencyCount_empty() {
        XCTAssertTrue(Anagram.areAnaagramsUsingCharacterFrequencyCount("", ""))
    }
    
    func test_areAnaagramsUsingCharacterFrequencyCount_differentLength() {
        XCTAssertFalse(Anagram.areAnaagramsUsingCharacterFrequencyCount("evil", "vilee"))
    }
    
    func test_areAnaagramsUsingCharacterFrequencyCount_differentCase() {
        XCTAssertTrue(Anagram.areAnaagramsUsingCharacterFrequencyCount("listen", "Silent"))
    }
    
    func test_areAnaagramsUsingCharacterFrequencyCount_whiteSpace() {
        XCTAssertTrue(Anagram.areAnaagramsUsingCharacterFrequencyCount("angel ", "glean"))
    }
    
    func test_areAnaagramsUsingCharacterFrequencyCount_trueCase() {
        for (word1, word2) in anagramPairs {
            XCTAssertTrue(
                Anagram.areAnaagramsUsingCharacterFrequencyCount(word1, word2),
                "Expected \(word1) and \(word2) to be anagrams"
            )
        }
    }
    
    func test_areAnaagramsUsingCharacterFrequencyCount_falseCase() {
        for (word1, word2) in nonAnagramPairs {
            XCTAssertFalse(
                Anagram.areAnaagramsUsingCharacterFrequencyCount(word1, word2),
                "Expected \(word1) and \(word2) not to be anagrams"
            )
        }
    }
}

