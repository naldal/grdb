import ProjectDescription
import ProjectDescriptionHelpers

let projectName = "CustomerDatabase"
let project = Project(
  name: projectName,
  targets: Project.makeFrameworkTargets(
    name: projectName,
    customInfoPlist: .default,
    dependencies: [.grdb],
    testDependencies: []
  )
)

