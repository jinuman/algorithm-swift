// 스택

import Foundation

struct Stack {
    private var stack = [Int]()

    mutating func push(_ x: Int) {
        self.stack.append(x)
    }

    mutating func pop() -> Int? {
        return self.stack.popLast()
    }

    func top() -> Int? {
        return self.stack.last
    }

    func empty() -> Int {
        return self.stack.isEmpty ? 1 : 0
    }

    func size() -> Int {
        return self.stack.count
    }
}

final class B_10828 {
    func run() {
        guard let n = Int(readLine() ?? "0") else { return }
        var stack = Stack()
        
        for _ in 0..<n {
            guard let cmd = readLine()?.split(separator: " ") else { break }
            switch cmd[0] {
            case "push":
                stack.push(Int(cmd[1]) ?? 0)
            case "pop":
                print(stack.pop() ?? -1)
            case "top":
                print(stack.top() ?? -1)
            case "empty":
                print(stack.empty())
            case "size":
                print(stack.size())
            default:
                break
            }
        }
    }
}

/*
input
14
push 1
push 2
top
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
top
 
output
2
2
0
2
1
-1
0
1
-1
0
3
*/
