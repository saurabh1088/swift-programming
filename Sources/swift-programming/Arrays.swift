//
//  Arrays.swift
//  swift-programming
//
//  Created by Saurabh Verma on 19/07/25.
//

import Foundation

struct Arrays {
    /// ------------------------------------------------------------------------
    /// `Efficiency`
    ///
    /// `Time Complexity`
    /// `O(n)`
    /// - For loop is the dominant part of this algorithm
    /// - For loop iterates through every element, hence time complexity of O(n)
    ///
    /// `Space Complexity`
    /// `O(1)`
    /// - For loop iteration is over an existing array, hence no new memory is created
    ///
    /// `Alternative`
    /// In `Swift` when `Array` element conforms to `Comparable` then instance method `max()`
    /// is available, which also has complexity of `O(n)`
    static func largestElement<T: Comparable>(in array: [T]) -> T? {
        guard array.isEmpty == false else { return nil }
        var largestElement = array[0]
        for item in array {
            if item > largestElement {
                largestElement = item
            }
        }
        return largestElement
    }
    
    static func largestElementUsingRecursion<T: Comparable>(in array: [T]) -> T? {
        guard array.isEmpty == false else { return nil }
        var largestElement = array[0]
        if array.count != 1 {
            var largestElementFromRestOfArray: T?
            largestElementFromRestOfArray = largestElementUsingRecursion(in: Array(array.dropFirst()))
            if let largestElementFromRestOfArray = largestElementFromRestOfArray,
               largestElementFromRestOfArray > largestElement {
                largestElement = largestElementFromRestOfArray
            }
        }
        return largestElement
    }
}

