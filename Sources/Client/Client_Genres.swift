//
//  Client_Genres.swift
//  MDBSwiftWrapper
//
//  Created by George Kye on 2016-02-12.
//  Copyright © 2016 George Kye. All rights reserved.
//

import Foundation

extension Client{  
  static func Genres(listType: String, language: String?, genreId: Int?, page: Double?, include_all: Bool?, include_adult: Bool?, completion: @escaping (ClientReturn) -> ()) -> (){
    var parameters: [String : AnyObject] = [:]
    var url = "";
    
    if let genreId = genreId {
      url = "https://api.themoviedb.org/3/genre/" + String(genreId) + "/" + listType
    } else {
      url = "https://api.themoviedb.org/3/genre/" + listType + "/list"
    }
    
    if(language != nil){
      parameters["language"] = language as AnyObject?
    }
    
    if(page != nil){
      parameters["page"] = page as AnyObject?
    }
    if(include_all != nil){
      parameters["include_all_movies"] = include_all as AnyObject?
    }
    if(include_adult != nil){
      parameters["include_adult"] = include_adult as AnyObject?
    }
    
    networkRequest(url: url, parameters: parameters, completion: {
      apiReturn in
      completion(apiReturn)
    })
  }
  
}
