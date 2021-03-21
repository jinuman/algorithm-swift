import Foundation

extension Int {
    func power(_ num: Int) -> Int {
        var result = 1
        for _ in 0 ..< num {
            result *= self
        }
        return result
    }
}
