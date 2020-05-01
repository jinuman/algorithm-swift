// 교통카드
// 2018년 하반기 1번문제
// 최초 잔액 2만원
// 40km 까지 720원, 41km 부터 8km 마다 80원 추가
// 최소 이동거리는 4km, 최대 이동거리는 178km. 이를 벗어나면 현재 잔액을 출력하고 종료
// 더 이상 차감할 수 없으면 현재 잔액을 출력하고 종료

import Foundation

class Line_TrafficCard {

    func run() {
        let money: Int = 20000
        var pay: Int = 0
        let dists: [Int] = readLine()!.split(separator: " ").compactMap {
            Int($0)
        }
        for dist in dists {
            if dist < 4 || dist > 178 {
                break
            }
            if dist <= 40 {
                if pay + 720 > 20000 {
                    break
                }
                pay += 720
            } else {
                let addPay = Int(ceil(Double(dist - 40) / Double(8))) * 80
                if pay + 720 + addPay > 20000 {
                    break
                }
                pay = pay + 720 + addPay
            }
        }
        print(money - pay)
    }
}

/*
input
11 128 15 111 59 31 70 102 50 172 88 56 40 41 12

output
4160
*/
