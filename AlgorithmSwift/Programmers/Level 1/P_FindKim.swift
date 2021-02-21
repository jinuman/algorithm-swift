// 서울에서 김서방 찾기

import Foundation

class P_FindKim {
    func solution(_ seoul: [String]) -> String {
        guard let location = seoul.firstIndex(of: "Kim") else { return "" }
        return "김서방은 \(location)에 있다"
    }
    
    func run() {
        print(solution(["Jane", "Kim"]))  // 김서방은 1에 있다
    }
}
