import Vapor

func routes(_ app: Application) throws {

    app.get{ req async throws -> View in
    let movies = try await Movie.query(on: req.db).all(\.$title)
        return try await req.view.render("index", ["movies":movies])
    }

    app.get("movies"){req in
        Movie.query(on: req.db).all()
    }

    app.post("movies"){ req -> EventLoopFuture<Movie> in
        let movie = try req.content.decode(Movie.self)
        return movie.create(on: req.db).map{movie}
    }
}