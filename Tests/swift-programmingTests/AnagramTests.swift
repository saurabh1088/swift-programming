//
//  AnagramTests.swift
//  swift-programming
//
//  Created by Saurabh Verma on 30/03/25.
//

import XCTest
@testable import swift_programming

final class AnagramTests: XCTestCase {
    
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
}

