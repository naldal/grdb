import ProjectDescription

let dependencies = Dependencies(
  carthage: CarthageDependencies([]),
  swiftPackageManager: SwiftPackageManagerDependencies([
    .remote(url: "https://github.com/Quick/Quick.git", requirement: .branch("master")),
    .remote(url: "https://github.com/Quick/Nimble.git", requirement: .branch("main")),
    .remote(url: "https://github.com/groue/GRDB.swift.git", requirement: .exact("6.21.0")),
    .remote(url: "https://github.com/SnapKit/SnapKit.git", requirement: .exact("5.6.0"))
  ], productTypes: [
    "Quick": .staticFramework,
    "Nimble": .staticFramework,
    "GRDB": .staticFramework,
    "SnapKit": .staticFramework
  ])
)
