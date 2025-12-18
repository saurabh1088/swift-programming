//
//  SlidingWindow.swift
//  swift-programming
//
//  Created by Saurabh Verma on 17/12/25.
//

import Foundation

struct SlidingWindow {
    
    static func maximumSubArraySum() {
        let array = [2, 3, 1, 2, 4, 3]
        var currentMax = 0
        var max = 0
        let window = 3
        
        for index in 0..<3 {
            currentMax = currentMax + array[index]
        }
        
        for (index, _) in array.enumerated() {
            if index + window < array.count {
                currentMax = currentMax - array[index]
                currentMax = currentMax + array[index + window]
                if currentMax > max {
                    max = currentMax
                }
            }
        }
        
        print("Maximum sum : \(max)")
    }
}
