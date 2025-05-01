//
//  ReverseTests.swift
//  swift-programming
//
//  Created by Saurabh Verma on 01/05/25.
//

import XCTest
@testable import swift_programming

final class ReverseTests: XCTestCase {
    
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
    
    func testReverseString_withWhitespace() {
        let input = "a b c"
        let expected = "c b a"
        XCTAssertEqual(Reverse.reverseString(input), expected)
    }

    func testReverseString_withUnicodeCharacters() {
        let input = "🙂🙃"
        let expected = "🙃🙂"
        XCTAssertEqual(Reverse.reverseString(input), expected)
    }

    func testReverseString_withPalindromes() {
        let input = "madam"
        let expected = "madam"
        XCTAssertEqual(Reverse.reverseString(input), expected)
    }
}
