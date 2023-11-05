import ProjectDescription

public extension TargetDependency {
  static let quick: TargetDependency = .external(name: "Quick")
  static let nimble: TargetDependency = .external(name: "Nimble")
  static let grdb: TargetDependency = .external(name: "GRDB")
  static let snapkit: TargetDependency = .external(name: "SnapKit")
  static let customerDB: TargetDependency = .project(target: "CustomerDatabase", path: "../CustomerDatabase")
}
