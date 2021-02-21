// 국영수
// 국어 점수 - 내림차순
// 국어 점수가 같으면 영어점수 - 오름차순
// 국어 점수와 영어 점수가 같으면 수학점수 - 내림차순
// 모든 점수가 같으면 이름 - 사전순(오름차순) 대문자 < 소문자

import Foundation

class B_10825 {
    struct Student {
        let name: String
        let kor: Int
        let eng: Int
        let math: Int
    }
    
    typealias st = Student
    
    func run() {
        if let n = Int(readLine() ?? "") {
            
            var students = [st]()
            
            for _ in 0..<n {
                if let s = readLine()?.split(separator: " ") {
                    students.append(st(name: String(s[0]), kor: Int(s[1]) ?? 0, eng: Int(s[2]) ?? 0, math: Int(s[3]) ?? 0))
                }
            }
            
            students.sort { (s0, s1) -> Bool in
                if s0.kor != s1.kor {
                    return s0.kor > s1.kor
                } else {
                    if s0.eng != s1.eng {
                        return s0.eng < s1.eng
                    } else {
                        if s0.math != s1.math {
                            return s0.math > s1.math
                        } else {
                            return s0.name < s1.name
                        }
                    }
                }
            }
            
            for i in 0..<n {
                print("\(students[i].name)")
            }
            
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
