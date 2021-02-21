// 스킬트리
// 2018년

import Foundation

final class P_SkillTree {
    func isValidSkillTree(_ skill: String, _ skillTree: String) -> Bool {
        // skillTree 문자열에서 skill 문자를 포함하는 부분만 추출
        let filteredSkillTree = skillTree.filter { skill.contains($0) }
        return skill.starts(with: filteredSkillTree)
    }

    func solution(_ skill: String, _ skill_trees: [String]) -> Int {
        return skill_trees.filter { isValidSkillTree(skill, $0) }.count
    }

    func run() {
        print(solution("CBD", ["BACDE", "CBADF", "AECB", "BDA"]))  // 2
    }
}
