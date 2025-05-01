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
}
