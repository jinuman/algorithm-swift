// 2016년
// 2016년 1월 1일은 금요일, 2016년은 윤년이다.
// 2016년 a월 b일은 무슨 요일인지 return 하는 함수 작성

import Foundation

class P_2016 {
    private func solution(_ a: Int, _ b: Int) -> String {
        let days = ["THU", "FRI", "SAT", "SUN", "MON", "TUE", "WED"]
        let months = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
        let totalDays: Int = months[0..<a - 1].reduce(0, +) + b
        return days[totalDays % 7]
    }

    func run() {
        print(solution(5, 24))  // TUE
        print(solution(1, 1))   // FRI
    }
}

