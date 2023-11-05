import ProjectDescription

extension Project {
    
  public static func makeFrameworkTargets(
      name: String,
      frameworkType: Product = .staticFramework,
      baseBundleId: String = "com.tuistTemplate",
      customInfoPlist: InfoPlist,
      dependencies: [TargetDependency],
      testDependencies: [TargetDependency]
  ) -> [Target] {
        
    let scripts: [TargetScript] = [
      TargetScript.makeScript(
          order: .pre,
          scriptPath: "../Tool/Lint/swiftlint --config \"../Tool/Lint/swiftlint.yml\"",
          name: "Lint"
      )
    ]
          
    let mainTarget = Target(
      name: name,
      platform: .iOS,
      product: frameworkType,
      bundleId: "\(baseBundleId).\(name)",
      deploymentTarget: .iOS(targetVersion: "15.0", devices: [.iphone]),
      infoPlist: customInfoPlist,
      sources: ["Targets/\(name)/Sources/**"],
      resources: ["Targets/\(name)/Resources/**"],
      scripts: scripts,
      dependencies: dependencies
    )
    
    let testHostApp = Target(
      name: "\(name)TestHost",
      platform: .iOS,
      product: .app,
      bundleId: "\(baseBundleId).\(name)",
      infoPlist: customInfoPlist,
      sources: ["TestHost/Sources/**"],
      resources: ["TestHost/Resources/**"],
      dependencies: [.target(name: name)]
    )
    
    let testTarget = Target(
      name: "\(name)Tests",
      platform: .iOS,
      product: .unitTests,
      bundleId: "\(baseBundleId).\(name)Tests",
      infoPlist: .default,
      sources: ["Targets/**"],
      resources: [],
      dependencies: [.target(name: name), .target(name: "\(name)TestHost")] + testDependencies
    )
          
    let sampleApp = Target(
      name: "\(name)SampleApp",
      platform: .iOS,
      product: .app,
      bundleId: "\(baseBundleId).\(name)SampleApp",
      infoPlist: customInfoPlist,
      sources: ["SampleApp/Sources/**"],
      resources: ["SampleApp/Sources/**"],
      dependencies: [.target(name: name)]
    )
          
    return [mainTarget, testHostApp, testTarget, sampleApp]
  }
}
