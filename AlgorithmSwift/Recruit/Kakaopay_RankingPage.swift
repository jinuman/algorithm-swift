// 2019년 카카오페이 인턴 4번문제
// 미해결 ...
// 정렬 후 리스트 비교 후 바뀌었으면 cnt += 1 ...

import Foundation

class Kakaopay_RankingPage {
    struct Rank {
        let name: String
        let score: Int
    }

    func solution(_ K: Int, _ userInfo: [String]) -> Int {
        var d: [String: Rank] = [:]
//        var cnt: Int = 0
        var firstPage = [Rank]()
        userInfo.forEach {
            let info = $0.split(separator: " ")
            let key = String(info[0])
            let rank = Rank(name: key, score: Int(info[1]) ?? 0)

            if d.keys.contains(key) == false {
                d[key] = rank
                firstPage.append(rank)
            } else {
                if d[key]!.score < rank.score {
                    d[key] = rank
                }
            }
        }
        print(d.values)

        return 0
    }

    func run() {
        print(solution(3, ["alex111 100", "cheries2 200", "coco 150", "luna 100", "alex111 120", "coco 300", "cheries2 110"]))  // 4
//        print(solution(3, ["alex111 100", "cheries2 200", "alex111 200", "cheries2 150", "coco 50", "coco 200"]))  // 3
//        print(solution(2, ["cheries2 200", "alex111 100", "coco 150", "puyo 120"]))  // 3
    }
}
