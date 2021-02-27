// 스택

final class Stack {
    private var stack = [Int]()

    func push(_ x: Int) {
        self.stack.append(x)
    }

    func pop() -> Int? {
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

struct B_10828 {
    func solution(_ command: String, _ stack: Stack) {
        let command: [Substring] = command.split(separator: " ")
        switch command[0] {
        case "push":
            stack.push(Int(command[1]) ?? 0)
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

    func run() {
        let stack = Stack()
        for _ in 0 ..< Int(readLine()!)! {
            guard let command = readLine() else { break }
            solution(command, stack)
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
