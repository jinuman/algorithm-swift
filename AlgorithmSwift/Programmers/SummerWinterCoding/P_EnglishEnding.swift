// 영어 끝말잇기
// 2018년

import Foundation

final class P_EnglishEnding {
    func solution(_ n: Int, _ words: [String]) -> [Int] {
        var checkedWords: [String] = []
        var beforeWord: String?
        for word in words {
            if checkedWords.contains(word) {
                return [(checkedWords.count % n) + 1, checkedWords.count / n + 1]
            } else {
                if let before = beforeWord?.last,
                   let current = word.first {
                    if before != current {
                        return [(checkedWords.count % n) + 1, checkedWords.count / n + 1]
                    }
                }
            }
            checkedWords.append(word)
            beforeWord = word
        }
        return [0, 0]
    }

    func run() {
        print(solution(3, ["tank", "kick", "know", "wheel", "land", "dream", "mother", "robot", "tank"])) // [3, 3]
        print(solution(5, ["hello", "observe", "effect", "take", "either", "recognize", "encourage", "ensure", "establish", "hang", "gather", "refer", "reference", "estimate", "executive"])) // [0, 0]
        print(solution(2, ["hello", "one", "even", "never", "now", "world", "draw"])) // [1, 3]
    }
}
