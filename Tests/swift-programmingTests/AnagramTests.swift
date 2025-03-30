//
//  AnagramTests.swift
//  swift-programming
//
//  Created by Saurabh Verma on 30/03/25.
//

import XCTest
@testable import swift_programming

final class AnagramTests: XCTestCase {
    
    func test_areAnaagramsUsingSimpleSortCompare_empty() {
        XCTAssertTrue(Anagram.areAnaagramsUsingSimpleSortCompare("", ""))
    }
    
    func test_areAnaagramsUsingSimpleSortCompare_differentLength() {
        XCTAssertFalse(Anagram.areAnaagramsUsingSimpleSortCompare("abc", "abcd"))
    }
    
    func test_areAnaagramsUsingSimpleSortCompare_differentCase() {
        XCTAssertFalse(Anagram.areAnaagramsUsingSimpleSortCompare("listen", "Silent"))
    }
}

