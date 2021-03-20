// 국영수
// 국어 점수 - 내림차순
// 국어 점수가 같으면 영어점수 - 오름차순
// 국어 점수와 영어 점수가 같으면 수학점수 - 내림차순
// 모든 점수가 같으면 이름 - 사전순(오름차순) 대문자 < 소문자

import Foundation

final class B_10825 {
    struct Student {
        let name: String
        let kor: Int
        let eng: Int
        let math: Int
    }
    
    func run() {
        let n = Int(readLine()!)!

        var students = [Student]()

        for _ in stride(from: 0, to: n, by: 1) {
            let line = readLine()!.split(separator: " ")
            let student = Student(
                name: line[0].description,
                kor: Int(line[1])!,
                eng: Int(line[2])!,
                math: Int(line[3])!
            )
            students.append(student)
        }

        students.sort { (current, compare) -> Bool in
            if current.kor != compare.kor {
                return current.kor > compare.kor
            } else {
                if current.eng != compare.eng {
                    return current.eng < compare.eng
                } else {
                    if current.math != compare.math {
                        return current.math > compare.math
                    } else {
                        return current.name < compare.name
                    }
                }
            }
        }

        for i in 0..<n {
            print("\(students[i].name)")
        }
    }
}

/*
input
12
Junkyu 50 60 100
Sangkeun 80 60 50
Sunyoung 80 70 100
Soong 50 60 90
Haebin 50 60 100
Kangsoo 60 80 100
Donghyuk 80 60 100
Sei 70 70 70
Wonseob 70 70 90
Sanghyun 70 70 80
nsj 80 80 80
Taewhan 50 60 90

output
Donghyuk
Sangkeun
Sunyoung
nsj
Wonseob
Sanghyun
Sei
Kangsoo
Haebin
Junkyu
Soong
Taewhan
*/
