// 직사각형
// a: 직사각형, b: 선분, c: 점, d: 공통부분 없음
// (x, y): 왼쪽 아래, (p, q): 오른쪽 위 꼭지점 좌표
// 런타임 에러..

import Foundation

class B_2527 {
    func run() {
        for _ in 0..<4 {
            let line = readLine()!.components(separatedBy: " ").map {
                Int($0)!
            }
            let a = Array(line[0...3])
            let b = Array(line[4...7])

            let leftX = max(a[0], b[0])
            let rightX = min(a[2], b[2])
            let bottomY = max(a[1], b[1])
            let topY = min(a[3], b[3])

            let width = rightX - leftX
            let height = topY - bottomY

            if width == 0 && height == 0 {
                print("c")
            } else if width == 0 || height == 0 {
                print("b")
            } else if width < 0 || height < 0 {
                print("d")
            } else {
                print("a")
            }
        }
    }
}

/*
input
3 10 50 60 100 100 200 300
45 50 600 600 400 450 500 543
11 120 120 230 50 40 60 440
35 56 67 90 67 80 500 600

output
d
a
a
b
*/