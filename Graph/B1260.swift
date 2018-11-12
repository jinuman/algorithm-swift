// DFS와 BFS

import Foundation

class B1260 {
    var graph: [[Int]] = [[]]
    var check: [Bool] = []

    func run() {
        let inputs: [Int] = readLine()!.split(separator: " ").map {
            Int($0)!
        }
        let n = inputs[0]
        let m = inputs[1]
        let startNode = inputs[2]
        graph = [[Int]].init(repeating: [], count: n + 1)
        check = [Bool].init(repeating: false, count: n + 1)
        for _ in 0..<m {
            let edge = readLine()!.split(separator: " ").map {
                Int($0)!
            }
            let u = edge[0]
            let v = edge[1]
            graph[u].append(v)
            graph[v].append(u)
        }
        for i in 1...n {
            graph[i].sort()
        }
        dfs(startNode)
        print()
        check = [Bool].init(repeating: false, count: n + 1)
        bfs(startNode)
        print()
    }
}

extension B1260 {
    func dfs(_ x: Int) {
        check[x] = true
        print(x, terminator: " ")
        for i in 0..<graph[x].count {
            let next = graph[x][i]
            if !check[next] {
                dfs(next)
            }
        }
    }
}

extension B1260 {
    func bfs(_ start: Int) {
        var queue: [Int] = []
        check[start] = true
        queue.append(start)
        while !queue.isEmpty {
            let x = queue.removeFirst()
            print(x, terminator: " ")
            for next in graph[x] {
                if !check[next] {
                    check[next] = true
                    queue.append(next)
                }
            }
        }
    }
}

B1260().run()

/*
4 5 1
1 2
1 3
1 4
2 4
3 4
*/