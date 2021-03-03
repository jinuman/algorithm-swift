//
//  StringExtensions.swift
//  AlgorithmSwift
//
//  Created by Jinwoo Kim on 16/09/2019.
//  Copyright © 2019 Jinuman. All rights reserved.
//

import Foundation

extension String {
    // for convenience we should include String return
    subscript(i: Int) -> String {
        return self[i ..< i + 1]
    }

    subscript(range: Range<Int>) -> String {
        let startIndex = self.index(self.startIndex, offsetBy: range.lowerBound)
        let endIndex = self.index(self.startIndex, offsetBy: range.upperBound)

        return String(self[startIndex ..< endIndex])
    }

    subscript(range: ClosedRange<Int>) -> String {
        let startIndex = self.index(self.startIndex, offsetBy: range.lowerBound)
        let endIndex = self.index(self.startIndex, offsetBy: range.upperBound)

        return String(self[startIndex ... endIndex])
    }

    func trim() -> String {
        return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }

    func times(_ n: Int) -> String {
        var repeatedString = String()
        for _ in 0 ..< n {
            repeatedString += self
        }
        return repeatedString
    }
}
