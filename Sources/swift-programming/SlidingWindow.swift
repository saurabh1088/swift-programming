//
//  SlidingWindow.swift
//  swift-programming
//
//  Created by Saurabh Verma on 17/12/25.
//

import Foundation

struct SlidingWindow {
    
    static func maximumSubArraySum() {
        let array = [1, 2, 3, 4, 9, 6, 7, 8, 3, 4, 7, 2, 1, 5, 8, 9, 4, 5, 6, 7]
        var currentMax = 0
        var finalMax = 0
        let windowSize = 3
        let startingIndex = windowSize - 1
        let lastIndex = array.count - 1
        
        for index in 0..<windowSize {
            currentMax = currentMax + array[index]
        }
        
        finalMax = currentMax
        
        for index in startingIndex..<lastIndex {
            print("Iteration :: \(index) | Current max :: \(currentMax) | Final max :: \(finalMax)")
            currentMax = currentMax - array[index - windowSize + 1]
            currentMax = currentMax + array[index + 1]
            if currentMax > finalMax {
                finalMax = currentMax
            }
        }
        
        print("Maximum sum : \(finalMax)")
    }
}
