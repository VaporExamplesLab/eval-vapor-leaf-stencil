// swift-tools-version:4.2
import PackageDescription

let package = Package(
    name: "eval-vapor-leaf-stencil",
    dependencies: [
        // 💧 A server-side Swift web framework.
        .package(url: "https://github.com/vapor/vapor.git", from: "3.3.0"),
        
        // 🍃 An expressive, performant, and extensible templating language built for Swift.
        .package(url: "https://github.com/vapor/leaf.git", from: "3.0.2"),
        
        // Stencil
        .package(url: "https://github.com/stencilproject/Stencil.git", from: "0.13.1"),
        
        // swift-html Domain Specific Language (DSL)
        // "0.2.1" Swift 4.2 
        // "0.3.0" Swift 5.0
        // "0.3.1" Swift 4.2 & 5.0? not yet due to dependency.
        .package(url: "https://github.com/pointfreeco/swift-html.git", from: "0.2.1")
    ],
    targets: [
        .target(name: "App", dependencies: ["Html", "Leaf", "Stencil", "Vapor"]),
        .target(name: "Run", dependencies: ["App"]),
        .testTarget(name: "AppTests", dependencies: ["App"])
    ],
    swiftLanguageVersions: [.v4_2]
)

