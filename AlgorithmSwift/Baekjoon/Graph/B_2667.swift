// 단지번호붙이기

/* 문제
 주어진 정사각형 모양의 지도에서 1은 집이 있는 곳, 0은 집이 없는 곳을 나타낸다.
 이 지도를 가지고 연결된 집의 모임인 단지를 정의하고, 단지에 번호를 붙이려 한다.
 연결되었다는 것: 좌우, 혹은 아래위로 집이 있는 경우.
 대각선상에 집이 있는 경우는 연결된 것이 아니다.

 단지 수를 출력하고,  각 단지에 속하는 집의 수를 오름차순으로 정렬하여 출력하는 프로그램 작성
 */

import Foundation

final class B_2667 {
    struct Pair {
        let x: Int
        let y: Int

        init(_ x: Int, _ y: Int) {
            self.x = x
            self.y = y
        }
    }

    var n = Int()
    var map = [[Int]]()
    var visit = [[Int]]() // 방문했으면 단지 번호 저장
    let dx = [-1, 1, 0, 0]
    let dy = [0, 0, -1, 1]

    func bfs(_ x: Int, _ y: Int, _ number: Int) {
        var queue: [Pair] = []
        queue.append(Pair(x, y))
        visit[x][y] = number
        while !queue.isEmpty {
            let pair = queue.removeFirst()
            for k in 0 ..< 4 {
                let nextX = pair.x + dx[k]
                let nextY = pair.y + dy[k]
                if 0 <= nextX, nextX < n,
                   0 <= nextY, nextY < n,
                   visit[nextX][nextY] == 0,
                   map[nextX][nextY] == 1 {
                    queue.append(Pair(nextX, nextY))
                    visit[nextX][nextY] = number // 단지 번호 표시
                }
            }
        }
    }

    func solution() {
        var number: Int = 0 // 단지 번호
        for i in stride(from: 0, to: n, by: 1) {
            for j in stride(from: 0, to: n, by: 1) {
                if visit[i][j] == 0, map[i][j] == 1 {
                    number += 1
                    bfs(i, j, number)
                }
            }
        }
        var house = [Int](repeating: 0, count: number + 1)
        for i in stride(from: 0, to: n, by: 1) {
            for j in stride(from: 0, to: n, by: 1) {
                if visit[i][j] != 0 {
                    house[visit[i][j]] += 1
                }
            }
        }
        house.sort()
        print(number)
        for i in stride(from: 1, to: house.count, by: 1) {
            print(house[i])
        }
    }

    func run() {
        n = Int(readLine()!)!
        map = [[Int]](repeating: [], count: n)
        visit = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)

        for i in stride(from: 0, to: n, by: 1) {
            guard let line = readLine() else { break }
            for element in line {
                map[i].append(Int(element.asciiValue! - 48))
            }
        }
        solution()
    }
}

/*
input
7
0110100
0110101
1110101
0000111
0100000
0111110
0111000

output
3
7
8
9
*/
