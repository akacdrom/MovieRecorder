import Foundation
import Fluent
import FluentPostgresDriver

struct CreateMovie:Migration{

    //This function cerated the table of movie
    func prepare(on database: Database) -> EventLoopFuture<Void>{
        database.schema("movies")
        .id()
        .field("title", .string)
        .create()
    }

    //This function removes the table of movie
    func revert(on database: Database) -> EventLoopFuture<Void>{
        database.schema("movies").delete()
    }
}