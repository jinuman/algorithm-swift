// 큐

import Foundation

struct Queue {
    private var queue = [Int]()
    
    mutating func push(_ x: Int) {
        self.queue.append(x)
    }
    
    mutating func pop() -> Int {
        return self.queue.isEmpty ? -1 : self.queue.removeFirst()
    }
    
    func size() -> Int {
        return self.queue.count
    }
    
    func empty() -> Int {
        return self.queue.isEmpty ? 1 : 0
    }
    
    func front() -> Int? {
        return self.queue.first
    }
    
    func back() -> Int? {
        return self.queue.last
    }
}

final class B_10845 {
    func run() {
        guard let n = Int(readLine() ?? "0") else { return }
        var queue = Queue()
        
        for _ in 0..<n {
            guard let cmd = readLine()?.components(separatedBy: " ") else { break }
            switch cmd[0] {
            case "push":
                queue.push(Int(cmd[1]) ?? 0)
            case "pop":
                print(queue.pop())
            case "size":
                print(queue.size())
            case "empty":
                print(queue.empty())
            case "front":
                print(queue.front() ?? -1)
            case "back":
                print(queue.back() ?? -1)
            default:
                break
            }
        }
    }
    
}

/*
input
15
push 1
push 2
front
back
size
empty
pop
pop
pop
size
empty
pop
push 3
empty
front

output
1
2
2
0
1
2
-1
0
1
-1
0
3
*/
