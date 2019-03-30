# Stencil

<p align="center">
    <a href="http://docs.vapor.codes/3.0/">
        <img src="http://img.shields.io/badge/read_the-docs-2196f3.svg" alt="Documentation">
    </a>
    <a href="LICENSE">
        <img src="http://img.shields.io/badge/license-MIT-brightgreen.svg" alt="MIT License">
    </a>
    <a href="https://swift.org">
        <img src="http://img.shields.io/badge/swift-4.2-brightgreen.svg" alt="Swift 4.2">
    </a>
</p>

* Page: [README](../README.md), [Leaf](Leaf.md), Stencil, [Swift-HTML](Swifthtml.md), [Swift Language Organic](Swiftlang.md) 
* Section: <a id="toc"></a>
[Resources](#linkResources)

## Vapor Service

_Service Provider_

``` swift
public final class StencilProvider: Provider {
    /// Creates a new `StencilProvider`.
    public init() {}

    static let stencilPathStr = DirectoryConfig.detect().workDir + "Resources/Stencil/"
    static let stencilPath = Path(stencilPathStr)
    static let loader: Loader = FileSystemLoader(paths: [stencilPath])
    
    /// See `Provider`.
    public func register(_ services: inout Services) throws {
        services.register([ViewRenderer.self]) {
            container -> StencilRenderer in
            return try StencilRenderer.init(using: container)
        }
    }
    
    /// See `Provider`.
    public func didBoot(_ container: Container) throws -> Future<Void> {
        return .done(on: container)
    }
}
```

_View Renderer Service_


A view render service which async dispatch was added for Stencil.

``` swift
public final class StencilRenderer: Service {
    /// The event loop this renderer will use to read files
    private let container: Container
    /// Environment: template loader
    private let stencilEnvironment: Stencil.Environment

    init(using container: Container) throws {
        let directoryConfig = DirectoryConfig.detect()
        let stencilPathStr = directoryConfig.workDir + "Resources/Stencil/"
        let stencilPath = Path(stencilPathStr)
        let loader: Loader = FileSystemLoader(paths: [stencilPath])
        self.stencilEnvironment = Stencil.Environment(loader: loader)
        self.container = container
    }
    
    public func render(
        _ path: String, // relative path to a Stencil template file
        _ context: [AnyHashable : Any]
        )
        -> Future<View> {
            let promiseView: Promise<View> = container.eventLoop.newPromise(View.self)
            
            DispatchQueue.global().async {
                // () -> Void in
                do {
                    let rendered: String = try self.stencilEnvironment.renderTemplate(
                        name: path, // file path
                        context: context as? [String : Any]
                    )
                    let renderedData = Data(rendered.utf8)
                    let view: View = View(data:renderedData)
                    return promiseView.succeed(result: view)
                }
                catch let err {
                    promiseView.fail(error: err)
                }
            }
            return promiseView.futureResult // Future<View>
    }
}
```

## Notes

[Installation](http://stencil.fuller.li/en/latest/installation.html)

Update Swift Package Manager Installation Example to include 4.2 example.

``` swift
// swift-tools-version:4.2
import PackageDescription

let package = Package(
  name: "MyApplication",
  dependencies: [
    .package(url: "https://github.com/stencilproject/Stencil.git", from: "0.13.1"),
  ]
)
```

## Resources <a id="Resources">[▴](#toc)</a>

* [GitHub/stencilproject: Stencil ⇗](https://github.com/stencilproject/Stencil)
