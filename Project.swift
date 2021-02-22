import ProjectDescription

let projectName: String = "AlgorithmSwift"

let project = Project(
    name: "\(projectName)",
    targets: [
        Target(
            name: "\(projectName)",
            platform: .macOS,
            product: .commandLineTool,
            bundleId: "com.jinuman.\(projectName)",
            infoPlist: .default,
            sources: ["\(projectName)/**"],
            dependencies: []
        )
    ]
)
