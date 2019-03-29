import Vapor


/// Creates an instance of `Application`. This is called from `main.swift` in the run target.
public func app(_ env: Environment) throws -> Application {
    var config = Config.default()
    // Environment(name: String, isRelease: Bool, arguments: [String])
    var env = env
    var services = Services.default()
    
    #if(DEBUG)
    printConfigureInfo(config, env, services, tag: "Pre Configure")
    #endif
    
    // Configure: Services, Routes, Preferences, Middleware
    try configure(&config, &env, &services)
    
    #if(DEBUG)
    printConfigureInfo(config, env, services, tag: "Post Configure")
    #endif
    
    let app = try Application(config: config, environment: env, services: services)
    try boot(app)
    return app
}

public func printConfigureInfo(_ config: Config, _ env: Environment, _ services: Services, tag: String = "") {

    print("\n### app(env: Environment) // \(tag) ###")
    let dirConfig = DirectoryConfig.detect()
    print(dirConfig.workDir) // "/path/to/workdir"
    
    print("# config:\n\(config.description)")
    // - Logger: ConsoleLogger
    // - Sessions: KeyedCacheSessions
    print()
    print("        env.name == \(env.name)")
    // development
    print("   env.arguments == \(env.arguments)")
    // ..path../Run
    print("env.commandInput == \(env.commandInput)")
    print("   env.isRelease == \(env.isRelease)")
    print()
    print("# services:\n\(services.description)")
    
    print()
}

/* ************************
 *** BEFORE `config(…)` ***
 Preferences:
 - Sessions: KeyedCacheSessions
 - Logger: ConsoleLogger
 Requirements:
 - none
 
 Services:
 - NIOServer: Server
 - NIOServerConfig
 - RunningServerCache
 - FoundationClient: Client
 - EngineRouter: Router
 - ApplicationResponder: Responder
 - BCryptDigest
 - SessionCache
 - SessionsMiddleware
 - KeyedCacheSessions: Sessions
 - MemorySessions: Sessions
 - SessionsConfig
 - MemoryKeyedCache: KeyedCache
 - MiddlewareConfig
 - FileMiddleware
 - ErrorMiddleware
 - ContentConfig
 - ContentCoders
 - Terminal: Console
 - BootCommand
 - ServeCommand
 - RoutesCommand
 - CommandConfig
 - Commands
 - DirectoryConfig
 - ConsoleLogger: Logger
 - PrintLogger: Logger
 - PlaintextRenderer: ViewRenderer
 - BlockingIOThreadPool
 - NonBlockingFileIO
 Providers:
 - none
 *******************************/

/* *****************************
 *** AFTER `config(…)` ADDS: ***
 Preferences:
 - ViewRenderer: LeafRenderer

 Services:
 - LeafRenderer: TemplateRenderer, ViewRenderer
 - LeafConfig
 - LeafTagConfig
 - StencilRenderer: ViewRenderer
 - SwifthtmlRenderer
 - SwiftorganicRenderer: ViewRenderer
 Providers:
 - LeafProvider
 - StencilProvider
 - SwifthtmlProvider
 - SwiftorganicProvider
 *******************************/
