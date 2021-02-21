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
    subscript (i: Int) -> String {
        return self[i ..< i + 1]
    }

    subscript (r: Range<Int>) -> String {
        let start = self.index(self.startIndex, offsetBy: r.lowerBound)
        let end = self.index(self.startIndex, offsetBy: r.upperBound)

        return String(self[start ..< end])
    }

    subscript (r: ClosedRange<Int>) -> String {
        let start = self.index(self.startIndex, offsetBy: r.lowerBound)
        let end = self.index(self.startIndex, offsetBy: r.upperBound)

        return String(self[start ... end])
    }

    func trim() -> String {
        return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
}
