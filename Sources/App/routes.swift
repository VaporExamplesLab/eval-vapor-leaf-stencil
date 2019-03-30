import Vapor

// :NYI: consider using a BlockingIOThreadPool to control the number of threads created for blocking work.
// This helps avoids starving event loops from CPU time while blocking work is being done.

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    // GET "/" returns Home pages with links
    router.get {
        (request: Request) -> Future<View> in
        return try request
            .make(SwiftlangRenderer.self)
            .render(template: SwiftlangTemplateIndex(), [String:String]())
    }

    // GET /futureView
    router.get("futureView") {
        request -> Future<View> in
        
        let promiseView: Promise<View> = request.eventLoop.newPromise(View.self)
        
        DispatchQueue.global().async {
            let string = "Do lots of time consuming processing to create this string."
            // may processing read from remote file or URLSession.
            let stringData = Data(string.utf8)
            let view = View(data: stringData)
            
            print(FileManager.default.currentDirectoryPath)
            // ../DerivedData/eval-vapor-leaf-stencil-qly…okq/Build/Products/Debug
            
            return promiseView.succeed(result: view)
        }
        
        return promiseView.futureResult
    }
    
    // GET /hello
    router.get("hello", String.parameter) {
        req -> Future<View> in
        return try req.view().render("hello", [
            "nameKey": req.parameters.next(String.self)
            ])
    }

    // Configure controllers
    let directoryConfig = DirectoryConfig.detect()
    let resourcesPath = directoryConfig.workDir + "Resources/"
    let resourcesUrl = URL(fileURLWithPath: resourcesPath, isDirectory: true)

    let leafController = LeafController(resourcesUrl: resourcesUrl)
    try router.register(collection: leafController)

    let stencilController = StencilController(resourcesUrl: resourcesUrl)
    try router.register(collection: stencilController)

    let swifthtmlController = SwifthtmlController(resourcesUrl: resourcesUrl)
    try router.register(collection: swifthtmlController)

    let swiftlangController = SwiftlangController(resourcesUrl: resourcesUrl)
    try router.register(collection: swiftlangController)
}

