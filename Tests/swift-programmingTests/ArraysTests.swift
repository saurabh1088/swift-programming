//
//  ArraysTests.swift
//  swift-programming
//
//  Created by Saurabh Verma on 19/07/25.
//

import XCTest
@testable import swift_programming

final class ArraysTests: XCTestCase {
    
    // -------------------------------------------------------------------------
    // MARK: Tests for function largestElement<T: Comparable>(in array: [T]) -> T?
    func test_largestElement_Int() {
        XCTAssertEqual(Arrays.largestElement(in: [3, 2, 5, 1, 0, 22, 32, 12, 44, 89, 23, 34, 60, 50]), 89)
        XCTAssertEqual(Arrays.largestElement(in: [10, 5, 15, 20, 0, 8, 25, 30, 2, 12, 7, 18, 22]), 30)
        XCTAssertEqual(Arrays.largestElement(in: [99, 1, 88, 2, 77, 3, 66, 4, 55, 5, 44, 6, 33, 7, 22, 8, 11, 9]), 99)
        XCTAssertEqual(Arrays.largestElement(in: [100, 200, 50, 300, 10, 400, 250, 150, 500]), 500)
        XCTAssertEqual(Arrays.largestElement(in: [7, 1, 9, 3, 5]), 9)
        XCTAssertEqual(Arrays.largestElement(in: [111, 222, 333, 444, 555, 666, 777, 888, 999]), 999)
        XCTAssertEqual(Arrays.largestElement(in: [42]), 42)
        XCTAssertEqual(Arrays.largestElement(in: [Int]()), nil)
        XCTAssertEqual(Arrays.largestElement(in: [-5, -10, 0, 1, -2, 8, 15, -1]), 15)
        XCTAssertEqual(Arrays.largestElement(in: [1000, 500, 750, 250, 1250, 100, 1500, 50, 1750, 2000]), 2000)
    }
    
    func test_largestElement_Double() {
        XCTAssertEqual(Arrays.largestElement(in: [3.14, 2.71, 5.0, 1.618, 0.0, 22.5]), 22.5)
        XCTAssertEqual(Arrays.largestElement(in: [-1.0, -0.5, -2.0]), -0.5)
        XCTAssertNil(Arrays.largestElement(in: [Double]()))
    }
    
    func test_largestElement_Strings() {
        XCTAssertEqual(Arrays.largestElement(in: ["apple", "banana", "cherry", "date"]), "date")
        XCTAssertEqual(Arrays.largestElement(in: ["zebra", "apple", "cat"]), "zebra")
        XCTAssertEqual(Arrays.largestElement(in: ["Swift", "Python", "Java", "Kotlin"]), "Swift")
        XCTAssertNil(Arrays.largestElement(in: [String]()))
    }
    
    func test_largestElement_Unicode_Scalars() {
        XCTAssertEqual(Arrays.largestElement(in: ["a", "b", "c"]), "c")
        XCTAssertEqual(Arrays.largestElement(in: ["Z", "A", "M"]), "Z")
        XCTAssertEqual(Arrays.largestElement(in: ["!", "@", "#"]), "@")
        XCTAssertNil(Arrays.largestElement(in: [Character]()))
    }
    
    // -------------------------------------------------------------------------
    // MARK: Tests for function largestElementUsingRecursion<T: Comparable>(in array: [T]) -> T?
    func test_largestElementUsingRecursion_Int() {
        XCTAssertEqual(Arrays.largestElementUsingRecursion(in: [3, 2, 5, 1, 0, 22, 32, 12, 44, 89, 23, 34, 60, 50]), 89)
        XCTAssertEqual(Arrays.largestElementUsingRecursion(in: [10, 5, 15, 20, 0, 8, 25, 30, 2, 12, 7, 18, 22]), 30)
        XCTAssertEqual(Arrays.largestElementUsingRecursion(in: [99, 1, 88, 2, 77, 3, 66, 4, 55, 5, 44, 6, 33, 7, 22, 8, 11, 9]), 99)
        XCTAssertEqual(Arrays.largestElementUsingRecursion(in: [100, 200, 50, 300, 10, 400, 250, 150, 500]), 500)
        XCTAssertEqual(Arrays.largestElementUsingRecursion(in: [7, 1, 9, 3, 5]), 9)
        XCTAssertEqual(Arrays.largestElementUsingRecursion(in: [111, 222, 333, 444, 555, 666, 777, 888, 999]), 999)
        XCTAssertEqual(Arrays.largestElementUsingRecursion(in: [42]), 42)
        XCTAssertEqual(Arrays.largestElementUsingRecursion(in: [Int]()), nil)
        XCTAssertEqual(Arrays.largestElementUsingRecursion(in: [-5, -10, 0, 1, -2, 8, 15, -1]), 15)
        XCTAssertEqual(Arrays.largestElementUsingRecursion(in: [1000, 500, 750, 250, 1250, 100, 1500, 50, 1750, 2000]), 2000)
    }
    
    func test_largestElementUsingRecursion_Double() {
        XCTAssertEqual(Arrays.largestElementUsingRecursion(in: [3.14, 2.71, 5.0, 1.618, 0.0, 22.5]), 22.5)
        XCTAssertEqual(Arrays.largestElementUsingRecursion(in: [-1.0, -0.5, -2.0]), -0.5)
        XCTAssertNil(Arrays.largestElementUsingRecursion(in: [Double]()))
    }
    
    func test_largestElementUsingRecursion_Strings() {
        XCTAssertEqual(Arrays.largestElementUsingRecursion(in: ["apple", "banana", "cherry", "date"]), "date")
        XCTAssertEqual(Arrays.largestElementUsingRecursion(in: ["zebra", "apple", "cat"]), "zebra")
        XCTAssertEqual(Arrays.largestElementUsingRecursion(in: ["Swift", "Python", "Java", "Kotlin"]), "Swift")
        XCTAssertNil(Arrays.largestElementUsingRecursion(in: [String]()))
    }
    
    func test_largestElementUsingRecursion_Unicode_Scalars() {
        XCTAssertEqual(Arrays.largestElementUsingRecursion(in: ["a", "b", "c"]), "c")
        XCTAssertEqual(Arrays.largestElementUsingRecursion(in: ["Z", "A", "M"]), "Z")
        XCTAssertEqual(Arrays.largestElementUsingRecursion(in: ["!", "@", "#"]), "@")
        XCTAssertNil(Arrays.largestElementUsingRecursion(in: [Character]()))
    }
}
