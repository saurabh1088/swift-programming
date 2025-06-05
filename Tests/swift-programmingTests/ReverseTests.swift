//
//  ReverseTests.swift
//  swift-programming
//
//  Created by Saurabh Verma on 01/05/25.
//

import XCTest
@testable import swift_programming

final class ReverseTests: XCTestCase {
    
    /// ------------------------------------------------------------------------
    // MARK: Tests for function reverseString
    func test_reverseString_withEmptyString() {
        let input = ""
        let expected = ""
        XCTAssertEqual(Reverse.reverseString(input), expected)
    }
    
    func test_reverseString_withRegularString() {
        let input = "hello!"
        let expected = "!olleh"
        XCTAssertEqual(Reverse.reverseString(input), expected)
    }
    
    func test_reverseString_withSingleCharacterString() {
        let input = "a"
        let expected = "a"
        XCTAssertEqual(Reverse.reverseString(input), expected)
    }
    
    func test_reverseString_withWhitespace() {
        let input = "a b c"
        let expected = "c b a"
        XCTAssertEqual(Reverse.reverseString(input), expected)
    }

    func test_reverseString_withUnicodeCharacters() {
        let input = "🙂🙃"
        let expected = "🙃🙂"
        XCTAssertEqual(Reverse.reverseString(input), expected)
    }

    func test_reverseString_withPalindromes() {
        let input = "madam"
        let expected = "madam"
        XCTAssertEqual(Reverse.reverseString(input), expected)
    }
    
    /// ------------------------------------------------------------------------
    // MARK: Tests for function reverseStringUsingReduce
    func test_reverseStringUsingReduce_withEmptyString() {
        let input = ""
        let expected = ""
        XCTAssertEqual(Reverse.reverseStringUsingReduce(input), expected)
    }
    
    func test_reverseStringUsingReduce_withRegularString() {
        let input = "hello!"
        let expected = "!olleh"
        XCTAssertEqual(Reverse.reverseStringUsingReduce(input), expected)
    }
    
    func test_reverseStringUsingReduce_withSingleCharacterString() {
        let input = "a"
        let expected = "a"
        XCTAssertEqual(Reverse.reverseStringUsingReduce(input), expected)
    }
    
    func test_reverseStringUsingReduce_withWhitespace() {
        let input = "a b c"
        let expected = "c b a"
        XCTAssertEqual(Reverse.reverseStringUsingReduce(input), expected)
    }

    func test_reverseStringUsingReduce_withUnicodeCharacters() {
        let input = "🙂🙃"
        let expected = "🙃🙂"
        XCTAssertEqual(Reverse.reverseStringUsingReduce(input), expected)
    }

    func test_reverseStringUsingReduce_withPalindromes() {
        let input = "madam"
        let expected = "madam"
        XCTAssertEqual(Reverse.reverseStringUsingReduce(input), expected)
    }

    /// ------------------------------------------------------------------------
    // MARK: Tests for function reverseStringUsingLoop
    func test_reverseStringUsingLoop_withEmptyString() {
        let input = ""
        let expected = ""
        XCTAssertEqual(Reverse.reverseStringUsingLoop(input), expected)
    }

    func test_reverseStringUsingLoop_withRegularString() {
        let input = "hello!"
        let expected = "!olleh"
        XCTAssertEqual(Reverse.reverseStringUsingLoop(input), expected)
    }

    func test_reverseStringUsingLoop_withSingleCharacterString() {
        let input = "a"
        let expected = "a"
        XCTAssertEqual(Reverse.reverseStringUsingLoop(input), expected)
    }

    func test_reverseStringUsingLoop_withWhitespace() {
        let input = "a b c"
        let expected = "c b a"
        XCTAssertEqual(Reverse.reverseStringUsingLoop(input), expected)
    }

    func test_reverseStringUsingLoop_withUnicodeCharacters() {
        let input = "🙂🙃"
        let expected = "🙃🙂"
        XCTAssertEqual(Reverse.reverseStringUsingLoop(input), expected)
    }

    func test_reverseStringUsingLoop_withPalindromes() {
        let input = "madam"
        let expected = "madam"
        XCTAssertEqual(Reverse.reverseStringUsingLoop(input), expected)
    }
}
