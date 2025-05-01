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
        let inputString = ""
        XCTAssertEqual(Reverse.reverseString(inputString), inputString)
    }
    
    func test_reverseString_withRegularString() {
        let inputString = "Hello World"
        let reversedString = "dlroW olleH"
        XCTAssertEqual(Reverse.reverseString(inputString), reversedString)
    }
}
