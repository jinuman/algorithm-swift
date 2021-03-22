// 스킬트리
// 2018년

/* 문제
 For example,
 skill: "CBD" 이면 C -> B -> D 가 선행 스킬 순서가 된다.
 "BACDE" -> 불가능 (B 스킬을 배우기 전에 C 스킬을 배워야함)
 "CBADF" -> 가능
 "BDA" -> 가능

 가능한 스킬트리의 개수 return
 */

import Foundation

final class P_SkillTree {
    func isValidSkillTree(_ skill: String, _ skillTree: String) -> Bool {
        // skillTree 문자열에서 skill 문자를 포함하는 부분만 추출
        let skillConvention = skillTree.filter { skill.contains($0) }
        return skill.starts(with: skillConvention)
    }

    func solution(_ skill: String, _ skill_trees: [String]) -> Int {
        return skill_trees.filter { isValidSkillTree(skill, $0) }.count
    }

    func run() {
        print(solution("CBD", ["BACDE", "CBADF", "AECB", "BDA"]))  // 2
    }
}
