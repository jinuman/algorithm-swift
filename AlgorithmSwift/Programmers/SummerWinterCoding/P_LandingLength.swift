// 방문 길이
// 2018년

/*
 (10 x 10) 좌표계에서 캐릭터가 처음 걸어본 길의 거리를 구하는 문제
 */
// 좌표의 방문 여부가 아닌 길의 방문 여부를 체크해야 함

import Foundation

final class P_LandingLength {
    func solution(_ dirs: String) -> Int {
        var answer = 0 // 처음 걸어본 길의 길이
        var x = 5
        var y = 5

        var visit: [[[[Bool]]]] = Array(
            repeating: Array(
                repeating: Array(
                    repeating: Array(
                        repeating: false,
                        count: 11
                    ),
                    count: 11
                ),
                count: 11
            ),
            count: 11
        )

        for command in dirs {
            var nextX = x
            var nextY = y

            switch command {
            case "L":
                nextX -= 1
            case "R":
                nextX += 1
            case "U":
                nextY += 1
            case "D":
                nextY -= 1
            default:
                break
            }

            // 지정된 범위를 벗어났을 경우
            if abs(nextX - 5) > 5 || abs(nextY - 5) > 5 {
                continue
            }

            if !visit[nextX][nextY][x][y] {
                // (x, y) <-> (nextX, nextY) 길을 방문했다고 표시
                visit[nextX][nextY][x][y] = true
                visit[x][y][nextX][nextY] = true
                answer += 1
            }
            x = nextX
            y = nextY
        }
        return answer
    }

    func run() {
        print(solution("ULURRDLLU")) // 7
        print(solution("LULLLLLLU")) // 7
    }
}
