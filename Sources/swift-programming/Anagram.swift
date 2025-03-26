//
//  Anagram.swift
//  swift-programming
//
//  Created by Saurabh Verma on 26/03/25.
//

import Foundation

struct Anagram {
    
    static func areAnaagrams(_ string1: String, _ string2: String) -> Bool {
        let sortedString1 = string1.sorted().reduce("") { partialResult, character in
            partialResult + String(character)
        }
        let sortedString2 = string2.sorted().reduce("") { partialResult, character in
            partialResult + String(character)
        }
        return sortedString1 == sortedString2
    }
}
