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
    
    /// ------------------------------------------------------------------------
    /// `Efficiency`
    ///
    /// `Time Complexity`
    /// `O(n^2)`
    /// - Array(array.dropFirst()) is the dominant factor
    /// - array.dropFirst() in Swift, this returns an ArraySlice (a view into the original array) in O(1) time. This part is efficient.
    /// - Array(...) However, converting that ArraySlice back into a new Array requires copying all elements
    /// from the slice into a new contiguous memory block. If the slice has k elements, this copy operation takes O(k) time.
    ///
    /// `Space Complexity`
    /// `O(n^2)`
    /// - Every time array is created for sliced part, it leads to new memory allocations.
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

extension Arrays {
    
    static func smallestElement<T: Comparable>(in array: [T]) -> T? {
        guard array.isEmpty == false else { return nil }
        guard array.count > 1 else { return array.first }
        var smallestElement = array[0]
        for element in array {
            if element < smallestElement {
                smallestElement = element
            }
        }
        return smallestElement
    }
    
    static func smallestElementUsingRecursion<T: Comparable>(in array: [T]) -> T? {
        guard array.isEmpty == false else { return nil }
        var smallestElement = array[0]
        if array.count != 1 {
            var smallestElementFromRestOfArray: T?
            smallestElementFromRestOfArray = smallestElementUsingRecursion(in: Array(array.dropFirst()))
            if let smallestElementFromRestOfArray = smallestElementFromRestOfArray,
               smallestElementFromRestOfArray < smallestElement {
                smallestElement = smallestElementFromRestOfArray
            }
        }
        return smallestElement
    }
}

