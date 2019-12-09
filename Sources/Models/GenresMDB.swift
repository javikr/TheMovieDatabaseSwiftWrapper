//
//  GenresMDB.swift
//  MDBSwiftWrapper
//
//  Created by George Kye on 2016-02-12.
//  Copyright © 2016 George Kye. All rights reserved.
//

import Foundation


public enum GenresListType: String{
  case tv, movie
}

open class GenresMDB: KeywordsMDB{
  
  
  ///Get the list of tv or movie genres.
  open class func genres(listType: GenresListType, language: String?, completion: @escaping (_ clientReturn: ClientReturn, _ data: [GenresMDB]?) -> ()) -> (){
    Client.Genres(listType: listType.rawValue, language: language, genreId: nil, page: nil, include_all: nil, include_adult: nil){
      apiReturn in
      var genres: [GenresMDB]?
      if let json = apiReturn.json?["genres"] {
        genres = GenresMDB.initialize(json: json)
      }
      completion(apiReturn, genres)
    }
  }
  
  ///Get the list of movies for a particular genre by id. By default, only movies with 10 or more votes are included.
  open class func genre_movies(genreId: Int, include_adult_movies: Bool, language: String?, page: Double?, completion: @escaping (_ clientReturn: ClientReturn, _ data: [MovieMDB]?) -> ()) -> (){
    Client.Genres(listType: "movies", language: language, genreId: genreId, page: page, include_all: true, include_adult: include_adult_movies){
      apiReturn in
      var movies: [MovieMDB]?
      if let json = apiReturn.json?["results"] {
        movies = MovieMDB.initialize(json: json)
      }
      completion(apiReturn, movies)
      
    }
  }
  
  ///Get the list of movies for a particular genre by id. By default, only movies with 10 or more votes are included.
  open class func genre_shows(genreId: Int, include_adult_movies: Bool, language: String?, page: Double?, completion: @escaping (_ clientReturn: ClientReturn, _ data: [TVMDB]?) -> ()) -> (){
    Client.Genres(listType: "tv", language: language, genreId: genreId, page: page, include_all: true, include_adult: nil){
      apiReturn in
      var shows: [TVMDB]?
      if let json = apiReturn.json?["results"] {
        shows = TVMDB.initialize(json: json)
      }
      completion(apiReturn, shows)
      
    }
  }
  
}
