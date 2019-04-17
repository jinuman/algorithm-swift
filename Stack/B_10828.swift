// 스택

import Foundation

class Stack {
    var stack = [Int]()

    func push(_ x: Int) {
        stack.append(x)
    }

    func pop() -> Int? {
        return stack.popLast()
    }

    func top() -> Int? {
        return stack.last
    }

    func empty() -> Int {
        return stack.isEmpty ? 1 : 0
    }

    func size() -> Int {
        return stack.count
    }
}

class B_10828 {
    func run() {
        if let n = Int(readLine() ?? "0") {
            let stack = Stack()
            
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
