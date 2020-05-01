// 2019년 카카오페이 인턴 1번문제

import Foundation

class Kakaopay_PhoneNum {
    func solution(_ phone_num: String) -> Int {
        let regex1 = "^(010)-([0-9]{4})-([0-9]{4})$"
        let regex2 = "^(010)([0-9]{4})([0-9]{4})$"
        let regex3 = "^[+](82)-(10)-([0-9]{4})-([0-9]{4})$"

        let isOne: Bool = NSPredicate(format: "SELF MATCHES %@", regex1).evaluate(with: phone_num)
        let isTwo: Bool = NSPredicate(format: "SELF MATCHES %@", regex2).evaluate(with: phone_num)
        let isThree: Bool = NSPredicate(format: "SELF MATCHES %@", regex3).evaluate(with: phone_num)

        if isOne {
            return 1
        } else if isTwo {
            return 2
        } else if isThree {
            return 3
        } else {
            return -1
        }
    }

    func run() {
        print(solution("01012345678"))          // 2
        print(solution("010-1212-333"))         // -1
        print(solution("+82-10-3434-2323"))     // 3
        print(solution("+82-010-3434-2323"))    // -1
    }
}
