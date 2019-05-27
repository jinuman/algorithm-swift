// DFS와 BFS

import Foundation

class B_1260 {
    var graph = [[Int]]()
    var isVisited = [Bool]()

    func run() {
        guard let line = readLine()?.split(separator: " ") else { return }
        let inputs = line.compactMap { Int($0) }
        
        let n = inputs[0]
        let m = inputs[1]
        let startNode = inputs[2]
        graph = [[Int]].init(repeating: [], count: n + 1)
        isVisited = [Bool].init(repeating: false, count: n + 1)
        for _ in 0..<m {
            guard let edgeLine = readLine()?.split(separator: " ") else { return }
            let edge = edgeLine.compactMap { Int($0) }
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
        isVisited = [Bool].init(repeating: false, count: n + 1)
        bfs(startNode)
        print()
    }
}

extension B_1260 {
    func dfs(_ x: Int) {
        isVisited[x] = true
        print(x, terminator: " ")
        for i in 0..<graph[x].count {
            let next = graph[x][i]
            if !isVisited[next] {
                dfs(next)
            }
        }
    }
}

extension B_1260 {
    func bfs(_ start: Int) {
        var queue: [Int] = []
        isVisited[start] = true
        queue.append(start)
        while !queue.isEmpty {
            let x = queue.removeFirst()
            print(x, terminator: " ")
            for next in graph[x] {
                if !isVisited[next] {
                    isVisited[next] = true
                    queue.append(next)
                }
            }
        }
    }
}

/*
input
4 5 1
1 2
1 3
1 4
2 4
3 4

output
1 2 4 3
1 2 3 4
*/
