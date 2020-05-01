import Foundation

struct Rect {
    // y
    let top: Int
    let bottom: Int

    // x
    let left: Int
    let right: Int

    init(_ px: Int, _ py: Int, _ qx: Int, _ qy: Int) {
        self.top = max(py, qy)
        self.bottom = min(py, qy)
        self.left = min(px, qx)
        self.right = max(px, qx)
    }
}

class IntersectionRectArea {
    func run() {
        let p = readLine()!.components(separatedBy: " ").map {
            Int($0)!
        }
        let q = readLine()!.components(separatedBy: " ").map {
            Int($0)!
        }
        let r = readLine()!.components(separatedBy: " ").map {
            Int($0)!
        }
        let s = readLine()!.components(separatedBy: " ").map {
            Int($0)!
        }

        let result: Int = getIntersectionRectArea(p, q, r, s)
        print(result)
    }

    func getIntersectionRectArea(_ p: [Int], _ q: [Int], _ r: [Int], _ s: [Int]) -> Int {
        let rectA = Rect(p[0], p[1], q[0], q[1])
        let rectB = Rect(r[0], r[1], s[0], s[1])

        let top = min(rectA.top, rectB.top)
        let bottom = max(rectA.bottom, rectB.bottom)
        let left = max(rectA.left, rectB.left)
        let right = min(rectA.right, rectB.right)

        guard bottom <= top, left <= right else {
            return 0
        }
        let width = right - left
        let height = top - bottom

        return width * height
    }
}

//IntersectionRectArea().run()

/*
Input
-7 5
0 0
-3 -3
4 2

Output
6
*/

/*
Input
1 1
0 0
2 2
1 1

Output
0
*/
