import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
  name: "CustomerManger",
  platform: .iOS,
  product: .app,
  dependencies: [.snapkit, .customerDB],
  testDependencies: [
    .quick,
    .nimble
  ],
  bridgingHeaderPath: "Support/BridgingHeader/CustomerManger-Bridging-Header.h",
  customInfoPlist: .file(path: "Support/InfoPlist/Info.plist"),
  additionalTargets: []
)
