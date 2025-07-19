//
//  Arrays.swift
//  swift-programming
//
//  Created by Saurabh Verma on 19/07/25.
//

import Foundation

struct Arrays {
    
    static func largestElement(in array: [Int]) -> Int {
        var largestElement = array[0]
        for item in array {
            if item > largestElement {
                largestElement = item
            }
        }
        return largestElement
    }
}

