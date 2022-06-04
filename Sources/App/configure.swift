import Leaf
import Vapor

// configures your application
public func configure(_ app: Application) throws {
    // uncomment to serve files from /Public folder
    app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

    app.databases.use(.postgres(hostname: "localhost", username: "postgres", password: "", database: "app"),as: .psql )
    app.migrations.add(CreateMovie())
    app.views.use(.leaf)

    // register routes
    try routes(app)
}
